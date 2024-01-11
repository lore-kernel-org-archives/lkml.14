Received: from m16.mail.163.com (m15.mail.163.com [45.254.50.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5BB7C8C7
	for <linux-kernel@vger.kernel.org>; Thu, 11 Jan 2024 07:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="bZZ1Xj+b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=8s5k7ubzwbT6PFJHXm
	88W+KosJBhdpcR2bre8+/8h2g=; b=bZZ1Xj+bRibNpccFl0TfkL/IQOtFhmCEfL
	cJyDpYfd1PuCdy0o+7NE5yseoGaLv65heCqpbrVH6seHvbK9GBU0EVkbysp656wE
	az4PVMjv5OjJbQtkitqct2WrT3Kv72MsrFKm6ou+KHjw4UygDhiuV6oCpGNuF24s
	JEJnlBSnk=
Received: from localhost.localdomain (unknown [182.148.14.173])
	by gzga-smtp-mta-g0-4 (Coremail) with SMTP id _____wDXP6Qkk59lJtqPAA--.16725S2;
	Thu, 11 Jan 2024 15:05:08 +0800 (CST)
From: GuoHua Chen <chenguohua_716@163.com>
To: tzimmermann@suse.de,
	airlied@gmail.com,
	maarten.lankhorst@linux.intel.com,
	daniel@ffwll.ch,
	mripard@kernel.org,
	patrik.r.jakobsson@gmail.com
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	GuoHua Chen <chenguohua_716@163.com>
Subject: [PATCH] drm/gma500: Clean up errors in opregion.h
Date: Thu, 11 Jan 2024 07:05:06 +0000
Message-Id: <20240111070506.9516-1-chenguohua_716@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:_____wDXP6Qkk59lJtqPAA--.16725S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKw15uF48ZF18tryUZF1DKFg_yoWDJrXEkF
	1UZrs5urWku3ZYkFW3AFWYvry2yF4avF4rGa1Iqay3Jr47Zr1Uu3yqgF93Zr18Xa47Ga98
	Aa4qqFy7AFy7KjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjb4S3UUUUU==
X-CM-SenderInfo: xfkh0w5xrk3tbbxrlqqrwthudrp/xtbBEhhi1mVOBk3MMwAAsh
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Fix the following errors reported by checkpatch:

ERROR: space prohibited before that close parenthesis ')'

Signed-off-by: GuoHua Chen <chenguohua_716@163.com>
---
 drivers/gpu/drm/gma500/opregion.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gma500/opregion.c b/drivers/gpu/drm/gma500/opregion.c
index 0c271072af63..ff6632826376 100644
--- a/drivers/gpu/drm/gma500/opregion.c
+++ b/drivers/gpu/drm/gma500/opregion.c
@@ -211,7 +211,7 @@ void psb_intel_opregion_enable_asle(struct drm_device *dev)
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct opregion_asle *asle = dev_priv->opregion.asle;
 
-	if (asle && system_opregion ) {
+	if (asle && system_opregion) {
 		/* Don't do this on Medfield or other non PC like devices, they
 		   use the bit for something different altogether */
 		gma_enable_pipestat(dev_priv, 0, PIPE_LEGACY_BLC_EVENT_ENABLE);
-- 
2.17.1

