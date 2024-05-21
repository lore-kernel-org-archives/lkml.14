Received: from smtp.forwardemail.net (smtp.forwardemail.net [167.172.40.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6F51494A8
	for <linux-kernel@vger.kernel.org>; Tue, 21 May 2024 20:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=167.172.40.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716323337; cv=none; b=b5F+f7EEgZYGgWpDDMlh29RZnKdp+Fluf/e/g7QYk3aE8HE58mVU1v+mSTOJ6vS1dX8u0felG4WVqRivuklNJ/1OdK6/IVS3pQDi/w0pTuvKpgtovQ+/5yrGL1TUb1JFSwftVm9OtVi5ann/6ApRt4PUfYzuUUp4bdY/IRgyDIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716323337; c=relaxed/simple;
	bh=i9RtT9crBjtAme5G9mmfSOcopOxJUXbwe5ZvznIypVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qL2nfudXmqABJ8NjBwxoWC0RvIOniczaOgTtCxTuPT82PgbNHhPKe5Yey7LjVrZdycGQWY/0RrzFvC6KnUQ2Y0FDaaHoCOSRRE5RrvNk6fgVe13pdllELAw1ejzqD2X7gYspvjg6ovxNWB4GxJnYzK5PoJanEUUZUq+Hx/nRFAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=b4laSxmh; arc=none smtp.client-ip=167.172.40.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="b4laSxmh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1716323304; bh=fcefaUUjcIVFz8cXLo03BezrzCivGislzB62c0WvQU0=;
 b=b4laSxmhyQ/5aQXtN8M9kEY7oRw+GMri4Sw+4HGzpCj46o0z6I43AiHJ//Dsdshc4DKZoMFaR
 8Zp77mZr/VTxdVVqz0r6f9DdOI4SFZ8prV6KN4d0hvfyVtoma9b8xyUzYv2XvO3ZkhAWSuTp7Ek
 ZivYfPO02ctu8AVE/W+kLOzLLc000IqcvHHp3cSHpLB1kWwdLBVA3hE/U8mj7QXt4cvGnEN9L1z
 ez32KWO9yAZr+v3YF6sCVD2nJ36KoEj+rDV6Sw3ZCNgN4PVNX3VYw/ACfDZmFYvz9S0qIKFE3M8
 6jlw1yTyx+X/a3LbbaJYaKHw8Zzu6DlVqjAJMMMmTRSw==
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Jonas
 Karlman <jonas@kwiboo.se>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 1/2] dt-bindings: arm: rockchip: Add Radxa ZERO 3W/3E
Date: Tue, 21 May 2024 20:28:04 +0000
Message-ID: <20240521202810.1225636-2-jonas@kwiboo.se>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240521202810.1225636-1-jonas@kwiboo.se>
References: <20240521202810.1225636-1-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 167.172.40.54
X-ForwardEmail-ID: 664d03e4f0b0d6a409517482

Add devicetree binding documentation for Radxa ZERO 3W/3E boards.

The Radxa ZERO 3W/3E is an ultra-small, high-performance single board
computer based on the Rockchip RK3566, with a compact form factor and
rich interfaces.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
v2: Collect acked-by tag
v3: Fix devicetree spelling
v4: No change
v5: No change
v6: No change
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index e04c213a0dee..51cdaabaf0d9 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -814,6 +814,13 @@ properties:
           - const: radxa,rock-5b
           - const: rockchip,rk3588
 
+      - description: Radxa ZERO 3W/3E
+        items:
+          - enum:
+              - radxa,zero-3e
+              - radxa,zero-3w
+          - const: rockchip,rk3566
+
       - description: Rikomagic MK808 v1
         items:
           - const: rikomagic,mk808
-- 
2.43.2

