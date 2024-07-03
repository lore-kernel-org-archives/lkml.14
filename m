Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71674178364
	for <linux-kernel@vger.kernel.org>; Wed,  3 Jul 2024 12:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720010513; cv=none; b=h7ofgiNUCxYuurwCpezq1DOQePatTBHeJWlvxFdSMkUOnS/X6n4r1Vy6JSsd+P/fl8Fkl1YRBu4rvJe+69VWRW0cVBAFMHyO+JCK3LTHE0yuIfTFDKs5CQoV3BJJgAtRAaTe26/fyxhAXWsGXevEaip0gz0cRyQvHnhAoP7WoEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720010513; c=relaxed/simple;
	bh=+Sieh1o5MyoBrHnm558BmfMmJRpQbNvLcV12+eOLjiA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JhMzNL1agzf/gXv4pYp7EHxqSBheubt6ptTRKE30vyHp67U1v4h+vx06NWN+qCy1QtX6f/+ByHA1AeN8Ig07gb6ifHbsxSXqv/qlmwPhWi7oxvnyMHkEYlVPAA40K/4ydwzxAAvNEwTTARNsaOrfp24bdF3bZpK3F0itPRRFWko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fnnlw0i6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fnnlw0i6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EB41C2BD10;
	Wed,  3 Jul 2024 12:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720010513;
	bh=+Sieh1o5MyoBrHnm558BmfMmJRpQbNvLcV12+eOLjiA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Fnnlw0i6W/oooJnn0ktH8v09JmdXZPM1figcF+bGCs7fmPcP2pD7UYGnM7hv8R+Hi
	 gMnkuqYu/QUdE/Trj3sF7Guajilklm6J3b0gMIX8eHr7tlhwiNprflDKB+yWDBzEvY
	 uTP6ILn03iFgKC/HyqQAAJ5RcOZm1Tvg6gIIp3770iQWKfDtdKmm68udKNblWurg8G
	 YfYL352qnKD5fL46SPwvy8vLkVkGgVs6hzNXm2QVZPKMePtNtWiZFbsLexK9EITk65
	 //AouMXK7YUr1JUsOpP8ggGHQS60CgWDQeafjJ8t6Ah8b5rrDEX0oES8rWYZFNVt8z
	 vkNePbucnQoiQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>, Vladimir Isaev
 <vladimir.isaev@syntacore.com>, Roman Artemev
 <roman.artemev@syntacore.com>, Guo Ren <guoren@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH] riscv: Check that vdso does not contain any dynamic
 relocations
In-Reply-To: <20240326113831.283025-1-alexghiti@rivosinc.com>
References: <20240326113831.283025-1-alexghiti@rivosinc.com>
Date: Wed, 03 Jul 2024 14:41:49 +0200
Message-ID: <8734oqzlyq.fsf@all.your.base.are.belong.to.us>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hey Alex,

Alexandre Ghiti <alexghiti@rivosinc.com> writes:

> Like other architectures, use the common cmd_vdso_check to make sure of
> that.
>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Looking in PW, this fails on rv32? Is that a false negative?

Other than that,
Reviewed-by: Bj=C3=B6rn T=C3=B6pel <bjorn@rivosinc.com>
