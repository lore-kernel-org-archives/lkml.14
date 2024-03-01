Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id C885D39AD4
	for <linux-kernel@vger.kernel.org>; Fri,  1 Mar 2024 16:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709312034; cv=none; b=KGissv3ofjdzKPQ1e7gUJ5mBC1XQMHFXheE3AMrUyICOOjCo3ci6miQ58Xax5KXxkBlXsED2Esam2bYa7QBjKs/p64FCRLn+Ro7KS+WOlhChEIQnmkbuUa/bXG2A2SaTWnbO8dZVri9OAZEQmX2M8r6OTb7Neqie2JUzwSgyxRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709312034; c=relaxed/simple;
	bh=29SVKj6G+k0fROpoD+ltEVOKHLMNDqiZ/KNCqWGiZI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CTzbpmda0eD98RKcYvFEgcY8xNiKL+1aBK76A5gn5/CIGG0fzRN1RE1oab7YsHlAjTaseyVsINb7JRcOhKQT+gp17I+oTC9Fc1RJxfX9BZ7wNjT1Jr/4ew+SJau3UMyxZOSFW0S6peGl/EWdKPUucLGC/m2UY1yr7GMo3//5Lcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 39476 invoked by uid 1000); 1 Mar 2024 11:53:45 -0500
Date: Fri, 1 Mar 2024 11:53:45 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Tom Hu <huxiaoying@kylinos.cn>
Cc: linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
  linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
Subject: Re: [PATCH] usb-storage: Add Brain USB3-FW to IGNORE_UAS
Message-ID: <a960f1c2-a858-498e-a0cf-4c15d74487d5@rowland.harvard.edu>
References: <20240226075936.1744353-1-huxiaoying@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240226075936.1744353-1-huxiaoying@kylinos.cn>

On Mon, Feb 26, 2024 at 03:59:36PM +0800, Tom Hu wrote:
> The UAS mode of BRAIN USB_HDD is reported to fail to work on several
> platforms with the following error message, then after re-connecting the
> device will be offlined and not working at all.
> 
> [  622.518442][ 2] sd 8:0:0:0: [sda] tag#17 uas_eh_abort_handler 0 uas-tag 18
>                    inflight: CMD
> [  622.527575][ 2] sd 8:0:0:0: [sda] tag#17 CDB: Write(10) 2a 00 03 6f 88 00 00
>                    04 00 00
> [  622.536330][ 2] sd 8:0:0:0: [sda] tag#0 uas_eh_abort_handler 0 uas-tag 1
>                    inflight: CMD
> [  622.545266][ 2] sd 8:0:0:0: [sda] tag#0 CDB: Write(10) 2a 00 07 44 1a 88 00
>                    00 08 00
> 
> These disks have a broken uas implementation, the tag field of the status
> iu-s is not set properly, so we need to fall-back to usb-storage.
> 
> Signed-off-by: Hu Xiaoying <huxiaoying@kylinos.cn>
> 1

What is that 1?

> ---
>  drivers/usb/storage/unusual_uas.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusual_uas.h
> index 1f8c9b16a0fb..98b7ff2c76ba 100644
> --- a/drivers/usb/storage/unusual_uas.h
> +++ b/drivers/usb/storage/unusual_uas.h
> @@ -83,6 +83,13 @@ UNUSUAL_DEV(0x0bc2, 0x331a, 0x0000, 0x9999,
>  		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>  		US_FL_NO_REPORT_LUNS),
>  
> +/* Reported-by: Tom Hu <huxiaoying@kylinos.cn> */
> +UNUSUAL_DEV(0x1234, 0x1234, 0x0000, 0x9999,

The vendor and product ID values have a suspicious look, but they appear 
to be genuine.

> +		"Brain",
> +		"External HDD",
> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +		US_FL_IGNORE_UAS),
> +
>  /* Reported-by: Benjamin Tissoires <benjamin.tissoires@redhat.com> */
>  UNUSUAL_DEV(0x13fd, 0x3940, 0x0000, 0x9999,
>  		"Initio Corporation",
> -- 
> 2.25.1

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern
