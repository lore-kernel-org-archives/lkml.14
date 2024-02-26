Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7FF4DA0B;
	Mon, 26 Feb 2024 09:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=71.19.156.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708939124; cv=none; b=LI0EJ078MFd0aUTL2/S/PWJLAaa74rUwqrYrM2uvCkDbRsAqqFJPoetYdU63+l1VBDMiyP0JrANtb5qtcF0p6IlP3HXxWT89w5x+qstdDSAUFUvKEH2LzrUfVm2khWRZCY9XuQX5XZriPJvejZbf1bzRW/+lSnR7n9AyUQxVMm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708939124; c=relaxed/simple;
	bh=mf3z62tltfMzlLenaPAaqgxyWuiF6fV/UO7P1p2oRRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dja3k6HDmFzQ5aBUMXdcaImtN/V4X7BNx2e5JuzLxEQPc5gzhZWTln92s+qFN/pvihwJK1A+y179CTmNdr4bpEu/vXxQd7hiIS6zniqse0XKDE8gggt7vKbng/y+tHiltO3kGEvNLG2WdE5JAUFfdVI5udle6kNKOd+kmWxzjLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bewilderbeest.net; spf=pass smtp.mailfrom=bewilderbeest.net; dkim=pass (1024-bit key) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.b=ZXxvFiTr; arc=none smtp.client-ip=71.19.156.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bewilderbeest.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bewilderbeest.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.b="ZXxvFiTr"
Received: from hatter.bewilderbeest.net (unknown [IPv6:2602:61:712b:6300::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 618F442D0;
	Mon, 26 Feb 2024 01:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1708939116;
	bh=gzTjQUu0dObSt10SZKcdNKoLWfM0zbCV3RKhSxsSPq8=;
	h=From:To:Cc:Subject:Date:From;
	b=ZXxvFiTr5xOW2Y311ZVhtKPovu4hZqyoQl1/TtGUUC1hcFdl0EwBA8isXTKOSCP3p
	 6t5D40EcDe3jD5sDzq3zBCHo+uLyMPc4RdhaerEp6qldfB7MIfUnm9jWzRUiM2kAk4
	 EAK0gx/r0xKgrmHiOTEK+OVa+6RNfzuymNg2skf8=
From: Zev Weiss <zev@bewilderbeest.net>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>
Cc: Zev Weiss <zev@bewilderbeest.net>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] ARM: dts: aspeed: ahe50dc: Update lm25066 regulator name
Date: Mon, 26 Feb 2024 01:17:53 -0800
Message-ID: <20240226091754.16027-2-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A recent change to the lm25066 driver changed the name of its
regulator from vout0 to vout; device-tree users of lm25066's regulator
functionality (of which ahe50dc is the only one) thus require a
corresponding update.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dts
index 6600f7e9bf5e..93f3be849071 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dts
@@ -18,7 +18,7 @@ efuse@##hexaddr {							\
 		reg = <0x##hexaddr>;						\
 		shunt-resistor-micro-ohms = <675>;				\
 		regulators {							\
-			efuse##num: vout0 {					\
+			efuse##num: vout {					\
 				regulator-name = __stringify(efuse##num##-reg);	\
 			};							\
 		};								\
-- 
2.43.2

