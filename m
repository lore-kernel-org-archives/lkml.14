Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FF09482D8;
	Wed, 10 Jul 2024 03:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720580652; cv=none; b=oJU/G7XsMIMKIadiawRsmeWITx3PsJpe6bar20GEei0bZ35yktJcn3Y4FXSjYbqIycSZTli+C28NCBwXvUvoF3i2PZvZkjfR8OtQA7JkbFNFutvGUwacncYrCiVdYqWxLOoSaxYqkp2ZdEQbo028JDBfz0B1srz4aG9+CLBicD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720580652; c=relaxed/simple;
	bh=mzB2pR72KMygmv8qJ1h/AzV0GyJz5bsjmqe+iGfGSdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S0MctG/cSXdoZ1QQMw9Nu9MLr8zEIwQsplBScunfuRsX2/GfiIyKG9Kho8EQfWNPv77y/t3SD5WZ7KKOPrQ/KA08qlj6SZaTk7yLFrSGsLoF8R7j5tCZYbvtISqL7lymF8zD21tGPhFc85keny1SUOcH5qlaX+VZHxYxk5QWiWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=HRhv7ptD; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="HRhv7ptD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=yYtU1h1eDFudRupuFjOmskdIRg/MaZB4WUfDNPnHm4U=;
	b=HRhv7ptD6fO4Nz6uzsXGaCdpdM6+xJE9ru6t4KQORSTA1Aa3caWMNkbQ0DwQw6
	Ga4IxOvHMWK7bVxwshI+7CG4Tke7lFujMFeIJ6Mb/j7TSEjOLAWkIWbX8Srr2BYr
	kRIqIJOnZDUy16utzMXenXfVZQIxyeJQyWkJNjDGjyrg8=
Received: from dragon (unknown [117.62.10.72])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDnjz6W8o1mWkWBAA--.32164S3;
	Wed, 10 Jul 2024 10:31:52 +0800 (CST)
Date: Wed, 10 Jul 2024 10:31:50 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Shawn Guo <shawnguo@kernel.org>, Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>, Fabio Estevam <festevam@denx.de>,
	ARM <linux-arm-kernel@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the imx-mxs tree
Message-ID: <Zo3yljWDKlIT1TCU@dragon>
References: <20240710115319.10dae8e2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240710115319.10dae8e2@canb.auug.org.au>
X-CM-TRANSID:Mc8vCgDnjz6W8o1mWkWBAA--.32164S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUwT5lDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCRgYZWZv-fryrAAAs8

On Wed, Jul 10, 2024 at 11:53:19AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in the arm-soc tree as a different commit
> (but the same patch):
> 
>   3898bc187cde ("arm64: defconfig: Enable the IWLWIFI driver")
> 
> This is commit
> 
>   465830ad2534 ("arm64: defconfig: Enable the IWLWIFI driver")
> 
> in the arm-soc tree.

Thanks for reporting!  It happened because of that my for-next branch is
outdated.  I just updated it.

Shawn

