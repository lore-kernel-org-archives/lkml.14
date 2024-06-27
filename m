Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7364436C;
	Thu, 27 Jun 2024 19:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719516466; cv=none; b=RuWhZ8zb0mPFSLrpd9PxiL6KEPlQaFf4pQZr+Ni6o/q9JJt4xL1459X+kQ0IPyHEMbZUzvSzzC6N7EirQuO7k6WsAobHnlqLDOLnvOTMf07zyOdZRx8s3+oGotEmcVqxYNMsFE2JfFj+Vcob6mIyZfS7/OKtZbBINZA0bOE9jAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719516466; c=relaxed/simple;
	bh=+7gU5uk7EEkjDmCtEETo5hhP65fvh6Cf2cNQJ5yFuS4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nykgbRqpBsnx4DsSDQ1xPZ2H6Tq2IZSxu5GSoJBu1QTJP1k5HrZrg/w//lKiChLvnYsLXENrMQkCbY4IlKyFQ6mQfz2yfcqWFgg6gTvgTxftGa5Qdm9C+KZnC90wDszap1P1EYoJlGbNn27yJfbi6Oiwm2fN2m+ypU5hu7sdnbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i53875b6a.versanet.de ([83.135.91.106] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sMumL-0000wK-Jz; Thu, 27 Jun 2024 21:27:33 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Johan Jonker <jbx6244@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1] ARM: dts: rockchip: rk3036: add #sound-dai-cells to hdmi node
Date: Thu, 27 Jun 2024 21:27:28 +0200
Message-Id: <171951643515.1057727.8654296483792075000.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <55d302e5-c018-4b93-84c1-8cf75162e939@gmail.com>
References: <55d302e5-c018-4b93-84c1-8cf75162e939@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 24 Jun 2024 19:43:29 +0200, Johan Jonker wrote:
> '#sound-dai-cells' is required to properly interpret
> the list of DAI specified in the 'sound-dai' property,
> so add them to the 'hdmi' node for 'rk3036.dtsi'.
> 
> 

Applied, thanks!

[1/1] ARM: dts: rockchip: rk3036: add #sound-dai-cells to hdmi node
      commit: d45db4fcd3ae0d13191c8db00583f0bc49d9795d

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
