Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0763F184D
	for <linux-kernel@vger.kernel.org>; Thu, 11 Jan 2024 08:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="JPAjVZou"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=WrxlIiYF4btuCFh0aC
	etWERXHg/rWpEIVM4RgNLUC68=; b=JPAjVZouOCDG7zhICxezC1YJuJUM5ZRwDB
	eB1jqXlmmJwyXgjxkZ3OSA3wkXIiwLmLRgUMv0d/mfVRa/faJsOlS5UIwSMelrNf
	rMynibOsMfZo6BhBjo3t80zFnHpRYs6blRbev1MI0CueP59avdWrDQfL339185UG
	HI7L3pr0o=
Received: from localhost.localdomain (unknown [182.148.14.173])
	by gzga-smtp-mta-g0-0 (Coremail) with SMTP id _____wDn79nqpp9laF6UAA--.52481S2;
	Thu, 11 Jan 2024 16:29:30 +0800 (CST)
From: GuoHua Chen <chenguohua_716@163.com>
To: daniel@ffwll.ch,
	Xinhui.Pan@amd.com,
	alexander.deucher@amd.com,
	airlied@gmail.com,
	christian.koenig@amd.com
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	GuoHua Chen <chenguohua_716@163.com>
Subject: [PATCH] drm/radeon: Clean up errors in rs400.c
Date: Thu, 11 Jan 2024 08:29:29 +0000
Message-Id: <20240111082929.12064-1-chenguohua_716@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:_____wDn79nqpp9laF6UAA--.52481S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrur45CrWxZrWDKry7ur1xXwb_yoWDZrg_WF
	y3uw4kXayIvFn3Z3W8Zw4rKr9F9F45uF4fWa12yry5Kr13Zr1xXFWkGF1UWrWfG3ZrAr9r
	Z3yvkF4SyrnFkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUZXo7UUUUU==
X-CM-SenderInfo: xfkh0w5xrk3tbbxrlqqrwthudrp/1tbiqA1i1mVOBlCy4AAAs+
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Fix the following errors reported by checkpatch:

ERROR: space required before the open parenthesis '('

Signed-off-by: GuoHua Chen <chenguohua_716@163.com>
---
 drivers/gpu/drm/radeon/rs400.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/rs400.c b/drivers/gpu/drm/radeon/rs400.c
index 922a29e58880..d7f552d441ab 100644
--- a/drivers/gpu/drm/radeon/rs400.c
+++ b/drivers/gpu/drm/radeon/rs400.c
@@ -86,7 +86,7 @@ int rs400_gart_init(struct radeon_device *rdev)
 		return 0;
 	}
 	/* Check gart size */
-	switch(rdev->mc.gtt_size / (1024 * 1024)) {
+	switch (rdev->mc.gtt_size / (1024 * 1024)) {
 	case 32:
 	case 64:
 	case 128:
@@ -116,7 +116,7 @@ int rs400_gart_enable(struct radeon_device *rdev)
 	tmp |= RS690_DIS_OUT_OF_PCI_GART_ACCESS;
 	WREG32_MC(RS690_AIC_CTRL_SCRATCH, tmp);
 	/* Check gart size */
-	switch(rdev->mc.gtt_size / (1024 * 1024)) {
+	switch (rdev->mc.gtt_size / (1024 * 1024)) {
 	case 32:
 		size_reg = RS480_VA_SIZE_32MB;
 		break;
-- 
2.17.1

