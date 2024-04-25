Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C28314A0A0
	for <linux-kernel@vger.kernel.org>; Thu, 25 Apr 2024 14:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714056735; cv=none; b=XKWX1Fd/ffZJLFrhI/jkr67gD3FYsR0Ye6Mtek8qDNRxzLvSyRXKZ602o2CPb35zKBzhrQNllaXPty7qWh4FPPa1jWibnmZeXAVVrt3rR9VTUO0N7VRDxEW9Al3zf9aEJjHdoqOKJgcKxv5EPvGhFkiIs5ALcYVyua22CVn/G1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714056735; c=relaxed/simple;
	bh=/u3wbgA1QdA2taGLlOkOU3G7ijCZqN/Hs58MIzdcL/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TpbIh63/2WgGAKad8facqKDsZGtjgY8AnW9//KjHcpxXSb2hO2d5zPgpWbiyaBVwuXqBbKqlXRGHRdNfWq2mmMsH8lfBK3QctmlEX7IdmpSbHBnzzMI9/WxiPTZqgz/WSeIr4fP4z6Dec2Zy1pzqHBlnKO0r1C6M22xf/ROmCT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i5e861d82.versanet.de ([94.134.29.130] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1s00S1-0003Vg-2q; Thu, 25 Apr 2024 16:51:53 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: tzimmermann@suse.de, mripard@kernel.org, hjc@rock-chips.com,
 s.hauer@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH 1/1] drm/rockchip: vop2: Fix the port mux of VP2
Date: Thu, 25 Apr 2024 16:51:52 +0200
Message-ID: <3237003.e9J7NaK4W3@diego>
In-Reply-To: <20240422101905.32703-2-andyshrk@163.com>
References:
 <20240422101905.32703-1-andyshrk@163.com>
 <20240422101905.32703-2-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Montag, 22. April 2024, 12:19:05 CEST schrieb Andy Yan:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> The port mux of VP2 should be RK3568_OVL_PORT_SET__PORT2_MUX.
> 
> Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver")
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

on a rk3588 with VP3 connected to a DSI display
Tested-by: Heiko Stuebner <heiko@sntech.de>



