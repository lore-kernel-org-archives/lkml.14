Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A3A4689
	for <linux-kernel@vger.kernel.org>; Fri, 19 Jan 2024 02:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705632935; cv=none; b=BZ+Zcn2h2ri24YnkKgYhIK1hW8CCeqraTc4wTFxySuZJGMTVcY4PQX8eIBfSCKgyvnBeJMwFE4gzViX60db8LmYwTZIr2bH0Z7fHrbpsQnO8a/BTxKan7JygBIhpv+c7+ChIeoDXZXLin/UlDQ9FylkdjgjqolgtGHigmAsHlsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705632935; c=relaxed/simple;
	bh=dfumpJtIdKlNuKqQWiGK95QOE37/ccF6Ylw8rGJGrw4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=rdPwWs1PZmm2eJEr+fwxFSFYmvZlAZ1jd28mESW8sacYw1ElOT2LXzzt3woCEsWL9I2mk9H/PTc7Fsda05i4oHCOm4rRexS4uOOiXY7tow8NPiGZKm7Llb42XhhgeBlmUrXEN9kd7Q+WUMAlcmo9CWURk6yyACR3/K1iRKxsJJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GzcoP1hj; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GzcoP1hj"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1705632931;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nVV0GAZomkybNTFhBHxnmDns6Siw62nEuJmiDpVUSoc=;
	b=GzcoP1hjD25gxdJYMEvenAHq0Bs10vl2Dgh+GHdFwisGTYDWXMP6ETbEDHZmm71iIVG2E7
	J7HwJMe6OZWj5VSa66/p1zlQajZIPLpnHZzQ6ZYoeH/7D9ZnwszFhwSI6bAiHWxS00Dcmu
	hBr8TyQVl7rL64Dra5acukIK/M9WMxM=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Subject: Re: [PATCH v4 4/7] hugetlb: pass *next_nid_to_alloc directly to
 for_each_node_mask_to_alloc
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20240118123911.88833-5-gang.li@linux.dev>
Date: Fri, 19 Jan 2024 10:54:50 +0800
Cc: David Hildenbrand <david@redhat.com>,
 David Rientjes <rientjes@google.com>,
 Mike Kravetz <mike.kravetz@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Tim Chen <tim.c.chen@linux.intel.com>,
 Linux-MM <linux-mm@kvack.org>,
 LKML <linux-kernel@vger.kernel.org>,
 ligang.bdlg@bytedance.com
Content-Transfer-Encoding: 7bit
Message-Id: <6FCCD287-152F-43AF-AF20-E8408E2CB378@linux.dev>
References: <20240118123911.88833-1-gang.li@linux.dev>
 <20240118123911.88833-5-gang.li@linux.dev>
To: Gang Li <gang.li@linux.dev>
X-Migadu-Flow: FLOW_OUT



> On Jan 18, 2024, at 20:39, Gang Li <gang.li@linux.dev> wrote:
> 
> With parallelization of hugetlb allocation across different threads, each
> thread works on a differnet node to allocate pages from, instead of all
> allocating from a common node h->next_nid_to_alloc.  To address this, it's
> necessary to assign a separate next_nid_to_alloc for each thread.
> 
> Consequently, the hstate_next_node_to_alloc and for_each_node_mask_to_alloc
> have been modified to directly accept a *next_nid_to_alloc parameter,
> ensuring thread-specific allocation and avoiding concurrent access issues.
> 
> Signed-off-by: Gang Li <gang.li@linux.dev>
> Tested-by: David Rientjes <rientjes@google.com>

Reviewed-by: Muchun Song <muchun.song@linux.dev>

Thanks.

