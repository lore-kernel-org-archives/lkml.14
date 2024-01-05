Received: from mxout2.routing.net (mxout2.routing.net [134.0.28.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8F22E84A;
	Fri,  5 Jan 2024 16:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="S1GKJ1tA"
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout2.routing.net (Postfix) with ESMTP id CB4AE5FD8F;
	Fri,  5 Jan 2024 16:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1704471664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fn9i81xP7ZEmQqZw0cHUB5qam/4Zd8WwUWJ3g2A50Zs=;
	b=S1GKJ1tAYxprTNflZhTx9uOs6ybollM4dzkhgH7awAEpawoFGquR+ImYthbmzCyujR8uMn
	H2ARnzNafZr1Jh9zPlXOlEGVy6zP/+bIivUFnU/5Dq0G1CI+Qki/PVvAlwNC3ZPKrsIDkp
	DxgkmjUS0us2GbPrEc1CxKmfetbsc/E=
Received: from frank-G5.. (fttx-pool-80.245.77.34.bambit.de [80.245.77.34])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id B682B360303;
	Fri,  5 Jan 2024 16:21:02 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	Sam Shih <sam.shih@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 0/2] Add reset controller to mt7988 infracfg
Date: Fri,  5 Jan 2024 17:20:53 +0100
Message-Id: <20240105162056.43266-1-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: d5bc6535-430f-4be9-8228-d74279bce75c

From: Frank Wunderlich <frank-w@public-files.de>

Infracfg on mt7988 supports reset controller function which is
needed to get lvts thermal working.

Patches are based on clk-next due to recently added mt7988 clock driver:
https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git

changes:
  v2:
    - change value of constant to 0 from 9
    - add missing SoB and commit-message for binding-patch

Frank Wunderlich (2):
  dt-bindings: reset: mediatek: add MT7988 LVTS reset ID
  clk: mediatek: add infracfg reset controller for mt7988

 drivers/clk/mediatek/clk-mt7988-infracfg.c    | 20 +++++++++++++++++++
 .../reset/mediatek,mt7988-resets.h            |  4 ++++
 2 files changed, 24 insertions(+)

-- 
2.34.1

