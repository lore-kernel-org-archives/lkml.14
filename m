Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A1712AACB
	for <linux-kernel@vger.kernel.org>; Thu, 15 Feb 2024 12:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708001084; cv=none; b=ojTSO+E42fv945ZNpxsWvmgJAJF/XLsR/D4V55aHZwGVdr5BlziKxKZ/X2EVpCK8RRFko0w9yA36H509VT5ttFyEIcxfwFsA1w8INSgGtdSkB5QrzlsYrMoZS7zWq8r752/zauwUNnB+ak6gRNDuVDijbV7jWGFB9dO+0tN+hfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708001084; c=relaxed/simple;
	bh=cAmuYY8stIVt1YffPK/9ukIye27tCzUrEGNy9mrrUZU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eUSTBTSmEhX1wSbk8cmToPKBw6tfS36o2rmwDuxAT7Ox1q//V4mbAee08Xcn3kvsGPcp0yWYIsmPoGKm/l9JUbvmBPlNcIRQMIIyxk7zHlSARrbLYima7qzoHO1kaqVw6Rkwg6cfTlBzrFTTVPXWaHofTWqSyEW2T4wJ1HbMDaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ovFsYQEq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ovFsYQEq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F0F1C43390;
	Thu, 15 Feb 2024 12:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708001084;
	bh=cAmuYY8stIVt1YffPK/9ukIye27tCzUrEGNy9mrrUZU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ovFsYQEqmn2rziJijv9i7nFLCDCf0v7mNM2MV3OJq87S8yDHfu2QkNvIyjP8kkC3p
	 cfGQAcpnOOLbXbrXMJQdbdwhufI7f1CtsR3QInhjGACNZSc6u0wtInGo44kBSX/esg
	 OmNVjMKUXrUEBCeg0ZdRTg85Sf4i3zWQas3sypJWd1+M+98WJ898BOzi/lPGKyiYE6
	 GUdWZVCp87z7YENe5HthYhBd8PIdBK9jCPcjZ39/hi+Wmcvxu6Boe8+Dr4l450aWRU
	 j7WZQ6nryDbbOytjNHXxm79ItrURRudGGPL6LUM/L/iUoYoNA6YqazExovgwAQAqIG
	 CLTUtfxrPam6A==
From: Will Deacon <will@kernel.org>
To: Mark Brown <broonie@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	linux-kernel@vger.kernel.org,
	Dave Martin <Dave.Martin@arm.com>,
	Doug Anderson <dianders@chromium.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm64/sve: Lower the maximum allocation for the SVE ptrace regset
Date: Thu, 15 Feb 2024 12:44:37 +0000
Message-Id: <170799768132.3746307.14703611184129999692.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20240213-arm64-sve-ptrace-regset-size-v2-1-c7600ca74b9b@kernel.org>
References: <20240213-arm64-sve-ptrace-regset-size-v2-1-c7600ca74b9b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 13 Feb 2024 18:24:38 +0000, Mark Brown wrote:
> Doug Anderson observed that ChromeOS crashes are being reported which
> include failing allocations of order 7 during core dumps due to ptrace
> allocating storage for regsets:
> 
>   chrome: page allocation failure: order:7,
>           mode:0x40dc0(GFP_KERNEL|__GFP_COMP|__GFP_ZERO),
>           nodemask=(null),cpuset=urgent,mems_allowed=0
>    ...
>   regset_get_alloc+0x1c/0x28
>   elf_core_dump+0x3d8/0xd8c
>   do_coredump+0xeb8/0x1378
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64/sve: Lower the maximum allocation for the SVE ptrace regset
      https://git.kernel.org/arm64/c/2813926261e4

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
