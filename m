Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBAD6D1BE
	for <linux-kernel@vger.kernel.org>; Fri, 12 Jan 2024 13:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rOLczhKc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C9DDC43399;
	Fri, 12 Jan 2024 13:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705066972;
	bh=8hQRS8IkXDHH4SUKUASSikBWKe/pa1REXYwjgjKIUlM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rOLczhKcJk6tl92PpedWLGd+oZ5zc2pSgnHEk9myRbkCRrzSYwS2ONLTEZzXk2MHg
	 T2tQU1VM9oYVf0u7pb/lzgfV/d41BmyfF4I6X49cUydMizW9JTVrsIS7nWANTHLLyJ
	 Jcej9sw9943eqdqMU6kFNYSd6qH3QnxBKnbvxlX3BfLg0c6A3vDxIzmQ1EsxiToI+S
	 KBjNFag3SWXonMZH6JybbeHpgmEXB3BjKGZ/dHWoGurQQmibM8A2pBm/d1y+j9zX8G
	 zHTvYCRWWaWKOWZLR48DgN2hl1+RI0ZXNUhS/q/jELXPFuNnlilnU2zMUS3pW00a5i
	 mN1OjdmhGQXLQ==
From: Will Deacon <will@kernel.org>
To: mark.rutland@arm.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	catalin.marinas@arm.com
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	swboyd@chromium.org,
	dianders@chromium.org
Subject: Re: [PATCH v2] arm64: irq: include <linux/cpumask.h>
Date: Fri, 12 Jan 2024 13:42:41 +0000
Message-Id: <170506345866.1191096.6584133190384253967.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20240110074007.4020016-1-tudor.ambarus@linaro.org>
References: <20240110074007.4020016-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 10 Jan 2024 07:40:07 +0000, Tudor Ambarus wrote:
> Sorting include files in alphabetic order in
> drivers/tty/serial/samsung.c revealed the following error:
> 
> In file included from drivers/tty/serial/samsung_tty.c:24:
> ./arch/arm64/include/asm/irq.h:9:43: error: unknown type name ‘cpumask_t’
>     9 | void arch_trigger_cpumask_backtrace(const cpumask_t *mask, int exclude_cpu);
>       |                                           ^~~~~~~~~
> 
> [...]

Applied to arm64 (for-next/core), thanks!

[1/1] arm64: irq: include <linux/cpumask.h>
      https://git.kernel.org/arm64/c/b95df3bd1ea3

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
