Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66449823CC
	for <linux-kernel@vger.kernel.org>; Fri, 19 Apr 2024 11:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713525550; cv=none; b=K9BDjcq4SG5KBGcFT0W2awk+0n5Lfh1wlOYQ+fPF0y//PAwGxoNPXp/5WtVoBloaXdAWtbMbIAwOnR6U8dgMjrxbpRqRMf1EOuuz1SHot3IdmqW8ZfGjqVOqQH2/P3oYuQDX81ku5HoSre1JXCLc0dIx4STJPCpgkDcnnLZVah8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713525550; c=relaxed/simple;
	bh=0hFHJBp4ygPcMsTIzHGAhFHU2mVFmahzabjEHWqGMoo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n9l1nYSqfJDBP6dLgYlQsWYMAEFwKv8ABoy2pXQUAaiAOBxZ1PdmayrVPGvm5xfcRsP/4nAdb8bPScQ/3jRyPsms5EtFvO83gR/kMVYmn23jy4iN2QinL5vxGIrn5bA0wlPu+pv7Kim5I9do0G0CwUKQIzntyZ/wTXRDPiFHzOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from [213.70.33.226] (helo=phil.intern)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1rxmGi-0000RL-Sk; Fri, 19 Apr 2024 13:19:01 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>,
	dri-devel@lists.freedesktop.org,
	tzimmermann@suse.de,
	mripard@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] drm/rockchip: lvds: Remove include of drm_dp_helper.h
Date: Fri, 19 Apr 2024 13:18:55 +0200
Message-Id: <171352551023.2525344.5911304759929385224.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240414120841.837661-1-andyshrk@163.com>
References: <20240414120841.837661-1-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sun, 14 Apr 2024 20:08:41 +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> drm_dp_helper.h is not used by lvds driver
> 
> 

Applied, thanks!

[1/1] drm/rockchip: lvds: Remove include of drm_dp_helper.h
      commit: 685ba01ebedb8f87673f587f540ba84c444442d4

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
