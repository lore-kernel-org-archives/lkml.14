Received: from m16.mail.163.com (m15.mail.163.com [45.254.50.219])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28227FC05
	for <linux-kernel@vger.kernel.org>; Thu, 11 Jan 2024 08:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="lRecydZb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=bMr6+jCwBDAXMfkCwN
	Cu37s1tj1gKYx42JEDzqJHAnc=; b=lRecydZbiOhjQkR8ALNh+TQj3aOUxKiDPb
	6NAQpCjadOSZYFVTz7RP9CaNbIniXNSN+mwg7VC+KYVEaRR+WA659I7zV3q3jlgd
	VLwTOs9jI/8KvLilPW2PHxJ3gm6B/VTTAIpJOOqv6r2UuFhmAoHlcPqzLSGBwX8i
	lRbTAzFrw=
Received: from localhost.localdomain (unknown [182.148.14.173])
	by gzga-smtp-mta-g0-2 (Coremail) with SMTP id _____wD3n+XWrJ9lICuXAA--.792S2;
	Thu, 11 Jan 2024 16:54:46 +0800 (CST)
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
Subject: [PATCH] drm/radeon: Clean up errors in kv_smc.c
Date: Thu, 11 Jan 2024 08:54:45 +0000
Message-Id: <20240111085445.12891-1-chenguohua_716@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:_____wD3n+XWrJ9lICuXAA--.792S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFy8tFWUGrWfXw1UKw4DArb_yoWxtwb_Wr
	18XF1Iq39FvFn7Z3WrAF4UXFy2yrn8uF48ur4Iga4ftF17ZrWjq34DCryUX3y8GF93AF9r
	Cws5XFy3ZrsrGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUuyIUUUUUU==
X-CM-SenderInfo: xfkh0w5xrk3tbbxrlqqrwthudrp/xtbBEgFi1mVOBlB3XgAAsz
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Fix the following errors reported by checkpatch:

ERROR: spaces required around that '=' (ctx:VxW)

Signed-off-by: GuoHua Chen <chenguohua_716@163.com>
---
 drivers/gpu/drm/radeon/kv_smc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/kv_smc.c b/drivers/gpu/drm/radeon/kv_smc.c
index c0a59527e7b8..65831cca6730 100644
--- a/drivers/gpu/drm/radeon/kv_smc.c
+++ b/drivers/gpu/drm/radeon/kv_smc.c
@@ -189,7 +189,7 @@ int kv_copy_bytes_to_smc(struct radeon_device *rdev,
 		if (ret)
 			return ret;
 
-		original_data= RREG32(SMC_IND_DATA_0);
+		original_data = RREG32(SMC_IND_DATA_0);
 
 		extra_shift = 8 * (4 - byte_count);
 
-- 
2.17.1

