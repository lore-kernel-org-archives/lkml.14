Received: from mail-177132.yeah.net (mail-177132.yeah.net [123.58.177.132])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2CB810F1;
	Mon,  3 Jun 2024 01:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717377163; cv=none; b=ROa2wvA+tlfADNpHdL+LUED/A5+vFRlIMUqEPvq+hsJmrsv+WCYzMsVyBoA8fHPMjM6lrJ/8ZIA3nPXDx4Xj7Wpa4g05HDxqtBnlfaKAI7t4YdQldcwjRCC0KFv6hpzqqyJR4MfGmeQ2Rd09EoWS2z1kVtwCmD9KRUZmmqdc2Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717377163; c=relaxed/simple;
	bh=tIe7sgzLNNumDDE2u9rW3b9KU0lhJ9Id5HhmB1TXO74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HVTUDxafVpiQ3FahBDC8TOo7wGRYDETYRX2+1YhEfoFOe75ZolDmTSdLTlh7zmWXGblKb9GJGOA0OMrKDSRdAI4qzT2NOCJ862NcfsN+bcMKbVOx4IpsyT8JP0CuauuRJ0pFE3hExyeMzzgJewXrAtKdhP26MA6jl3fQaIPGiX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=XvaE/y4L; arc=none smtp.client-ip=123.58.177.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="XvaE/y4L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=rqVP833gbfOr94xX9bKqRkcWmC/Hfc0U89o8Z84A84E=;
	b=XvaE/y4LGl5EZ5jTqDB9jkTVKcaMPM6NBbjnvSxqafFUDFQrLGReGTcuBG8kNo
	lbyq01MZ0nIZ+oOcouWOFEpdLqc564KQPGZ3OlR6WW/eJ1ZCZGTx2ytXIdidzP3o
	ROJQ+8KtXGrTk5/ilY7kICG2fbKGP3yq56fzCH0rBGU1E=
Received: from dragon (unknown [114.216.76.201])
	by smtp2 (Coremail) with SMTP id C1UQrADX31ByGF1maB_sBw--.21248S3;
	Mon, 03 Jun 2024 09:12:19 +0800 (CST)
Date: Mon, 3 Jun 2024 09:12:18 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux@ew.tq-group.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] arm64: dts: freescale: tqma9352: Add partitions
 subnode to spi-nor
Message-ID: <Zl0YciNbjq4aDtL6@dragon>
References: <20240423113151.2145120-1-alexander.stein@ew.tq-group.com>
 <20240423113151.2145120-2-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240423113151.2145120-2-alexander.stein@ew.tq-group.com>
X-CM-TRANSID:C1UQrADX31ByGF1maB_sBw--.21248S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrZF17AF1fWFyrCF4xJFy8uFg_yoW3AFb_Jr
	18Ga10qw4jyrWfK3Z09Fs7KF9rXa1UuF1UXr1fJrZrJ3WYyw1DXryvqryktrnxua1jkry3
	uayrAr4DAw12kjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0wXo3UUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiGBPyZV6Nn2D2ZwAAsh

On Tue, Apr 23, 2024 at 01:31:46PM +0200, Alexander Stein wrote:
> The bootloader adds MTD partitions in this subnode if present, or in the
> spi-nor node itself otherwise. Direct children cause warnings like:
> 425e0000.spi: ofpart partition /soc@0/bus@42000000/spi@425e0000/flash@0/
>   partition@600000 (/soc@0/bus@42000000/spi@425e0000/flash@0) #size-cells
>   is wrongly set to <0>, assuming <1> for parsing partitions.
> 
> This is due flexspi node having #size-cells = <0>. Setting #size-cells in
> MTD nodes itself is deprecated by mtd.yaml.
> Fix all this by adding an empty partitions node which the bootloader will
> fill with configured MTD partitions.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied all, thanks!

