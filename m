Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 002AC1304BD;
	Tue,  9 Apr 2024 15:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712676361; cv=none; b=Fw6ajb5oZWP3KvZfInX5qSnZLtrvoWJREh4SdnEQ0sgOSCVGs2m/h3LzAbubT5sH8OZBHhLa/EaEFUb2huD0jNHUEW8TApAQ+bho94onhqR4Vmd+z2KFRLAH5HHGKStCYvjQs0KPHH7f8N9PqMCCnxYbzrJIauujg+y2ooB5EFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712676361; c=relaxed/simple;
	bh=X2IfKt2qfJOWHO4OqiBIlMOe/82/ecVxOkQzXgLMQkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=izvDVZDQ4VXoP2StHQUT/i6HSRRp4XUcknRu5yv9UjCEUkkJ+E1S6y3nM6uAolSYpU2gnkoSLwiobmJJaPxNYL6WErABAbXKeuAM8ZjeCwtPYUm5aXWx9TBsttD175q1xK5W6wiGsD96nSbJjhBbtMgRVyNa490WRdWUMgkdyP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1ruCwh-0002sV-00; Tue, 09 Apr 2024 16:59:35 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 7DB4FC0135; Tue,  9 Apr 2024 16:59:02 +0200 (CEST)
Date: Tue, 9 Apr 2024 16:59:02 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Oleg Nesterov <oleg@redhat.com>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org, Xi Ruoyao <xry111@xry111.site>
Subject: Re: [PATCH] MIPS: scall: Save thread_info.syscall unconditionally on
 entry
Message-ID: <ZhVXtv7CX7CGm3R6@alpha.franken.de>
References: <20240328-mips_save_syscall-v1-1-9e1d62d6999d@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240328-mips_save_syscall-v1-1-9e1d62d6999d@flygoat.com>

On Thu, Mar 28, 2024 at 02:27:56PM +0000, Jiaxun Yang wrote:
> thread_info.syscall is used by syscall_get_nr to supply syscall nr
> over a thread stack frame.
> 
> Previously, thread_info.syscall is only saved at syscall_trace_enter
> when syscall tracing is enabled. However rest of the kernel code do
> expect syscall_get_nr to be available without syscall tracing. The
> previous design breaks collect_syscall.
> 
> Move saving process to syscall entry to fix it.
> 
> Reported-by: Xi Ruoyao <xry111@xry111.site>
> Link: https://github.com/util-linux/util-linux/issues/2867
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/mips/include/asm/ptrace.h |  2 +-
>  arch/mips/kernel/asm-offsets.c |  1 +
>  arch/mips/kernel/ptrace.c      | 15 ++++++---------
>  arch/mips/kernel/scall32-o32.S | 23 +++++++++++++----------
>  arch/mips/kernel/scall64-n32.S |  3 ++-
>  arch/mips/kernel/scall64-n64.S |  3 ++-
>  arch/mips/kernel/scall64-o32.S | 33 +++++++++++++++++----------------
>  7 files changed, 42 insertions(+), 38 deletions(-)

applied to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
