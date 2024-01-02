Received: from cae.in-ulm.de (cae.in-ulm.de [217.10.14.231])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C15EE15AF8
	for <linux-kernel@vger.kernel.org>; Tue,  2 Jan 2024 19:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=c--e.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=c--e.de
Received: by cae.in-ulm.de (Postfix, from userid 1000)
	id 89F801408EF; Tue,  2 Jan 2024 20:30:37 +0100 (CET)
From: "Christian A. Ehrhardt" <lk@c--e.de>
To: linux-kernel@vger.kernel.org
Cc: "Christian A. Ehrhardt" <lk@c--e.de>,
	Chris Bainbridge <chris.bainbridge@gmail.com>,
	RD Babiera <rdbabiera@google.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] usb: typec: Fix double free in typec_altmode_put_partner
Date: Tue,  2 Jan 2024 20:29:48 +0100
Message-Id: <20240102192948.42392-1-lk@c--e.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <CALzBnUG_8d-PLdhpHb4=mWUZ4oUguBqj3hBnE_HBHgdX1WoyVg@mail.gmail.com>
References: <CALzBnUG_8d-PLdhpHb4=mWUZ4oUguBqj3hBnE_HBHgdX1WoyVg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The altmode device nodes of a port partner and of cable
plugs hold a reference to the altmode of a port. The port's
altmode contains various back pointers but these do not
contribute to the reference count.

Thus, free the port's altmode device instead of doing a
double free on ourself.

Reported-By: Chris Bainbridge <chris.bainbridge@gmail.com>
Fixes: b17b7fe6dd5c (usb: typec: class: fix typec_altmode_put_partner to put plugs)
Cc: RD Babiera <rdbabiera@google.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org
Signed-off-by: Christian A. Ehrhardt <lk@c--e.de>
---
 drivers/usb/typec/class.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

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
-- 
2.40.1

