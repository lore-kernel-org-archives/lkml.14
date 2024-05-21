Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FECB1EB40;
	Tue, 21 May 2024 20:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716322161; cv=none; b=iMYVJIr2pUwUFdpixE2QbNkvGBC4/H+e1IJ2J1BOfSrTPIeVitjTYP7/vqjtRpufzT8XovxyqZB94iGiIAMA/5eX+lVIJXLEt2/QmWpr/6mMH1T0+I50V80koy1QKRTIMGIRu6FmnNFszvS0q/Jouy1LyrAic+aADLKlEv//jnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716322161; c=relaxed/simple;
	bh=YCLaesMRPgnx2aWOX6S2yUSocPC0B/e6abnb5jWAWX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qEhtrw/yridDeZRF5edVgwugp5wndTgC4KlUKCiivbL1wy51TMH4ZJYfece3GINX4p1VnVBZpNtJpwVcahnxHA1ZUezh+13qzCJQQukj6WlOunug/JLyZfZvv6SDOUgScPgFnsQe7iuBgUUIZ4ysGuB7idP8aNdDv0wBkvyBujI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=Lcsmmyjz; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="Lcsmmyjz"
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 5A0121F92C;
	Tue, 21 May 2024 22:09:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1716322153;
	bh=YCLaesMRPgnx2aWOX6S2yUSocPC0B/e6abnb5jWAWX8=; h=From:To:Subject;
	b=LcsmmyjzgZXG+t7HZzn4eC+53qXG+3dl40qZGRZ/dXVNXu47/Cf/YA+xiegVRducl
	 MSt442z0qcX5D1fPZd3fON7JnyhjFStGjx/CZ1QGyMxxEYn53DHyOOFm8TR3eGyqru
	 AKOT8jMJplxT6rJTCfzpzCGrVUXXFmx201ZAkibN3jgHi0pYysLnMob0MmK2YE7VXx
	 9wznEEW7avj/JGL94847zdDavEfRy9SK8ey14nZYLxxB3Y+JiBkiFKdwWCPWD4QcSX
	 +M7nS2sH3OO+jAeC651ULbsDb9Dw7uTuylbnhq6ZW7xh04zg44riSv5Px6v7Ul9DtL
	 vpbuQEW+yKrwA==
Date: Tue, 21 May 2024 22:09:09 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: nm@ti.com, vigneshr@ti.com, kristo@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	danishanwar@ti.com, srk@ti.com
Subject: Re: [PATCH v2 1/3] arm64: dts: ti: k3-j784s4-main: Add PCIe nodes
Message-ID: <20240521200909.GA3707@francesco-nb>
References: <20240520101149.3243151-1-s-vadapalli@ti.com>
 <20240520101149.3243151-2-s-vadapalli@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240520101149.3243151-2-s-vadapalli@ti.com>

On Mon, May 20, 2024 at 03:41:47PM +0530, Siddharth Vadapalli wrote:
> TI's J784S4 has two instances of Gen3 x4 Lane PCIe Controllers namely
> PCIE0 and PCIE1. Add support for the Root Complex Mode of operation of
> these PCIe instances.

What about PCIE2? J784S4 has 3 PCIe instances, it would be beneficial to
add all 3, not just the first twos.

Francesco

