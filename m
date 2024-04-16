Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74793B7A8;
	Tue, 16 Apr 2024 06:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713247237; cv=none; b=LneSA4cY4EbRdf3zYDPSSbldsOokWpcBkfGG/99jtaS4OfRMkKytaSggOrhINpLrCW6cTQJ0SNji3WBypg8qpRQAxn6LT3/JnRrBK2sFXJ0ao8COaf7OdB0Juhf3RsJO4EK8k9DhSYciq+2P7lO/oAGgVYiF2ZNufVOLr7m6kzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713247237; c=relaxed/simple;
	bh=T9KxgbXgW9cKGCmcDq/ArW9UZsCC3yRG5VB2U0tTrJE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SuOMVsPeySekroEX+QFBZZUN8umAvRyZWCRkSQ778jEhUlqzGszlVK/Iai3kxjk5Oh387MTextz3VXjrSYn4A/jvddWbL23BdsM1EKw9VXJ2Gmq3BuFANLC+9pTRByUlzfjyd/JpGq9DeFA5V30I2NNrfVu6EXqRGyGOR4Bo0dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LTJxWsn+; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LTJxWsn+"
Received: by mail.gandi.net (Postfix) with ESMTPSA id C328B1C0009;
	Tue, 16 Apr 2024 06:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713247232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=E5fFVE00qLSrpepHJZYFR5SmMhmRqNzf7Fm4bTsP25M=;
	b=LTJxWsn+dY7BpyM1yBDB7GpvCrAgnoN/1SeCkb+u286pztigVBrz61qwuNcKVxyWbuyXfe
	Q7wlt1ojVeq9j7d6SGrMRezeL6s2jkgaJS4AcP2pgDqpw8B4OAoTMwXrNbLAS2usFxTWgI
	uMrXwEnQWhJ7oP3GcVJn5GudLsw8JDsivQOKw4ySEEJQwqbdX4wrF4fAyxpAABWdqIkWBW
	h42pQkQU5Rk3/xuGa72Uhlfl/lebmEdcF1lZcWviBLhpy1FijOEI8tyHLBMuEzITsSiDWe
	jqhC5SZs69XZCs6/J3p17zughThmzuXfru75kBZqc3C9gwq9yCd0KWdUEZ8jkQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH 0/3] ASoC: dapm: improve debugfs output and introduce
 dapm-graph
Date: Tue, 16 Apr 2024 08:00:23 +0200
Message-Id: <20240416-vizdapm-ng-v1-0-5d33c0b57bc5@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPcTHmYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDEwNT3bLMqpTEglzdvHTdZHNTM8u0tESLVFMLJaCGgqLUtMwKsGHRsbW
 1ANvQk39cAAAA
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Dimitris Papastamos <dp@opensource.wolfsonmicro.com>, 
 Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
 Mihai Serban <mihai.serban@gmail.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.13.0
X-GND-Sasl: luca.ceresoli@bootlin.com

This patch series improves the tools available to understand and debug
DAPM.

Patches 1-2 add more information to the widget files exposed in debugfs.

Patch 3 introduces dapm-graph, a script to generate a picture of the DAPM
state inspired to vizdapm.

Patch 1 is required for dapm-graph to work, while patch 2 allows to enhance
its features but it is not required.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Luca Ceresoli (3):
      ASoC: dapm: debugfs: add component to route lines
      ASoC: dapm: debugfs: show the widget type
      tools/sound/dapm-graph: new tool to visualize DAPM state

 MAINTAINERS            |   6 +
 sound/soc/soc-dapm.c   |  54 ++++++++-
 tools/sound/dapm-graph | 303 +++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 361 insertions(+), 2 deletions(-)
---
base-commit: 5568f556e601b02d673bc7edab8de0f11815eec7
change-id: 20240405-vizdapm-ng-c7569ffa8e58

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

