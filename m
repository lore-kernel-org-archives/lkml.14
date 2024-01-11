Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.6])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FF8D15D0
	for <linux-kernel@vger.kernel.org>; Thu, 11 Jan 2024 02:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="iBgjqxt4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=6XnZjv2AWPiI5dqzax
	Rd+P/BdNiXsS2TWUib8qNZYKo=; b=iBgjqxt4vjbfmHHDs60si/oISpoy7ig8nT
	LTK3ltXA48wnW8Dfpbju1D9ZlHi6q3+y9JA7wVMbIHRZDJ9hVEfU1mH3MSmd1kOQ
	t72tNk3nr6O7uRAIWUHmJ7tx21VrbISJjXZdpfV3GqZO85BDGMh+9t0VPDEVgoqk
	D09sQzXRE=
Received: from localhost.localdomain (unknown [182.148.14.173])
	by gzga-smtp-mta-g0-3 (Coremail) with SMTP id _____wDnD9uXWJ9lwy+dAA--.10032S2;
	Thu, 11 Jan 2024 10:55:19 +0800 (CST)
From: chenxuebing <chenxb_99091@126.com>
To: Xinhui.Pan@amd.com,
	daniel@ffwll.ch,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	chenxuebing <chenxb_99091@126.com>
Subject: [PATCH] drm/amd/include: Clean up errors in arct_ip_offset.h
Date: Thu, 11 Jan 2024 02:55:17 +0000
Message-Id: <20240111025517.6687-1-chenxb_99091@126.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:_____wDnD9uXWJ9lwy+dAA--.10032S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtF1DCF48Kry8Zr1xWw4rKrg_yoWfJrc_Ca
	4xJ395W3y7uFnFqF1akFn3u34j9a1ruFnYqw1fta4rtrZFkr4UW395Jr42qr4ruFs3CFsr
	Z3WkXFW5ZrnIgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUj2NtUUUUU==
X-CM-SenderInfo: hfkh05lebzmiizr6ij2wof0z/1tbiGA5ixWVLZWL-aQADsN
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Fix the following errors reported by checkpatch:

ERROR: open brace '{' following struct go on the same line

Signed-off-by: chenxuebing <chenxb_99091@126.com>
---
 drivers/gpu/drm/amd/include/arct_ip_offset.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/include/arct_ip_offset.h b/drivers/gpu/drm/amd/include/arct_ip_offset.h
index af1c46991429..7dd876f7df74 100644
--- a/drivers/gpu/drm/amd/include/arct_ip_offset.h
+++ b/drivers/gpu/drm/amd/include/arct_ip_offset.h
@@ -25,13 +25,11 @@
 #define MAX_SEGMENT                                         6
 
 
-struct IP_BASE_INSTANCE
-{
+struct IP_BASE_INSTANCE {
     unsigned int segment[MAX_SEGMENT];
 } __maybe_unused;
 
-struct IP_BASE
-{
+struct IP_BASE {
     struct IP_BASE_INSTANCE instance[MAX_INSTANCE];
 } __maybe_unused;
 
-- 
2.17.1

