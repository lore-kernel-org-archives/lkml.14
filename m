Received: from m16.mail.163.com (m15.mail.163.com [45.254.50.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7FF710940
	for <linux-kernel@vger.kernel.org>; Thu, 11 Jan 2024 09:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="HEXYSBHl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=MTVN4F7Q/6GUVtGLXv
	BAx+h+E7050Jgk+qf/1nmhWoc=; b=HEXYSBHlW7q3TnpXkd6y501I7anlK3t/Gq
	x10HtVbgM1A60WuvNQCjdvsyGLih1+xW8UdlwX4n2nhtskQxNY4bFOooOXrjCexi
	+w4uiphLrwxsHriJlCjq+Oy4mP9QFEyNVORXdruD35OxNFUjqgbU1Itc50FbUdDC
	GT9r9BiHE=
Received: from localhost.localdomain (unknown [182.148.14.173])
	by gzga-smtp-mta-g0-3 (Coremail) with SMTP id _____wDXP+0jrp9lYaaXAA--.18866S2;
	Thu, 11 Jan 2024 17:00:19 +0800 (CST)
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
Subject: [PATCH] drm/radeon: Clean up errors in r600_dpm.c
Date: Thu, 11 Jan 2024 09:00:17 +0000
Message-Id: <20240111090017.13235-1-chenguohua_716@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:_____wDXP+0jrp9lYaaXAA--.18866S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKFWDZrWxuFy5Kry8JFWfuFg_yoWDGrb_C3
	WxW3y7JrW3Kr9YgFyIkan5X3s2vr1j93Z3Ww1Fva4fJr12qFs5W3yDJryxXr1UGFW3Wrn5
	JrWUJF1SkrsxWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUZXo7UUUUU==
X-CM-SenderInfo: xfkh0w5xrk3tbbxrlqqrwthudrp/xtbBEh5i1mVOBlCZjwAAsT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Fix the following errors reported by checkpatch:

ERROR: that open brace { should be on the previous line

Signed-off-by: GuoHua Chen <chenguohua_716@163.com>
---
 drivers/gpu/drm/radeon/r600_dpm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/radeon/r600_dpm.c b/drivers/gpu/drm/radeon/r600_dpm.c
index 9d2bcb9551e6..64980a61d38a 100644
--- a/drivers/gpu/drm/radeon/r600_dpm.c
+++ b/drivers/gpu/drm/radeon/r600_dpm.c
@@ -28,8 +28,7 @@
 #include "r600_dpm.h"
 #include "atom.h"
 
-const u32 r600_utc[R600_PM_NUMBER_OF_TC] =
-{
+const u32 r600_utc[R600_PM_NUMBER_OF_TC] = {
 	R600_UTC_DFLT_00,
 	R600_UTC_DFLT_01,
 	R600_UTC_DFLT_02,
@@ -47,8 +46,7 @@ const u32 r600_utc[R600_PM_NUMBER_OF_TC] =
 	R600_UTC_DFLT_14,
 };
 
-const u32 r600_dtc[R600_PM_NUMBER_OF_TC] =
-{
+const u32 r600_dtc[R600_PM_NUMBER_OF_TC] = {
 	R600_DTC_DFLT_00,
 	R600_DTC_DFLT_01,
 	R600_DTC_DFLT_02,
-- 
2.17.1

