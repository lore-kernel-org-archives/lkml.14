Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6408F3A1A3;
	Mon, 22 Jan 2024 10:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705918585; cv=none; b=S3/zBe1OVTZ/WAu0YqfxeH41Exkqw6dFS34FhRoUKyo6axf5xokS4tpY5TM+hnxutus2niTrHR3MKDKNOSwCHrhr6bTeDscNGm5bn8QioM5jTWzpog4EivHONZVlnO5g6HrR0PPyab7iKefmWTz327+HTy3COHiaD9+5W4Z6rEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705918585; c=relaxed/simple;
	bh=P8/Ubm/1PBIHe3pGHIlv2TBxqViTD4v2CslJiEztukw=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wo9TzS6/2I49gpi5DxQD5RBJKA1pBiW6/NgJA4mK+ZpylLsAsxnzhKfpYjDuM+Xm9MlUYSmKSNSpZnUHRs/YTrBxombpdMyCIKttFWqq7CrKGa9TKLP2wWL3FJKDs2MUWAejoh/kE+ukifftKqVVvqLcdkQAVNhtBg/Gs/mt0+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1rRrLi-0000Sg-00; Mon, 22 Jan 2024 11:16:14 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id BDD36C0671; Mon, 22 Jan 2024 11:15:38 +0100 (CET)
Date: Mon, 22 Jan 2024 11:15:38 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: sgi-ip32: Fix missing prototypes
Message-ID: <Za5ASnKPMNE6Dhle@alpha.franken.de>
References: <20240119135252.112460-1-tsbogend@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240119135252.112460-1-tsbogend@alpha.franken.de>

On Fri, Jan 19, 2024 at 02:52:51PM +0100, Thomas Bogendoerfer wrote:
> Fix interrupt function prototypes, move all prototypes into a new
> file ip32-common.h and include it where needed.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  arch/mips/sgi-ip32/crime.c       |  6 ++++--
>  arch/mips/sgi-ip32/ip32-berr.c   |  2 ++
>  arch/mips/sgi-ip32/ip32-common.h | 15 +++++++++++++++
>  arch/mips/sgi-ip32/ip32-irq.c    |  6 ++----
>  arch/mips/sgi-ip32/ip32-memory.c |  1 +
>  arch/mips/sgi-ip32/ip32-reset.c  |  2 ++
>  arch/mips/sgi-ip32/ip32-setup.c  |  3 +--
>  7 files changed, 27 insertions(+), 8 deletions(-)
>  create mode 100644 arch/mips/sgi-ip32/ip32-common.h

applied to mips-fixes

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
