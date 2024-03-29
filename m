Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D00613F425;
	Fri, 29 Mar 2024 23:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711756256; cv=none; b=hM/bXwJPATiCRNlng3DoPICrnA35G2b5Ilbp1Mx+uIR2LK5PGAw9Dzzp4zwhmeLsvZ9UhqJ4TZcHC/+9B0l1IV8TZgy0mZ/R4OuuV2ImfPgkCm33m3Cn0I8LZGYDLPRrvMXfVxgrNzj85eYr42IzefpU8P752ODwvHmYQJIc+Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711756256; c=relaxed/simple;
	bh=rlQEKxVzgYYSYVWFuLPv1VGy4M/P7nf9VBaUGEusVLs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GjvGyW/uUNVJz/s7mj7A/DLVe+xFiXQRg1N7nquavcNsswKq9NXud4t6NzXKup28v0aO6n2dXiZrhWhT7U9QSi5c2nUbrMxllP1c1vXQUNHNXSQiAt0gfBcWrkuiObUJgFSrSQv8dPfL6NaX0OChvTDYzSMVHf+jbSx3htwdhqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8827AFEC;
	Fri, 29 Mar 2024 16:51:27 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 800203F64C;
	Fri, 29 Mar 2024 16:50:52 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@csie.org>,
	Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Ryan Walklin <ryan@testtoast.com>,
	Chris Morgan <macroalpha82@gmail.com>
Subject: [PATCH 3/4] mfd: axp20x: AXP717: Add support for boost regulator
Date: Fri, 29 Mar 2024 23:50:32 +0000
Message-Id: <20240329235033.25309-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.8
In-Reply-To: <20240329235033.25309-1-andre.przywara@arm.com>
References: <20240329235033.25309-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AXP717 also contains a boost regulator, to provide the 5V USB VBUS
rail when running on battery.

Add the registers to the MFD description to be able to use them from the
regulator driver.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/mfd/axp20x.c       | 2 ++
 include/linux/mfd/axp20x.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index 48ce6ea693cea..62f3dd254d57b 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -209,6 +209,8 @@ static const struct regmap_access_table axp313a_volatile_table = {
 };
 
 static const struct regmap_range axp717_writeable_ranges[] = {
+	regmap_reg_range(AXP717_MODULE_EN_CONTROL, AXP717_MODULE_EN_CONTROL),
+	regmap_reg_range(AXP717_BOOST_CONTROL, AXP717_BOOST_CONTROL),
 	regmap_reg_range(AXP717_IRQ0_EN, AXP717_IRQ4_EN),
 	regmap_reg_range(AXP717_DCDC_OUTPUT_CONTROL, AXP717_CPUSLDO_CONTROL),
 };
diff --git a/include/linux/mfd/axp20x.h b/include/linux/mfd/axp20x.h
index 8c0a33a2e9ce2..4dad54fdf67ee 100644
--- a/include/linux/mfd/axp20x.h
+++ b/include/linux/mfd/axp20x.h
@@ -115,6 +115,8 @@ enum axp20x_variants {
 #define AXP313A_IRQ_STATE		0x21
 
 #define AXP717_ON_INDICATE		0x00
+#define AXP717_MODULE_EN_CONTROL	0x19
+#define AXP717_BOOST_CONTROL		0x1e
 #define AXP717_IRQ0_EN			0x40
 #define AXP717_IRQ1_EN			0x41
 #define AXP717_IRQ2_EN			0x42
-- 
2.35.8

