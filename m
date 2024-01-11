Received: from m16.mail.163.com (m15.mail.163.com [45.254.50.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4D7CDDBA
	for <linux-kernel@vger.kernel.org>; Thu, 11 Jan 2024 08:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="EZHVndKz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=C41GvdsfCnJ5btfTlf
	7ADFG8GCPBwf9UbjaedLoXgJ4=; b=EZHVndKzTLc0xLguuz56/JzUQpjoov5KMS
	K/oPLO8pet+bdyH3aOcrJorjs4neL5wC727T+R+F33Fl5tGwUzbM9dOOHuHWTvet
	c94D5tBU5k/3OMiWUYGEYuhKll7vTQINIJw6zdb9QwqF0jntr0czo7CJKAqet+fJ
	XV+x2fetc=
Received: from localhost.localdomain (unknown [182.148.14.173])
	by gzga-smtp-mta-g0-5 (Coremail) with SMTP id _____wCX__VDpp9lalCVAA--.15415S2;
	Thu, 11 Jan 2024 16:26:43 +0800 (CST)
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
Subject: [PATCH] drm/radeon: Clean up errors in uvd_v1_0.c
Date: Thu, 11 Jan 2024 08:26:41 +0000
Message-Id: <20240111082641.11892-1-chenguohua_716@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:_____wCX__VDpp9lalCVAA--.15415S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKw1xtFWUWFyUGF4rKryUJrb_yoW3ZFc_KF
	4UZ3y5GwsrZ3Z7ZF12kFs8AF92yw45uFs3uw1Yqas3tryYqw4rWry7ury3Xw4rGFn3JF95
	Cw4vgFyfZFsxZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUZXo7UUUUU==
X-CM-SenderInfo: xfkh0w5xrk3tbbxrlqqrwthudrp/xtbBEhxi1mVOBk+X-AACsx
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Fix the following errors reported by checkpatch:

ERROR: "(foo*)" should be "(foo *)"

Signed-off-by: GuoHua Chen <chenguohua_716@163.com>
---
 drivers/gpu/drm/radeon/uvd_v1_0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/uvd_v1_0.c b/drivers/gpu/drm/radeon/uvd_v1_0.c
index 58557c2263a7..5684639d20a6 100644
--- a/drivers/gpu/drm/radeon/uvd_v1_0.c
+++ b/drivers/gpu/drm/radeon/uvd_v1_0.c
@@ -142,7 +142,7 @@ int uvd_v1_0_resume(struct radeon_device *rdev)
 	addr = (rdev->uvd.gpu_addr >> 32) & 0xFF;
 	WREG32(UVD_LMI_EXT40_ADDR, addr | (0x9 << 16) | (0x1 << 31));
 
-	WREG32(UVD_FW_START, *((uint32_t*)rdev->uvd.cpu_addr));
+	WREG32(UVD_FW_START, *((uint32_t *)rdev->uvd.cpu_addr));
 
 	return 0;
 }
-- 
2.17.1

