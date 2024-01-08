Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1BA14000
	for <linux-kernel@vger.kernel.org>; Mon,  8 Jan 2024 00:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RNhJCiaB"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 645A21BF205;
	Mon,  8 Jan 2024 00:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1704672254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Tdf5Xfn2/DCKkUk8uXbKkMEcVB0zckMLmQU1nw+lsO8=;
	b=RNhJCiaBPBd2SrPwPb2Zwt0QbmP1O7VhzophmpmegyJ/N/mYJkN8558X1yPtXrnw9WLnWK
	0XCn+MmD1JapvUOrWE4IpiqObWKLDoxSfO97HOYKaoIHTR2TRxhSHGN7bgpluALz7Fu0Ww
	xZSCT5YMiiVruM/10YOzy01Yy19ukJwsxaZ3sDVUa7vtK+zK67Y16BJn4oOJji86yyAYWJ
	nC8kkb+MF4WCyyBxISCSOg1P74W04HtZDHqwuHGsO/l7OvIwkpWWYtI/EB74Ei5JriwvmV
	EuT/j+YjIw6JjSPuQzTF2w1j1YoijRGusf8lXqKpLcRZbAXhyChv2v1t5ZP08A==
Date: Mon, 8 Jan 2024 01:04:13 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Cc: linux-i3c@lists.infradead.org
Subject: Re: [PATCH] i3c: master: fix Excess kernel-doc description warning
Message-ID: <170467220283.558820.13127608286872037848.b4-ty@bootlin.com>
References: <20231223050542.13930-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231223050542.13930-1-rdunlap@infradead.org>
X-GND-Sasl: alexandre.belloni@bootlin.com


On Fri, 22 Dec 2023 21:05:42 -0800, Randy Dunlap wrote:
> Remove the @boardinfo: line to prevent the kernel-doc warning:
> 
> include/linux/i3c/master.h:98: warning: Excess struct member 'boardinfo' description in 'i2c_dev_desc'
> 
> 

Applied, thanks!

[1/1] i3c: master: fix Excess kernel-doc description warning
      commit: 18e5794879905a788e06fb2bc40b6f5b58eae5c2

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
