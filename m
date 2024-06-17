Received: from mail-177132.yeah.net (mail-177132.yeah.net [123.58.177.132])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2442B15EFC9;
	Mon, 17 Jun 2024 02:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718590349; cv=none; b=Lf/eSQ95gd/cU/q+A4r2EME/9JzIW2MZGaU6wSVuEsWaitVJZbheVDB7A0zVAqavao2aqlzRHGVjfbJfzSWwMAFbyXRhBZHSsNY0SQDhZrvyWAtqFF5dkFzeTJYox+BMedsV5yoGgKD+7PWYibqYzsKmdkX8TtQsDZ1QoJ+UNQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718590349; c=relaxed/simple;
	bh=2hkMhVkh2nVoBTw6NJzXuRmEaWOunyw84vTzOsVqq8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rq6xLdbbiQILpPJbkYhfcyLURhxgt6UcpM5omoZO2aW14UQfA+p5bnniHBiS9mr1x5WKOzCsUD02+WTNqlSLt7Jk2rTqBzcQITgjknWikSPg9UEaRTK+raP/UCl2oD8ukwobW9JAmBaAAk+b1KOziAS8jhpfl2u8w2QMKDpm13w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=YZcvj283; arc=none smtp.client-ip=123.58.177.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="YZcvj283"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=0akHP1anUFimuceQyxW2eFWvpAgkvYdidH+pYaG6Ejs=;
	b=YZcvj283Aon/EwSllz18VWjet31sT4J91PTvreJLrD/yFEY6Y2H780mNAajZwl
	5NYGJDdy5jhTbv82QzCTToXWLkj8t6sW+8EDAEDrEiHlUnmPlK2vpdi15bc3UPVE
	YBMU502EeXM/PIHZnJ3c5uLsZHmgUP3BQVw3/zBReT+SE=
Received: from dragon (unknown [114.216.76.201])
	by smtp2 (Coremail) with SMTP id C1UQrAD3P31tm29m_e_NCA--.25055S3;
	Mon, 17 Jun 2024 10:11:58 +0800 (CST)
Date: Mon, 17 Jun 2024 10:11:57 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Christopher Obbard <chris.obbard@collabora.com>
Cc: linux-kernel@vger.kernel.org, kernel@collabora.com,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/1] arm64: dts: imx8mp-debix-model-a: Enable HDMI
 output
Message-ID: <Zm+bbZilJNup8mEN@dragon>
References: <20240610234307.96766-1-chris.obbard@collabora.com>
 <20240610234307.96766-2-chris.obbard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610234307.96766-2-chris.obbard@collabora.com>
X-CM-TRANSID:C1UQrAD3P31tm29m_e_NCA--.25055S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUID73DUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiGA4BZV6Nn46QnQAAs9

On Tue, Jun 11, 2024 at 12:42:38AM +0100, Christopher Obbard wrote:
> Enable the HDMI output on the Debix Model A SBC, using the HDMI encoder
> present in the i.MX8MP SoC.
> 
> This has been tested with a generic 1080p HDMI display, along with a
> smaller 1280x800 HDMI display.
> 
> Signed-off-by: Christopher Obbard <chris.obbard@collabora.com>

Applied, thanks!

