Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.6])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F28410E8
	for <linux-kernel@vger.kernel.org>; Thu, 11 Jan 2024 02:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="aEVDtYQ9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=nd6Mj0RtoD5c7xd3/S
	D4+mpKUxvN4uC5t+EZUCKM8Tg=; b=aEVDtYQ9pXCiMSUMMF7Lo4e0QAr6MIxsHV
	fiqJRc69dJuGRtXF1AcDGUDtTi8Wob/wEIVMh5fRPu/Z6IzjVSyngXWAgnrC1vst
	vig1EDSxCLmfWAtbdPFAf7/ham9TwEt+z5Q3NMpOULHASOH1UDqSfnNEv5M8oBIR
	T0cLQGS3Y=
Received: from localhost.localdomain (unknown [182.148.14.173])
	by gzga-smtp-mta-g0-5 (Coremail) with SMTP id _____wD3n6HjV59ld++cAA--.11062S2;
	Thu, 11 Jan 2024 10:52:19 +0800 (CST)
From: chenxuebing <chenxb_99091@126.com>
To: airlied@gmail.com,
	Xinhui.Pan@amd.com,
	daniel@ffwll.ch,
	christian.koenig@amd.com,
	alexander.deucher@amd.com
Cc: amd-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	chenxuebing <chenxb_99091@126.com>
Subject: [PATCH] drm/amdgpu: Clean up errors in umc_v6_0.c
Date: Thu, 11 Jan 2024 02:52:18 +0000
Message-Id: <20240111025218.6599-1-chenxb_99091@126.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:_____wD3n6HjV59ld++cAA--.11062S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtr1fZw15Cw1kAr48tFyUAwb_yoWxZrb_Cr
	WUJ3sIqFsrAFn2qw1avwsxZFy0vF1rZFWkAF1jqa4Syry7Z345XrWqgr1kXr18ursxCF9r
	Xw4qgr45JasrCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUU0tC7UUUUU==
X-CM-SenderInfo: hfkh05lebzmiizr6ij2wof0z/1tbiWQVixWVLYT6O6gAAsu
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Fix the following errors reported by checkpatch:

ERROR: space required after that ',' (ctx:VxV)

Signed-off-by: chenxuebing <chenxb_99091@126.com>
---
 drivers/gpu/drm/amd/amdgpu/umc_v6_0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/umc_v6_0.c b/drivers/gpu/drm/amd/amdgpu/umc_v6_0.c
index 0d6b50528d76..97fa88ed770c 100644
--- a/drivers/gpu/drm/amd/amdgpu/umc_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/umc_v6_0.c
@@ -25,7 +25,7 @@
 
 static void umc_v6_0_init_registers(struct amdgpu_device *adev)
 {
-	unsigned i,j;
+	unsigned i, j;
 
 	for (i = 0; i < 4; i++)
 		for (j = 0; j < 4; j++)
-- 
2.17.1

