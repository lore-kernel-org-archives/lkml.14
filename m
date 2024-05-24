Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F75986AFA;
	Fri, 24 May 2024 07:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716534655; cv=none; b=RldLPN6nLSGe+vMUSSan+z85ymJNAnCXFzACBmEMEsBMQbiuL+wSmCcg6hTMO+vMNyRkMM1sYFG4nM368qiLfAhOnRm4KOgKCxf95jAZwgdKLzeuJvGSX6NJmC/rg9M8pDqi126LwhLVP6Mvjv2uZhKZLR7aBk+Rgtapz0g52m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716534655; c=relaxed/simple;
	bh=yoH7HDIzCvy2OCMXmqXpl6iSu4XuuIUTXd0xzeGfedg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ss7syKBhn6C1JEIxpM+q4uui2WHpdgQ1ckuZ7MNLnPNZ4Avw7XoxPvwtDHz6T6ui6u+fqHggKOG5WZCEQqJQURLjGFICTNADaQGyZ56IoH3ekLR9/9YpL/MS9HtyOV2uQGB+Bv4b2IAI9kiEiBNppIWKVUaa5mQkIr/izu5IOVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=0k1QsmKy; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="0k1QsmKy"
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 8400B1F9F4;
	Fri, 24 May 2024 09:10:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1716534649;
	bh=E+eiGEXpFDBtOnSags/hbRRzOuPfaC9yiDVYuMURIKE=; h=From:To:Subject;
	b=0k1QsmKyyyawhgK6mPG0YMcfmqol9ra56MShsur4YR1cISoGVrEsf6oy+G0BwS7tK
	 MyWsOHKeZj0h0ZRkLNtP1ftuoD0kFCOlhaPOclrhrgWBvtlXSvvo80OAmDMNYjU+DZ
	 wvggmPvsHno+DV8ZhB4WXn+Vtsy7atBBjqKIkmDA93Qh12CxIDzH8NqJGpG4GzwZHn
	 aiks+KDfrGe9ykKumvzVErhMHLASDKMVjIHyCbQ1eJRgwFef5yN6/JeUc6W4qwjCcH
	 05iIonnmgCTem2goFQWf2nLRdUeMDROLJ+xEYxnG2Ubt8BK0oT4ci3hDhYolA0Z/hI
	 uMA50jT5K+3Xg==
From: Francesco Dolcini <francesco@dolcini.it>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v1 1/2] dt-bindings: usb: gpio-sbu-mux: Make 'enable-gpios' optional
Date: Fri, 24 May 2024 09:10:33 +0200
Message-Id: <20240524071034.4441-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240524071034.4441-1-francesco@dolcini.it>
References: <20240524071034.4441-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

The enable gpio is not required when the SBU mux is used only for
orientation, make enable-gpios required only for alternate mode
switch use case.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
index 88e1607cf053..30edcce82f97 100644
--- a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
+++ b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
@@ -44,13 +44,18 @@ properties:
 
 required:
   - compatible
-  - enable-gpios
   - select-gpios
   - orientation-switch
   - port
 
 allOf:
   - $ref: usb-switch.yaml#
+  - if:
+      required:
+        - mode-switch
+    then:
+      required:
+        - enable-gpios
 
 additionalProperties: false
 
-- 
2.39.2

