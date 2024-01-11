Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.7])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E0C9EC4
	for <linux-kernel@vger.kernel.org>; Thu, 11 Jan 2024 03:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="IzoZqaRi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=JwXJ7fsA7cmpEsjrHf
	poNIoh9mNuYfp1hWQOmX7j+rI=; b=IzoZqaRilSg/3KjdcmmV4DW+TUw3wiBcXH
	tAqOrsPjVitnUOVRQyuBwBbXc/uPn0FKCrq7eI85Flvb1Sx1tmGGJYhygijxuB8U
	RydRgK8Ni6K/lNyVIaQ9gVQyyNx12ndHPy60O4JZGP2AAPWjzk7vBqM2EtHEm/zh
	GgeQR1RGU=
Received: from localhost.localdomain (unknown [182.148.14.173])
	by gzga-smtp-mta-g0-2 (Coremail) with SMTP id _____wDnj8b0Yp9ljy6eAA--.25586S2;
	Thu, 11 Jan 2024 11:39:32 +0800 (CST)
From: chenxuebing <chenxb_99091@126.com>
To: daniel@ffwll.ch,
	alexander.deucher@amd.com,
	airlied@gmail.com,
	Xinhui.Pan@amd.com,
	christian.koenig@amd.com
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	chenxuebing <chenxb_99091@126.com>
Subject: [PATCH] drm/amd/display: Clean up errors in renoir_ip_offset.h
Date: Thu, 11 Jan 2024 03:39:30 +0000
Message-Id: <20240111033930.8056-1-chenxb_99091@126.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:_____wDnj8b0Yp9ljy6eAA--.25586S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtF1DCF48KF1kKF4Dtw1DKFg_yoW3KFX_Ca
	4xGws5WrWI9FnIqF1IyFn3Za4q93W09FykWw4rtFy5trnrCr1UW3y5Jr9rXr4ruFZxGFsr
	Zan5WFy5XrnagjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRRt8nDUUUUU==
X-CM-SenderInfo: hfkh05lebzmiizr6ij2wof0z/1tbiOhdixWVEuXuEDQAAsg
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Fix the following errors reported by checkpatch:

ERROR: open brace '{' following struct go on the same line

Signed-off-by: chenxuebing <chenxb_99091@126.com>
---
 drivers/gpu/drm/amd/include/renoir_ip_offset.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/include/renoir_ip_offset.h b/drivers/gpu/drm/amd/include/renoir_ip_offset.h
index 7dff85c81e5a..fa023cfdf72d 100644
--- a/drivers/gpu/drm/amd/include/renoir_ip_offset.h
+++ b/drivers/gpu/drm/amd/include/renoir_ip_offset.h
@@ -25,13 +25,11 @@
 #define MAX_SEGMENT                                        5
 
 
-struct IP_BASE_INSTANCE
-{
+struct IP_BASE_INSTANCE {
     unsigned int segment[MAX_SEGMENT];
 };
 
-struct IP_BASE
-{
+struct IP_BASE {
     struct IP_BASE_INSTANCE instance[MAX_INSTANCE];
 } __maybe_unused;
 
-- 
2.17.1

