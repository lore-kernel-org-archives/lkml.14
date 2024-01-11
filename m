Received: from m16.mail.163.com (m15.mail.163.com [45.254.50.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53085D26A
	for <linux-kernel@vger.kernel.org>; Thu, 11 Jan 2024 07:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="pdK3rx4I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=7tZ+Al8JEkFnVgRnmt
	irXvujrce962QyqAYda92sLOg=; b=pdK3rx4IQAyOKeWFiRijBlEx69g0SuiO0n
	zN/XTvnegJgEoi9urOFbatsHGnufdBXERNrj9cjMlFp+3NeepymTF3AZhNFqHngh
	pBqnHanCchx9r/CrO6PQMehL+nkimzOwKuVk7dZDhMKtOlXW10tlkBjzL/oRcMUy
	8+6SrdSNQ=
Received: from localhost.localdomain (unknown [182.148.14.173])
	by gzga-smtp-mta-g0-3 (Coremail) with SMTP id _____wD3n5b6lZ9lFHaRAA--.13440S2;
	Thu, 11 Jan 2024 15:17:14 +0800 (CST)
From: GuoHua Chen <chenguohua_716@163.com>
To: alain.volmat@foss.st.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	GuoHua Chen <chenguohua_716@163.com>
Subject: [PATCH] drm/sti: Clean up errors in sti_hda.c
Date: Thu, 11 Jan 2024 07:17:13 +0000
Message-Id: <20240111071713.10056-1-chenguohua_716@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:_____wD3n5b6lZ9lFHaRAA--.13440S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKw15uF48Zr4ftryUJry8uFg_yoWfZrb_GF
	W8Wrn5ZFZrAw1DAw13Cr1YvFyvvan8uFZ3Cw4S9a4aqFs7Ar4fJa4FgFyUWw1kXF42gFZx
	Aws2qry5ZrnxGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjT7KDUUUUU==
X-CM-SenderInfo: xfkh0w5xrk3tbbxrlqqrwthudrp/1tbiqB9i1mVOBk7woAAAsw
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Fix the following errors reported by checkpatch:

ERROR: space prohibited before that ',' (ctx:WxW)

Signed-off-by: GuoHua Chen <chenguohua_716@163.com>
---
 drivers/gpu/drm/sti/sti_hda.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sti/sti_hda.c b/drivers/gpu/drm/sti/sti_hda.c
index 6ee35612a14e..1079ac0732c5 100644
--- a/drivers/gpu/drm/sti/sti_hda.c
+++ b/drivers/gpu/drm/sti/sti_hda.c
@@ -486,7 +486,7 @@ static void sti_hda_pre_enable(struct drm_bridge *bridge)
 	hda_write(hda, SCALE_CTRL_CR_DFLT, HDA_ANA_SCALE_CTRL_CR);
 
 	/* Configure sampler */
-	hda_write(hda , src_filter_y, HDA_ANA_SRC_Y_CFG);
+	hda_write(hda, src_filter_y, HDA_ANA_SRC_Y_CFG);
 	hda_write(hda, src_filter_c,  HDA_ANA_SRC_C_CFG);
 	for (i = 0; i < SAMPLER_COEF_NB; i++) {
 		hda_write(hda, coef_y[i], HDA_COEFF_Y_PH1_TAP123 + i * 4);
-- 
2.17.1

