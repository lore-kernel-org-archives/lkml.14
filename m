Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCD92A1D8;
	Wed, 10 Apr 2024 05:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712726121; cv=none; b=USiBjLfoT+4Eaf2hgidr+ezvbcODkBcjiao5oowl++8VxQK40CrH/5MWYT5SkUbZstI927BrDooPDWaVrdPvAw++Yq8qgBsu4N0+kxUwM8Nt5ptHBIl8aGnXTN53SJMiHNLJbLHGUFUUDyRwlGzmIkLDyjEwFS1nJFnCa5fJiWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712726121; c=relaxed/simple;
	bh=R9C8kZGloRnrK7WuDh1oAE9KcOnWmUEfqZNePFGUNBM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bh0h1SHsFECi4gfxuFklpJdQ6AS2HcND/AcdZMi2FoPmH/GVRADYPD0hQeXblO7O/Op8orY6FdTYnSKqNb9bzJlH5d0KpoDAUkebsdmCDHv8oCFwDm+x4gxdZqwNvxU6BLTHjpJkGDSa2YUB3L3Zh5Bgy+bWJ+/IKPl1Xkr/TP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from ip-185-104-138-50.ptr.icomera.net ([185.104.138.50] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ruQIm-0008Ut-Ly; Wed, 10 Apr 2024 07:15:16 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Rob Herring <robh@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	David Jander <david@protonic.nl>
Subject: Re: [PATCH v2 0/2] Add Protonic MECSBC board support
Date: Wed, 10 Apr 2024 07:15:06 +0200
Message-Id: <171272604792.1867483.1217258129041362039.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240405-protonic-mecsbc-v2-0-0a6fedc78b9f@pengutronix.de>
References: <20240405-protonic-mecsbc-v2-0-0a6fedc78b9f@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 05 Apr 2024 12:14:24 +0200, Sascha Hauer wrote:
> This series adds support for the Protonic MECSBC. MECSBC is a single
> board computer for blood analysis machines from RR-Mechatronics,
> designed and manufactured by Protonic Holland, based on the Rockchip
> RK3568 SoC.
> 
> 

Applied, thanks!

[1/2] dt-bindings: arm: rockchip: Add Protonic MECSBC board
      commit: 6eb006d7c8271d4ff811b8f13b40e527d35d88e1
[2/2] arm64: dts: rockchip: add Protonic MECSBC device-tree
      commit: 6f9dfb7358535136e49d6fe9d31409f20f8cb9a7

Adjusted the node-sorting some more to honor our alphabetical
paradigm.

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
