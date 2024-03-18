Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7463657886;
	Mon, 18 Mar 2024 19:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710791926; cv=none; b=hKTbdmmWM4p9PBr/5N4Rl3DDvqwIDyIkaz215SEa06neXFmLmSDq8xme9SxwC0P8SAMdh0osbWoPdvhPPgLgiRpTVn/j8OgHwUqldxGqfZpATZuEQvb/19ufNxHDfb/EPtjAl31jv0xmRmpOFltqWZwZqCHMrS3FLfi5VcCjWnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710791926; c=relaxed/simple;
	bh=BQx6VNvTlzK5oQIvrUO32TBVz9kFRTi0gekP4j1rY5I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WEa+ZdomfYpGLE0HFSG2BaIsDhzXN1bWqVWvkjGq/JTRumLuIVJ1BcpdZ734ba3pyjybBGw8KF8K1DfIdA1EnYOgU4OMNmetyoItXV/CzVnK06NP9dwARmCliDYRjcEdNj0iKBGlxZveGSbidbPyaCSQs2nSqwR6fYva8qp2NUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JELimW9i; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JELimW9i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710791925; x=1742327925;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BQx6VNvTlzK5oQIvrUO32TBVz9kFRTi0gekP4j1rY5I=;
  b=JELimW9ic695Y73W0STnxjU3SGjMVDjcwY4yU5kh7jMpMTuEoRClNC8A
   kiFr2F0e+cPIeIWYr6ooCx+NxMdCBHqE/4QJu+Kfh2jTRKix1a/zbThsu
   fQuFyAnuaLIIE200s3KLproULhdpc+daOJbJHTjzqgvPB3pd2yu5UFnox
   TrH2H+83s8srZLRZtaNCjWtbGSu4KGsFx8BJkaMkL08X1pryDJic9YekM
   UB+tRlVu6ix3bJwLGq9avIwLGsVYTs4eStChmsxjp6bdpEyyLn2JrUQst
   u9fQRE4QWZ5dpL4Y44kdC/yxhinGS//8wS48RGiTpNyb03P4tiA5swFgT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="16776143"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="16776143"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2024 12:58:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="937060632"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="937060632"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 18 Mar 2024 12:58:39 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id C6F03815; Mon, 18 Mar 2024 21:58:38 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] ASoC: fsl: imx-es8328: Switch to using gpiod API
Date: Mon, 18 Mar 2024 21:58:37 +0200
Message-ID: <20240318195837.180069-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This updates the driver to gpiod API, and removes yet another use of
of_get_named_gpio().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/soc/fsl/imx-es8328.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/sound/soc/fsl/imx-es8328.c b/sound/soc/fsl/imx-es8328.c
index 6f0d031c1d5f..ad915c55cc35 100644
--- a/sound/soc/fsl/imx-es8328.c
+++ b/sound/soc/fsl/imx-es8328.c
@@ -3,7 +3,7 @@
 // Copyright 2012 Freescale Semiconductor, Inc.
 // Copyright 2012 Linaro Ltd.
 
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
@@ -23,7 +23,7 @@ struct imx_es8328_data {
 	struct snd_soc_card card;
 	char codec_dai_name[DAI_NAME_SIZE];
 	char platform_name[DAI_NAME_SIZE];
-	int jack_gpio;
+	struct gpio_desc *jack_gpiod;
 };
 
 static struct snd_soc_jack_gpio headset_jack_gpios[] = {
@@ -54,8 +54,8 @@ static int imx_es8328_dai_init(struct snd_soc_pcm_runtime *rtd)
 					struct imx_es8328_data, card);
 	int ret = 0;
 
-	/* Headphone jack detection */
-	if (gpio_is_valid(data->jack_gpio)) {
+	if (data->jack_gpiod) {
+		/* Headphone jack detection */
 		ret = snd_soc_card_jack_new_pins(rtd->card, "Headphone",
 						 SND_JACK_HEADSET | SND_JACK_BTN_0,
 						 &headset_jack,
@@ -64,7 +64,7 @@ static int imx_es8328_dai_init(struct snd_soc_pcm_runtime *rtd)
 		if (ret)
 			return ret;
 
-		headset_jack_gpios[0].gpio = data->jack_gpio;
+		headset_jack_gpios[0].desc = data->jack_gpiod;
 		ret = snd_soc_jack_add_gpios(&headset_jack,
 					     ARRAY_SIZE(headset_jack_gpios),
 					     headset_jack_gpios);
@@ -174,7 +174,11 @@ static int imx_es8328_probe(struct platform_device *pdev)
 
 	data->dev = dev;
 
-	data->jack_gpio = of_get_named_gpio(pdev->dev.of_node, "jack-gpio", 0);
+	data->jack_gpiod = devm_gpiod_get_optional(dev, "jack");
+	if (IS_ERR(data->jack_gpiod)) {
+		ret = PTR_ERR(data->jack_gpiod);
+		goto put_device;
+	}
 
 	/*
 	 * CPU == Platform
-- 
2.43.0.rc1.1.gbec44491f096

