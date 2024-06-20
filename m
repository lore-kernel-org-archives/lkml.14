Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808B41FA3;
	Thu, 20 Jun 2024 01:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718845310; cv=none; b=ulYsysj3QX2vu0tzribhW8hoY10IYL9YZBjc/AJznCWEll4H/vCCCtnr9Wc86GRFnADVSFPKeZXi9hWytHAPMELp/RihkajkjrUOBc0EjLWdi4X4GjB47RNokd/HiJ7t4np4tHG9DDJnDdjjSTRlTEBE9o0GcjrydFcN9N5gJFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718845310; c=relaxed/simple;
	bh=Dh7fI9g0bKhm08YYuZbUPD7TIcVtzqcOd2fHYxtxqqw=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=jZVYsGk8HkBrQjdWS8Lv2qfxHol1p+LbU9HXs79NhE7LvLqorwtYMpwTNSfhi8cNUPyunu+HRGBo/QcCHquDtGcG1CAufY4Gj0kALvRK2E4/sH/QSjM0nod7OFr3ci37Zd2ugDNaNizeKR4rpW4bP69pN+/e/kreKYkzxjNfpPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Bosutmkj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Bosutmkj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7495C2BBFC;
	Thu, 20 Jun 2024 01:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1718845310;
	bh=Dh7fI9g0bKhm08YYuZbUPD7TIcVtzqcOd2fHYxtxqqw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BosutmkjQy/I6U0jOTI1nwJ//4o8Z0IjQox/7TwrmGqisl/KdfRDwvHq544lLXrpH
	 hU6PxtqJ8agUSI7X914PVFesaz9n1YeI7XgiFqwlEBnW3Ta7dc5LZYzUeFNkAPBY9S
	 JtvJFcltERhLC4TfhX1dVv15jkpm2+dK8/2+XwPk=
Date: Wed, 19 Jun 2024 18:01:49 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: yangge1116@126.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, 21cnbao@gmail.com, baolin.wang@linux.alibaba.com,
 mgorman@techsingularity.net, liuzixing@hygon.cn
Subject: Re: [PATCH] mm/page_alloc: add one PCP list for THP
Message-Id: <20240619180149.c043cce3f1f84db02fe24f5f@linux-foundation.org>
In-Reply-To: <1718801672-30152-1-git-send-email-yangge1116@126.com>
References: <1718801672-30152-1-git-send-email-yangge1116@126.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 19 Jun 2024 20:54:32 +0800 yangge1116@126.com wrote:

> From: yangge <yangge1116@126.com>
> 
> Since commit 5d0a661d808f ("mm/page_alloc: use only one PCP list for
> THP-sized allocations") no longer differentiates the migration type
> of pages in THP-sized PCP list, it's possible that non-movable
> allocation requests may get a CMA page from the list, in some cases,
> it's not acceptable.
> 
> If a large number of CMA memory are configured in system (for
> example, the CMA memory accounts for 50% of the system memory),
> starting a virtual machine with device passthrough will get stuck.
> During starting the virtual machine, it will call
> pin_user_pages_remote(..., FOLL_LONGTERM, ...) to pin memory. Normally
> if a page is present and in CMA area, pin_user_pages_remote() will
> migrate the page from CMA area to non-CMA area because of
> FOLL_LONGTERM flag. But if non-movable allocation requests return
> CMA memory, migrate_longterm_unpinnable_pages() will migrate a CMA
> page to another CMA page, which will fail to pass the check in
> check_and_migrate_movable_pages() and cause migration endless.
> Call trace:

Thanks.  I'll add this for testing - please send us a new version which
addresses Barry's comments.
