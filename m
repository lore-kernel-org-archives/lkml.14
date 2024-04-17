Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD191651BD;
	Wed, 17 Apr 2024 21:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713389091; cv=none; b=svnOMDyXQ60nXxc7aFvVHgLE1chhvub7nfiwCelDA9XtGQ+fKImhRxH0FmLyOZjWjWBKYax/mrdViQSCw9PU4mSE+TLDHu2+pqRZcstVErkH4BJ1/Wq4aNksolfGAAzdK4uRf+crTG4I0ubGCVMC27lBv09wvRRyfhG0RDbhano=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713389091; c=relaxed/simple;
	bh=6nk5yJ4aUQQGSz71dMXHhHoWmkitQvJujyBqACR/ULc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r1wgxsu/TP6wrWxQosKouRhpxaxAwgFVOM1g94YInhhQzLBaAPJuUHkhyXNNiUFlJ7eFvHQsOPtagLqQn1pmoTVGOoFcOw18dyhczC9Gy+DEGGWMUKDcJhOX+c03riWDTX+ejxvngPZfWeICIaxLqn7PFitgBa8WBM7B5yYy8bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i5e861917.versanet.de ([94.134.25.23] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1rxCll-0007Yy-5m; Wed, 17 Apr 2024 23:24:41 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: helios4: Fix USB interface compatible string
Date: Wed, 17 Apr 2024 23:24:35 +0200
Message-Id: <171338906384.2268267.9580227847147102869.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240412204405.3703638-1-robh@kernel.org>
References: <20240412204405.3703638-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 12 Apr 2024 15:44:04 -0500, Rob Herring wrote:
> The correct compatible string for a USB interface node begins with
> "usbif", not "usb". Fix the Rockchip RK3399 based Kobol Helios64 board.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: helios4: Fix USB interface compatible string
      commit: 93b36e1d3748c352a70c69aa378715e6572e51d1

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
