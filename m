Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DE37E584;
	Wed, 24 Jan 2024 16:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706115398; cv=none; b=pF+C15it9twTyWu2XgWy2f5WOIse1F7j2KRBAXth46WjvfBfuJs/2MPi1VlOz1tLhD05xIdVFHhCVGzU2LU24ZJMHbz2C+5FNzGLRluJiEBOKqBJKVFYQYK2z8fcNMjbPXZzNBzqOuZJuXpKqxxFqAZbgRnvLOh5jOMz9IC4QVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706115398; c=relaxed/simple;
	bh=J/sQhWMEvt/vn+lfCEXPe62LcDsGsyF7kH6x+xd5LL0=;
	h=From:To:Cc:Date:Message-Id:MIME-Version:Subject; b=na5K5xKxWDbMQAvl9+8+ay5DRP9QjC3kewHG0pUDaFzmnYEiHRV++EZ/4O1ygeKB8MXsu+RZ8hjYpAU4EbLKkdM+uUdxsMTWQWK4tHGYtlS6t2h5q1mj1UNx3lnLp7o7FENYzTIDDW2OMl/PqFD/yfOUOGIymbhnlpamOLfpB4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=gQceyD+1; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="gQceyD+1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Cc:To
	:From:subject:date:message-id:reply-to;
	bh=mnUWpMCy5DToKNWP1PJXR/S74CtvHvrqkEFrG4JVcmw=; b=gQceyD+1WuSt+4y40mjd6PxMF1
	FehwBP+JKLpk5+tVsOi7HMq60F3ateXgIJLo4dQZismkca2AN6krYcA6HWfPqTmoZqt/POizCd7Ks
	QYHCyImjGHZ3MX4GaiFJOgRyB6AbaIyjL90geHBph/FQtpKGpuFKo9KGD9Lolf7P5fm4=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:45420 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1rSgY6-0007ym-NO; Wed, 24 Jan 2024 11:56:27 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	leoyang.li@nxp.com,
	hvilleneuve@dimonoff.com
Cc: krzysztof.kozlowski@linaro.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	hugo@hugovil.com,
	andy.shevchenko@gmail.com
Date: Wed, 24 Jan 2024 11:46:44 -0500
Message-Id: <20240124164646.1506814-1-hugo@hugovil.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	* -0.0 T_SCC_BODY_TEXT_LINE No description available.
Subject: [PATCH v2 0/2] board: imx8mn-rve-gateway: fix compatible description
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

From: Hugo Villeneuve <hvilleneuve@dimonoff.com>

Hello,
this patch series fixes compatible description for the RVE gateway board.

Thank you.

Link: [v1] https://lore.kernel.org/all/20240124154422.3600920-1-hugo@hugovil.com/raw

Changes for V2:
-Add Fixes tags

Hugo Villeneuve (2):
  dt-bindings: arm: fsl: remove redundant company name
  arm64: dts: imx8mn-rve-gateway: remove redundant company name

 Documentation/devicetree/bindings/arm/fsl.yaml       | 2 +-
 arch/arm64/boot/dts/freescale/imx8mn-rve-gateway.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)


base-commit: 615d300648869c774bd1fe54b4627bb0c20faed4
-- 
2.39.2

