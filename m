Received: from mail.nfschina.com (unknown [42.101.60.195])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 0B0BF446CF
	for <linux-kernel@vger.kernel.org>; Tue,  4 Jun 2024 08:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717488603; cv=none; b=RVoR2dYAyAiV3ixDZT1xOK3g+I3oDk+2/wh5JoaZZFME4JfK3s7n/5bUtu7V+BvSWvyXorwwGCftKMPXDyUHg0BRsU30x9Tyb5FmyEWH8gu8tldJk1sBgt63Q3dhxZK0+ijaUiZGP8QvLKGvrpgJzhALMymjUSPpF8zHsrNoqYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717488603; c=relaxed/simple;
	bh=+G9mKjMwEOKUczjE7ezwTf4S8G52vs1HHeC05ItUBNw=;
	h=From:To:Cc:Subject:Date:Message-Id; b=oct2jv38BYpuBibYnITwmtXfzAvKhrGNFZAQVZh1acqlYOuXBKgjiImKNslb9fg13P/UCa2gAvvxy3JqYVqZjtNm/cFGTi8auulU3ukGUAuGuuPLlhcGhmvWHD/iaG7TpjuAw8KEogjyo48rQmaBFyq4Sei5tRrq3ITWMeyMaXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from localhost.localdomain (unknown [219.141.250.2])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id 25BA56047F7C7;
	Tue,  4 Jun 2024 16:09:51 +0800 (CST)
X-MD-Sfrom: zeming@nfschina.com
X-MD-SrcIP: 219.141.250.2
From: Li zeming <zeming@nfschina.com>
To: tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org,
	Li zeming <zeming@nfschina.com>
Subject: [PATCH] irq: chip: Optimize the irq_set_irq_type function code
Date: Tue,  4 Jun 2024 16:09:14 +0800
Message-Id: <20240604080914.38019-1-zeming@nfschina.com>
X-Mailer: git-send-email 2.18.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Optimize the position of ret and remove initialization assignments,
making the function look more aesthetically pleasing internally.

Signed-off-by: Li zeming <zeming@nfschina.com>
---
 kernel/irq/chip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index dc94e0bf2c94..1ce3d29abc90 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -64,9 +64,9 @@ EXPORT_SYMBOL(irq_set_chip);
  */
 int irq_set_irq_type(unsigned int irq, unsigned int type)
 {
+	int ret;
 	unsigned long flags;
 	struct irq_desc *desc = irq_get_desc_buslock(irq, &flags, IRQ_GET_DESC_CHECK_GLOBAL);
-	int ret = 0;
 
 	if (!desc)
 		return -EINVAL;
-- 
2.18.2

