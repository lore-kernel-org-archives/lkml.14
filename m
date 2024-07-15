Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 453A01422D1;
	Mon, 15 Jul 2024 22:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721081963; cv=none; b=aLkL38BmoIaPobImrfBGJ0tWr9JMB1kkk62TsTczSsEi8v4NVLXy0Q1628s/J630AnmQguTvmsA9TSt+pSjy7MBj7Tjs2q5ciQ/1TcWbvZxFzuHs/3a0DnleMKs/JPc6ygvXvvG+o4cSM9aW+F8V7tjqjjQNxWqvvyDOjUsM0Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721081963; c=relaxed/simple;
	bh=30lEdmX0r5J2IsDKWRgDgTaJMVtMND6C58RniTMto5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bz4gO2lOAuw/qBGf6XV668yMCTIlZM811sD+DE3eccOCKt0nen4qDwY2X7at2NTsTmj8z5aaGk3h6ZI/LEWLSJLaZRzJR1JmGJg2+fXkK0kTnlVpWqwJ5I1Vw1UDxKFnGYYJOa9HV72RafYdTeM0LfiW9qXhOer868So2bAFOb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sTU2C-0000ff-00; Tue, 16 Jul 2024 00:19:04 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 417AAC0120; Mon, 15 Jul 2024 23:48:25 +0200 (CEST)
Date: Mon, 15 Jul 2024 23:48:25 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] MIPS: Fix fallback march for SB1
Message-ID: <ZpWZKcm+IieM+eZm@alpha.franken.de>
References: <20240714-fix-flags-v1-1-63c103e73d43@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240714-fix-flags-v1-1-63c103e73d43@flygoat.com>

On Sun, Jul 14, 2024 at 10:52:57AM +0800, Jiaxun Yang wrote:
> Fallback march for SB1 should be mips64 instead of mips64r1.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202407111851.LwDasTcp-lkp@intel.com/
> Fixes: bfc0a330c1b4 ("MIPS: Fallback CPU -march flag to ISA level if unsupported")
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/mips/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/Makefile b/arch/mips/Makefile
> index 80aecba24892..5785a3d5ccfb 100644
> --- a/arch/mips/Makefile
> +++ b/arch/mips/Makefile
> @@ -170,7 +170,7 @@ cflags-$(CONFIG_CPU_NEVADA)	+= $(call cc-option,-march=rm5200,-march=mips4) \
>  			-Wa,--trap
>  cflags-$(CONFIG_CPU_RM7000)	+= $(call cc-option,-march=rm7000,-march=mips4) \
>  			-Wa,--trap
> -cflags-$(CONFIG_CPU_SB1)	+= $(call cc-option,-march=sb1,-march=mips64r1) \
> +cflags-$(CONFIG_CPU_SB1)	+= $(call cc-option,-march=sb1,-march=mips64) \
>  			-Wa,--trap
>  cflags-$(CONFIG_CPU_SB1)	+= $(call cc-option,-mno-mdmx)
>  cflags-$(CONFIG_CPU_SB1)	+= $(call cc-option,-mno-mips3d)
> 
> ---
> base-commit: 3fe121b622825ff8cc995a1e6b026181c48188db
> change-id: 20240714-fix-flags-9f8ee5d7c033

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
