Received: from mail-177132.yeah.net (mail-177132.yeah.net [123.58.177.132])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28473386;
	Thu, 28 Mar 2024 06:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711608614; cv=none; b=IYzwVQNBNa4wYurWXLN2k6pDnDSOj/NeKqmLsZNV9bs9ssS9aOBP+yjVJpuLQoN3DZpZPAjJ/kUmxuhv/sAzYoGyuwBnIMVbWieaKbNNLg1aJtjgxYQOIZZkOnWt01/JsnqWJBB/wncjIvTlRPE48U5JPw6656R0xzmfMtf7W0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711608614; c=relaxed/simple;
	bh=RN8R+2Bx93C58W1vJP5YX6XlUXPug8ucJerzaITw4BU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JHfq+nPk6t4vyXkdqs6zTsHMoRnu5pmuAaZhBiJYZzO7G/DmuYE4yegMx0vpeQMVQBN6YaQud5R/bzzkAHhfe/8my98PwSLUIfhip/s4KoeHklRJsDxcALk07cVMO/IICR9SuRrjzRVZnXwMbj9FfRrRqJuLYJKwp9nDA3OrSyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=UeAbq32Q; arc=none smtp.client-ip=123.58.177.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="UeAbq32Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=tSkiYsm4pDu47eWsaJ3ZWcRIMjz3TMoXclE8uV647yk=;
	b=UeAbq32Qtqwkg3fMxSNUclzzR6l2ob3VQJrNgRefoPY292PlVbWh7CJdRaaQVF
	iippjvr6nigu/D7jaAQEW8Ogu5hNVweLYnGgZ2rV4TXi3H975ChhrIyNhzuzIcWV
	rn3f3LUTLkubbfhwlJa/mwIqJ2PNoQWhGGP9Cm/cNs7pU=
Received: from dragon (unknown [183.213.196.225])
	by smtp2 (Coremail) with SMTP id C1UQrAD3H1BBEAVmnM1UAg--.36602S3;
	Thu, 28 Mar 2024 14:37:56 +0800 (CST)
Date: Thu, 28 Mar 2024 14:37:53 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
Cc: Chester Lin <chester62515@gmail.com>, Andreas Farber <afaerber@suse.de>,
	Matthias Brugger <mbrugger@suse.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, NXP S32 Linux Team <s32@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: Re: [PATCH v2 0/2] add uSDHC and SCMI nodes to the S32G2 SoC
Message-ID: <ZgUQQVGJGtQnFT5p@dragon>
References: <20240122140602.1006813-1-ghennadi.procopciuc@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240122140602.1006813-1-ghennadi.procopciuc@oss.nxp.com>
X-CM-TRANSID:C1UQrAD3H1BBEAVmnM1UAg--.36602S3
X-Coremail-Antispam: 1Uf129KBjvdXoWruF4fKr45Gr1fXw48Ar4fZrb_yoWxCFg_ur
	W8K3yrC348JFZ7J3ZYka1DAF4UGFW09r18KrZ7Ww4Iqr9xtFs5tFs8K3yrXrWYk3WfKF9a
	yF15tr4DZr43ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUnYhF7UUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiDQSvZVszXW7RXgAAsX

On Mon, Jan 22, 2024 at 04:05:59PM +0200, Ghennadi Procopciuc wrote:
> From: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> 
> This patchset adds device tree support for S32G2 SCMI firmware and uSDHC
> node. The SCMI clock IDs are based on a downstream version of the TF-A
> stored on GitHub [0].
> 
> I can send the patches individually if you prefer that instead of
> submitting them all at once.??
> 
> [0] https://github.com/nxp-auto-linux/arm-trusted-firmware
> 
> Changes in v2:
>  - The SCMI clock bindings header has been removed.
> 
> Ghennadi Procopciuc (2):
>   arm64: dts: s32g: add SCMI firmware node
>   arm64: dts: s32g: add uSDHC node

Applied both, thanks!

