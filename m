Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D27E57322;
	Fri,  1 Mar 2024 21:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709329543; cv=none; b=Un8BwOpC78OJlhKUvHZpnE9SJBlALWfAc0e7kFN2KnQYUCwGUszORoW00TvObxFWwpFGlWJlausCq4iJbA7tKVxrRxL9FBp8bb6AsXGcdRfhboQ8moSLCUWolNNVL3/vHBIHWtsIvVZ/rieA2WAAnvUSWHTiB/t8y62UuMzc3s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709329543; c=relaxed/simple;
	bh=4gfFqVOZg0+bckkDoMH9sSGKsuJGpOlBZ1xS62hIMQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L4X7VIdHKCcyvieBEuSF0f3HIY2qKNnD3xriCA1z4s/EF9/MZnYbsdnRGaopnowkTPD+eI2J23h5L+lPpEH4b3fUoH94LOFuL3Ock8Phibsd9NybeEPWEPwfxGWZh1GeUX1I1Kq8grHcV+5uEBJVKk19rNFHLFU8fn2kpT/DqdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HjWqvnR6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HjWqvnR6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCF97C433F1;
	Fri,  1 Mar 2024 21:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1709329543;
	bh=4gfFqVOZg0+bckkDoMH9sSGKsuJGpOlBZ1xS62hIMQ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HjWqvnR6FSGmcN7LluVqt6vDQ3SAdANGPivcR1XGpOCO52A8mjSau1QeTREHAoiTm
	 5k7E4T+lFcYAP3OStZ3JHdDUbHuQ7WM4Cz5zPrTGiFuVLE53uPfOTDi8144YIKf+E6
	 F/XcTknmpga6kr1W7MMgMHlJbgDU92eGSDoX8frE=
Date: Fri, 1 Mar 2024 22:45:40 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Thinh.Nguyen@synopsys.com, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: core: Add DWC31 version 2.00a controller
Message-ID: <2024030121-unfold-murky-aae1@gregkh>
References: <20240301213554.7850-1-quic_wcheng@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240301213554.7850-1-quic_wcheng@quicinc.com>

On Fri, Mar 01, 2024 at 01:35:54PM -0800, Wesley Cheng wrote:
> Add revision value for identifying DWC31 version 2.00a based controllers.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  drivers/usb/dwc3/core.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index df544ec730d2..f3bbbc1947bd 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -1259,6 +1259,7 @@ struct dwc3 {
>  #define DWC31_REVISION_170A	0x3137302a
>  #define DWC31_REVISION_180A	0x3138302a
>  #define DWC31_REVISION_190A	0x3139302a
> +#define DWC31_REVISION_200A	0x3230302a

What code uses this define?

Why add a define that is not used?

confused,

greg k-h
