Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A79061691;
	Tue,  2 Apr 2024 10:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712054365; cv=none; b=DAqgoe6L1AZ649kUW2SEBrI6i3YF385RE48fyG/X6KLR4+iACM99kFBVkFLCohUfIWEAMhAV6UJAlkU+swndYUoMia+5iKnrjhsTavZLueQUFca31wQz3Rr8NWYedlr7EXi3Nujz4XOohphGIAeqr5dOaxsT9kFik+FD7iVvbKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712054365; c=relaxed/simple;
	bh=0ywk1aPD4iHu2wTKDlo26tgrYdL1uutRqFQeQi3qw1g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HmNYKLekPUz9uI9HHWuesux5aU/iXZy38mm+ZcFYS9Be8BhSqBZkvo1o9mX7kYztoTWDDN7yVhu9P2ShGpFhDdRJjQJpCX1X5v+qTFnmUehbCaARunUF+bu1kCL/p4Zqi5aYOH/PKQnYFjnmb6WHi7EyXhh80C/isdYUZKZf1bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i53875aaf.versanet.de ([83.135.90.175] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1rrbXy-00051j-5X; Tue, 02 Apr 2024 12:39:18 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 sfr@canb.auug.org.au, liujianfeng1994@gmail.com
Subject:
 Re: [PATCH] arm64: dts: rockchip: remove startup-delay-us from
 vcc3v3_pcie2x1l0 on rock-5b
Date: Tue, 02 Apr 2024 12:39:17 +0200
Message-ID: <2535182.Sgy9Pd6rRy@diego>
In-Reply-To: <20240401081302.942742-1-liujianfeng1994@gmail.com>
References: <20240401081302.942742-1-liujianfeng1994@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Montag, 1. April 2024, 10:13:02 CEST schrieb Jianfeng Liu:
> Property startup-delay-us is copied from vendor dts and it will
> make kernel not detect pcie wifi device. If I run command:
> "echo 1 > /sys/bus/pci/rescan", pcie wifi device is detected, but
> my wifi device RTL8822CE failed to load driver. Another device
> RTL8723BE can load driver but no wifi signal is detected.
> 
> Removing this property will fix issues above.
> 
> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> index d6bf2ee07..a9af654a0 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> @@ -76,7 +76,6 @@ vcc3v3_pcie2x1l0: vcc3v3-pcie2x1l0-regulator {
>  		regulator-boot-on;
>  		regulator-min-microvolt = <3300000>;
>  		regulator-max-microvolt = <3300000>;
> -		startup-delay-us = <50000>;
>  		vin-supply = <&vcc5v0_sys>;
>  	};

this somehow sounds like a hack around a deeper issue.
Because regulator_enable just delays its return by that delay
so the pcie driver should just after this return do the scanning?

Does the pcie driver enable the regulator too late somehow?


Heiko




