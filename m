Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E32A79DB8;
	Fri,  2 Feb 2024 11:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706873883; cv=none; b=rwV0w816rRFE5i+eadzcdd1SFSCfrP9xfjJqJujR1e3qafTobBx+eOL6eOoh6jkL7VqfQ+Jf+MrbJ/JAp6Xzkc6etu/KJJAKrAXFNPZg8Ne22/1KarUxE8Wel5l9H5Ub5OoSinze2p2WBHesJ+wZq4DtXYYxQIF+MAbckfgMe0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706873883; c=relaxed/simple;
	bh=p5lXBrTHJqQYc6rYWZj48xlKqjP4sLrBohNcmDgpqvg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q4KcWzPmKzDdEdEHnBHtyWXs9y9vKLdaXWRhkdzfDpHfXrgRMskJlVWeC6DRoc4OjhrWu4gFUX8fVNv+j/yH+tFikTTDjzTRzXzqQaTxbvqFiwvl2wfV48YT4eY8H63doFidKK0GsZ1MhBcZ7muImGH2DegzfheyPSMMxCdWF68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WhSeQjr3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WhSeQjr3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC355C433F1;
	Fri,  2 Feb 2024 11:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706873882;
	bh=p5lXBrTHJqQYc6rYWZj48xlKqjP4sLrBohNcmDgpqvg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WhSeQjr3l/GbnCW9pTnVmhXQjQfBKb9n+fzZSjXV3RJXg0fFVMZAr9bR06bZ0bFAa
	 5G1tAArTjA0PcO3TQAKYElQCTLEQ8Jdy/DfcVfEqa/curg80oW/vpxvft7UjDExF/I
	 +MoyMvv3iAI6kh5o6ebkn8RQzA15nXJtLqr1jx9tiGyXo/M5SSjoCEqCZykmhUtV84
	 BaCbM9pfOIEzJVycbI3OMBAuyecMuewd3Zn+MajENWJ1ijydu0wTZzp55G304skt8T
	 KKWTofvYQ8Asnfq6lLZQ+nLCQrWBklX2Eg3U7SsB+EZiLsnfxsTVKBT4OWUV0pHT3s
	 N9LkvVBv9cstg==
Message-ID: <fb8ea6c6-609a-4a0d-ae7b-06b8500bd978@kernel.org>
Date: Fri, 2 Feb 2024 13:37:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] phy: cadence-torrent: Add PCIe(100MHz) +
 USXGMII(156.25MHz) multilink configuration
Content-Language: en-US
To: Swapnil Jakhade <sjakhade@cadence.com>, vkoul@kernel.org,
 kishon@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: mparab@cadence.com, s-vadapalli@ti.com
References: <20240104133013.2911035-1-sjakhade@cadence.com>
 <20240104133013.2911035-3-sjakhade@cadence.com>
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20240104133013.2911035-3-sjakhade@cadence.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 04/01/2024 15:30, Swapnil Jakhade wrote:
> Torrent PHY can have separate input reference clocks for PLL0 and PLL1.
> Add support for dual reference clock multilink configurations.
> 
> Add register sequences for PCIe(100MHz) + USXGMII(156.25MHz) multilink
> configuration. PCIe uses PLL0 and USXGMII uses PLL1.
> 
> Signed-off-by: Swapnil Jakhade <sjakhade@cadence.com>

Reviewed-by: Roger Quadros <rogerq@kernel.org>
