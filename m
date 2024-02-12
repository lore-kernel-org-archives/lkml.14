Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 411A0468D
	for <linux-kernel@vger.kernel.org>; Mon, 12 Feb 2024 02:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707703625; cv=none; b=Awvs+m3yXhvgEiShi1vPrp8ys5+SlbWt+z++gLlu+U6T5ul6D3sEA1MSwBhH/mcPt3b3WL/MmqDb5jt4eYwDMbYa38Xuqe8J3fmdDbxWXuxuew+aO+yW2q+aW/2YxWldp1m5wpUpDIo+oVrs+TUUixonDvfnttQdKrOkmVChgz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707703625; c=relaxed/simple;
	bh=74BKNfXB75ckP4L/HFKnSrg26cu46GQbna7/Kj1r80U=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=lxVzxnmXpMrIRhvI3SCLIOmFtxr5I/aa2TZpe2eNwshCTCMXTWtWFko5A+6XKOtaJuERQ0w3t3FoUl2K3k61yfl6QqYWH65/Lv9RH7t43kwm+DJJ6trMTnXLFSBbvop/8OBpSElDvymxEhHhpTMJURKVTXytthlt6eS8W81/kBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6CB6DDA7;
	Sun, 11 Feb 2024 18:07:42 -0800 (PST)
Received: from [10.162.40.23] (unknown [10.162.40.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B76123F762;
	Sun, 11 Feb 2024 18:06:59 -0800 (PST)
Message-ID: <559e213a-bd39-4799-8899-c8689e09a01b@arm.com>
Date: Mon, 12 Feb 2024 07:36:56 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH] mm/hugetlb: Ensure adequate CMA areas available for
 hugetlb_cma[]
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, Muchun Song <muchun.song@linux.dev>,
 linux-kernel@vger.kernel.org
References: <20240209065036.1412670-1-anshuman.khandual@arm.com>
 <20240209141637.129e417747ef130255db620d@linux-foundation.org>
Content-Language: en-US
In-Reply-To: <20240209141637.129e417747ef130255db620d@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/10/24 03:46, Andrew Morton wrote:
> On Fri,  9 Feb 2024 12:20:36 +0530 Anshuman Khandual <anshuman.khandual@arm.com> wrote:
> 
>> HugeTLB CMA area array is being created for possible MAX_NUMNODES without
>> ensuring corresponding MAX_CMA_AREAS support in CMA. Let's just warn for
>> such scenarios indicating need for CONFIG_CMA_AREAS adjustment.
>>
>> ...
>>
>> --- a/mm/hugetlb.c
>> +++ b/mm/hugetlb.c
>> @@ -7750,6 +7750,13 @@ void __init hugetlb_cma_reserve(int order)
>>  	}
>>  
>>  	reserved = 0;
>> +
>> +	/*
>> +	 * There needs to be enough MAX_CMA_AREAS to accommodate
>> +	 * MAX_NUMNODES heap areas being created here. Otherwise
>> +	 * adjust CONFIG_CMA_AREAS as required.
>> +	 */
>> +	VM_WARN_ON(MAX_CMA_AREAS < MAX_NUMNODES);
> 
> Could this simply be fixed up in Kconfig logic?

CMA_AREAS should default as (1 << NODES_SHIFT) ? But the system admin might want
to create more heap areas for other purposes as well. The idea here is to ensure
MAX_CMA_AREAS is at least MAX_NUMNODES if HugeTLB support is enabled. Do we have
some other methods ?

> 
> And I think this could be detected at compile-time?  BUILD_BUG_ON()?

Right, was thinking about this at first. Makes sense, will change here, seems to
be the right location for a build check as well.

> 
>>  	for_each_online_node(nid) {
>>  		int res;
>>  		char name[CMA_MAX_NAME];
>> -- 
>> 2.25.1
> 
