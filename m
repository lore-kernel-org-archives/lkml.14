Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5B5B282F9;
	Tue, 26 Dec 2023 10:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 301652F4;
	Tue, 26 Dec 2023 02:41:10 -0800 (PST)
Received: from minigeek.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D2C5E3F5A1;
	Tue, 26 Dec 2023 02:40:22 -0800 (PST)
Date: Tue, 26 Dec 2023 10:40:04 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Fuyao Kashizuku <fuyao@sjterm.com>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Florian Fainelli
 <f.fainelli@gmail.com>, Wei Xu <xuwei5@hisilicon.com>, Gregory CLEMENT
 <gregory.clement@bootlin.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, =?UTF-8?B?6bqm5YGl5bu6?=
 <maijianzhang@allwinnertech.com>
Subject: Re: [PATCH v2] ARM: dts: sun8i: Open FETA40i-C regulator aldo1
Message-ID: <20231226104004.0cec26a9@minigeek.lan>
In-Reply-To: <ZYqRZev1g_mztff2@debian.cyg>
References: <ZYqRZev1g_mztff2@debian.cyg>
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

On Tue, 26 Dec 2023 16:40:05 +0800
Fuyao Kashizuku <fuyao@sjterm.com> wrote:

Hi,

many thanks for the quick turnaround!

> The USB PHY in the Allwinner R40 SoC seems to rely on voltage on the
> VCC-TVIN/OUT supply pins for proper operation, on top of its own supply
> voltage on VCC-USB. Without a 3.3V voltage supplied to VCC-TV*, USB
> operation becomes unstable and can result in disconnects.
> 
> The Forlinx FETA40i-C SoM connects both the VCC-TVOUT and VCC-TVIN pins
> to the ALDO1 rail of the PMIC, so we need to enable that rail for USB
> operation. Since there is no supply property in the DT bindings for
> the USB core, we need to always enable the regulator.
> 
> This fixes unstable USB operation on boards using the Forlinx FETA40i-C
> module.
> 
> Signed-off-by: Fuyao Kashizuku <fuyao@sjterm.com>

Perfect, looks good to me now!

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Thanks!
Andre

> ---
> Changes in v2:
>  - Subject include board name.
>  - regulator name changed to vcc-3v3-tv-usb.
>  - explain why we need to enable the regulator.
>  - use full name of the commiter
>  - Link to v1: https://lore.kernel.org/lkml/ZYKjYypuAx7gNuam@debian.cyg/
> 
>  arch/arm/boot/dts/allwinner/sun8i-r40-feta40i.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/allwinner/sun8i-r40-feta40i.dtsi b/arch/arm/boot/dts/allwinner/sun8i-r40-feta40i.dtsi
> index 9f39b5a2bb35..c12361d0317f 100644
> --- a/arch/arm/boot/dts/allwinner/sun8i-r40-feta40i.dtsi
> +++ b/arch/arm/boot/dts/allwinner/sun8i-r40-feta40i.dtsi
> @@ -42,6 +42,13 @@ &pio {
>  	vcc-pg-supply = <&reg_dldo1>;
>  };
>  
> +&reg_aldo1 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <3300000>;
> +	regulator-max-microvolt = <3300000>;
> +	regulator-name = "vcc-3v3-tv-usb";
> +};
> +
>  &reg_aldo2 {
>  	regulator-always-on;
>  	regulator-min-microvolt = <1800000>;

