Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8575C10A14
	for <linux-kernel@vger.kernel.org>; Thu, 11 Jan 2024 08:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="pR+FxTnY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=yIzZtNZgUk+hSg+LRm
	vyXhs5mkbZ/NoO0/JblU6W9xQ=; b=pR+FxTnYzQfJ26kf7/SYkr44nWiV0torxa
	S24RKhmDyBfnUeC9FVTisuJqbJOyFvcoYE2H/H1nSHATAZ7knm3gQUnERlCQ3Ry7
	YiTrQe/LYBXmWAXjuExiRdNE0H7jaLl29tI5gyvAODd7Z+mRGYANZkcAPXdodJxF
	WJHnO2hJg=
Received: from localhost.localdomain (unknown [182.148.14.173])
	by gzga-smtp-mta-g0-1 (Coremail) with SMTP id _____wDnjxEVpJ9lJ0sRAA--.4258S2;
	Thu, 11 Jan 2024 16:17:25 +0800 (CST)
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
Subject: [PATCH] drm/radeon: Clean up errors in rv6xx_dpm.h
Date: Thu, 11 Jan 2024 08:17:24 +0000
Message-Id: <20240111081724.11578-1-chenguohua_716@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:_____wDnjxEVpJ9lJ0sRAA--.4258S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKFWDZrWxuFy5Kry8JFWfuFg_yoWfWFb_Gr
	n7Xa93CrW7uryv9F1xArsIyrWIv398uFs3G3W8KF43J347X3WxZ3srZF9rX345JF4xAFn7
	Ka1vgFyfCrs3WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUj2YLDUUUUU==
X-CM-SenderInfo: xfkh0w5xrk3tbbxrlqqrwthudrp/1tbiqBZi1mVOBlBo9wAAso
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Fix the following errors reported by checkpatch:

ERROR: that open brace { should be on the previous line

Signed-off-by: GuoHua Chen <chenguohua_716@163.com>
---
 drivers/gpu/drm/radeon/atombios_crtc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/atombios_crtc.c b/drivers/gpu/drm/radeon/atombios_crtc.c
index ade13173921b..ecebebe2e7a6 100644
--- a/drivers/gpu/drm/radeon/atombios_crtc.c
+++ b/drivers/gpu/drm/radeon/atombios_crtc.c
@@ -213,8 +213,7 @@ static void atombios_enable_crtc_memreq(struct drm_crtc *crtc, int state)
 	atom_execute_table(rdev->mode_info.atom_context, index, (uint32_t *)&args);
 }
 
-static const u32 vga_control_regs[6] =
-{
+static const u32 vga_control_regs[6] = {
 	AVIVO_D1VGA_CONTROL,
 	AVIVO_D2VGA_CONTROL,
 	EVERGREEN_D3VGA_CONTROL,
-- 
2.17.1

