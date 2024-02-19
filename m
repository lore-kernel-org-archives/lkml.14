Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB9A1D68F;
	Mon, 19 Feb 2024 06:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708324236; cv=none; b=pXzdEDl8LTPf1/qvEEyWbmIMUVZLpgISps1nqqvlj5hNB+cTlFeYXxJYK399QrFKRwO5bItRJTpJvGkdUmzEjO60ceMakBSmU7O5lI9ARVmiolwidmSexOEbKctaRe7QWwrjrplDfKq+myepLQwR1GjTmKPnSYbxHpVNNF1KwnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708324236; c=relaxed/simple;
	bh=PEbz4H3+0cY9MCwTNcv4ML1L9nXnuzzemqVXQ5LZ1Os=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H2ZeT7p3LVAOBDzkzmAotyoz6MsAekpqwy5pHI9qSm/b8srxBriW9fDD4WAzpcvWH4Z/vO+iF15NIvGWOdggwKeyXbLN4UXDOgdN9VAcDcVvbFsk/FcvyTSjUIo7UsXVCfd6AOzkmHPk7TJvBsz8Eb3on+H3tXB0LB2KdH3q81E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HvKe2QYF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HvKe2QYF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32FCAC433F1;
	Mon, 19 Feb 2024 06:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1708324236;
	bh=PEbz4H3+0cY9MCwTNcv4ML1L9nXnuzzemqVXQ5LZ1Os=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HvKe2QYFj0IRJHwwJ9Fx0ZBJYnzqWVRwG35NkjiAq06henq0cvLpx6HDrBreZf/Ac
	 VlIWzPS1J/PQ7tyXidDoLyPS+me2esfH4A4e0AOjMydYD7pkYhdnTXrh58sE+GnmjQ
	 Us8TDi1ENVw1m2qTvaQH5U03wza+lioFe/QE4ug8=
Date: Mon, 19 Feb 2024 07:30:33 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Puma Hsu <pumahsu@google.com>
Cc: mathias.nyman@intel.com, Thinh.Nguyen@synopsys.com, badhri@google.com,
	royluo@google.com, howardyen@google.com, albertccwang@google.com,
	raychi@google.com, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/3] usb: xhci: Add support for Google XHCI controller
Message-ID: <2024021906-celestial-tuesday-bd24@gregkh>
References: <20240219061008.1761102-1-pumahsu@google.com>
 <20240219061008.1761102-3-pumahsu@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240219061008.1761102-3-pumahsu@google.com>

On Mon, Feb 19, 2024 at 02:10:07PM +0800, Puma Hsu wrote:
> diff --git a/drivers/usb/host/xhci-goog.c b/drivers/usb/host/xhci-goog.c
> new file mode 100644
> index 000000000000..db027a5866db
> --- /dev/null
> +++ b/drivers/usb/host/xhci-goog.c
> @@ -0,0 +1,154 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * xhci-goog.c - xHCI host controller driver platform Bus Glue.
> + *
> + * Copyright (c) 2024 Google LLC

This code is older than 2024, right?  :)

> +	if (WARN_ON(!sysdev->dma_mask)) {

If this triggers, you just rebooted your device (as you run with
panic-on-warn enabled), so please, if this is something that can
actually happen, handle it properly and move on, don't reboot a device.

> +MODULE_ALIAS("platform:xhci-hcd-goog");

Why is this alias needed?  I thought that was only for older-style
platform devices

> +static int __init xhci_goog_init(void)
> +{
> +	return platform_driver_register(&usb_goog_xhci_driver);
> +}
> +module_init(xhci_goog_init);
> +
> +static void __exit xhci_goog_exit(void)
> +{
> +	platform_driver_unregister(&usb_goog_xhci_driver);
> +}
> +module_exit(xhci_goog_exit);

module_platform_driver()?

thanks,

greg k-h
