Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC5754664
	for <linux-kernel@vger.kernel.org>; Tue, 27 Feb 2024 22:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709073483; cv=none; b=pvLiax0BgKePdFwC/2Xi7ghpvP8pe8diExO0hcuk4vPC/Af+OZcWt3ZrkNkkvt2ZV2fClcrFQVjXJucYfVM2OL6tiE4E0LzhraadT8TzBzZhqiVY8zyN6H60cMoeGAT2naR7nH3uDXGwlaw5PUsulKGqwLyOHQhFLzEHDZbwv7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709073483; c=relaxed/simple;
	bh=XsHRzTCykweE3aMEo/2Ajb738ntrdMof1ujAQ6dpnaU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KT7Argp6vlAwxEqfZerzlmvKeBwZn2yJWkLfw95oND58m+VmxJJg9z1kk0YENmEV6V30lzYjvFxyq4rkXR6/xymTSwlSZj75VLbcy1Az+HaPjJSZd/NAqLxrr9OFYu3dh/sQ2Zb5WSB6Ex/20VolkvvuUYQmael4kZ2C+/iEiLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i53875b6c.versanet.de ([83.135.91.108] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1rf655-0001zj-Lc; Tue, 27 Feb 2024 23:37:47 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] arm64: defconfig: Enable Rockchip HDMI/eDP Combo PHY
Date: Tue, 27 Feb 2024 23:37:45 +0100
Message-Id: <170907346109.770500.16742913187559024297.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240219203725.283532-1-cristian.ciocaltea@collabora.com>
References: <20240219203725.283532-1-cristian.ciocaltea@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 19 Feb 2024 22:37:24 +0200, Cristian Ciocaltea wrote:
> Enable support for the Rockchip HDMI/eDP Combo PHY, which is based on a
> Samsung IP block. This is used by the RK3588 SoC family.
> 
> 

Applied, thanks!

[1/1] arm64: defconfig: Enable Rockchip HDMI/eDP Combo PHY
      commit: 23ed255e74317b10b41b396d4af5b79b47b28c22

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
