Received: from smtp.forwardemail.net (smtp.forwardemail.net [167.172.40.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B94192B65
	for <linux-kernel@vger.kernel.org>; Wed, 26 Jun 2024 20:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=167.172.40.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719433014; cv=none; b=WAz/WoFYB0U2QzHktKz5ky/cw3RsCZQ9jvxZEXyqbB3KLXJhIc1lAAkMTvqM90cRGUJVbV+nlArfawJ2MFbzLM7GyXOQNRtZnbaatK4x3WUSA2ZVDBoT4mUhgOCu4JE25T9/kZYH5UY0r3YhEaT7t+IlPA/TpuEiXxDkTq5yrdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719433014; c=relaxed/simple;
	bh=WJm3s538VQy5DwWldTcVumo+iEjgL8P+vMDofEpvIqA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y/18ZP/2j/u/8/+rkkRM1+Pc6FEqKhaX0yKzdgJVPzwhXYwy6baVHkRx/iHTRIj6+0hUcpaQUKkhGTGMpOHe4KnQiU8Nfb/E5ywmBDxEMRoTWXbHlDyq5bUXlFYDKS1gS3THM/k124RzzDXEVwLFvlky4e06V9v0aIIgjkqMXbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=nFGMMldP; arc=none smtp.client-ip=167.172.40.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="nFGMMldP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1719432988; bh=Y/SoR3uNRek5u3223LJsEVFtFNsd61NpDGA8BT3LgR4=;
 b=nFGMMldP4dIJ00Z5a00cREs3NVAsqHQp7Rk+9MrcwHFuQOqWeT5Fb1+vPt0UbXu8YGS/ImlsG
 2jiH6cx6/YQP5ZIP62T1lItGSewOPbYL5O0YJoD9Ky5RU11004b8/z6RjFVeqC4HegBy6lq1boR
 p3yAL+47GVlws834KTSHCz43Wfaduc0u0as2TQTayc3hIO5fh/mmLdZtlY6uFcIw57GhdxK6zZ+
 iwgXK6Eoe/IH4U179UePJuYDB9cqlNnWr4Jb56Lwf2tRZygvUw1qD8MxHT4rTNNBVxcD18fiJEc
 GlJaeayHE9Cgbxp09L3twc65a3r502z7hce2WalJ6sxQ==
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
Cc: FUKAUMI Naoki <naoki@radxa.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add Radxa ROCK 3B
Date: Wed, 26 Jun 2024 20:14:54 +0000
Message-ID: <20240626201502.1384123-2-jonas@kwiboo.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240626201502.1384123-1-jonas@kwiboo.se>
References: <20240626201502.1384123-1-jonas@kwiboo.se>
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
X-ForwardEmail-ID: 667c771ac7901497dbde75d4

Add devicetree binding documentation for the Radxa ROCK 3B board.

The Radxa ROCK 3B is a single-board computer based on the Pico-ITX form
factor (100mm x 75mm). Two versions of the ROCK 3B exists, a community
version based on the RK3568 SoC and an industrial version based on the
RK3568J SoC.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
v2: Collect a-b tag
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index d2e887415d5d..bbb2d7c217fc 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -811,6 +811,11 @@ properties:
           - const: radxa,rock3a
           - const: rockchip,rk3568
 
+      - description: Radxa ROCK 3B
+        items:
+          - const: radxa,rock-3b
+          - const: rockchip,rk3568
+
       - description: Radxa ROCK 3C
         items:
           - const: radxa,rock-3c
-- 
2.45.2

