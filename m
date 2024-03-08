Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45517567A
	for <linux-kernel@vger.kernel.org>; Fri,  8 Mar 2024 16:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709914088; cv=none; b=JMvqXmM2XG3bXYY4orj1su4jxuzp5cOvflMQNmloLpxb0i+9oMN2LwvO3bfjrY+nPARY270NKv4aUTZL6aecFE+aO/p9kt39XpuOKNwJEmcjj3DgZ1rIZZbvrUF/f6c8jJybROeY3xWK/QxvtXq852/IiNaaa3VYddT5hMfALDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709914088; c=relaxed/simple;
	bh=4776VYAwYZcBlvK+XQSJBOsbq5ySlZEiham03xKgXWA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NlAgMN33pFFdanXi5Cjqm62/qDPnipBkiSha760suTmWtqT9fMgmWEsG81xq7tV2V/iMm+sSQk7K8ajSpuSVaurQXBlcCRZZCIXmxa0/8N+DBtx6yIq29Mj6x7wAOKqpY0tvSlIKhTEx/xjvhAc+m8zzrYJax+Eavm7ktV/Em8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04365C15;
	Fri,  8 Mar 2024 08:08:41 -0800 (PST)
Received: from [10.57.68.92] (unknown [10.57.68.92])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A02C33F73F;
	Fri,  8 Mar 2024 08:08:02 -0800 (PST)
Message-ID: <5c7c7407-5356-4e12-a648-ae695fe0d1cb@arm.com>
Date: Fri, 8 Mar 2024 16:08:01 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/6] swiotlb: Reinstate page-alignment for mappings >=
 PAGE_SIZE
Content-Language: en-GB
To: Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org
Cc: kernel-team@android.com, iommu@lists.linux.dev,
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Petr Tesarik <petr.tesarik1@huawei-partners.com>,
 Dexuan Cui <decui@microsoft.com>, Nicolin Chen <nicolinc@nvidia.com>,
 Michael Kelley <mhklinux@outlook.com>
References: <20240308152829.25754-1-will@kernel.org>
 <20240308152829.25754-7-will@kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20240308152829.25754-7-will@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024-03-08 3:28 pm, Will Deacon wrote:
> For swiotlb allocations >= PAGE_SIZE, the slab search historically
> adjusted the stride to avoid checking unaligned slots. This had the
> side-effect of aligning large mapping requests to PAGE_SIZE, but that
> was broken by 0eee5ae10256 ("swiotlb: fix slot alignment checks").
> 
> Since this alignment could be relied upon drivers, reinstate PAGE_SIZE
> alignment for swiotlb mappings >= PAGE_SIZE.

This seems clear enough to keep me happy now, thanks! And apologies that 
I managed to confuse even myself in the previous thread...

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Reported-by: Michael Kelley <mhklinux@outlook.com>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>   kernel/dma/swiotlb.c | 18 +++++++++++-------
>   1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index c381a7ed718f..c5851034523f 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -992,6 +992,17 @@ static int swiotlb_search_pool_area(struct device *dev, struct io_tlb_pool *pool
>   	BUG_ON(!nslots);
>   	BUG_ON(area_index >= pool->nareas);
>   
> +	/*
> +	 * Historically, swiotlb allocations >= PAGE_SIZE were guaranteed to be
> +	 * page-aligned in the absence of any other alignment requirements.
> +	 * 'alloc_align_mask' was later introduced to specify the alignment
> +	 * explicitly, however this is passed as zero for streaming mappings
> +	 * and so we preserve the old behaviour there in case any drivers are
> +	 * relying on it.
> +	 */
> +	if (!alloc_align_mask && !iotlb_align_mask && alloc_size >= PAGE_SIZE)
> +		alloc_align_mask = PAGE_SIZE - 1;
> +
>   	/*
>   	 * Ensure that the allocation is at least slot-aligned and update
>   	 * 'iotlb_align_mask' to ignore bits that will be preserved when
> @@ -1006,13 +1017,6 @@ static int swiotlb_search_pool_area(struct device *dev, struct io_tlb_pool *pool
>   	 */
>   	stride = get_max_slots(max(alloc_align_mask, iotlb_align_mask));
>   
> -	/*
> -	 * For allocations of PAGE_SIZE or larger only look for page aligned
> -	 * allocations.
> -	 */
> -	if (alloc_size >= PAGE_SIZE)
> -		stride = umax(stride, PAGE_SHIFT - IO_TLB_SHIFT + 1);
> -
>   	spin_lock_irqsave(&area->lock, flags);
>   	if (unlikely(nslots > pool->area_nslabs - area->used))
>   		goto not_found;
