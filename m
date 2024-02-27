Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C5414198B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Feb 2024 13:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709041495; cv=none; b=q733cj5ZScun39MPTNqGX1JIKSnBGkU4wk2WTpju8ITSeUc39HYMGyBSn+vSgod2a+myo3w5GrZ1sYE5Xgrq73OW9zII9itRl9mcJR34HyhS7XkfrWPgZbJNww7eOcW/EjXa2taBJBhQBmcLTi7XiWGri54/7zCZxLG0xTi2T1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709041495; c=relaxed/simple;
	bh=1y5hUASkrelvziKrhMhKIrFjIbkuNvj4l5OjXLc8gsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JYB843XTN2ni/Ixe6ZqZaTmow6tq2cT1PT0+6pJDFMBK0UzvbIQkMC51t3crZ+sgFDPXxLkNHtVC5KQhqQ3vo21cNnTe9dpcarbN86e8674pnf6t3aiMTkJzQy/BWHkw8c+9QpjNrJ9TU9J9NzOEPJnRWTEQxfGolglNWVYtDdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7D8FC43390;
	Tue, 27 Feb 2024 13:44:53 +0000 (UTC)
Date: Tue, 27 Feb 2024 13:44:51 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Arnd Bergmann <arnd@kernel.org>, Kees Cook <keescook@chromium.org>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	Linux Kernel Functional Testing <lkft@linaro.org>
Subject: Re: [PATCH] vdso/datapage: Quick fix - use asm/page-def.h for ARM64
Message-ID: <Zd3nU4IbF0yYREt4@arm.com>
References: <20240226175023.56679-1-anna-maria@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240226175023.56679-1-anna-maria@linutronix.de>

On Mon, Feb 26, 2024 at 06:50:23PM +0100, Anna-Maria Behnsen wrote:
> diff --git a/include/vdso/datapage.h b/include/vdso/datapage.h
> index 7ba44379a095..5d5c0b8efff2 100644
> --- a/include/vdso/datapage.h
> +++ b/include/vdso/datapage.h
> @@ -19,7 +19,11 @@
>  #include <vdso/time32.h>
>  #include <vdso/time64.h>
>  
> +#ifdef CONFIG_ARM64
> +#include <asm/page-def.h>
> +#else
>  #include <asm/page.h>
> +#endif

I'm not a fan of guarding includes but I guess this would do until we
merge Arnd's clean-up patches. FWIW:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
