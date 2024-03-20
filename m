Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 791D338FA0;
	Wed, 20 Mar 2024 08:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710923337; cv=none; b=u4SDJgIp8NqbISgodQ0FjD/TRNx4E34zmmABZGY13mm3/PdIE3uN5a0A2m7AB+6dasZuAN7XPlTMKvMirFTMXQVsOGgvSip9CJGiQ0fLNdbARlzN0II7RMrTTfMJDFbBA/0ijjuZ+hPhTX/0juNFd8iPRy+E56IsvVfqeAC/01Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710923337; c=relaxed/simple;
	bh=gE5IMhhE8VUEkVF4vVYv0JNygWdXQV9StROrvaRg01E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nIT/ZIOPABxRUY2z3414mUjdwUxyIFhSzq+1zNeuXwvmHZ2r33z+N79KhquOvfRs0rgdUV0bNZ7DF2XOrIlOnosIzQdS1+KACv4VYAmqvOR8jTsV2xTXinv4dPY2JUB8I/mxxfc9KSKzvZErjWAn6Jk3qBwgTB9oyTYnKWzERsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.07,139,1708354800"; 
   d="scan'208";a="202395284"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 20 Mar 2024 17:28:53 +0900
Received: from renesas-deb12.cephei.uk (unknown [10.226.93.11])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 908C3417039C;
	Wed, 20 Mar 2024 17:28:50 +0900 (JST)
From: Paul Barker <paul.barker.ct@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Paul Barker <paul.barker.ct@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] clk: renesas: r9a07g044: Mark resets array as const
Date: Wed, 20 Mar 2024 08:28:31 +0000
Message-Id: <20240320082831.9666-2-paul.barker.ct@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240320082831.9666-1-paul.barker.ct@bp.renesas.com>
References: <20240320082831.9666-1-paul.barker.ct@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The r9a07g044_resets array describes the reset signals in this SoC and
does not change at runtime.

Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
---
 drivers/clk/renesas/r9a07g044-cpg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index 48404cafea3f..f6df3f7a31b5 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -368,7 +368,7 @@ static const struct {
 #endif
 };
 
-static struct rzg2l_reset r9a07g044_resets[] = {
+static const struct rzg2l_reset r9a07g044_resets[] = {
 	DEF_RST(R9A07G044_GIC600_GICRESET_N, 0x814, 0),
 	DEF_RST(R9A07G044_GIC600_DBG_GICRESET_N, 0x814, 1),
 	DEF_RST(R9A07G044_IA55_RESETN, 0x818, 0),
-- 
2.44.0

