Received: from mail-177131.yeah.net (mail-177131.yeah.net [123.58.177.131])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A861B651;
	Mon,  3 Jun 2024 03:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717383720; cv=none; b=MrrlEEd7FRXlLg8lBaHxx6FRKZRcDdtGdx1sTnoPXt2jsddklfL8EAN5Di2UbhMpFTH8SkgYIJT3+0JlyzbkCSMoWJD3iOVdE883xQ5qhdRg7H5DrDtxoQCH6x9slc9hngyp81sUmRVae5ZuvIV49Dmhy00H0zM5Y4IAnYq8Ljg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717383720; c=relaxed/simple;
	bh=5x7HXdrNWAEE6vI1d7NYp5OMzGtUovnbw2hniT+rEYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ciB/VMnoq6ENePNAZfmo1ludUj6oeZWU3KLU8yzSKAxVL6pQQmvg8orjU8c645VL88Ts9mCSnvHhL++s6uza8XvOJENKftpSbTCrf+3A2tMRsul6Sba1Xtv0zTG7FM/AkcHiCqlD6Hzs7Xq+q2MwMZWQJfOPV/BA74yYGltzN9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=L+Rv56De; arc=none smtp.client-ip=123.58.177.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="L+Rv56De"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=pP5UUDF3nBlbJDPfN+e11ND9XX88gVbEBhykB7jdJWU=;
	b=L+Rv56DeTQoHK7guf4X1vgl/qCkCqi9fuNuLEfoJ26m7R9U+EjURt58XORbuuZ
	y2s58YyCzi+ktWO+nS3QIPuWymm7I1NVsCf+oG0kY8H+xSdQl34L6fbmEWMg5GWj
	qyK88KhbDbTRgS9yKPDQLEHf0EzEIuSvFXK7pk7dGDRuE=
Received: from dragon (unknown [114.216.76.201])
	by smtp1 (Coremail) with SMTP id ClUQrAD3_0MLMl1mA_AxBw--.35276S3;
	Mon, 03 Jun 2024 11:01:32 +0800 (CST)
Date: Mon, 3 Jun 2024 11:01:31 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Joao Paulo Goncalves <jpaulo.silvagoncalves@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Joao Paulo Goncalves <joao.goncalves@toradex.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: freescale: imx8mm-verdin: Fix GPU speed
Message-ID: <Zl0yC+5B0OzcnM6y@dragon>
References: <20240507143555.471025-1-jpaulo.silvagoncalves@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240507143555.471025-1-jpaulo.silvagoncalves@gmail.com>
X-CM-TRANSID:ClUQrAD3_0MLMl1mA_AxBw--.35276S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUx2YLDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiDwzyZVnxcx9JEwAAsK

On Tue, May 07, 2024 at 11:35:55AM -0300, Joao Paulo Goncalves wrote:
> From: Joao Paulo Goncalves <joao.goncalves@toradex.com>
> 
> The GPU clock was reduced on iMX8MM SOC device tree to prevent boards
> that don't support GPU overdrive from being out of specification. However,
> this caused a regression in GPU speed for the Verdin iMX8MM, which does
> support GPU overdrive. This patch fixes this by enabling overdrive mode
> in the SOM dtsi.
> 
> Fixes: 1f794d3eed53 ("arm64: dts: imx8mm: Reduce GPU to nominal speed")
> Signed-off-by: Joao Paulo Goncalves <joao.goncalves@toradex.com>

Applied, thanks!

