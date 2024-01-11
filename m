Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.9])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD714EC0
	for <linux-kernel@vger.kernel.org>; Thu, 11 Jan 2024 03:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="bc+vc4K5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=6frwK/KVUEYSvvdJ66
	BFFsb3/bMKiTPIVNBN0xKiv58=; b=bc+vc4K5Y7QBuee1hoTvo7m69SsFmE6ajq
	vaWkAT91W3/x7jBRAgAheSrwsAhwjl7w80xZV7uss7/MQbVHKBeS8dLjAobtDY9p
	nTHjKEk+FmPRSCQOahQNHWls6WIUea4mM9NVgM4dGch8bfZVJnZL8LP1sTtXmeyV
	8qT6P1b+Q=
Received: from localhost.localdomain (unknown [182.148.14.173])
	by gzga-smtp-mta-g1-3 (Coremail) with SMTP id _____wD3X9eAX59lWesuAA--.30668S2;
	Thu, 11 Jan 2024 11:24:49 +0800 (CST)
From: chenxuebing <chenxb_99091@126.com>
To: daniel@ffwll.ch,
	airlied@gmail.com,
	alexander.deucher@amd.com,
	Xinhui.Pan@amd.com,
	christian.koenig@amd.com
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	chenxuebing <chenxb_99091@126.com>
Subject: [PATCH] drm/amd/include/vangogh_ip_offset: Clean up errors in vangogh_ip_offset.h
Date: Thu, 11 Jan 2024 03:24:47 +0000
Message-Id: <20240111032447.7490-1-chenxb_99091@126.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:_____wD3X9eAX59lWesuAA--.30668S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtF1DCF48KF13Kr4kXw1xuFg_yoWfJrg_Ca
	47J3Z3GFWxuFnFgF1IyFn3u34j9wnY9Fs3Xw4ftFy5trnFyr1UW3yUXrn7Xr4ruF92kFsr
	Ja95WFZ8XrnIgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRRK9atUUUUU==
X-CM-SenderInfo: hfkh05lebzmiizr6ij2wof0z/1tbiOhFixWVEuXs+WwABsL
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Fix the following errors reported by checkpatch:

ERROR: open brace '{' following struct go on the same line

Signed-off-by: chenxuebing <chenxb_99091@126.com>
---
 drivers/gpu/drm/amd/include/vangogh_ip_offset.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/include/vangogh_ip_offset.h b/drivers/gpu/drm/amd/include/vangogh_ip_offset.h
index 691073ed780e..695d7d04dfa6 100644
--- a/drivers/gpu/drm/amd/include/vangogh_ip_offset.h
+++ b/drivers/gpu/drm/amd/include/vangogh_ip_offset.h
@@ -28,13 +28,11 @@
 #define MAX_SEGMENT                                         6
 
 
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

