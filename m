Received: from mail-out.aladdin-rd.ru (mail-out.aladdin-rd.ru [91.199.251.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED68137C22;
	Tue, 12 Mar 2024 16:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.199.251.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710262490; cv=none; b=YwLSEYsLZ9SIPAfQCAhyMySTKnQgJ83ghUctbtvLAxfgiHcyuje8FmT9Af6tIu+4JAGpAZI5m5PnFFW2bnKgGI96RQxPKIqN8xoVvU466F2BEl1jUjqNTPrCmulVCFazaI6VwdwTW5COhJ8eshZ/45eCVS23YgqvJVrplm/xod8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710262490; c=relaxed/simple;
	bh=IatuUoyah9BqPO/PBrdSSVVhJx3+CGn5xo0Pwxl1H+o=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nlAgdkfUWGIt7m7oF61pl4TkH/t2IJl4iuQWQZdWN6xbLh3Fv6XATUJ69dn75KWv+y1AtfOTgNTG4y9VKfTiSDGdfj1qmRSJY14TFc+85E0ofGqR9mOwM4GhsJK6RyJXSfT6X35QtgtpNWKaRfV1sWVZ7y7fRgp/+ZYpuFT6aAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aladdin.ru; spf=pass smtp.mailfrom=aladdin.ru; arc=none smtp.client-ip=91.199.251.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aladdin.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aladdin.ru
From: Daniil Dulov <d.dulov@aladdin.ru>
To: Jakub Kicinski <kuba@kernel.org>, Florian Fainelli
	<florian.fainelli@broadcom.com>
CC: Daniil Dulov <d.dulov@aladdin.ru>, Broadcom internal kernel review list
	<bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn <andrew@lunn.ch>, Heiner
 Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Doug
 Berger <opendmb@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<lvc-project@linuxtesting.org>
Subject: [PATCH net-next] net: phy: mdio-bcm-unimac: Cast denominator to unsigned long to avoid overflow
Date: Tue, 12 Mar 2024 19:53:58 +0300
Message-ID: <20240312165358.7712-1-d.dulov@aladdin.ru>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EXCH-2016-02.aladdin.ru (192.168.1.102) To
 EXCH-2016-01.aladdin.ru (192.168.1.101)

The expression priv->clk_freq * 2 can lead to overflow that will cause
a division by zero. So, let's cast it to unsigned long to avoid it.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Daniil Dulov <d.dulov@aladdin.ru>
---
 drivers/net/mdio/mdio-bcm-unimac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/mdio/mdio-bcm-unimac.c b/drivers/net/mdio/mdio-bcm-unimac.c
index f40eb50bb978..0425b622c09f 100644
--- a/drivers/net/mdio/mdio-bcm-unimac.c
+++ b/drivers/net/mdio/mdio-bcm-unimac.c
@@ -214,7 +214,7 @@ static int unimac_mdio_clk_set(struct unimac_mdio_priv *priv)
 	else
 		rate = clk_get_rate(priv->clk);
 
-	div = (rate / (2 * priv->clk_freq)) - 1;
+	div = (rate / (2 * (unsigned long)priv->clk_freq)) - 1;
 	if (div & ~MDIO_CLK_DIV_MASK) {
 		pr_warn("Incorrect MDIO clock frequency, ignoring\n");
 		ret = 0;
-- 
2.25.1

