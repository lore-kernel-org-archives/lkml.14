Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C04180A9E
	for <linux-kernel@vger.kernel.org>; Wed, 29 May 2024 12:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716985958; cv=none; b=rv0xBfmLcfjDXUkVbt1P1IYBqDxXPtnt9Itm++EQEzkO4TIdrWyZCi+5yWzDLWwneKW6i/WeOxQwVxjX1trNdXryNrj/MtT6lEN1hIGSm2CjW9rZchWv2CIz7yjdt9CO+V72Kqr0XGC1AQOZ26/hINDWJAi7n+iUZr/fg46uL/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716985958; c=relaxed/simple;
	bh=xr3BLD3QGdIgOEksdpVVfKsYGW4f9kqam36dVQmegkw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CYKV/FIe0yBtuw24c2RM+LfTceE2ZRBijZtEtlgF3fqxvkJzZXTkG39IxV6H2bENF6Pjl0+0ZRkUdUwKxlg8iC/YPxp8ai92tbL0ElAiN0/51Ba0Nj8Sc90kWTIcpLWfY0FSe2aYIw70JxnlFxPgf4tjTxOo24xuQptm2pFRMvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:1b01:1838:131c:4de4])
	by baptiste.telenet-ops.be with bizsmtp
	id V0YZ2C0043VPV9V010YZPH; Wed, 29 May 2024 14:32:34 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sCISs-00Gecx-Gn;
	Wed, 29 May 2024 14:32:32 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sCITo-009bMd-SX;
	Wed, 29 May 2024 14:32:32 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2] dt-bindings: timer: renesas,tmu: Make interrupt-names required
Date: Wed, 29 May 2024 14:32:32 +0200
Message-Id: <65fdd0425be0cc1bae9e6f7996aceaa5ad34e510.1716985947.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now all in-tree users have been updated with interrupt-names properties
according to commit 0076a37a426b6c85 ("dt-bindings: timer: renesas,tmu:
Document input capture interrupt"), make interrupt-names required.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
v2:
  - Add Acked-by.
---
 Documentation/devicetree/bindings/timer/renesas,tmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
index b6dd98d956f3e867..75b0e7c70b62c89f 100644
--- a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
+++ b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
@@ -95,6 +95,7 @@ required:
   - compatible
   - reg
   - interrupts
+  - interrupt-names
   - clocks
   - clock-names
   - power-domains
-- 
2.34.1

