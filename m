Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E9319A;
	Tue,  9 Apr 2024 00:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712622268; cv=none; b=aiOfaLc03yedtzFTkGU+W38cwxsqsd5P9hl3InodQoPJJIqrmKYnKezn2Jvkj5BevTqh9QGjpx9iP0+3R+OthD0Mgn+Saaa2jxrmruqMPNI4kQPmkQ4+xPpl1DxjgPjKRxPLlt+Kj18sRoV+SuuFGJNeEh5yQlq9/83BiW1TRm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712622268; c=relaxed/simple;
	bh=TDqjYQpAoBvvxb2GvP4NCr3jQj38qfOgENS8D5J1+hM=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=j6WWlXAo9RTkwHjWqe9UTtPbB0faoGR5YMKZ4EsMBCvk5wPPi+pg0ZT5+16eLNslVisMNqoKj4Mw/PpoqbDPuAok0tOK8WeZBI+YpdIpEVQ843sTTQPQYXY25lumOVszQQKZYU/Gy+FuE0JPMK5PrkXKBkLD2laJ6NGfAei6aRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=OiVgccSa; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="OiVgccSa"
Received: from [192.168.68.112] (ppp118-210-182-70.adl-adc-lon-bras34.tpg.internode.on.net [118.210.182.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id A5E392012B;
	Tue,  9 Apr 2024 08:24:14 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1712622257;
	bh=TDqjYQpAoBvvxb2GvP4NCr3jQj38qfOgENS8D5J1+hM=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=OiVgccSanJ+IFa3zzeSMINjq9hzETr6UDaT41Y4dk/scogRYDcAdUply26E3036Rt
	 0Wt9hLdPJPTbiMlvAZ1YphBdgEXkifqtpR5aC2P+x8E2UUCV5RFAzVVCPYiwfEM/2K
	 oPmLTU8hQcPrVjtNiqfBg4GHShfIs/LCWO9Y3Tsngh//cGU3OAAO7jAfqdtc0lHznm
	 FxuyAC/zfarqWt/6cNWWaRHuDVFiPz4Z6ZJFIwKTs8+ApTcds+cOIiEcWPSH8lC4RQ
	 A99RDm8cRZH85GrqGEd2Jekkhr3rjcn2E+E9znXYOM97nD/S7d+1su4Qp2gp09jjVl
	 ZIupyup7lZoXw==
Message-ID: <3f440c4347dd04c79969cc9fb16254146ef202b1.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 1/5] ARM: dts: aspeed: greatlakes: correct Mellanox
 multi-host property
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Tue, 09 Apr 2024 09:54:10 +0930
In-Reply-To: <20240405064624.18997-1-krzysztof.kozlowski@linaro.org>
References: <20240405064624.18997-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2024-04-05 at 08:46 +0200, Krzysztof Kozlowski wrote:
> "mlx,multi-host" is using incorrect vendor prefix and is not documented.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>=20

Thanks, I've applied these to my tree to be picked up by Joel.

Andrew
