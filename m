Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3845473F10;
	Thu, 22 Feb 2024 22:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708640055; cv=none; b=O4e6egauBvVyDF/sQxa43pplqpxsHGECvZn8SgAN0Ko/8N9e8hBcc+3/m2nUDYMDtzblgLBqbugqPShiHlJ4ZBWQPrR0Tj005BtEUVUYVcTXdPLIMmUeLwTxmv+83Wr89IJUz5aOwb9OeNuFYg/qZzqcEPY5W5T+xwDrVRU3pDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708640055; c=relaxed/simple;
	bh=ck3jRgRIEFFe1vVEFGBoovJRWLr353BeTOW5VKjl/ZU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gucSISJNx2mOmTq55yt9xr4Izklpsi/zRGsHl5tA8osQ4l9SDIy6eui5l+4QXn5jTtmHUHFmkqZgxNfmNZdC7mmAqOMaD4RVc9uiS2E/5iVKvInhiXSqB8r5hCBvakPuQ3tAeM49HGuelMLbO1bGyqBGyrxLS6ZNa+SumINipJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C3FC7DA7;
	Thu, 22 Feb 2024 14:14:49 -0800 (PST)
Received: from minigeek.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BD2AE3F766;
	Thu, 22 Feb 2024 14:14:09 -0800 (PST)
Date: Thu, 22 Feb 2024 22:12:45 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, wens@csie.org, samuel@sholland.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: allwinner: h616: Add Orange Pi Zero 2W to
 Makefile
Message-ID: <20240222221245.216f403a@minigeek.lan>
In-Reply-To: <20240222211326.114955-1-jernej.skrabec@gmail.com>
References: <20240222211326.114955-1-jernej.skrabec@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 22 Feb 2024 22:13:26 +0100
Jernej Skrabec <jernej.skrabec@gmail.com> wrote:

Hi,

> Orange Pi Zero 2W dts file is not included in Makefile. Fix this.
> 
> Fixes: c505ee1eae18 ("arm64: dts: allwinner: h616: add Orange Pi Zero 2W support")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Ah, sorry, I think this was lost during a rebase, when the other H618
boards were merged.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  arch/arm64/boot/dts/allwinner/Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
> index 91d505b385de..1f1f8d865d0e 100644
> --- a/arch/arm64/boot/dts/allwinner/Makefile
> +++ b/arch/arm64/boot/dts/allwinner/Makefile
> @@ -42,5 +42,6 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-bigtreetech-cb1-manta.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-bigtreetech-pi.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-orangepi-zero2.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-x96-mate.dtb
> +dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-orangepi-zero2w.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-orangepi-zero3.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-transpeed-8k618-t.dtb

