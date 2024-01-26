Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B5B18E29
	for <linux-kernel@vger.kernel.org>; Fri, 26 Jan 2024 06:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706252021; cv=none; b=t1Hw3PNfzNP6K4aRHMs9ePb3bHmINjuiE2LXEjeVUA68FtmAWJPnGmN/z0TcLskfd9JqeFIr5566qs2Pgp+Sz2KwegRvSU+WgoT/PQ0JH3qyvYSKwrf/Ttjzzq5m29tyDiqB71W+xzj6mF7Xr8uX64+ycDPOEMdO45KXrLY+xQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706252021; c=relaxed/simple;
	bh=5Yl9F+CzoZAtWpDOn5PuDO6yaUyXOId5gbApjRdJtCg=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=QQ0b5mRb5IUKxSIiBq+nlXiYp+KPDGgLKpJF4BBLlqcOtSWi32vfbH9PKCKJ9Wn+9HEeBz5VBOyalDMOiJkKpzAGhkXoCn5SYTZDZBeOwvJzlymWM9VAx/CsrpNzjFxq6F+wYvYBVr30D6iUs9RIdvxtF1Sb4K5Y2Wg3y4gjk9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=eGjdKbwF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="eGjdKbwF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ACD2C433F1;
	Fri, 26 Jan 2024 06:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1706252020;
	bh=5Yl9F+CzoZAtWpDOn5PuDO6yaUyXOId5gbApjRdJtCg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=eGjdKbwFc9UxRkSyUUzwJbhtW8McrA527Ae/OLxda04DU7du3mvcIO2ZW+Xm7oOIM
	 8dlvGytlqESnRE+vm5e4nUA918xJjIt0zcKBrYpjmhzP7gV5+yZgOuWGAbBW3BDq5/
	 nvZf1i1uzI4LLde0Mu4t7fkFM/Jw8AD5Tjv/Yxd4=
Date: Thu, 25 Jan 2024 22:53:36 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Jiexun Wang <wangjiexun@tinylab.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Subject: Re: [PATCH] mm/madvise: don't forget to leave lazy MMU mode in
 madvise_cold_or_pageout_pte_range()
Message-Id: <20240125225336.6a444c01d9d9812a23a6890b@linux-foundation.org>
In-Reply-To: <20240126032608.355899-1-senozhatsky@chromium.org>
References: <20230921174101.8e6271422a857af5414ce0a0@linux-foundation.org>
	<20240126032608.355899-1-senozhatsky@chromium.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 26 Jan 2024 12:25:48 +0900 Sergey Senozhatsky <senozhatsky@chromium.org> wrote:

> We need to leave lazy MMU mode before unlocking.

What might be the userspace-visible effects of this?

> Fixes: b2f557a21bc8 ("mm/madvise: add cond_resched() in madvise_cold_or_pageout_pte_range()"
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>

I'll add a cc:stable.

> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -451,6 +451,7 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
>  		if (++batch_count == SWAP_CLUSTER_MAX) {
>  			batch_count = 0;
>  			if (need_resched()) {
> +				arch_leave_lazy_mmu_mode();
>  				pte_unmap_unlock(start_pte, ptl);
>  				cond_resched();
>  				goto restart;

