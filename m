Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 671821B960
	for <linux-kernel@vger.kernel.org>; Fri, 15 Mar 2024 10:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710500122; cv=none; b=q8b2ASTTGETLnEhyMFhI0/78Kn+dW33NekF+GYaZNIfQmanrWzGq02f3/Zr7pBzK/oSaxBlZE7cwhJhgrBwrwF0CDSSxun6bViF3zSBX4jd6UaX7Py6fSqR6LuxuK6Xm2fPc1FoeiipK/3tI6/L6MChAN433O++g+qlQXwHXh/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710500122; c=relaxed/simple;
	bh=7l16go4HlTlmkmb7nNzK3ps56IPRMeTS+78pgRjsfgY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f/ckq5kpgE/ljjB/zSy1HbD/93X/TdQsBm+g2wQfYKMMFRiRfq4gCZF8F9qd6lJ40ZuKRjNmDOo00j0upLwuXZnLURPF/hv6EGQfMIsZMemyUoN7tXpAh6uWmZEjZfSVEp0Ab9gV677JAFQFM4yk/yXPAG27FphAgju0BeKZbWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB7A8C15;
	Fri, 15 Mar 2024 03:55:53 -0700 (PDT)
Received: from [10.57.69.160] (unknown [10.57.69.160])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 026733F762;
	Fri, 15 Mar 2024 03:55:15 -0700 (PDT)
Message-ID: <b8b3d0d9-7764-4fc4-b848-c02dd06fccc6@arm.com>
Date: Fri, 15 Mar 2024 10:55:14 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] mm: madvise: Avoid split during MADV_PAGEOUT and
 MADV_COLD
Content-Language: en-GB
To: David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, Huang Ying <ying.huang@intel.com>,
 Gao Xiang <xiang@kernel.org>, Yu Zhao <yuzhao@google.com>,
 Yang Shi <shy828301@gmail.com>, Michal Hocko <mhocko@suse.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Barry Song <21cnbao@gmail.com>,
 Chris Li <chrisl@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20240311150058.1122862-1-ryan.roberts@arm.com>
 <20240311150058.1122862-7-ryan.roberts@arm.com>
 <ffeee7da-e625-40dc-8da8-b70e4e6ef935@redhat.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <ffeee7da-e625-40dc-8da8-b70e4e6ef935@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/03/2024 10:35, David Hildenbrand wrote:
>> -        if (!pageout && pte_young(ptent)) {
>> -            ptent = ptep_get_and_clear_full(mm, addr, pte,
>> -                            tlb->fullmm);
>> -            ptent = pte_mkold(ptent);
>> -            set_pte_at(mm, addr, pte, ptent);
>> -            tlb_remove_tlb_entry(tlb, pte, addr);
>> +        if (!pageout) {
>> +            for (; nr != 0; nr--, pte++, addr += PAGE_SIZE) {
>> +                if (ptep_test_and_clear_young(vma, addr, pte))
>> +                    tlb_remove_tlb_entry(tlb, pte, addr);
>> +            }
>>           }
> 
> 
> The following might turn out a bit nicer: Make folio_pte_batch() collect
> "any_young", then doing something like we do with "any_writable" in the fork()
> case:
> 
> ...
>     nr = folio_pte_batch(folio, addr, pte, ptent, max_nr,
>                  fpb_flags, NULL, any_young);
>     if (any_young)
>         pte_mkyoung(ptent)
> ...
> 
> if (!pageout && pte_young(ptent)) {
>     mkold_full_ptes(mm, addr, pte, nr, tlb->fullmm);
>     tlb_remove_tlb_entries(tlb, pte, nr, addr);
> }
> 

I thought about that but decided that it would be better to only TLBI the actual
entries that were young. Although looking at tlb_remove_tlb_entry() I see that
it just maintains a range between the lowest and highest address, so this won't
actually make any difference.

So, yes, this will be a nice improvement, and also prevent the O(n^2) pte reads
for the contpte case. I'll change in the next version.
