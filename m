Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 036735C904
	for <linux-kernel@vger.kernel.org>; Tue, 26 Mar 2024 10:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711448089; cv=none; b=PUJn1XMJDvc3p+D/65/GxOHolD+NgdThvg1njIaBUj2MdC6YdlboldI4r9UCOBDBGIl4zUObkrOw/5Snyafc2ckE5aTuZAjamsne+hDVh0NuFYmgyjh3/rav48qY3ligOdJktZhDQJPQRwCE6B14hnnPPOROcfqUgT7BtBK3XOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711448089; c=relaxed/simple;
	bh=zS/DlGBU279on+SkgAiw/HfAypukIeqEH3KdLCX2I84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qcAtjsLZCgECCWQKu9swl67OXiHOQVz8M5PIeLt9D1BygmepmmzD8SxVzwC3Hqs8VcG9I0wyhadNVTMI169xQc7mMa82/ySsIrnoE021jv4qnmRI40NTXsTsi438LTKDktJMuXx6uanG2YYKE5cPmRLnlXk7RcE+t3LPkArQx+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6B71339
	for <linux-kernel@vger.kernel.org>; Tue, 26 Mar 2024 03:15:20 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 34E513F64C
	for <linux-kernel@vger.kernel.org>; Tue, 26 Mar 2024 03:14:47 -0700 (PDT)
Date: Tue, 26 Mar 2024 10:14:37 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] drm/panthor: Fix spelling mistake "readyness" ->
 "readiness"
Message-ID: <ZgKgDZrUakS_pwBS@e110455-lin.cambridge.arm.com>
References: <20240326100219.43989-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240326100219.43989-1-colin.i.king@gmail.com>

On Tue, Mar 26, 2024 at 10:02:19AM +0000, Colin Ian King wrote:
> There is a spelling mistake in a drm_err message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Acked-by: Liviu Dudau <liviu.dudau@arm.com>

Boris, can you also pick this one up when you're pushing your kernel doc fix?

Best regards,
Liviu

> ---
>  drivers/gpu/drm/panthor/panthor_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
> index 6dbbc4cfbe7e..0f7c962440d3 100644
> --- a/drivers/gpu/drm/panthor/panthor_gpu.c
> +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
> @@ -333,7 +333,7 @@ int panthor_gpu_block_power_on(struct panthor_device *ptdev,
>  						 val, (mask32 & val) == mask32,
>  						 100, timeout_us);
>  		if (ret) {
> -			drm_err(&ptdev->base, "timeout waiting on %s:%llx readyness",
> +			drm_err(&ptdev->base, "timeout waiting on %s:%llx readiness",
>  				blk_name, mask);
>  			return ret;
>  		}
> -- 
> 2.39.2
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
