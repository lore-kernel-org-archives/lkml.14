Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B92F84FD3;
	Thu,  7 Mar 2024 09:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709805319; cv=none; b=n9ibx9hkEJVlM615Kkcku9gTGSERi80/5PH9KVQ2X8Qq2VPsD9I1lXW6we2RsQXMgvz5+nk7ZHKB0BzBbeO0j5zLF9MnnrrDalzfieLrvTBAQtkGvGBmhrO3TH4Us8SCJuTaTnKqlmik8M5xkGpJwUX7ul6l5W2J/Asla0RvWog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709805319; c=relaxed/simple;
	bh=KLfycGuMheC04tlvb9jrC4igb5MjblkT22SldYTJ4b4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rM0AejSQyl+NqNr5pq4RiOAPEDj+p9ggiGKzaBFhxSqvs0ml8Rjpg3senMJGnNc05XGp0q/uP3HlquuApb5k+02Qyzam4WCXqMT/E6u8C4UV4P/dOIxJLjMTFlwDOx+c+7LjKRmoYZxQ7YP9SL7Bvj+uhREF7BjIzPVZ3iayM1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ITa+m7jn; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ITa+m7jn"
Received: by mail.gandi.net (Postfix) with ESMTPSA id EBB111C000F;
	Thu,  7 Mar 2024 09:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709805310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r3Qj18SJPoB5IwOhH7muoEgWJF0E8Qgb24UW7SZrSqs=;
	b=ITa+m7jnPWAcRiCcJYCCi1AgHywl45B/yVWuxpFOxZ7h1ysXWWk/QxBE35BexIV1rb5lxm
	6nxGzpH4CViZJUJ4pHBKDtJZLzxbZTOHTHlGxLHM3MLdPP38KfVW5Vsf25NW4GNGzbq/Gi
	8ALGDVsbE0QnmN36OcfRw+TbYVjr12v/qBf7ozn3H9O5M1oASnX0LMzHkL/G0FNpWhVfBk
	pco+RTSqV4VCEdUPclI18d+HWviFdJGATJXnUT9NHT6OKKBSaTI5ipsX3FfRRKjuoV7G0W
	miO+01g3P57Pspt5BTlqhozQk4XbIl9i+7tky10FnalLU4y9NXWVx3J8je4WxQ==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Thu, 07 Mar 2024 10:55:03 +0100
Subject: [PATCH v4 2/9] dt-bindings: usb: ti,j721e-usb: add ti,j7200-usb
 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240307-j7200-usb-suspend-v4-2-5ec7615431f3@bootlin.com>
References: <20240307-j7200-usb-suspend-v4-0-5ec7615431f3@bootlin.com>
In-Reply-To: <20240307-j7200-usb-suspend-v4-0-5ec7615431f3@bootlin.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Roger Quadros <rogerq@kernel.org>, 
 Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
 Kevin Hilman <khilman@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.13.0
X-GND-Sasl: theo.lebrun@bootlin.com

On J7200, the controller & its wrapper are reset on resume. It has the
same behavior as ti,j721e-usb with a different SoC integration.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml b/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml
index 653a89586f4e..e8f7e7511483 100644
--- a/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml
+++ b/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml
@@ -16,6 +16,9 @@ properties:
       - items:
           - const: ti,am64-usb
           - const: ti,j721e-usb
+      - items:
+          - const: ti,j7200-usb
+          - const: ti,j721e-usb
 
   reg:
     maxItems: 1

-- 
2.44.0

