Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211CB14F68;
	Thu, 11 Jan 2024 10:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="q4kLQ0pR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704970373;
	bh=t5/M/FDJlEol50qHM5SqsEKoXsNv1Vb4Pkp42aLqIa4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q4kLQ0pRzFTsf7+QSE8HGBiTkkbxto3GLyZ/YvnTZ3mYaGX8FfpVDoW/lCHeVEnrp
	 KDquhySZRSotQRrNpFz7IxcBhS8HRZql2vryLjMWnFXGTsPv1mm83U4LWKVWBbFh1n
	 kNp5Q0TsZ4yta0eBv1yrC3tqnJJTrn5uMX1BLsO1an4Om8eIsjITCVEyP2Ge9CLhXz
	 AVRGSiVkjnfVb9kpbBfTX9kERC6Xsl8c4gwQuOo2AF/PHqrXvKSWgPTtGbCs1Hs2qQ
	 Igi4DuQN7WY0gWzRwOnUKN+jHP27eSWNFbWSYz6lwKV+xDJIKIwqjyrKQ5zUgG2YPn
	 TBQ7/nNSxctcA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 65DF93781FCB;
	Thu, 11 Jan 2024 10:52:52 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: lgirdwood@gmail.com
Cc: broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ribalda@chromium.org,
	nicolas.ferre@microchip.com,
	u.kleine-koenig@pengutronix.de,
	kuninori.morimoto.gx@renesas.com,
	nfraprado@collabora.com,
	alsa-devel@alsa-project.org,
	trevor.wu@mediatek.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/7] ASoC: mediatek: mt8173-afe-pcm: Use devm_snd_soc_register_component()
Date: Thu, 11 Jan 2024 11:52:42 +0100
Message-ID: <20240111105247.117766-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240111105247.117766-1-angelogioacchino.delregno@collabora.com>
References: <20240111105247.117766-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function devm_snd_soc_register_component() allocates a new struct
snd_soc_component, adds components and initializes them; since this
is also devm, it automatically unregisters components and frees
memory upon destruction.

That's exactly what we're doing in the probe function of this driver:
switch to that function instead, allowing to remove the last goto and
to discard the .remove_new() callback for this driver.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c | 58 +++-------------------
 1 file changed, 8 insertions(+), 50 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
index ea611730de9c..b887e10635fe 100644
--- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
+++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
@@ -1129,72 +1129,31 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 	afe->runtime_resume = mt8173_afe_runtime_resume;
 	afe->runtime_suspend = mt8173_afe_runtime_suspend;
 
-	ret = devm_snd_soc_register_component(&pdev->dev,
-					 &mtk_afe_pcm_platform,
-					 NULL, 0);
+	ret = devm_snd_soc_register_component(&pdev->dev, &mtk_afe_pcm_platform, NULL, 0);
 	if (ret)
 		return ret;
 
-	comp_pcm = devm_kzalloc(&pdev->dev, sizeof(*comp_pcm), GFP_KERNEL);
-	if (!comp_pcm)
-		return -ENOMEM;
-
-	ret = snd_soc_component_initialize(comp_pcm,
-					   &mt8173_afe_pcm_dai_component,
-					   &pdev->dev);
+	ret = devm_snd_soc_register_component(&pdev->dev, &mt8173_afe_pcm_dai_component,
+					      mt8173_afe_pcm_dais,
+					      ARRAY_SIZE(mt8173_afe_pcm_dais));
 	if (ret)
 		return ret;
 
-#ifdef CONFIG_DEBUG_FS
-	comp_pcm->debugfs_prefix = "pcm";
-#endif
-
-	ret = snd_soc_add_component(comp_pcm,
-				    mt8173_afe_pcm_dais,
-				    ARRAY_SIZE(mt8173_afe_pcm_dais));
+	ret = devm_snd_soc_register_component(&pdev->dev, &mt8173_afe_hdmi_dai_component,
+					      mt8173_afe_hdmi_dais,
+					      ARRAY_SIZE(mt8173_afe_hdmi_dais));
 	if (ret)
 		return ret;
 
-	comp_hdmi = devm_kzalloc(&pdev->dev, sizeof(*comp_hdmi), GFP_KERNEL);
-	if (!comp_hdmi) {
-		ret = -ENOMEM;
-		goto err_cleanup_components;
-	}
-
-	ret = snd_soc_component_initialize(comp_hdmi,
-					   &mt8173_afe_hdmi_dai_component,
-					   &pdev->dev);
-	if (ret)
-		goto err_cleanup_components;
-
-#ifdef CONFIG_DEBUG_FS
-	comp_hdmi->debugfs_prefix = "hdmi";
-#endif
-
-	ret = snd_soc_add_component(comp_hdmi,
-				    mt8173_afe_hdmi_dais,
-				    ARRAY_SIZE(mt8173_afe_hdmi_dais));
-	if (ret)
-		goto err_cleanup_components;
-
 	ret = devm_request_irq(afe->dev, irq_id, mt8173_afe_irq_handler,
 			       0, "Afe_ISR_Handle", (void *)afe);
 	if (ret) {
 		dev_err(afe->dev, "could not request_irq\n");
-		goto err_cleanup_components;
+		return ret;
 	}
 
 	dev_info(&pdev->dev, "MT8173 AFE driver initialized.\n");
 	return 0;
-
-err_cleanup_components:
-	snd_soc_unregister_component(&pdev->dev);
-	return ret;
-}
-
-static void mt8173_afe_pcm_dev_remove(struct platform_device *pdev)
-{
-	snd_soc_unregister_component(&pdev->dev);
 }
 
 static const struct of_device_id mt8173_afe_pcm_dt_match[] = {
@@ -1215,7 +1174,6 @@ static struct platform_driver mt8173_afe_pcm_driver = {
 		   .pm = &mt8173_afe_pm_ops,
 	},
 	.probe = mt8173_afe_pcm_dev_probe,
-	.remove_new = mt8173_afe_pcm_dev_remove,
 };
 
 module_platform_driver(mt8173_afe_pcm_driver);
-- 
2.43.0

