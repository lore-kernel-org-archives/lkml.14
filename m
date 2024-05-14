Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B532171AB
	for <linux-kernel@vger.kernel.org>; Tue, 14 May 2024 05:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715664470; cv=none; b=isgPnOw2XbxbXYdeDm0Wbs64jgLHdMJZYh+Aiil92XIJr0sT925mipv6i/D8W2t9UhOhWP2oZqERuuglPH2ktZwgKf9QuB2lvdoRONqYcOVrCitGhYawuH7rj9GENVKcQRz6Nto57kf5aSjq+q6HdDALnrLOJZPhfroLdVXhy0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715664470; c=relaxed/simple;
	bh=ct5VforfP7/0JzrHWMZ45fHxGuEyv0JcTptqkFMTo4Y=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C1Zeyo+M1qK+8zO9HH2diJE/qw+fStfra6EaxdKNIYz5EmqLMUFasady3WYLvBzFdQOr6zG1wSYwPPJ8DaVFJgHCiOp4EwvhXdDtrOepUZrU6KK6dIQhD99o9phjzRhvdO2RFM86a69R/MZL8QeZVnTLdIft+3Xlzl3a97b4slY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-208.elisa-laajakaista.fi [88.113.25.208])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id ad5f0f9c-11b2-11ef-b3cf-005056bd6ce9;
	Tue, 14 May 2024 08:27:38 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 14 May 2024 08:27:37 +0300
To: Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, naresh.solanki@9elements.com,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: cy8c95x0: Cache muxed registers
Message-ID: <ZkL2Sdf0NcqaZRZ4@surfacebook.localdomain>
References: <20231219125350.4031370-1-patrick.rudolph@9elements.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231219125350.4031370-1-patrick.rudolph@9elements.com>

Tue, Dec 19, 2023 at 01:53:49PM +0100, Patrick Rudolph kirjoitti:
> Currently the port specific registers behind the PORTSEL mux aren't
> cached in the regmap and thus the typical setup time for a single pin
> on cy8c9560 is about 200msec on our system. The hotspot is the IRQ
> (un)masking, which causes lots of R/W operations.
> 
> Introduce a separate regmap for muxed registers and helper functions
> to use the newly introduced regmap for muxed register access under
> the i2c lock.
> 
> With the new cache in place the typical pin setup time is reduced to
> 20msec, making it about 10 times faster. As a side effect the system
> boot time is also reduced by 50%.

Interestingly that you have not Cc'ed me on your patches.
This, btw, a good reinvetion of a wheel which regmap supports already.

-- 
With Best Regards,
Andy Shevchenko


