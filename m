Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FF415A861;
	Wed, 29 May 2024 00:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716944324; cv=none; b=KRUyn0MpIgT2FcxLtDfvGxPriOGTfF2kr7Vu+ffd6IgaZ/AHANF5JVgEFk1nsDcKqUwJ6dZ/UGs5JmUqtZ36cloXizWEuMm1udOhBlxW6h8pmbgJjFAIqV1SncQysGiwxd/Yw+X0Qw/6D/2SM9XV+DOj9wXmv5DTyPdZCrDCOW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716944324; c=relaxed/simple;
	bh=Y5g11ZHjkDVjwkyLR3nt2hLItxoUwHvVSL8EOlmqydM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pi/sJeag8RGZv6kXBfIDH2Ql3AZNlqtfRiySw7WB+e/waLGRW6/H9M59leh9DXLGTBwgdXCa2+XJwHSKdj9ueZx6+OCZkVfXZK53FQymZ8yF1+jZqwKAb23D+Xs1ABeoUNNnq5V71U96lO+a0FfSEqsdnED1coH419vt/Y4tTag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=nSgnyFf0; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="nSgnyFf0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=HJR037dCjkOOk9KLg5+cP/Pzw64he4DHk0kgvVr60vs=; b=nSgnyFf0l+rWuWA4FpW2E1Gz1T
	mCXElTmG1ra2Ewsaym7BgzTH0eIyDz7dQhuOlcBMmHC5lR9Je6ppyLRpNxqF9Ziv9V2pYM8V2ECJg
	NSQuRqAwMG5ka9QnqOjj/Bv0yJrWdNymX/M5vXmbBImuZdMCwkMR2+gUU7iNx3rTHB4g=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sC7eC-00GCiA-61; Wed, 29 May 2024 02:58:32 +0200
Date: Wed, 29 May 2024 02:58:32 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Tristram.Ha@microchip.com
Cc: Woojung Huh <woojung.huh@microchip.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	UNGLinuxDriver@microchip.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: dsa: microchip: fix RGMII error in KSZ DSA
 driver
Message-ID: <c4741cab-993d-41c6-9402-aa6c32d72930@lunn.ch>
References: <1716932066-3342-1-git-send-email-Tristram.Ha@microchip.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1716932066-3342-1-git-send-email-Tristram.Ha@microchip.com>

On Tue, May 28, 2024 at 02:34:26PM -0700, Tristram.Ha@microchip.com wrote:
> From: Tristram Ha <tristram.ha@microchip.com>
> 
> The driver should return RMII interface when XMII is running in RMII mode.
> 
> Fixes: 0ab7f6bf1675 ("net: dsa: microchip: ksz9477: use common xmii function")
> Signed-off-by: Tristram Ha <tristram.ha@microchip.com>
> Acked-by: Arun Ramadoss <arun.ramadoss@microchip.com>
> Acked-by: Jerry Ray <jerry.ray@microchip.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
