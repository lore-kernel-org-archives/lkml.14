Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3319F8F6F;
	Mon,  1 Apr 2024 22:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712011578; cv=none; b=C6XIsO7gr/9MKEBtKsZlYzCwC7G1mxTtILOSD12gIqQe3o1koSrD4nLGR1jKifpqj82DE3/C0SuKN7zoch8f0/8m5LAhqjuxlska3AicOtyGQFg1HwoUYUmmMjW05AC10+zly1yqbwpPUvolSl4Tovo16Dos48h/vXMotXVrGA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712011578; c=relaxed/simple;
	bh=MrqDEBWd02lqgWk3/WZxrIvL1NUSLhf9sen0+aK8Ep0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IT2d8nVBChFJWQZq3EpnnK6A1AEsXu7nUDuZ0Frv4dzbKeXDLnsBPjmYw8epusWrnRYAPep51xVeKql8SZUqQAwt1ztQgR1KiGhNMwPCZy/2IF1/kD5R1akWpMHGplArRuwyp3UapiXJuUxPes82dZo0v2oZx7JFGqE04B/0vNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FdxgnI/E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FdxgnI/E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F33AC433C7;
	Mon,  1 Apr 2024 22:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712011577;
	bh=MrqDEBWd02lqgWk3/WZxrIvL1NUSLhf9sen0+aK8Ep0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FdxgnI/EQRF3OkVOJr2BV1d7PO40Xjsp4dc8yFm0TUzacg4wjaCpfL7NVYcBnB4iz
	 FP7pvQ8R0XgZ5X9weu/oNu6Jjv3q+lvZwBW80U5lwYBcNbksKHzFihO4WGlLihApqg
	 B0FcQBVAHvnblnIGaA6CEmNRBNPtIXRJQXg5oBDfqA4avqvIC15ksG4Iy5C3GfKyb2
	 yDZaKeIIrbDyDbA2Ca1g5xdeaCejIojWmCQVIC4T7/jk9cICF3KTZwhOfwtBc3ZX7S
	 78SDurcdLp6+k7ur4/OkmNdORIsdTb9/sNCL0JO7Eu0mR10hZSVmMr/xXEjAZmOhb8
	 bX26Ipp+ELbUA==
Date: Tue, 2 Apr 2024 00:46:15 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: kernel test robot <oliver.sang@intel.com>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>, ying.huang@intel.com,
	feng.tang@intel.com, fengwei.yin@intel.com
Subject: Re: [linus:master] [timers]  7ee9887703:
  stress-ng.uprobe.ops_per_sec -17.1% regression
Message-ID: <Zgs5NxoUUoGIkuQO@pavilion.home>
References: <202403271623.f0b40181-oliver.sang@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202403271623.f0b40181-oliver.sang@intel.com>

Le Wed, Mar 27, 2024 at 04:39:17PM +0800, kernel test robot a écrit :
> 
> 
> Hello,
> 
> 
> we reported
> "[tip:timers/core] [timers]  7ee9887703:  netperf.Throughput_Mbps -1.2% regression"
> in
> https://lore.kernel.org/all/202403011511.24defbbd-oliver.sang@intel.com/
> 
> now we noticed this commit is in mainline and we captured further results.
> 
> still include netperf results for complete. below details FYI.
> 
> 
> kernel test robot noticed a -17.1% regression of stress-ng.uprobe.ops_per_sec
> on:

The good news is that I can reproduce.
It has made me spot something already:

   https://lore.kernel.org/lkml/ZgsynV536q1L17IS@pavilion.home/T/#m28c37a943fdbcbadf0332cf9c32c350c74c403b0

But that's not enough to fix the regression. Investigation continues...

Thanks.
