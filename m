Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D591153E35;
	Mon,  1 Apr 2024 21:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712008546; cv=none; b=uDjUrwwzP2C+8NIOYaLsBvTc/LI0uj1+128ZlF4dSBoOd1NeORAerSvCvaBvDCzyxLm/g5bg4A2awdOL4K4kVn3O/HGBEWpcXmoC6uk6asoXdEWRHK2wLHjVsBXUXqvt3ov2YspAc6XGpAr1NDpVt2f9ffm4WX/oR9S+Lqla45Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712008546; c=relaxed/simple;
	bh=LTftMlGxCD8/c1Ci2D5IeJwheFCcyUEqDSnN2mUJtDw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q4rgCiHQHyrlSZhXsJ1Cqs3AnZ6II+DB0zoa2lfvpYTBndow4DqpCnfOr/Hca6kHQe0Np4E06JgqxgipS/U0KrI3F0PifSQphXzaMZGvSfKNjhuaoG0DWN9b6AVNvx24BvUJFEi62KVDj7NHHp5cz6TvY3p4aYvp2hPVRgbj0vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i53875aaf.versanet.de ([83.135.90.175] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1rrPcu-0008FL-2Q; Mon, 01 Apr 2024 23:55:36 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Cc: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] arm64: dts: rockchip: drop panel port unit address in GRU Scarlet
Date: Mon,  1 Apr 2024 23:55:32 +0200
Message-Id: <171200852039.1394042.12669558185744659181.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240401140939.97808-1-krzk@kernel.org>
References: <20240401140939.97808-1-krzk@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 1 Apr 2024 16:09:39 +0200, Krzysztof Kozlowski wrote:
> Panel port does not have "reg", thus it should not have unit address, as
> reported by dtc W=1 warning:
> 
>   rk3399-gru-scarlet.dtsi:666.32-668.7: Warning (unit_address_vs_reg): /dsi@ff960000/panel@0/ports/port@1/endpoint@1: node has a unit name, but no reg or ranges property
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: drop panel port unit address in GRU Scarlet
      commit: 4ddc13461740308d3133c2defda97d9e3a30ede8

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
