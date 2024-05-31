Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C35E770F3
	for <linux-kernel@vger.kernel.org>; Fri, 31 May 2024 17:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717175203; cv=none; b=DAv22ptSXux9tqWKv8jddPKEdgurALEPTUV3DcW3cqBzdyoZzocHmT4S4v+LN4se2+lU3CQ2XqjMXTlSyk8KZ1VBjUM2S6NVVmjzaEeovWWqZKZTbs0mLSCcFV8PERA30og/M08K3GDeMrfsbj6xP13AQwlRnWlG2EGogU46oBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717175203; c=relaxed/simple;
	bh=dS80JN7FnZR2xDSz5t2bt77ZQGXiSksbckOl1q1RrRw=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XHR/kWpqlFRhA0+1UsXVxTBHsdkBbEsh+sRdMYNyLqg6ZZHL5xrjne8jAQkRwfhYlCxFZ2ylsN1oYadt5cSDtfXnWYla49EhJw/Cu4JZtgJm7eDM8hlnl7lGJo+69gexwUfcDb5G304UAxNbNpUh4TW35bxvxeNuYm1hRcJnCfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CvRG0zMO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CvRG0zMO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B65EC116B1;
	Fri, 31 May 2024 17:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717175203;
	bh=dS80JN7FnZR2xDSz5t2bt77ZQGXiSksbckOl1q1RrRw=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=CvRG0zMOZ1nIcOqS2LdLBwVUgBC8Oyk50ReYrXcnkTJmnLImDH3HqBEEfAn5FciHl
	 mFkyXI5t7KR3QkNlyvmtKBXsPzse2m0PV70uH7MTmdug4dLZCFbNEt4sk9iN7sZbOx
	 Dt0ICHiiBL1A74O8DpCnsPaUz5ih0DIfW1i42cjfb4WgYMnlOlsBP+I8rj2ew9t7DI
	 l0MGvf1eW/lhWexdA7mID1AXRkJ6lwAg/z0n8nRpDGCGTYp3jwC2a6UHLF645FE5HD
	 LVCIUm5qwCG0+GoWdpcrGwP9Lwwf3KBQsKlrXBkP2pMWAzrmxRtwVudppHCTjiyM83
	 ETzaDG7Dx+t8A==
From: Lee Jones <lee@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Jarkko Nikula <jarkko.nikula@linux.intel.com>, Lee Jones <lee@kernel.org>, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
In-Reply-To: <20240531142505.1888-1-ilpo.jarvinen@linux.intel.com>
References: <20240531142505.1888-1-ilpo.jarvinen@linux.intel.com>
Subject: Re: (subset) [PATCH 1/1] mfd: intel-lpss: Rename SPI
 intel_lpss_platform_info structs
Message-Id: <171717520197.1212031.14558469435820532433.b4-ty@kernel.org>
Date: Fri, 31 May 2024 18:06:41 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.4

On Fri, 31 May 2024 17:25:05 +0300, Ilpo Järvinen wrote:
> The driver has intel_lpss_platform_info structs for I2C, SPI, and UART.
> The I2C and UART structs are named with "i2c" and "uart" in the variable
> name, whereas SPI ones do not mention "spi".
> 
> Rename the SPI related info structs to include "spi" in their names for
> consistency and to make it obvious in the device ID list what kind of
> device the line relates to.
> 
> [...]

Applied, thanks!

[1/1] mfd: intel-lpss: Rename SPI intel_lpss_platform_info structs
      commit: ebcd1453f15e2ef9bfa007d9ae4b9cd86d1afd5e

--
Lee Jones [李琼斯]

