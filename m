Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703F6745D5;
	Wed, 22 May 2024 03:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716348494; cv=none; b=jexxNR20tpFNkzRTGoSJLPkksoh/aaVTS+eSiCEmERl82kgm+FWhe/ISbVoy9CQkpg+BbiuI9F8YrUzCMnc/55CYvlOoa5ytnpfaHobbiqDAm7ihASn3tq0FmNDUnh6a76oiPfazs58ACp4bJfot+4hojXhc0Sme0sT4C/Q2Tqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716348494; c=relaxed/simple;
	bh=VtW7mWc78r/BBEDArrKEb/OrAquOD6TeXurMZtE5JCU=;
	h=From:To:Subject:Date:Message-Id; b=SUyTZZ2ff205ToX5iiEG9/ort2nz1RQXYCNlBge8JH3sGC1iKMaAQjy3j7iv7iowJQ7p5Mcy52kYZ2is7Lsomy9mNuepOHG9jkmDQxM+7pqt/Ch53hr+kan1u4DvO/dZxSHOWc1m8eTU19SH/XhkCRJYvYFL743vv77Pw5Ccj7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id DFC95200E7C;
	Wed, 22 May 2024 05:28:09 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id A4CFD200E80;
	Wed, 22 May 2024 05:28:09 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id ADD56180226C;
	Wed, 22 May 2024 11:28:07 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shengjiu.wang@gmail.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/2] ASoC: fsl_mqs: Add i.MX95 platform support
Date: Wed, 22 May 2024 11:08:23 +0800
Message-Id: <1716347305-18457-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

There are two MQS instances on the i.MX95 platform.
The definition of bit positions in the control register are
different. In order to support these MQS modules, define
two compatible strings to distinguish them.

changes in v2:
- remove "fsl,mqs-ctrl" property
- use two compatible strings to distinguish two instances

Shengjiu Wang (2):
  ASoC: dt-bindings: fsl,mqs: Add i.MX95 platform support
  ASoC: fsl_mqs: Add i.MX95 platform support

 .../devicetree/bindings/sound/fsl,mqs.yaml    |  2 +
 sound/soc/fsl/fsl_mqs.c                       | 46 ++++++++++++++++---
 2 files changed, 42 insertions(+), 6 deletions(-)

-- 
2.34.1

