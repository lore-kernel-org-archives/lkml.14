Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16516DDA7
	for <linux-kernel@vger.kernel.org>; Thu, 11 Jan 2024 08:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="GGR2SuQr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=6AZs02xj1/cbg0BiYo
	+KmJRnfb8WZCPrXQoJKEmHzYI=; b=GGR2SuQrujnsc54YNSF+uxxnodPQeL2V9+
	V7RNolEXZMjC8F4P2oQdDTfLHoOsRnlrb/ivLerLV0SXttB0lsXZv85InIUpJ595
	TNdQEWO0tOFQkEyZ/FAMX00fgfq+s9q7Zv/AkttaErTfxFwJFv1tDJU9HCL5E4iY
	dG2K2S8Mo=
Received: from localhost.localdomain (unknown [182.148.14.173])
	by gzga-smtp-mta-g0-5 (Coremail) with SMTP id _____wD3n1bdo59lXLCUAA--.18346S2;
	Thu, 11 Jan 2024 16:16:30 +0800 (CST)
From: GuoHua Chen <chenguohua_716@163.com>
To: daniel@ffwll.ch,
	Xinhui.Pan@amd.com,
	airlied@gmail.com,
	christian.koenig@amd.com,
	alexander.deucher@amd.com
Cc: linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	GuoHua Chen <chenguohua_716@163.com>
Subject: [PATCH] drm/radeon/kms: Clean up errors in rv6xx_dpm.h
Date: Thu, 11 Jan 2024 08:16:28 +0000
Message-Id: <20240111081628.11492-1-chenguohua_716@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:_____wD3n1bdo59lXLCUAA--.18346S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtF1kXF13tr13Ww17CFWDCFg_yoWxuwb_Ca
	4xX3y7WrW2kFn5XF47Zrs8JryIva15uF48uw4fta4fGry7Xr1fWa4vgrW7Xa1FgFn3JF9x
	Cw4kXFyfJFsFgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjcTmDUUUUU==
X-CM-SenderInfo: xfkh0w5xrk3tbbxrlqqrwthudrp/xtbBEB5i1mVOBk+DPwAAsk
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Fix the following errors reported by checkpatch:

ERROR: open brace '{' following struct go on the same line

Signed-off-by: GuoHua Chen <chenguohua_716@163.com>
---
 drivers/gpu/drm/radeon/rv6xx_dpm.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/rv6xx_dpm.h b/drivers/gpu/drm/radeon/rv6xx_dpm.h
index 8035d53ebea6..020c0dc8361d 100644
--- a/drivers/gpu/drm/radeon/rv6xx_dpm.h
+++ b/drivers/gpu/drm/radeon/rv6xx_dpm.h
@@ -28,8 +28,7 @@
 #include "r600_dpm.h"
 
 /* Represents a single SCLK step. */
-struct rv6xx_sclk_stepping
-{
+struct rv6xx_sclk_stepping {
     u32 vco_frequency;
     u32 post_divider;
 };
-- 
2.17.1

