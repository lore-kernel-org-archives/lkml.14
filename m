Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2C610E5;
	Thu, 28 Dec 2023 03:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tOkkyp8s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2A5AC433C8;
	Thu, 28 Dec 2023 03:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703733438;
	bh=7ivxNiLqpaa1z6fTYHQvFPiQhwaumRwRXyRY+iyjDmU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tOkkyp8sJ73lPjjHosBQbYd0/GXZMS/LEfgP6TYJU5KYrI2FQFwaNHRbIiANFhIT4
	 Fc9nfgf5lHIiIPvYDllK12+GSwo1nAM2cQa+Oj7oCrYxW8r5xVKZxmRmA1hY/iRw46
	 TzEcKEcSOU39qyy0gsTrVFDxcpQ0BWDwbuvdPvPjB0h6nOT0hys/HokRRaHQmdLzaz
	 tHoNULUlrhp0wQIg75Mjfp6jsgVCLKt0RV0C7ATNU9je2W26HzU+0vrBpQ9NXjj1AQ
	 3ciTjNnGPzdhp4WPATNVcGoRb9/0lZ6Qb7J/VKzMcV7LaIwz/MH3hqY8fkPGwrjzqh
	 DDUG57Z2onSHg==
Date: Thu, 28 Dec 2023 11:17:14 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Alper Nebi Yasak <alpernebiyasak@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	chrome-platform@lists.linux.dev,
	Patrick Georgi <pgeorgi@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	Samuel Holland <samuel@sholland.org>, coreboot@coreboot.org,
	Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH] firmware: coreboot: framebuffer: Avoid invalid zero
 physical address
Message-ID: <ZYzourLcnrxRubaG@google.com>
References: <20231108182625.46563-1-alpernebiyasak@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231108182625.46563-1-alpernebiyasak@gmail.com>

On Wed, Nov 08, 2023 at 09:25:13PM +0300, Alper Nebi Yasak wrote:
> On ARM64 systems coreboot defers framebuffer allocation to its payload,
> to be done by a libpayload function call. In this case, coreboot tables
> still include a framebuffer entry with display format details, but the
> physical address field is set to zero (as in [1], for example).
> 
> Unfortunately, this field is not automatically updated when the
> framebuffer is initialized through libpayload, citing that doing so
> would invalidate checksums over the entire coreboot table [2].
> 
> [...]

Applied, thanks!

[1/1] firmware: coreboot: framebuffer: Avoid invalid zero physical address
        commit: ecea08916418a94f99f89c543303877cb6e08a11

Just realized the bot didn't send the mail for the patch.
