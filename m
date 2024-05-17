Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32F46A039;
	Fri, 17 May 2024 14:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715957818; cv=none; b=DHvrP93KRSGFcdvFN8e4tMPrmrpPk9jkEbgjsyo8jP5uxGVMO8BaWrHzYhXkIzqz0Od4biGcmxw49u6dz+wkTyHKa0sKnekxY1lmHMtX5QEZou6iKeEy3KfL7VAKMVq5x3Y25HH/NCAiOTZhzcF61ygL7X4pOt6/nbEs43un0mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715957818; c=relaxed/simple;
	bh=1Kum9s/qcn+wubjO21I7J9v5LTOxH669/VPueehgn5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pDARlEXLawKm6oyPkGz3vWmPwyiLY5FLtnYHp71gkRjcwla3CMFscrZLaKnaG3bVRrqI0XNMrpyjYQDMvKR0jSqkpJQ9YHLijRQgcHXhfSn/EupWh6gr18v6lxuE3u+Ppimo5EYDW3wRfQu4kwzhrepClqLsGdSE0lgFc2X9sZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b/MRmppd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b/MRmppd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9741AC2BD10;
	Fri, 17 May 2024 14:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715957818;
	bh=1Kum9s/qcn+wubjO21I7J9v5LTOxH669/VPueehgn5E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b/MRmppdsIlCxTXjEi6IdEW4AIyJmyyy+0yOtNUBOKlXVCGR/m4Om2M9BVA/Ue3Qu
	 HDDf13nPMmN32nR8HB4hxcegaHlV+W8EsIabjByaui5fZ+DEnswRc56Wlt5fNaFvAH
	 kgTqDtfg9zbMlOWWTLBNqs8KsKSFjyWTLB8FtuCAspKUQfE1NDpyTakgH01RpwsKsj
	 MExDYPw1bLUqZ8xmuWtECaX7TvJvu6Ln/FcuNRstxe06Ol5ZyxywOovTMlu1MMp6QP
	 nju1HPtica2R1dfPof3ZY9ZsBUNhST+kygK+GkHD//3FEAYMiSArdPbZvWx2R1Xnka
	 KxPBCWLPvdutQ==
Date: Fri, 17 May 2024 07:56:55 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
	clang-built-linux <llvm@lists.linux.dev>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Anders Roxell <anders.roxell@linaro.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Borislav Petkov <bp@suse.de>, Borislav Petkov <bp@alien8.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: Re: clang: arch/x86/boot/printf.c:257:3: error: unannotated
 fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
Message-ID: <20240517145655.GA3660288@thelio-3990X>
References: <CA+G9fYuyPFBVyqqg0RVhaz4c0S+H4TMm1apxgwyTUOkge9NY7A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYuyPFBVyqqg0RVhaz4c0S+H4TMm1apxgwyTUOkge9NY7A@mail.gmail.com>

Hi Naresh,

On Fri, May 17, 2024 at 01:00:25PM +0200, Naresh Kamboju wrote:
> The following x86 build failed on Linux next-20240517 tag due to following
> warnings / errors only seen with clang builds.
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> Build errors:
> ----
> arch/x86/boot/printf.c:257:3: error: unannotated fall-through between
> switch labels [-Werror,-Wimplicit-fallthrough]
>   257 |                 case 'u':
>       |                 ^
> arch/x86/boot/printf.c:257:3: note: insert 'break;' to avoid fall-through
>   257 |                 case 'u':
>       |                 ^
>       |                 break;
> 1 error generated.
> 
> The suspected patch,
> x86/boot: Add a fallthrough annotation

Thanks for the report, this has been addressed:

https://git.kernel.org/tip/82110ae235e0560d1f952f74f9fd991587b0e3a7

Cheers,
Nathan
