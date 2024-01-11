Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.7])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D15752578
	for <linux-kernel@vger.kernel.org>; Thu, 11 Jan 2024 03:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="HTDhAKMs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=6FqB+geSfI83FPbRyv
	FYVNdr9jLJwIlBDU/KwiFg6l4=; b=HTDhAKMs1fbGCiPsn3sJwtx/OiJcQyXP+6
	7Fkehessf8Mb2dtnPGCeq89EWXsPiugPS9YvTVrdviuqLAFiwUJKdbdhVy+As3UP
	PTka1bcI7b9epFv+T8toZTpooGTLjf3R9g6bpVS6nTNs0E9ldJAt5fNcSUiaUN67
	ZZ2WPFPmE=
Received: from localhost.localdomain (unknown [182.148.14.173])
	by gzga-smtp-mta-g0-4 (Coremail) with SMTP id _____wDXP4HFXp9liiqdAA--.13025S2;
	Thu, 11 Jan 2024 11:21:41 +0800 (CST)
From: chenxuebing <chenxb_99091@126.com>
To: alexander.deucher@amd.com,
	Xinhui.Pan@amd.com,
	airlied@gmail.com,
	christian.koenig@amd.com,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	chenxuebing <chenxb_99091@126.com>
Subject: [PATCH] drm/amd/pp: Clean up errors in dm_pp_interface.h
Date: Thu, 11 Jan 2024 03:21:40 +0000
Message-Id: <20240111032140.7313-1-chenxb_99091@126.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:_____wDXP4HFXp9liiqdAA--.13025S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KF4fAr4DtrWUKFyfur4Uurg_yoW8Wr13pF
	sxJF1DAFWUJFnIgayUJFyS9rW8W39rKF1xGry3C3y3A3WIvFZIv3Z8Jr1UGr1fuFnxXrs7
	t3WxKayIqFZIkwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRRbyNUUUUU=
X-CM-SenderInfo: hfkh05lebzmiizr6ij2wof0z/1tbiHAhixWV2zz+ywAAAsi
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Fix the following errors reported by checkpatch:

ERROR: open brace '{' following struct go on the same line
ERROR: space prohibited before that ',' (ctx:WxE)

Signed-off-by: chenxuebing <chenxb_99091@126.com>
---
 drivers/gpu/drm/amd/include/dm_pp_interface.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/include/dm_pp_interface.h b/drivers/gpu/drm/amd/include/dm_pp_interface.h
index 1d93a0c574c9..acd1cef61b7c 100644
--- a/drivers/gpu/drm/amd/include/dm_pp_interface.h
+++ b/drivers/gpu/drm/amd/include/dm_pp_interface.h
@@ -27,7 +27,7 @@
 
 #define PP_MAX_CLOCK_LEVELS 16
 
-enum amd_pp_display_config_type{
+enum amd_pp_display_config_type {
 	AMD_PP_DisplayConfigType_None = 0,
 	AMD_PP_DisplayConfigType_DP54 ,
 	AMD_PP_DisplayConfigType_DP432 ,
@@ -36,8 +36,8 @@ enum amd_pp_display_config_type{
 	AMD_PP_DisplayConfigType_DP243,
 	AMD_PP_DisplayConfigType_DP216,
 	AMD_PP_DisplayConfigType_DP162,
-	AMD_PP_DisplayConfigType_HDMI6G ,
-	AMD_PP_DisplayConfigType_HDMI297 ,
+	AMD_PP_DisplayConfigType_HDMI6G,
+	AMD_PP_DisplayConfigType_HDMI297,
 	AMD_PP_DisplayConfigType_HDMI162,
 	AMD_PP_DisplayConfigType_LVDS,
 	AMD_PP_DisplayConfigType_DVI,
@@ -45,8 +45,7 @@ enum amd_pp_display_config_type{
 	AMD_PP_DisplayConfigType_VGA
 };
 
-struct single_display_configuration
-{
+struct single_display_configuration {
 	uint32_t controller_index;
 	uint32_t controller_id;
 	uint32_t signal_type;
-- 
2.17.1

