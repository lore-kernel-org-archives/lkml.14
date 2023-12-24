Received: from cae.in-ulm.de (cae.in-ulm.de [217.10.14.231])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43703610D;
	Sun, 24 Dec 2023 12:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=c--e.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=c--e.de
Received: by cae.in-ulm.de (Postfix, from userid 1000)
	id 324C4140155; Sun, 24 Dec 2023 13:14:52 +0100 (CET)
Date: Sun, 24 Dec 2023 13:14:52 +0100
From: "Christian A. Ehrhardt" <lk@c--e.de>
To: Chris Bainbridge <chris.bainbridge@gmail.com>
Cc: rdbabiera@google.com, heikki.krogerus@linux.intel.com,
	Greg KH <gregkh@linuxfoundation.org>,
	LKML <linux-kernel@vger.kernel.org>, linux-usb@vger.kernel.org
Subject: Re: BUG: use-after-free bisected to "usb: typec: class: fix
 typec_altmode_put_partner to put plugs"
Message-ID: <ZYggvPLi//f7jjnS@cae.in-ulm.de>
References: <CAP-bSRb3SXpgo_BEdqZB-p1K5625fMegRZ17ZkPE1J8ZYgEHDg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP-bSRb3SXpgo_BEdqZB-p1K5625fMegRZ17ZkPE1J8ZYgEHDg@mail.gmail.com>


Hi Chris,

[ Cc: linux-usb@vger.kernel.org ]

On Sun, Dec 24, 2023 at 12:54:11AM +0000, Chris Bainbridge wrote:
> Hello,
> 
> A use-after-free error has appeared after a recent commit. This occurs
> when I unplug the USB-C dock (HP G5).
> 
> 
> b17b7fe6dd5c6ff74b38b0758ca799cdbb79e26e is the first bad commit
> commit b17b7fe6dd5c6ff74b38b0758ca799cdbb79e26e
> Author: RD Babiera <rdbabiera@google.com>
> Date:   Wed Nov 29 19:23:50 2023 +0000
> 
>     usb: typec: class: fix typec_altmode_put_partner to put plugs

I'm not very familiar with the code in question but the double
free seems rather obvious to me as typec_altmode_put_partner()
frees the altmode itself (which is already being releasee) and not
the partner.

I think this might fix it. Can you give it a try? If it does I can
cook up a proper patch later this week.

     regards    Christian

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 16a670828dde..2da19feacd91 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -263,11 +263,13 @@ static void typec_altmode_put_partner(struct altmode *altmode)
 {
 	struct altmode *partner = altmode->partner;
 	struct typec_altmode *adev;
+	struct typec_altmode *partner_adev;
 
 	if (!partner)
 		return;
 
 	adev = &altmode->adev;
+	partner_adev = &partner->adev;
 
 	if (is_typec_plug(adev->dev.parent)) {
 		struct typec_plug *plug = to_typec_plug(adev->dev.parent);
@@ -276,7 +278,7 @@ static void typec_altmode_put_partner(struct altmode *altmode)
 	} else {
 		partner->partner = NULL;
 	}
-	put_device(&adev->dev);
+	put_device(&partner_adev->dev);
 }
 
 /**

