Received: from m16.mail.163.com (m15.mail.163.com [45.254.50.219])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC26811C8F
	for <linux-kernel@vger.kernel.org>; Thu, 11 Jan 2024 08:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="G3ht1Hrb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=K5jkcFwfLSzHGD8i3r
	gXpJa3IpDSb25X30niYM6V+dU=; b=G3ht1Hrb6MQjvFAWak1VX81kWQnHU0dsXD
	Ejz74HdMXp/kuEHHpW+c4y9LeW8WO4qKB72N8zVwQVlGwKuqCq2NoYRTAi0kWC8L
	5y11Y0H8fxg7r2ztbKcuR5e0MVEUbJ7qnHdQ9kSY9gftY5Kqtd9vdEBdQ2wQu5Ts
	4k0ZuUVR0=
Received: from localhost.localdomain (unknown [182.148.14.173])
	by gzga-smtp-mta-g0-2 (Coremail) with SMTP id _____wD3XwHKqp9lkZiWAA--.65077S2;
	Thu, 11 Jan 2024 16:46:03 +0800 (CST)
From: GuoHua Chen <chenguohua_716@163.com>
To: daniel@ffwll.ch,
	Xinhui.Pan@amd.com,
	alexander.deucher@amd.com,
	airlied@gmail.com,
	christian.koenig@amd.com
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	GuoHua Chen <chenguohua_716@163.com>
Subject: [PATCH] drm/radeon: Clean up errors in rv770_smc.h
Date: Thu, 11 Jan 2024 08:46:00 +0000
Message-Id: <20240111084600.12587-1-chenguohua_716@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:_____wD3XwHKqp9lkZiWAA--.65077S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZF4rCw18Gw1xJr1DZw1UKFg_yoW5Cr47pw
	47Gas8Jr45ta4293Z7GFWUAr1YyF4DtF43uFyava43XFWjvr4jkFy0gF45AFyfGa47uFyf
	XrWDtryUZ3ZIyaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UFdgAUUUUU=
X-CM-SenderInfo: xfkh0w5xrk3tbbxrlqqrwthudrp/xtbBEA5i1mVOBlA7dAAAsY
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Fix the following errors reported by checkpatch:

ERROR: open brace '{' following struct go on the same line
ERROR: open brace '{' following union go on the same line

Signed-off-by: GuoHua Chen <chenguohua_716@163.com>
---
 drivers/gpu/drm/radeon/rv770_smc.h | 27 +++++++++------------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/radeon/rv770_smc.h b/drivers/gpu/drm/radeon/rv770_smc.h
index 3b2c963c4880..d8e8f70135f2 100644
--- a/drivers/gpu/drm/radeon/rv770_smc.h
+++ b/drivers/gpu/drm/radeon/rv770_smc.h
@@ -31,8 +31,7 @@
 
 #define RV770_SMC_PERFORMANCE_LEVELS_PER_SWSTATE    3
 
-struct RV770_SMC_SCLK_VALUE
-{
+struct RV770_SMC_SCLK_VALUE {
     uint32_t        vCG_SPLL_FUNC_CNTL;
     uint32_t        vCG_SPLL_FUNC_CNTL_2;
     uint32_t        vCG_SPLL_FUNC_CNTL_3;
@@ -43,8 +42,7 @@ struct RV770_SMC_SCLK_VALUE
 
 typedef struct RV770_SMC_SCLK_VALUE RV770_SMC_SCLK_VALUE;
 
-struct RV770_SMC_MCLK_VALUE
-{
+struct RV770_SMC_MCLK_VALUE {
     uint32_t        vMPLL_AD_FUNC_CNTL;
     uint32_t        vMPLL_AD_FUNC_CNTL_2;
     uint32_t        vMPLL_DQ_FUNC_CNTL;
@@ -59,8 +57,7 @@ struct RV770_SMC_MCLK_VALUE
 typedef struct RV770_SMC_MCLK_VALUE RV770_SMC_MCLK_VALUE;
 
 
-struct RV730_SMC_MCLK_VALUE
-{
+struct RV730_SMC_MCLK_VALUE {
     uint32_t        vMCLK_PWRMGT_CNTL;
     uint32_t        vDLL_CNTL;
     uint32_t        vMPLL_FUNC_CNTL;
@@ -73,8 +70,7 @@ struct RV730_SMC_MCLK_VALUE
 
 typedef struct RV730_SMC_MCLK_VALUE RV730_SMC_MCLK_VALUE;
 
-struct RV770_SMC_VOLTAGE_VALUE
-{
+struct RV770_SMC_VOLTAGE_VALUE {
     uint16_t             value;
     uint8_t              index;
     uint8_t              padding;
@@ -82,16 +78,14 @@ struct RV770_SMC_VOLTAGE_VALUE
 
 typedef struct RV770_SMC_VOLTAGE_VALUE RV770_SMC_VOLTAGE_VALUE;
 
-union RV7XX_SMC_MCLK_VALUE
-{
+union RV7XX_SMC_MCLK_VALUE {
     RV770_SMC_MCLK_VALUE    mclk770;
     RV730_SMC_MCLK_VALUE    mclk730;
 };
 
 typedef union RV7XX_SMC_MCLK_VALUE RV7XX_SMC_MCLK_VALUE, *LPRV7XX_SMC_MCLK_VALUE;
 
-struct RV770_SMC_HW_PERFORMANCE_LEVEL
-{
+struct RV770_SMC_HW_PERFORMANCE_LEVEL {
     uint8_t                 arbValue;
     union{
         uint8_t             seqValue;
@@ -126,8 +120,7 @@ struct RV770_SMC_HW_PERFORMANCE_LEVEL
 
 typedef struct RV770_SMC_HW_PERFORMANCE_LEVEL RV770_SMC_HW_PERFORMANCE_LEVEL;
 
-struct RV770_SMC_SWSTATE
-{
+struct RV770_SMC_SWSTATE {
     uint8_t           flags;
     uint8_t           padding1;
     uint8_t           padding2;
@@ -142,8 +135,7 @@ typedef struct RV770_SMC_SWSTATE RV770_SMC_SWSTATE;
 #define RV770_SMC_VOLTAGEMASK_VDDCI 2
 #define RV770_SMC_VOLTAGEMASK_MAX  4
 
-struct RV770_SMC_VOLTAGEMASKTABLE
-{
+struct RV770_SMC_VOLTAGEMASKTABLE {
     uint8_t  highMask[RV770_SMC_VOLTAGEMASK_MAX];
     uint32_t lowMask[RV770_SMC_VOLTAGEMASK_MAX];
 };
@@ -152,8 +144,7 @@ typedef struct RV770_SMC_VOLTAGEMASKTABLE RV770_SMC_VOLTAGEMASKTABLE;
 
 #define MAX_NO_VREG_STEPS 32
 
-struct RV770_SMC_STATETABLE
-{
+struct RV770_SMC_STATETABLE {
     uint8_t             thermalProtectType;
     uint8_t             systemFlags;
     uint8_t             maxVDDCIndexInPPTable;
-- 
2.17.1

