Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D00E2572;
	Tue, 25 Jun 2024 07:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719301973; cv=none; b=J/wtlfYnZ0Od2Uwf29RzeZzyantwDJhUquwPm1bbBKonxg/AKiR9/rHzPXgu12mgWVk9X+ceFtypHQbcDlS2hHKAe8lHwzQtn+/9hjK/9rgJSbXaLd2oKgNUpFRjlGOEnvPzNc+WLXZBos96H6zlPQS2YLSULcIdK+FdudD2aWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719301973; c=relaxed/simple;
	bh=HFgAjZWqiyi4C7kDX2nR+Sgot40grFfg5AcgbFpGZ5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mtV3Anx55auXCRV7gbCOd+wn4/p6lAOAx4/TZqic8xnmNv2HWRhbzwABomD44c+hHBl0mJLcI48vmNgNGwMrIssZlYb8euNfa6dENMJK1DUradBd9dD1rS2e73ZqqZg1A4Sgh+Z8ohwC9jtquVelIRsMn4bemxX4lhuHfTPqB1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sM0yX-0007Cc-00; Tue, 25 Jun 2024 09:52:25 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 6682EC0120; Tue, 25 Jun 2024 09:46:34 +0200 (CEST)
Date: Tue, 25 Jun 2024 09:46:34 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Shiji Yang <yangshiji66@outlook.com>
Cc: linux-mips@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Khalid Aziz <khalid@gonehiking.org>, Baoquan He <bhe@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Serge Semin <fancer.lancer@gmail.com>, linux-kernel@vger.kernel.org,
	Mieczyslaw Nalewaj <namiltd@yahoo.com>
Subject: Re: [PATCH V2] mips: kernel: fix detect_memory_region() function
Message-ID: <Znp12j23mf1bUEqp@alpha.franken.de>
References: <TYCP286MB089598ABD1E2F66003D71EB8BCD52@TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYCP286MB089598ABD1E2F66003D71EB8BCD52@TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM>

On Tue, Jun 25, 2024 at 09:44:44AM +0800, Shiji Yang wrote:
>  	for (size = sz_min; size < sz_max; size <<= 1) {
> -		if (!memcmp(dm, dm + size, sizeof(detect_magic)))
> -			break;
> +		__raw_writel(MIPS_MEM_TEST_PATTERN, dm);
> +		if (__raw_readl(dm) == __raw_readl(dm + size)) {
> +			__raw_writel(~MIPS_MEM_TEST_PATTERN, dm);
> +			if (__raw_readl(dm) == __raw_readl(dm + size))
> +				break;
> +		}

you are testing memory, so just use pointers. __raw_readl and __raw_writel
are for io regions (which should be ioremppaed before usage).

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
