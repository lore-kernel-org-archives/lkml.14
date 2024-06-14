Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31ED519E7F0;
	Fri, 14 Jun 2024 17:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718386377; cv=none; b=PH5yDjNFwNf1zGkX2WNCqvlkXiW5Mo0psLtoL75MG5dNX206WCQGQ4aovLjrbRyJlmf8anQ555rh3g9Jv3tdhxH2OYpocOstHzF7139p3VIJUlflvjrTXGauBrtDLLCWdT2liyJ0Fa+DRlySLSrrLBb78zBiEj5ldKcqSeSAiwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718386377; c=relaxed/simple;
	bh=rCrSH+2eotbtSZHus1OO9vsM27on3YTkQLIXSX3Gn20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BJ6QM5TCcUExKJyUvqoGtWk8aDiVLljZu2F8GCDJkQyyHPWf1do+Y9h/Q1tg9n/14jA9UP2VTJNSAdfQQfqhwPRP16sBykf8IwUV7OZ2KUQTXqWeOYeRQgL16ORCh7DW4fi8YrW/25Q/puZhS6QDzCYSmlZIbpSbjZSPBJxybzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cdBiBEET; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cdBiBEET"
Received: by mail.gandi.net (Postfix) with ESMTPA id 042AEFF80B;
	Fri, 14 Jun 2024 17:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718386373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dX/NvEFRPKEGikk8fwukiwvaTdASJSmA9+QFa3LM6Fo=;
	b=cdBiBEETH3brboDNfayAgM3woKf5vj4k+CQ5YUUbP085D876D2hYH2lP6MDnIMck9yqphV
	qNvDKs53bNCkYxZ/qE7ENTcj33R3ZaHdCOBFx48ljIbzv84YnX5c26N+NfhBXupdgYPrpQ
	ZhrhAR0ZAm5TyFduZdBIrvG1jX4I0354HZsoQ3sD/vzpqqWzLyZUUxLecKtVQy5oIphQa1
	2yTpLY+ZiVxBlstiUK721FfVjz2datIWgNf3wXPsDnAHBvVv+bv/wk5X/47L2rq1VAQ6Qu
	Y4wc720rwxdXpS7aM38Dm8sAxyxMIx348GFv22vG8cCa4FS2punTlySJ/AJs/g==
From: Herve Codina <herve.codina@bootlin.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-um@lists.infradead.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH 09/23] irqdomain: Use irq_domain_instantiate() for hierarchy domain creation
Date: Fri, 14 Jun 2024 19:32:10 +0200
Message-ID: <20240614173232.1184015-10-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240614173232.1184015-1-herve.codina@bootlin.com>
References: <20240614173232.1184015-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com

irq_domain_instantiate() handles all needs to be used in
irq_domain_create_hierarchy()

Avoid code duplication and use directly irq_domain_instantiate() for
hierarchy domain creation.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 kernel/irq/irqdomain.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index 7e4a1da63549..edfd386be985 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -1213,23 +1213,16 @@ struct irq_domain *irq_domain_create_hierarchy(struct irq_domain *parent,
 		.hwirq_max = size,
 		.ops = ops,
 		.host_data = host_data,
+		.domain_flags = flags,
+		.parent = parent,
 	};
-	struct irq_domain *domain;
+	struct irq_domain *d;
 
 	if (!info.size)
 		info.hwirq_max = ~0U;
 
-	domain = __irq_domain_create(&info);
-	if (domain) {
-		if (parent)
-			domain->root = parent->root;
-		domain->parent = parent;
-		domain->flags |= flags;
-
-		__irq_domain_publish(domain);
-	}
-
-	return domain;
+	d = irq_domain_instantiate(&info);
+	return IS_ERR(d) ? NULL : d;
 }
 EXPORT_SYMBOL_GPL(irq_domain_create_hierarchy);
 
-- 
2.45.0

