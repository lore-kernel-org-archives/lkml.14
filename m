Received: from m16.mail.163.com (m15.mail.163.com [45.254.50.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2E7CE544
	for <linux-kernel@vger.kernel.org>; Thu, 11 Jan 2024 08:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="QfemAd+L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=GbOAo++7oysYIAnWef
	V3Jn+5qb8czDoPosnXjp6SIEM=; b=QfemAd+L8FqnQ1bjDeYAB6DSoS8SBadTeh
	cHqOcyBHhilHX/unh86Au+adIkLgmXDSwOKuBYGX5aTsnNHYyxunsgouiCaTzAgl
	o+mJUx8eq9REF7XsxURVnvLQZOFwbN3hHQXjSALI9U2+UzeS8oI1qCrdxxBQ/gFa
	3FVfpj7gI=
Received: from localhost.localdomain (unknown [182.148.14.173])
	by gzga-smtp-mta-g0-1 (Coremail) with SMTP id _____wD331Q2op9lFNkQAA--.1687S2;
	Thu, 11 Jan 2024 16:09:27 +0800 (CST)
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
Subject: [PATCH] drm/radeon/dpm: Clean up errors in trinity_dpm.h
Date: Thu, 11 Jan 2024 08:09:23 +0000
Message-Id: <20240111080923.11317-1-chenguohua_716@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:_____wD331Q2op9lFNkQAA--.1687S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtF1kXF13tr13WFyDWFWDtwb_yoWxKFg_C3
	4UX3yDXrW2kFn5uF18AFsxAryIva1FvF48Cr1ft348Jry2vr1fuayv9r9rXayUGFn3ZFn8
	Aa1kXrs3ZFsrXjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUtC7UUUUUU==
X-CM-SenderInfo: xfkh0w5xrk3tbbxrlqqrwthudrp/xtbBEBti1mVOBk9XvwAAs1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Fix the following errors reported by checkpatch:

ERROR: open brace '{' following struct go on the same line

Signed-off-by: GuoHua Chen <chenguohua_716@163.com>
---
 drivers/gpu/drm/radeon/trinity_dpm.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/trinity_dpm.h b/drivers/gpu/drm/radeon/trinity_dpm.h
index c261657750ca..431e2b68d21e 100644
--- a/drivers/gpu/drm/radeon/trinity_dpm.h
+++ b/drivers/gpu/drm/radeon/trinity_dpm.h
@@ -64,8 +64,7 @@ struct trinity_ps {
 
 #define TRINITY_NUM_NBPSTATES   4
 
-struct trinity_uvd_clock_table_entry
-{
+struct trinity_uvd_clock_table_entry {
 	u32 vclk;
 	u32 dclk;
 	u8 vclk_did;
-- 
2.17.1

