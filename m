Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BF4153BD0;
	Fri, 26 Apr 2024 16:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714150610; cv=none; b=DNC1Q7c0RDueYX15Xpcp83+O0wmbKoV6IzdVthrlM1sN9TmQezQ7OL2ZmcTUcKDQABJA4WcCCc8OyLYifosiN4Yt+cuxGBTU3F07+1pnvJ6T5mTs0Wgecrz1gLvgf+u1IfKSAnBdJutZ0g88HQMmhrkTnertjB9AWbEyKbz26rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714150610; c=relaxed/simple;
	bh=62bKvUYE91S2dby28hoHAUGeKknkiUpxhGJ4QHGMds8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PAiHLynT/RwFLrQJ5Y8HcQcqtzjMKztfw28tp3aUb0W9bpUJOE8hxcFpzzGY5elbeH8N9fVrXpH92z9BT5Kqn1E1eNced+MhvmmSQAm21HISyuHHElZzpCALZy8FM87OzbR08OMm6IKvJ23CATra9zjsK+G6V98nFT0fNvGrBig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JAaM0W+M; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JAaM0W+M"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4AAF4FF809;
	Fri, 26 Apr 2024 16:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714150607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wA7CY7GZxU0LmJK2k6Cb1a5Gi/2q8P8/f6Nq8+Ks5JI=;
	b=JAaM0W+MQEVTc3KdihKxI1ZNHVRMsCDcTQ+5tGA30IdkelmIN+NSiriR0JyVyNg8Dn6GXy
	2fhzfOZ+DNhINxiPpSdkSdC73e+XmwDOkzuEQKok+rTPvnHhTyFTVM+gneZRpZ1xJS+z+D
	ZT9oRyne6mnZslix2v6HvOkqOq00b4ArvqHsqrVdQ2Re+DONWR3FpsbjBp5S9dzOqDZ3tK
	uEkyEtkbcVz1SfJ8w42sPn+U84CUMc1E+mKmbo9S0CaZj696OzuUhKnsl/yR7bevLBCzsO
	KdgtqUXce735rXUgTkPKcnOWeSejR23SOKzk3szGznQwQJQwoamXynNPHC75Og==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 26 Apr 2024 18:56:35 +0200
Subject: [PATCH v2 02/12] ASoC: doc: dapm: fix struct name
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240426-dapm-docs-v2-2-87b07547eb5b@bootlin.com>
References: <20240426-dapm-docs-v2-0-87b07547eb5b@bootlin.com>
In-Reply-To: <20240426-dapm-docs-v2-0-87b07547eb5b@bootlin.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Bagas Sanjaya <bagasdotme@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-sound@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.13.0
X-GND-Sasl: luca.ceresoli@bootlin.com

struct snd_soc_codec_dai does not exist.

Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 Documentation/sound/soc/dapm.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/sound/soc/dapm.rst b/Documentation/sound/soc/dapm.rst
index 59f65b181828..68ef79f539f2 100644
--- a/Documentation/sound/soc/dapm.rst
+++ b/Documentation/sound/soc/dapm.rst
@@ -148,7 +148,7 @@ Stream widgets have the following format:-
   SND_SOC_DAPM_AIF_IN(name, stream, slot, reg, shift, invert)
 
 NOTE: the stream name must match the corresponding stream name in your codec
-snd_soc_codec_dai.
+snd_soc_dai_driver.
 
 e.g. stream widgets for HiFi playback and capture
 ::

-- 
2.34.1

