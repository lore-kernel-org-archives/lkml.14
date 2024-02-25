Received: from mail-177132.yeah.net (mail-177132.yeah.net [123.58.177.132])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1C7A12E6D;
	Sun, 25 Feb 2024 13:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708869403; cv=none; b=G+TVQgn9JC5iqqTeO3T3USRYYSb0G2sP/0FXutkenqM/Y+eADSDl2MDMOYVcNKJY2UhFu46A9+JgGqUNiHSwl1duXaRN73ssOzxv+DhP0+zr2gzsB03Mojg3RWmHRXqxRkvbz1wCKgJwXuSmxrsvGodPCeAaXQLt2aCXdOQpHzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708869403; c=relaxed/simple;
	bh=DCpufjbHQcORqZn+gyJe2ofatXl3VE7VXc4zcJgTATA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jdmDdZuQFG5itaNloj1jttc0lxASwcgFdrXV1Wty0gsKSMF7aByLuoPSB+3NmxQMTUQ3pdhY4fL8V8ewYAcHMHFJd789tt8oSfT13vnFvxXwud5xCMlBBDNEj5qbhyw4Pa+feXLQ/aQLdzPSgxMTn5yefgXDJqeNcCgleWDoHT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=Cb9/jH8n; arc=none smtp.client-ip=123.58.177.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="Cb9/jH8n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=51w7vCKGbXDnTrxK+rjkTDnWQdpGtVWd5T4A/QOG7TY=;
	b=Cb9/jH8n1eiJj3yJRm6esvTNM5e7z23jfcvgXQThj6DnihEtmKYowQVdGQ6BP1
	r9rH5fzrjKttuYiPzIXKKL1Io2g++5QLc98j2nz4UN/dA7puQGhbD17+4kEQzxkG
	8LnbcaTQEIMLB5zozlmPl7kqwwCX7RzK+MS7KEvrqOUkE=
Received: from dragon (unknown [183.213.196.200])
	by smtp2 (Coremail) with SMTP id C1UQrABHLYfhRttlaLRWBA--.21283S3;
	Sun, 25 Feb 2024 21:55:46 +0800 (CST)
Date: Sun, 25 Feb 2024 21:55:45 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Sebastian Reichel <sre@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 11/16] ARM: dts: nxp: imx6ul: xnur-gpio -> xnur-gpios
Message-ID: <ZdtG4RjqshJKR32p@dragon>
References: <20240224213240.1854709-1-sre@kernel.org>
 <20240224213240.1854709-12-sre@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240224213240.1854709-12-sre@kernel.org>
X-CM-TRANSID:C1UQrABHLYfhRttlaLRWBA--.21283S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVdb1UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiGAKPZV6NnjV6cwAAsB

On Sat, Feb 24, 2024 at 10:29:43PM +0100, Sebastian Reichel wrote:
> Replace all "xnur-gpio" with "xnur-gpios" in the i.MX6UL(L) Touchscreen
> node, since the -gpio suffix is deprecated. All known implementations of
> this binding can handle -gpio and -gpios since day 1, so this should be
> fully backwards compatible.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Sebastian Reichel <sre@kernel.org>

Applied, thanks!

