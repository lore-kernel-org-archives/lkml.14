Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EA612F5BB
	for <linux-kernel@vger.kernel.org>; Mon,  3 Jun 2024 14:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717425823; cv=none; b=C6OuHjmIAUlfY+fqKwUVG+sXBt0vF5Dsb/Nf7XXiTAWEfHdSCx7jjyZozR3Mix1SGTfmBCCrHPcgdd7v8EhQQyJ6dmGEsuU85gvIM54eA152pzyjav7CEa+LpTsNYAQOxBOifB4xfFD0hqH4g5s4mXYRsDnHorgHm49hN0DXA0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717425823; c=relaxed/simple;
	bh=V1K2iLhhRnGy0zuSs0nLFR7k6ApIHp8T8Sj2TRondgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tMobOZ8yG+dmddh3tngICTjHi9R8RpY01ScG96yj/9utphG/zkbwagg6/+8EG1bLuvNUi5Ed2IgJofSfcjMdxqT0WmdiLKJ35xYhjFEarVvaRjXAm8THh5fnT0/hujQ+MvlAduLsD2V628cD00PdTXN9C7AOJ9nfIrZgrivjBP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=HtlyqtbZ; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="HtlyqtbZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=t9yfn1hx0t4EDmkvA9VAFFm6UlGVc6snNAn9His+0pM=; b=HtlyqtbZUh3FHXZwUgc78xShF7
	tPJva81XjQdsSgeJs1xN92rHK3zVnZiW4d9J5S6ZEyZc4S2Egw1Kqmfsgf1cTZyHDTA2PhQjj0KIF
	fYzh4D/lkAuWYS3cAkAQnzYpUyzu9+DH3gdphRjL2s/EQcwawIO+py4IOc7SUUG185v4/iRD4/rTv
	mW1uertN6alMsoKaTjw7dTdYcyY1AnCFiLjholY0VJH9JXc9YnGX+W5aMh/wWkpcY0oNa1GtIOQ27
	ZHQqixIdwj50SWjF3MWN4n2YXiTwKptHFOSgXn5puHKkQo+JpjrlzGPJ0Kgm3MsOWTkpUHLPF4TIW
	+x354qpg==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE8uE-0000000EAgX-0enb;
	Mon, 03 Jun 2024 14:43:26 +0000
Date: Mon, 3 Jun 2024 15:43:26 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Lance Yang <ioworker0@gmail.com>
Cc: akpm@linux-foundation.org, ryan.roberts@arm.com, david@redhat.com,
	21cnbao@gmail.com, baolin.wang@linux.alibaba.com, ziy@nvidia.com,
	fengwei.yin@intel.com, ying.huang@intel.com, libang.li@antgroup.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] mm/mlock: implement folio_mlock_step() using
 folio_pte_batch()
Message-ID: <Zl3Wjh9_aGY8Xxm7@casper.infradead.org>
References: <20240603140745.83880-1-ioworker0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240603140745.83880-1-ioworker0@gmail.com>

On Mon, Jun 03, 2024 at 10:07:45PM +0800, Lance Yang wrote:
> +++ b/mm/mlock.c
> @@ -307,26 +307,15 @@ void munlock_folio(struct folio *folio)
>  static inline unsigned int folio_mlock_step(struct folio *folio,
>  		pte_t *pte, unsigned long addr, unsigned long end)
>  {
> -	unsigned int count, i, nr = folio_nr_pages(folio);
> -	unsigned long pfn = folio_pfn(folio);
> +	const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
> +	unsigned int count = (end - addr) >> PAGE_SHIFT;

This is a pre-existing bug, but ... what happens if you're on a 64-bit
system and you mlock() a range that is exactly 2^44 bytes?  Seems to me
that count becomes 0.  Why not use an unsigned long here and avoid the
problem entirely?

folio_pte_batch() also needs to take an unsigned long max_nr in that
case, because you aren't restricting it to folio_nr_pages().

