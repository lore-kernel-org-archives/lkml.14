Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60CA46F30B;
	Thu, 27 Jun 2024 07:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719474999; cv=none; b=knj82im27eq1b6ma1z4CQtQi1aM6wUImdhGl5TyPn/pgpqBx6MZwKpO707/PtJ7bOf9jrMt1WDChypTtfhO4D1Kz1FGQuNoqi0iyS9y++YgOjSoWIBJyMJTNGwx7OtF0bpbx6FoPxPKt5kUV7FBJsMcB2qxcxOyC7P9kJomzBKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719474999; c=relaxed/simple;
	bh=pmh2WPEGH93NRjf9Mx0zSTtzvhQAcUIo7vgaooEg9rQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UVHwRE83abGrV293+6IW5aRIPULq0QaRi6En+f6EbFGr/lBgeEEN2CE9AxU6Np7UqJBnlSZq4DqMTaGd23F5uF9tcjINLEzki2+2rTjFbgVctOuAbYFtNyw8e4pU7sDPEhVwABNCn7LvhvGlO/L7Q/qFTnWDhp+hRuxbZAeCd0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=WcJEYMWY; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="WcJEYMWY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=sp8KZdlX3RPDhtLx6ynzr5IonFdRIlNIab79h3NFXaM=;
	b=WcJEYMWYQ9vVXCutrY7Klxkm8Ev4MpSZGszXHCl8J/JX5tTXnjtOC0XGFBno91
	vMTYQR3wD/Vy2Pvlop81NotNidMSoxJDf2gIF4Axfa7HUrRCduMFlw0sJQxPokdF
	jjGDEn6KXAE9XKmN4r8Fvx2jwsVIme6UHqgCaxm70/nak=
Received: from dragon (unknown [114.218.218.47])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD33_AVG31mPrkZAA--.25823S3;
	Thu, 27 Jun 2024 15:56:06 +0800 (CST)
Date: Thu, 27 Jun 2024 15:56:04 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Joy Zou <joy.zou@nxp.com>
Cc: frank.li@nxp.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/2] remove and reorder labels
Message-ID: <Zn0bFMhDlK5agGjT@dragon>
References: <20240620022637.2494329-1-joy.zou@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240620022637.2494329-1-joy.zou@nxp.com>
X-CM-TRANSID:M88vCgD33_AVG31mPrkZAA--.25823S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU-o7KDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCRcLZWZv-cx1LgAAsT

On Thu, Jun 20, 2024 at 10:26:35AM +0800, Joy Zou wrote:
> For the details, please check the patch commit log.
> 
> ---
> Changes for v2:
> 1. separate the remove label patch from reorder patch.
> 2. change the child device order in lpi2c3.
> 3. modify the commit message.
> 
> Joy Zou (2):
>   arm64: dts: imx93-11x11-evk: fix duplicated lpi2c3 labels
>   arm64: dts: imx93-11x11-evk: reorder lpi2c2, lpi2c3, mu1 and mu2 label

Applied both, thanks!

