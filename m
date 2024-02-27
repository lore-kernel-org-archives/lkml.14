Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DF847F6B;
	Tue, 27 Feb 2024 03:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709005687; cv=none; b=fYnShFLUkDD10/KrHfIzDWjSCZp4L57jA13c7RIAj7eRkouXQ9X2sJBDs79D6ODI9fnSgSnGzNQx9KPxqHXyrIlFkKct3sKBl0YH2bfljsqlWnFfhTAW+5qXR84J6I713BUTramlJemjpuq9KX1cXMyBOCAQrqsg76XIH9e8VMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709005687; c=relaxed/simple;
	bh=cacPr0MTI+JRhwGO7IhtItFnmCOQ/pFvWBmqEdFSIrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lwESx6drsGSSgRP008pfhsZhIxoJaH2dVUQdqIchU5+P41tdfoNkGfnifQTicfoXzGykn+MXoM7f6EFLKwqEC80yasvCxesVRRmVzuIAn93PYsCwLd5MQAjh/FePOgQB5jyW6qOc9yzEqQcqiG0DwMemw6OoQ82/BaMq8JRFU2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=il0vU8pc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="il0vU8pc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15E6CC433F1;
	Tue, 27 Feb 2024 03:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709005687;
	bh=cacPr0MTI+JRhwGO7IhtItFnmCOQ/pFvWBmqEdFSIrg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=il0vU8pcT34LDlVUSe8PpUFbGc+h4cI18CsjC2ddRGTysQwMOVvDmceAJ20LQrcy7
	 kbUl0wQEACpsGa2uREplW8+oHy8X8UBHIlK7g7Ws+GPZr5JD4v/iZyeX7M+tY3LKQQ
	 aLqtlXszzC3X4d1LxzsUUNFzimGrsFIhqFLwcKLKUdb4/Arfi8MSHGoG7CzSeH7gRf
	 +SnhFyMaw8velddfAJGxIveUqg8JpdyQNMmsP3Ne8xGLGOks+gzIicPcMb+nmn6rwd
	 kION2WkyBxmch0+CT+WIcFMHMXOerqCUxr3g6CSe0jTYpe4gPJ95tOT8Jef//C7ehB
	 z9gsPP4kg4UWA==
Date: Mon, 26 Feb 2024 21:48:05 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH net-next] dt-bindings: net: ethernet-controller: drop
 redundant type from label
Message-ID: <170900568440.2662928.16266010667249541759.robh@kernel.org>
References: <20240226122913.87669-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240226122913.87669-1-krzysztof.kozlowski@linaro.org>


On Mon, 26 Feb 2024 13:29:13 +0100, Krzysztof Kozlowski wrote:
> dtschema defines label as string, so $ref in other bindings is
> redundant.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/net/ethernet-controller.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

