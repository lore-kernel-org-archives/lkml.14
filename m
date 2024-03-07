Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5F3085643
	for <linux-kernel@vger.kernel.org>; Thu,  7 Mar 2024 11:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709811740; cv=none; b=SR0UcFKOcne2fhDNJ1IdLjsOOKmAUodSdoRY7Kn0LSkjCWyR1VXOlJNxW5eMbrwT7idNcTDRnMdpBI4xUKab1R7BTv5em1y1Bipm1g1XvdUrPUbNROgM8ug/W/+Ye4VAIoG2iTNbB31J+ojf0yonRO05uR6hTt8a31AAwMfvrbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709811740; c=relaxed/simple;
	bh=TmxL7N4dxrHP1woS/AOxLUshTy7SH90cVTRuhb70/As=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LQtyQiYSYjif0oyyAnEkgKKA1PwOzR4GZ8o1+96YrvY2EIefJEukO3B+ptARuZ9lvaPeZp2B3gio4IOYkdfaTgcg9eKaM7bn86QKlK0lSkSknrRfEyDhewHUUPHjpKuisKmAAVoDc0C/sMd07Y0jgJ4i8BOJzdJoVfRc0OBoDXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B626C1FB;
	Thu,  7 Mar 2024 03:42:52 -0800 (PST)
Received: from [10.1.25.184] (XHFQ2J9959.cambridge.arm.com [10.1.25.184])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 38ED13F762;
	Thu,  7 Mar 2024 03:42:13 -0800 (PST)
Message-ID: <b1bf4b62-8e9b-470f-a300-d13c24177688@arm.com>
Date: Thu, 7 Mar 2024 11:42:11 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] mm/madvise: enhance lazyfreeing with mTHP in
 madvise_free
Content-Language: en-GB
To: David Hildenbrand <david@redhat.com>, Barry Song <21cnbao@gmail.com>
Cc: Lance Yang <ioworker0@gmail.com>, Vishal Moola <vishal.moola@gmail.com>,
 akpm@linux-foundation.org, zokeefe@google.com, shy828301@gmail.com,
 mhocko@suse.com, fengwei.yin@intel.com, xiehuan09@gmail.com,
 wangkefeng.wang@huawei.com, songmuchun@bytedance.com, peterx@redhat.com,
 minchan@kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20240307061425.21013-1-ioworker0@gmail.com>
 <CAGsJ_4xcRvZGdpPh1qcFTnTnDUbwz6WreQ=L_UO+oU2iFm9EPg@mail.gmail.com>
 <CAK1f24k2G_DSEjuqqqPyY0f7+btpYbjfoyMH7btLfP8nkasCTQ@mail.gmail.com>
 <CAGsJ_4xREM-P1mFqeM-s3-cJ9czb6PXwizb-3hOhwaF6+QM5QA@mail.gmail.com>
 <03458c20-5544-411b-9b8d-b4600a9b802f@arm.com>
 <CAGsJ_4zp1MXTjG=4gBO+J3owg7sHDgDJ8Ut51i1RBSnKnK0BfQ@mail.gmail.com>
 <501c9f77-1459-467a-8619-78e86b46d300@arm.com>
 <8f84c7d6-982a-4933-a7a7-3f640df64991@redhat.com>
 <e6bc142e-113d-4034-b92c-746b951a27ed@redhat.com>
 <d24f8553-33f2-4ae7-a06d-badaf9462d84@arm.com>
 <CAGsJ_4za-2xpg21phWi2WWLF1iPXhoc1xM__FDTwYYBBKsTPgw@mail.gmail.com>
 <a07deb2c-49e1-4324-8e70-e897605faa9d@redhat.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <a07deb2c-49e1-4324-8e70-e897605faa9d@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/03/2024 11:31, David Hildenbrand wrote:
> On 07.03.24 12:26, Barry Song wrote:
>> On Thu, Mar 7, 2024 at 7:13 PM Ryan Roberts <ryan.roberts@arm.com> wrote:
>>>
>>> On 07/03/2024 10:54, David Hildenbrand wrote:
>>>> On 07.03.24 11:54, David Hildenbrand wrote:
>>>>> On 07.03.24 11:50, Ryan Roberts wrote:
>>>>>> On 07/03/2024 09:33, Barry Song wrote:
>>>>>>> On Thu, Mar 7, 2024 at 10:07 PM Ryan Roberts <ryan.roberts@arm.com> wrote:
>>>>>>>>
>>>>>>>> On 07/03/2024 08:10, Barry Song wrote:
>>>>>>>>> On Thu, Mar 7, 2024 at 9:00 PM Lance Yang <ioworker0@gmail.com> wrote:
>>>>>>>>>>
>>>>>>>>>> Hey Barry,
>>>>>>>>>>
>>>>>>>>>> Thanks for taking time to review!
>>>>>>>>>>
>>>>>>>>>> On Thu, Mar 7, 2024 at 3:00 PM Barry Song <21cnbao@gmail.com> wrote:
>>>>>>>>>>>
>>>>>>>>>>> On Thu, Mar 7, 2024 at 7:15 PM Lance Yang <ioworker0@gmail.com> wrote:
>>>>>>>>>>>>
>>>>>>>>>> [...]
>>>>>>>>>>>> +static inline bool can_mark_large_folio_lazyfree(unsigned long addr,
>>>>>>>>>>>> +                                                struct folio *folio,
>>>>>>>>>>>> pte_t *start_pte)
>>>>>>>>>>>> +{
>>>>>>>>>>>> +       int nr_pages = folio_nr_pages(folio);
>>>>>>>>>>>> +       fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>>>>>>>>>>>> +
>>>>>>>>>>>> +       for (int i = 0; i < nr_pages; i++)
>>>>>>>>>>>> +               if (page_mapcount(folio_page(folio, i)) != 1)
>>>>>>>>>>>> +                       return false;
>>>>>>>>>>>
>>>>>>>>>>> we have moved to folio_estimated_sharers though it is not precise, so
>>>>>>>>>>> we don't do
>>>>>>>>>>> this check with lots of loops and depending on the subpage's mapcount.
>>>>>>>>>>
>>>>>>>>>> If we don't check the subpage’s mapcount, and there is a cow folio
>>>>>>>>>> associated
>>>>>>>>>> with this folio and the cow folio has smaller size than this folio,
>>>>>>>>>> should we still
>>>>>>>>>> mark this folio as lazyfree?
>>>>>>>>>
>>>>>>>>> I agree, this is true. However, we've somehow accepted the fact that
>>>>>>>>> folio_likely_mapped_shared
>>>>>>>>> can result in false negatives or false positives to balance the
>>>>>>>>> overhead.  So I really don't know :-)
>>>>>>>>>
>>>>>>>>> Maybe David and Vishal can give some comments here.
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>> BTW, do we need to rebase our work against David's changes[1]?
>>>>>>>>>>> [1]
>>>>>>>>>>> https://lore.kernel.org/linux-mm/20240227201548.857831-1-david@redhat.com/
>>>>>>>>>>
>>>>>>>>>> Yes, we should rebase our work against David’s changes.
>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>> +
>>>>>>>>>>>> +       return nr_pages == folio_pte_batch(folio, addr, start_pte,
>>>>>>>>>>>> +                                        ptep_get(start_pte), nr_pages,
>>>>>>>>>>>> flags, NULL);
>>>>>>>>>>>> +}
>>>>>>>>>>>> +
>>>>>>>>>>>>     static int madvise_free_pte_range(pmd_t *pmd, unsigned long addr,
>>>>>>>>>>>>                                    unsigned long end, struct mm_walk
>>>>>>>>>>>> *walk)
>>>>>>>>>>>>
>>>>>>>>>>>> @@ -676,11 +690,45 @@ static int madvise_free_pte_range(pmd_t *pmd,
>>>>>>>>>>>> unsigned long addr,
>>>>>>>>>>>>                     */
>>>>>>>>>>>>                    if (folio_test_large(folio)) {
>>>>>>>>>>>>                            int err;
>>>>>>>>>>>> +                       unsigned long next_addr, align;
>>>>>>>>>>>>
>>>>>>>>>>>> -                       if (folio_estimated_sharers(folio) != 1)
>>>>>>>>>>>> -                               break;
>>>>>>>>>>>> -                       if (!folio_trylock(folio))
>>>>>>>>>>>> -                               break;
>>>>>>>>>>>> +                       if (folio_estimated_sharers(folio) != 1 ||
>>>>>>>>>>>> +                           !folio_trylock(folio))
>>>>>>>>>>>> +                               goto skip_large_folio;
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> I don't think we can skip all the PTEs for nr_pages, as some of them
>>>>>>>>>>> might be
>>>>>>>>>>> pointing to other folios.
>>>>>>>>>>>
>>>>>>>>>>> for example, for a large folio with 16PTEs, you do MADV_DONTNEED(15-16),
>>>>>>>>>>> and write the memory of PTE15 and PTE16, you get page faults, thus PTE15
>>>>>>>>>>> and PTE16 will point to two different small folios. We can only skip
>>>>>>>>>>> when we
>>>>>>>>>>> are sure nr_pages == folio_pte_batch() is sure.
>>>>>>>>>>
>>>>>>>>>> Agreed. Thanks for pointing that out.
>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>> +
>>>>>>>>>>>> +                       align = folio_nr_pages(folio) * PAGE_SIZE;
>>>>>>>>>>>> +                       next_addr = ALIGN_DOWN(addr + align, align);
>>>>>>>>>>>> +
>>>>>>>>>>>> +                       /*
>>>>>>>>>>>> +                        * If we mark only the subpages as lazyfree, or
>>>>>>>>>>>> +                        * cannot mark the entire large folio as
>>>>>>>>>>>> lazyfree,
>>>>>>>>>>>> +                        * then just split it.
>>>>>>>>>>>> +                        */
>>>>>>>>>>>> +                       if (next_addr > end || next_addr - addr !=
>>>>>>>>>>>> align ||
>>>>>>>>>>>> +                           !can_mark_large_folio_lazyfree(addr, folio,
>>>>>>>>>>>> pte))
>>>>>>>>>>>> +                               goto split_large_folio;
>>>>>>>>>>>> +
>>>>>>>>>>>> +                       /*
>>>>>>>>>>>> +                        * Avoid unnecessary folio splitting if the
>>>>>>>>>>>> large
>>>>>>>>>>>> +                        * folio is entirely within the given range.
>>>>>>>>>>>> +                        */
>>>>>>>>>>>> +                       folio_clear_dirty(folio);
>>>>>>>>>>>> +                       folio_unlock(folio);
>>>>>>>>>>>> +                       for (; addr != next_addr; pte++, addr +=
>>>>>>>>>>>> PAGE_SIZE) {
>>>>>>>>>>>> +                               ptent = ptep_get(pte);
>>>>>>>>>>>> +                               if (pte_young(ptent) ||
>>>>>>>>>>>> pte_dirty(ptent)) {
>>>>>>>>>>>> +                                       ptent =
>>>>>>>>>>>> ptep_get_and_clear_full(
>>>>>>>>>>>> +                                               mm, addr, pte,
>>>>>>>>>>>> tlb->fullmm);
>>>>>>>>>>>> +                                       ptent = pte_mkold(ptent);
>>>>>>>>>>>> +                                       ptent = pte_mkclean(ptent);
>>>>>>>>>>>> +                                       set_pte_at(mm, addr, pte,
>>>>>>>>>>>> ptent);
>>>>>>>>>>>> +                                       tlb_remove_tlb_entry(tlb, pte,
>>>>>>>>>>>> addr);
>>>>>>>>>>>> +                               }
>>>>>>>>>>>
>>>>>>>>>>> Can we do this in batches? for a CONT-PTE mapped large folio, you are
>>>>>>>>>>> unfolding
>>>>>>>>>>> and folding again. It seems quite expensive.
>>>>>>>>
>>>>>>>> I'm not convinced we should be doing this in batches. We want the initial
>>>>>>>> folio_pte_batch() to be as loose as possible regarding permissions so
>>>>>>>> that we
>>>>>>>> reduce our chances of splitting folios to the min. (e.g. ignore SW bits
>>>>>>>> like
>>>>>>>> soft dirty, etc). I think it might be possible that some PTEs are RO and
>>>>>>>> other
>>>>>>>> RW too (e.g. due to cow - although with the current cow impl, probably not.
>>>>>>>> But
>>>>>>>> its fragile to assume that). Anyway, if we do an initial batch that ignores
>>>>>>>> all
>>>>>>>
>>>>>>> You are correct. I believe this scenario could indeed occur. For instance,
>>>>>>> if process A forks process B and then unmaps itself, leaving B as the
>>>>>>> sole process owning the large folio.  The current wp_page_reuse() function
>>>>>>> will reuse PTE one by one while the specific subpage is written.
>>>>>>
>>>>>> Hmm - I thought it would only reuse if the total mapcount for the folio
>>>>>> was 1.
>>>>>> And since it is a large folio with each page mapped once in proc B, I thought
>>>>>> every subpage write would cause a copy except the last one? I haven't
>>>>>> looked at
>>>>>> the code for a while. But I had it in my head that this is an area we need to
>>>>>> improve for mTHP.
>>
>> So sad I am wrong again 😢
>>
>>>>>
>>>>> wp_page_reuse() will currently reuse a PTE part of a large folio only if
>>>>> a single PTE remains mapped (refcount == 0).
>>>>
>>>> ^ == 1
>>
>> seems this needs improvement. it is a waste the last subpage can
> 
> My take that is WIP:
> 
> https://lore.kernel.org/all/20231124132626.235350-1-david@redhat.com/T/#u
> 
>> reuse the whole large folio. i was doing it in a quite different way,
>> if the large folio had only one subpage left, i would do copy and
>> released the large folio[1]. and if i could reuse the whole large folio
>> with CONT-PTE, i would reuse the whole large folio[2]. in mainline,
>> we don't have this cont-pte luxury exposed to mm, so i guess we can
>> not do [2] easily, but [1] seems to be an optimization.
> 
> Yeah, I had essentially the same idea: just free up the large folio if most of
> the stuff is unmapped. But that's rather a corner-case optimization, so I did
> not proceed with that.
> 

I'm not sure it's a corner case, really? - process forks, then both parent and
child and write to all pages in what was previously a fully & contiguously
mapped large folio?

Reggardless, why is it an optimization to do the copy for the last subpage and
syncrhonously free the large folio? It's already partially mapped so is on the
deferred split list and can be split if memory is tight.

