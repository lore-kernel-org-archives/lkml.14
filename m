Received: from m16.mail.163.com (m15.mail.163.com [45.254.50.219])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B9375663
	for <linux-kernel@vger.kernel.org>; Thu, 11 Jan 2024 06:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ajYwqpnG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=tMlRLR1qg9/lV8ANg5
	oVzk/RVrvunJWO7lURJe1t1h8=; b=ajYwqpnGMRiPJTBKgGzZbowc9V/hYuo0VH
	fqpYjRoXIkyvaZxGgF4mxhANfrMU6QtUQUGofQ1m+bHQGxp2VJF16AM1/icLTQN6
	amy7Tg10+icGhsFij0ILfrX4O5M0xsoMwFwL0DpCycJKxCoT98jMDUQkp3YLP4o0
	oA8uBMo/M=
Received: from localhost.localdomain (unknown [182.148.14.173])
	by gzga-smtp-mta-g0-3 (Coremail) with SMTP id _____wD3X+8wkZ9lbDKQAA--.17659S2;
	Thu, 11 Jan 2024 14:56:49 +0800 (CST)
From: GuoHua Chen <chenguohua_716@163.com>
To: airlied@gmail.com,
	daniel@ffwll.ch,
	tzimmermann@suse.de,
	mripard@kernel.org,
	patrik.r.jakobsson@gmail.com,
	maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	GuoHua Chen <chenguohua_716@163.com>
Subject: [PATCH] drm: Clean up errors in cdv_intel_dp.h
Date: Thu, 11 Jan 2024 06:56:48 +0000
Message-Id: <20240111065648.9170-1-chenguohua_716@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:_____wD3X+8wkZ9lbDKQAA--.17659S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrur13Ww1fXFyUZr1rJF4kXrb_yoW3trX_WF
	4UXrsrZrW3Cay5Wry7Ar9I9ryYvF1F93yv9Fy7Ka43Jw17Ary5u3429FykZ3WrCryUWFsr
	J3WkXFyrCrn3ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUj8wItUUUUU==
X-CM-SenderInfo: xfkh0w5xrk3tbbxrlqqrwthudrp/1tbiqBNi1mVOBk5u1AAAsW
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Fix the following errors reported by checkpatch:

ERROR: else should follow close brace '}'

Signed-off-by: GuoHua Chen <chenguohua_716@163.com>
---
 drivers/gpu/drm/gma500/cdv_intel_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma500/cdv_intel_dp.c
index 27cfeb6b470f..135a1226df1a 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
@@ -735,7 +735,7 @@ cdv_intel_dp_aux_native_read(struct gma_encoder *encoder,
 		if ((ack & DP_AUX_NATIVE_REPLY_MASK) == DP_AUX_NATIVE_REPLY_ACK) {
 			memcpy(recv, reply + 1, ret - 1);
 			return ret - 1;
-		} else 
+		} else
 			if ((ack & DP_AUX_NATIVE_REPLY_MASK) == DP_AUX_NATIVE_REPLY_DEFER)
 				udelay(100);
 			else
-- 
2.17.1

