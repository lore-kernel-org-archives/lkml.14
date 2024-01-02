Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D3C14F61;
	Tue,  2 Jan 2024 16:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r5c84EWY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AAE8C433C7;
	Tue,  2 Jan 2024 16:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704211334;
	bh=3yRK9vsubu6cS+rIzQek4IUOpiHcOTk+QvVxskLzw2g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r5c84EWY4DWv7JGx1H8KkLX7YrRP5i4wPco8vyaHxW26zoftec28bNQVRXxGkpARF
	 9rBugDrtMxIUkDpvAlNJMjokfYvLMJPZadnwkv3z7Z3ZNuMiAQljwy66Q/40EbLIsA
	 tkzhWgqw5U/KZmW1two6CJJeRfiSRcVU+2jtHWnkRLdzCW/4emnbROzebHrL9IF6Vh
	 NrZKCPlluQq2kpnvjIOoevlNw9TVsJjqtRbncvAiu7zwB6RgZo5XGCyMskxuXFGefo
	 8G6C8qLsvxeBEs1ievw7ogaiLP2ayoM4Rxp4d/7H+QREnj6rC04QAVSjVI4z+vcV7M
	 RO2hvi8NJ6bWw==
Received: (nullmailer pid 2927276 invoked by uid 1000);
	Tue, 02 Jan 2024 16:02:11 -0000
Date: Tue, 2 Jan 2024 09:02:11 -0700
From: Rob Herring <robh@kernel.org>
To: Mark Hasemeyer <markhas@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, Andy Shevchenko <andriy.shevchenko@intel.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, Tzung-Bi Shih <tzungbi@kernel.org>, Raul Rangel <rrangel@chromium.org>, Frank Rowand <frowand.list@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, LKML <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 19/24] of: irq: Add default implementation for
 of_irq_to_resource()
Message-ID: <170421131448.2926138.1861213132542999072.robh@kernel.org>
References: <20231226192149.1830592-1-markhas@chromium.org>
 <20231226122113.v3.19.I31d4dd6a7e5a3e5eee05c87b358e63cd1aa0e467@changeid>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231226122113.v3.19.I31d4dd6a7e5a3e5eee05c87b358e63cd1aa0e467@changeid>


On Tue, 26 Dec 2023 12:21:23 -0700, Mark Hasemeyer wrote:
> Similar to of_irq_to_resource_table(), add a default implementation of
> of_irq_to_resource() for systems that don't have CONFIG_OF_IRQ defined.
> 
> Signed-off-by: Mark Hasemeyer <markhas@chromium.org>
> ---
> 
> (no changes since v2)
> 
> Changes in v2:
> -None
> 
>  include/linux/of_irq.h | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

Missing tags:

Acked-by: Rob Herring <robh@kernel.org>



