Received: from smtp.smtpout.orange.fr (smtp-27.smtpout.orange.fr [80.12.242.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323A246A0;
	Sat, 23 Mar 2024 06:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711177053; cv=none; b=T0FKJjlpqJqp48IELSKuX1LQAjvPeLg3DNubdLDUPk4PiZhPbXEeydsNegBX/Ie6Hb21XHNH7+5fvIw1WmobzwXxS6mAQfGa0p2MYHm/YL0FDHWFBo/5p2rEnOiIysnuS0GghAcfDQSvYLHms8m85NZ1hOqFvhXIe7GQupGz0D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711177053; c=relaxed/simple;
	bh=Voz19KYzQOltPtFam3tB/1mEVOfoTTWvRX0X9iZJcNY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LPQhHLvG3jQXzHsstPTgr7rE94Nq63/9XSM5llwpccBNqNt1fPScG39Oc8wBOM7Bt+aW7DQcSOmMQdgXzrRGE3D7qaFQ9b2R5mhOxuNP0vWvLbVzsdNfK7hXxg2Fk8L5khR+F2gi2Gt2by2RIhd6JOP9+sfD08G5KuGG0X45GLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=VnG+P5F6; arc=none smtp.client-ip=80.12.242.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="VnG+P5F6"
Received: from fedora.home ([86.243.17.157])
	by smtp.orange.fr with ESMTPA
	id nvJZrKeyIixjunvJhrMrfQ; Sat, 23 Mar 2024 07:57:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1711177041;
	bh=wUyvvyJdTx1/XQHU+I6I8DZSGJvicxz4iaZppevGwzg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=VnG+P5F6DWNNqpoxfOdkl4yZLmfzeYi2LOnaowgKoaw3uou81NL+bv2B6dHJ3sv19
	 yUPV3RBm7Gz+iOvf5r1Mqpk8pNZgHrHzRlkzKAHBwQGeK8lrApU7m1hdwiTR3qppSM
	 /YMKBxwTBId1cs9QxyuGgMvh9l30ceTUtRM0PzJDccmZ6b/QVbhh66r6RX8fji/9hc
	 16m5Qvj1TavkranrLpR9QmRi7pOgx1ZDMGVZJw1ULYOKiSBt0FIGGxc+kFKTx9KWyC
	 r7m+YtXjd8EIoz+Q14s62wLCRWGntV+UjvBKOZOWCHBx8ZafKac6UfTs3aNdfAlFvQ
	 zNAPR2EVhD6NQ==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 23 Mar 2024 07:57:21 +0100
X-ME-IP: 86.243.17.157
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: gregkh@linuxfoundation.org,
	jbrunet@baylibre.com,
	ruslan.bilovol@gmail.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 1/3] usb: gadget: u_audio: Fix the size of a buffer in a strscpy() call
Date: Sat, 23 Mar 2024 07:57:03 +0100
Message-ID: <bf8a9353319566624f653531b80e5caf3d346ba1.1711176700.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1711176700.git.christophe.jaillet@wanadoo.fr>
References: <cover.1711176700.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The size given to strscpy() is not consistent with the destination buffer
that is used. The size is related to 'driver' and the buffer is
'mixername'.

sizeof(card->mixername) is 80 and sizeof(card->driver) is 16, so in
theory this could lead to unneeded string truncation.

In practice, this is not the case because g_audio_setup() has only 2
callers. 'card_name' is either "UAC1_Gadget" or "UAC2_Gadget".

Anyway, using the correct size is cleaner and more future proof.

In order to be less verbose, use the new 2-argument version of strscpy()
which computes auto-magically the size of the destination.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.

As this doesn't fix anything in the real world, no Fixes tag is provided.
Should one not agree with me, it is:
Fixes: e89bb4288378 ("usb: gadget: u_audio: add real feedback implementation")
---
 drivers/usb/gadget/function/u_audio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index 4a42574b4a7f..00ff623b4ebb 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -1257,7 +1257,7 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
 	if ((c_chmask && g_audio->in_ep_fback)
 			|| (p_chmask && params->p_fu.id)
 			|| (c_chmask && params->c_fu.id))
-		strscpy(card->mixername, card_name, sizeof(card->driver));
+		strscpy(card->mixername, card_name);
 
 	if (c_chmask && g_audio->in_ep_fback) {
 		kctl = snd_ctl_new1(&u_audio_controls[UAC_FBACK_CTRL],
-- 
2.44.0

