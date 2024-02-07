Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD9826110;
	Wed,  7 Feb 2024 00:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707265740; cv=none; b=AC/AEfD1t1+ZkB8p1noaS1qY9ETy40fqzPFYX2V37SjvCgKyUlpuZh2ad9DBQ2Yx6IuxOpwfEkD+WzAYGFdEDlpd4AIx+8k6IcsaYIQTHiWJltu8IHdBJPum3qyDdbJVF2EqR8edCVGziGtMeyLx3gzz8sNy0GzNDnLFB97UF+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707265740; c=relaxed/simple;
	bh=TyQL9dYpJTrFoZvv3BODjzpQVgn1pu2vsCc2aaIMq3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ga6PjvSKGj+B8Ebzve/gYIYApGQoslut/k8BIanuFKJO+ZhJ25xs6IwenVr+xkRQ2hgKeeZjP9nqNpcFG8eS+LsTykfDTFfIQNUHQNlGWw9LlxqbD3H2BxxvPzOhEeOs+6yYpccQjCREiPp+1We/CZzoowaWD+4Uai2nEeIAq+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B79021FB;
	Tue,  6 Feb 2024 16:29:40 -0800 (PST)
Received: from [192.168.42.178] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 615093F5A1;
	Tue,  6 Feb 2024 16:28:56 -0800 (PST)
Message-ID: <69512f5f-65b0-4b4f-8135-0265edd7ed5f@arm.com>
Date: Wed, 7 Feb 2024 00:28:54 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: sunxi: Add Sipeed Longan Module
 3H and Longan Pi 3H
Content-Language: en-US
To: Jisheng Zhang <jszhang@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240203122502.1259-1-jszhang@kernel.org>
 <20240203122502.1259-2-jszhang@kernel.org>
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20240203122502.1259-2-jszhang@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 03/02/2024 13:25, Jisheng Zhang wrote:
> Add name & compatible for the Sipeed Longan Module 3H and Longan PI 3H
> board.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>   Documentation/devicetree/bindings/arm/sunxi.yaml | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
> index a9d8e85565b8..a97d44ba10ac 100644
> --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> @@ -835,6 +835,12 @@ properties:
>             - const: sinlinx,sina33
>             - const: allwinner,sun8i-a33
>   
> +      - description: Sipeed Longan Pi 3H board for the Sipeed Longan Module 3H
> +        items:
> +          - const: sipeed,longan-pi-3h
> +          - const: sipeed,longan-module-3h
> +          - const: allwinner,sun50i-h618
> +
>         - description: SourceParts PopStick v1.1
>           items:
>             - const: sourceparts,popstick-v1.1
