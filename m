Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061E312D765;
	Tue,  4 Jun 2024 15:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717513390; cv=none; b=oczNcvMgL6dq1TOK2NKe/Ae7GzV/WPXOBLIRPMhsxpM5dGAmzOBfZPplTdpgH6UZEZBO+jwZh0fBcOJi7OyfXZqINUyWcFp3kOAbJrfP018EEgN7RmPBfjSXlvVlY1FDoEh2B6hx31ltn1fIk72QWv6d0LFDfV4x//vVWkvmfHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717513390; c=relaxed/simple;
	bh=oO1N7CvqGabg5ERSsXB0x92cImrpfMbrk+9dlOLtd7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HcNnck11mSDehnCvrNm3XSqZPJJtxjMYaWbfPgnxYOlObEqlvVfJ86G4saoVL/T9fG9KjgWrZiT8rzqo/6IPbmN5tIxCx9CBgrXiwOsW4K/pIkkRWyR1q2epzuJH/axzVmSwqgnWDk62Z8S5cOj2PVH48vEExUiskcNnl2H3IjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rDOtIdOQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rDOtIdOQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D219C2BBFC;
	Tue,  4 Jun 2024 15:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717513389;
	bh=oO1N7CvqGabg5ERSsXB0x92cImrpfMbrk+9dlOLtd7E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rDOtIdOQObmJChX0rf8RMYc5FteVfSWKI35Sr6T1crvh73zIrfrgwz28dMbARyWLN
	 gvRvFXt8bZkfjFuncbzwz2UbD63HjWpNJoSPSW7qy/oqKfam0fzceXdCXzTX9/iIPL
	 YxnyYLVgiUD8ztV6R+xx0pNv+0PLEo7i3kaGQDR2XNm8VTHeXuG99dF4BhSKRC3VgD
	 aMRm04qLaUbXsHkYUKgQ6+Y9pSHM4ZaDWJNLk1ZKaB/RZJBv+qjpzLkdXVULVFTUbe
	 DcXyG8XvC/UDfVY9xpOxPa6LDXs2Ud3TnYP+C38GalPMeoEYSYwTsv8m/RFoKs5vhU
	 We9RECL8Y22dQ==
Date: Tue, 4 Jun 2024 10:03:06 -0500
From: Rob Herring <robh@kernel.org>
To: Pengfei Li <pengfei.li_1@nxp.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, abelvesa@kernel.org,
	mturquette@baylibre.com, sboyd@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	ping.bai@nxp.com, ye.li@nxp.com, peng.fan@nxp.com,
	aisheng.dong@nxp.com, frank.li@nxp.com, tharvey@gateworks.com,
	alexander.stein@ew.tq-group.com, gregor.herburger@ew.tq-group.com,
	hiago.franco@toradex.com, joao.goncalves@toradex.com,
	hvilleneuve@dimonoff.com, Markus.Niebel@ew.tq-group.com,
	m.felsch@pengutronix.de, m.othacehe@gmail.com, bhelgaas@google.com,
	leoyang.li@nxp.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/5] dt-bindings: clock: Add i.MX91 clock support
Message-ID: <20240604150306.GA596314-robh@kernel.org>
References: <20240530022634.2062084-1-pengfei.li_1@nxp.com>
 <20240530022634.2062084-2-pengfei.li_1@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530022634.2062084-2-pengfei.li_1@nxp.com>

On Wed, May 29, 2024 at 07:26:30PM -0700, Pengfei Li wrote:
> i.MX91 has similar Clock Control Module(CCM) design as i.MX93.
> Add a new compatible string for i.MX91.
> 
> Signed-off-by: Pengfei Li <pengfei.li_1@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  Documentation/devicetree/bindings/clock/imx93-clock.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/imx93-clock.yaml b/Documentation/devicetree/bindings/clock/imx93-clock.yaml
> index ccb53c6b96c1..98c0800732ef 100644
> --- a/Documentation/devicetree/bindings/clock/imx93-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/imx93-clock.yaml
> @@ -16,6 +16,7 @@ description: |
>  properties:
>    compatible:
>      enum:
> +      - fsl,imx91-ccm
>        - fsl,imx93-ccm

Should fallback to fsl,imx93-ccm? Being a superset should be ok because 
your DT should never use the non-existent clocks. If not, where is the 
driver change?

Rob
