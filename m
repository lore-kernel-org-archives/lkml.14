Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA0016F29E;
	Fri, 26 Apr 2024 16:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714150618; cv=none; b=tYIk1DEZxsNwUzeL/6ZKJWkZhwXu573H0L1PenV9ccI4lW9LL5/4OEGE9MxDE3vLVHfuXRab7xvdY5GLGKlwUSvKGOjredkgSwYWp96ZXmFLbDrt/JXq87e6rpE5xrRlbNFAPF8MyoXEBEeY9LuCGU2MqtTGTPnGns87UpM1bn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714150618; c=relaxed/simple;
	bh=F1LZ4pXZailW1WmBflpQvbjndxGmhq/MZOPOp9kXDC0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Eca3LBNr7LzuD2f3xCdEPC71TF5/QxLuZfo0h6qicw8mz1y8bSsYfBYUORSXW57gjDE1mCNo0pTKS76oUfsw2aja2s0mkobB1KgavQG7WA1BmQIhm0lpn2sFmW1yxdWVdG4OdhXGasj0w+EhM7WoyT9Mf/k2qxi9wE/hQkcRZzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=AoRbk68P; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="AoRbk68P"
Received: by mail.gandi.net (Postfix) with ESMTPSA id D38D4FF806;
	Fri, 26 Apr 2024 16:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714150614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JNUYmNaDXVi05G13rtiLP/bMLMXkxWa7NktFe/M9xNQ=;
	b=AoRbk68PHj29FzrNYrmhF6dXOHnoZfHOTsV54igW6QYX6jg0Cz1IjUBWKueOghDwBB1l3D
	d+gFh6BsDvwD01DMhwuKko3VGm2t6I+RuZ2uwFquLyb/qo5KRZCOUPn98t/Ff53v5qHGkA
	8bmAlhiOTUEQbaM6K5iQlrpbtAStOaPIvrTZa2eGulmByD4ZrKVMN2OdE3m72Xxt6HuSh6
	z4Xr2gKxvXcn1pjyLkuKl9OFvEoVpBdektcbMaKNya/u2itmAqznSQ+6sWk1SRYQJ/KTXL
	y4yVOnv3lh0m0KOXiB9fy3CAFh1TwDDNwRNBEaSf/jmUzbC47nZ4FskwINZ+LA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 26 Apr 2024 18:56:42 +0200
Subject: [PATCH v2 09/12] ASoC: doc: dapm: fix and improve section
 "Registering DAPM controls"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240426-dapm-docs-v2-9-87b07547eb5b@bootlin.com>
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

Extend the first paragraph to mention the {,num_}dapm_routes fields just
like the widget conterparts. Mention the route fields also in the code
example. Fix "at build time", this really means "at probe time".

Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 Documentation/sound/soc/dapm.rst | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/Documentation/sound/soc/dapm.rst b/Documentation/sound/soc/dapm.rst
index 4b094c3d7942..2831b00ae4e2 100644
--- a/Documentation/sound/soc/dapm.rst
+++ b/Documentation/sound/soc/dapm.rst
@@ -254,12 +254,17 @@ This can be used to merge two signal paths together in software.
 Registering DAPM controls
 =========================
 
-In many cases the DAPM widgets implemented statically in a ``static const
-struct snd_soc_dapm_widget`` array and the routes connecting them in a
-``static const struct snd_soc_dapm_route`` array in a codec driver, and
-simply declared via the ``dapm_widgets`` and ``num_dapm_widgets`` fields of
-the ``struct snd_soc_component_driver`` so the driver registration will
-take care of populating them::
+In many cases the DAPM widgets are implemented statically in a ``static
+const struct snd_soc_dapm_widget`` array in a codec driver, and simply
+declared via the ``dapm_widgets`` and ``num_dapm_widgets`` fields of the
+``struct snd_soc_component_driver``.
+
+Similarly, routes connecting them are implemented statically in a ``static
+const struct snd_soc_dapm_route`` array and declared via the
+``dapm_routes`` and ``num_dapm_routes`` fields of the same struct.
+
+With the above declared, the driver registration will take care of
+populating them::
 
   static const struct snd_soc_dapm_widget wm2000_dapm_widgets[] = {
   	SND_SOC_DAPM_OUTPUT("SPKN"),
@@ -278,11 +283,13 @@ take care of populating them::
 	...
   	.dapm_widgets		= wm2000_dapm_widgets,
   	.num_dapm_widgets	= ARRAY_SIZE(wm2000_dapm_widgets),
+  	.dapm_routes            = wm2000_audio_map,
+  	.num_dapm_routes        = ARRAY_SIZE(wm2000_audio_map),
 	...
   };
 
 In more complex cases the list of DAPM widgets and/or routes can be only
-known at build time. This happens for example when a driver supports
+known at probe time. This happens for example when a driver supports
 different models having a different set of features. In those cases
 separate widgets and routes arrays implementing the case-specific features
 can be registered programmatically by calling snd_soc_dapm_new_controls()

-- 
2.34.1

