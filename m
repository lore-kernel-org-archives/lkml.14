Received: from m16.mail.163.com (m15.mail.163.com [45.254.50.219])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 826D6CA64
	for <linux-kernel@vger.kernel.org>; Thu, 11 Jan 2024 07:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ddCHvTHc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=N4fl1Vr4yKPgLj4QrJ
	Z2wWvmpX5FPtU3ppWBKDsxI5I=; b=ddCHvTHcyMUimurQEGeNViyjt3ZWfoyJq2
	Gnw9UJcJGS8l/eeRElLMZU7hg3a2i/Q/2CBiPx1BlBlZZH/wGEciHssWXxUEkozM
	tJz8e/czZrW7We3L+vl/RCZBSkvwyXHK3WoE86g/zAoEFDkssH5mWMr4dFjtg0Z1
	bTu85joT8=
Received: from localhost.localdomain (unknown [182.148.14.173])
	by gzga-smtp-mta-g0-4 (Coremail) with SMTP id _____wDnzyqnkp9lyLyPAA--.56040S2;
	Thu, 11 Jan 2024 15:03:04 +0800 (CST)
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
Subject: [PATCH] drm/gma500: Clean up errors in oaktrail_lvds.h
Date: Thu, 11 Jan 2024 07:03:03 +0000
Message-Id: <20240111070303.9344-1-chenguohua_716@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:_____wDnzyqnkp9lyLyPAA--.56040S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtF1fZF1rZF45Kw4kCF47CFg_yoWfJFb_CF
	W8GF4rWw4Dua1q9r1xAr4Yvr1qy3W5urs7ZFs3tFy3J345Zr15W3yYgFW3XFyxZayxWFZr
	twna9F98AFs7CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjb4S3UUUUU==
X-CM-SenderInfo: xfkh0w5xrk3tbbxrlqqrwthudrp/xtbBEgVi1mVOBk2+6AAAsV
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Fix the following errors reported by checkpatch:

ERROR: space prohibited after that open parenthesis '('

Signed-off-by: GuoHua Chen <chenguohua_716@163.com>
---
 drivers/gpu/drm/gma500/oaktrail_lvds.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gma500/oaktrail_lvds.c b/drivers/gpu/drm/gma500/oaktrail_lvds.c
index d974d0c60d2a..62490a49c1ba 100644
--- a/drivers/gpu/drm/gma500/oaktrail_lvds.c
+++ b/drivers/gpu/drm/gma500/oaktrail_lvds.c
@@ -126,7 +126,7 @@ static void oaktrail_lvds_mode_set(struct drm_encoder *encoder,
 		return;
 	}
 
-	drm_object_property_get_value( &connector->base,
+	drm_object_property_get_value(&connector->base,
 		dev->mode_config.scaling_mode_property, &v);
 	drm_connector_list_iter_end(&conn_iter);
 
-- 
2.17.1

