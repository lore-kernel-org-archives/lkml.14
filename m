Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.6])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C047A4A
	for <linux-kernel@vger.kernel.org>; Thu, 11 Jan 2024 03:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="Z2PZsadU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=X7/hcIuRpwjcQd9lz0
	bnRT1q5+i9Qj9IDqkJ2j/QrPY=; b=Z2PZsadU1dI6DoCqXI2h/DRaptgIrAPtm9
	Q4txrSrI/PcIGLF/Dd0A8nrUG5cauJqcFrbFVuRmEHs9DGMBG/phCqmO6o+wNkXy
	GyAhNYAku9ah0QpMuLcqv1A1UOPcF3DJBnXeD1PRl7D5InITK3E5CpXERelxuyy+
	lt0F8Deis=
Received: from localhost.localdomain (unknown [182.148.14.173])
	by gzga-smtp-mta-g0-2 (Coremail) with SMTP id _____wD33wLmWZ9lnk+dAA--.4894S2;
	Thu, 11 Jan 2024 11:00:54 +0800 (CST)
From: chenxuebing <chenxb_99091@126.com>
To: Xinhui.Pan@amd.com,
	airlied@gmail.com,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	chenxuebing <chenxb_99091@126.com>
Subject: [PATCH] drm/amdgpu: Clean up errors in navi12_ip_offset.h
Date: Thu, 11 Jan 2024 03:00:53 +0000
Message-Id: <20240111030053.6868-1-chenxb_99091@126.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:_____wD33wLmWZ9lnk+dAA--.4894S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtF1DCF48Kr4kWryDJw47urg_yoW3KFX_Ca
	4xJ3s3WrWxWFn2qFsFkFWxZ34jka18uFn3Xw4rtFy5trsrAr18W3y5Gr47XrWruFnIgFZr
	Za1kWFy5XrnIgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRR_OzPUUUUU==
X-CM-SenderInfo: hfkh05lebzmiizr6ij2wof0z/1tbiWQ5ixWVLYT6tKAABsF
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Fix the following errors reported by checkpatch:

ERROR: open brace '{' following struct go on the same line

Signed-off-by: chenxuebing <chenxb_99091@126.com>
---
 drivers/gpu/drm/amd/include/navi12_ip_offset.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/include/navi12_ip_offset.h b/drivers/gpu/drm/amd/include/navi12_ip_offset.h
index d8fc00478b6a..e94d80ec8d92 100644
--- a/drivers/gpu/drm/amd/include/navi12_ip_offset.h
+++ b/drivers/gpu/drm/amd/include/navi12_ip_offset.h
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

