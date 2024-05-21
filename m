Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C7E1474B3
	for <linux-kernel@vger.kernel.org>; Tue, 21 May 2024 21:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716326586; cv=none; b=WYCL/lpu4P9BNb23Pg25IHhG5owe078BGEqEvFn2cLYR0s4zJOxGml9Bi9maXJrnFYCuEmR5P4SRkC2EBmxnP7NvyeMM5NAB83vhAHxLfn+GFaS1rNflbDFzF1ktKWD1hC1tbGGGfmFFAgjuwjdU0cwJUvxJU1vwEYE76YHubVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716326586; c=relaxed/simple;
	bh=vdnxgbNWMRmyyiOXub/U8xA2a2lGUmNEyOZiMq5Q6Rs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XuNmHRo/CXQ8sHw/a5big5A9B9grmunMPi7GgHa8F3j0yXrTr7EHa+jfP4eZgZNxFfbwLMhwB1ZV0a5aUt2EaQB2HwSB0S9zoZBQidhIDcCvwb1/7POcexIOY9kQqADtAG3c0M09rzi+VrVPvFn6uorev8Va5VIwTtt5r1FqFMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=QrKLhziu; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="QrKLhziu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1716326581; bh=OoiAXuzNmsgIuRUNSx8gF6sy2Z92yBxfUE4RrLaG18M=;
 b=QrKLhziuMDQ4WXW2rxPIAUkfZjoo6FbCUKzPMLgkawh7j+t8r/XGQIPpXFlCywRGyRd8CbR76
 SAy/9dqUTyC7kK9xSOS0VvKYQlVSP4jItWsbpbhcL0Wu91B3JOYqhKfxNprUHiEkiOLzXGdm475
 O8G90AMArSOiWio9nghee/eDWJ80zcgAtFI/qYlhkADunJA6K/gt3JUbcUYL1nJgdma3dIRieC3
 xqDVGOxsLfFioMZIwMd+dNUxq+498uUR3zep5bp0fzljZb+y/eNtfyblT0J6Y6h5RnmZvEp6jFU
 QKNgZdxOdc2m1qYhV1+0DWRoB8oX9qXuf6qVYZB1sAlg==
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Jonas
 Karlman <jonas@kwiboo.se>
Subject: [PATCH 1/2] dt-bindings: arm: rockchip: Add Radxa ROCK S0
Date: Tue, 21 May 2024 21:22:42 +0000
Message-ID: <20240521212247.1240226-2-jonas@kwiboo.se>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240521212247.1240226-1-jonas@kwiboo.se>
References: <20240521212247.1240226-1-jonas@kwiboo.se>
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
 149.28.215.223
X-ForwardEmail-ID: 664d10b18b6b0c828344b0fe

Add devicetree binding for the Radxa ROCK S0 board.

Radxa ROCK S0 is a single-board computer based on the Rockchip RK3308B
SoC in an ultra-compact form factor.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 51cdaabaf0d9..77469270b271 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -814,6 +814,11 @@ properties:
           - const: radxa,rock-5b
           - const: rockchip,rk3588
 
+      - description: Radxa ROCK S0
+        items:
+          - const: radxa,rock-s0
+          - const: rockchip,rk3308
+
       - description: Radxa ZERO 3W/3E
         items:
           - enum:
-- 
2.43.2

