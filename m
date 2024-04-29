Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F27EEDA;
	Mon, 29 Apr 2024 00:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714350423; cv=none; b=Z5tOumP1M3vjPdpQn+tZce4ox4voaF5fjjufAEMyRMQS+758szfZ7UZesJQsiSBccPUIW2Kau+07xHFJouXGu9rwaawA00FF6ktP6qpIAHlkefK4RuhtHCG8fiBvoJNQ7Lv1c6W5NOFlthHjWmB8Gt0VxT+rHsofpfvWQfyYqmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714350423; c=relaxed/simple;
	bh=oZ8CDJ87DHapEDR21yPFYKV3LrFmlIVzhWRzefmtllw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aKKv1XrqW5ifQhuzc5Rf/EAI5PtEzQIEdm9zdGwGZo4YyPzcmE+moctnCS96eNDwZunrB3LhlVvKopHXRj3KXSmO2mrl66WpKcjIFrqABsaSdnrK3dFf0wDanlDU9vBPicAyGSjKXoiRB/TCM+dksc1TNMmnE2Q4at/J4q9+Obk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gU4+wnBv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gU4+wnBv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0400EC113CC;
	Mon, 29 Apr 2024 00:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714350423;
	bh=oZ8CDJ87DHapEDR21yPFYKV3LrFmlIVzhWRzefmtllw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gU4+wnBv96PnwZz2h/SvbVTK+Nq4CqvZlNd6cD/GsXSVCVgIlW1IXlKf2X5hHvJ8M
	 EaFayKyzGoq97R0ktbsSFudPqoBP++50wtczy3pSoM1tJueoFLXaFigJppbrEeDbzA
	 9N9GIggPVnSWvDyyEXju6tnJazcM7p9PV6bXOM4sNWkUuSgKEoFc2Gk2HgiiVDXuWL
	 5LH9RmJU80qNNW8pZdFbM1+Un/QCA9V99GCTOdoIEkzA9Oi17s8ChyHEQ2hl2NRHef
	 GssFcRG3IeSEH4k6GxkxJm3frqLdioVxFYMlw3DVb02tCC7NCemi+QJK5rQu7TAvJh
	 IrjAZR4bx/G/w==
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 6/8] riscv: dts: starfive: visionfive 2: add "disable-wp" for tfcard
Date: Mon, 29 Apr 2024 08:13:15 +0800
Message-ID: <20240429001317.432-7-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240429001317.432-1-jszhang@kernel.org>
References: <20240429001317.432-1-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No physical write-protect line is present, so setting "disable-wp".

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
index b6030d63459d..e19f26628054 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
@@ -304,6 +304,7 @@ &mmc1 {
 	no-sdio;
 	no-mmc;
 	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_LOW>;
+	disable-wp;
 	cap-sd-highspeed;
 	post-power-on-delay-ms = <200>;
 	pinctrl-names = "default";
-- 
2.43.0

