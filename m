Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.6])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE405101C5
	for <linux-kernel@vger.kernel.org>; Thu, 11 Jan 2024 09:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="ex1NxR6C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=ANEG89gYRf51+rapw8
	sx8ynu43x7AerI7oBF9GRbLlo=; b=ex1NxR6CodTaMLVBzT71AwNPP2j+61Geuv
	+OLrDfKpBTyt47SmaCsN8CsI39tgY/9icXG2b2+ZdobnyyuKbg/U/EdUTO/Ou0I8
	/2uhPkKvIm8OhvvYOFq3gjHBKnjPatCSKYbA4RcuWt1+m96nQP2BVBZf0tB1QlY1
	nka3V5kEg=
Received: from localhost.localdomain (unknown [182.148.14.173])
	by gzga-smtp-mta-g0-3 (Coremail) with SMTP id _____wDX36rgsJ9lRz+lAA--.34645S2;
	Thu, 11 Jan 2024 17:12:00 +0800 (CST)
From: XueBing Chen <chenxb_99091@126.com>
To: daniel@ffwll.ch,
	Xinhui.Pan@amd.com,
	alexander.deucher@amd.com,
	airlied@gmail.com,
	christian.koenig@amd.com
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	XueBing Chen <chenxb_99091@126.com>
Subject: [PATCH] drm/radeon/kms: Clean up errors in radeon_pm.c
Date: Thu, 11 Jan 2024 09:11:59 +0000
Message-Id: <20240111091159.13564-1-chenxb_99091@126.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:_____wDX36rgsJ9lRz+lAA--.34645S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrur48GrWrKF15Gr1xZw4fXwb_yoWkGFX_uF
	W8uFyUX34qv34kuF1a9a90yr9Igr4kur4UZw4ft3WfJry5ZF18XFy8ZFnrXr4UXF4rJFn8
	Jw4kWa43AFsF9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUj2NtUUUUU==
X-CM-SenderInfo: hfkh05lebzmiizr6ij2wof0z/1tbiWQJixWVLYUQm5AAAs1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Fix the following errors reported by checkpatch:

ERROR: space required before the open parenthesis '('

Signed-off-by: XueBing Chen <chenxb_99091@126.com>
---
 drivers/gpu/drm/radeon/radeon_pm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_pm.c b/drivers/gpu/drm/radeon/radeon_pm.c
index b73fd9ab0252..4482c8c5f5ce 100644
--- a/drivers/gpu/drm/radeon/radeon_pm.c
+++ b/drivers/gpu/drm/radeon/radeon_pm.c
@@ -587,7 +587,7 @@ static ssize_t radeon_hwmon_set_pwm1_enable(struct device *dev,
 	int err;
 	int value;
 
-	if(!rdev->asic->dpm.fan_ctrl_set_mode)
+	if (!rdev->asic->dpm.fan_ctrl_set_mode)
 		return -EINVAL;
 
 	err = kstrtoint(buf, 10, &value);
@@ -789,7 +789,7 @@ static umode_t hwmon_attributes_visible(struct kobject *kobj,
 		return 0;
 
 	/* Skip vddc attribute if get_current_vddc is not implemented */
-	if(attr == &sensor_dev_attr_in0_input.dev_attr.attr &&
+	if (attr == &sensor_dev_attr_in0_input.dev_attr.attr &&
 		!rdev->asic->dpm.get_current_vddc)
 		return 0;
 
-- 
2.17.1

