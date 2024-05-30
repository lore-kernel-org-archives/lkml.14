Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E30186E33
	for <linux-kernel@vger.kernel.org>; Thu, 30 May 2024 14:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717081153; cv=none; b=bERpTkpS5xekeUBMbH92XrgYn4Z/haAYDlctRVtidhCm7iLULmXwfcAs8EEdileJMhIb/baoILTk/fXy5X1tJV53rJP0bxAvk22e9zLh7C9E54AKtCWsNoPSk22AWsPnKb7Z8ckYGQ6xenPGGir6v5iiKTvWeeImel1Pvdapcgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717081153; c=relaxed/simple;
	bh=To7Obkom+Eu+b5CzCZMTNz1Zon//K/3BLINJ/4Jzzjw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HAVFPcvmei+4v3tOeoqRN6xAPncVwBbXExB2SSBzt/k96I2ysUzHjVvsoqTLT6wRtP9wx3KyCRWVZuuvd5+xsekpfVMY2Yq5Zq4iPBy+31lrJavuA3ox1tFj5h9XoIwpVcBlQtbsAAH7GyHo4rGaMBAcyEv5M0F+O9V9AjZ5x0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=AVtW63z+; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="AVtW63z+"
X-Envelope-To: linux@treblig.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1717081147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YmuU//dkJp7/bqMDC5bYlhcDNvJuvWDepZNNFMpTHfQ=;
	b=AVtW63z+BFg+N+i/VwF6voyhpXmTsIdi4tudn1OlsR1k9zDPA1VMDUJWt76QSW0eWIQkO6
	rq9EIF1DH6yZF4KtAQhnn/d9675jDbbrrxE8CZIB8j/PUfeIVRR5Mu1nghvPPznYxZW2Yh
	XLbrQnF24ylVS2WvPMpMZDkNCZwoezQ=
X-Envelope-To: camelia.groza@nxp.com
X-Envelope-To: linuxppc-dev@lists.ozlabs.org
X-Envelope-To: linux-arm-kernel@lists.infradead.org
X-Envelope-To: linux-kernel@vger.kernel.org
Message-ID: <336239e6-4369-44ea-a60c-d300cf6e6f81@linux.dev>
Date: Thu, 30 May 2024 10:59:03 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] soc/fsl/qbman: remove unused struct 'cgr_comp'
To: linux@treblig.org, camelia.groza@nxp.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240528231123.136664-1-linux@treblig.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20240528231123.136664-1-linux@treblig.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 5/28/24 19:11, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> 'cgr_comp' has been unused since
> commit 96f413f47677 ("soc/fsl/qbman: fix issue in
> qman_delete_cgr_safe()").
> 
> Remove it.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>  drivers/soc/fsl/qbman/qman.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/soc/fsl/qbman/qman.c b/drivers/soc/fsl/qbman/qman.c
> index 7e9074519ad2..4dc8aba33d9b 100644
> --- a/drivers/soc/fsl/qbman/qman.c
> +++ b/drivers/soc/fsl/qbman/qman.c
> @@ -2546,11 +2546,6 @@ int qman_delete_cgr(struct qman_cgr *cgr)
>  }
>  EXPORT_SYMBOL(qman_delete_cgr);
>  
> -struct cgr_comp {
> -	struct qman_cgr *cgr;
> -	struct completion completion;
> -};
> -
>  static void qman_delete_cgr_smp_call(void *p)
>  {
>  	qman_delete_cgr((struct qman_cgr *)p);

Reviewed-by: Sean Anderson <sean.anderson@linux.dev>
