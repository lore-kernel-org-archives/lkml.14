Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346532C6A6
	for <linux-kernel@vger.kernel.org>; Thu, 18 Jan 2024 18:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705602345; cv=none; b=avNACOKIhKbwpO2RFHKk/uUijZj7wONXSgo8KYzoxylvjFKcagKXmpI67FHeHSO4mjnj/gnM0PzHiKpxrCv1juOnBINwOot/yKig7csVfFFUNCyI5BrgV22YctFztUUN0rcJeqfH6+OlKjjFttDnAZmjTq/bs4hIJETxIaZrxzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705602345; c=relaxed/simple;
	bh=/D9duSKrItHHns0upfiDxdFxl0rUJPb9JNSyJ+gDcTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tbddXwax0fkyUmcAoZZT8qghlSw5icLNOcXCoSolyM4TaEyrUn/BgzvAuYZzSDsZ8OBf+hyxeiu8bP6H4HOyhMYxsPK8n2sZ2b6G/rWVdeQvaQ4+GOacrqr3czx/xiVlyigKrogaP7WuKOQwNqwqm6qul4TUV8+xFnhUNIIQs8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=SsNUuUkH; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="SsNUuUkH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2i/k1Z2tU3KCpUOMZ3sK/SSQo/PyL7UxFRzxbgPK8Ik=; b=SsNUuUkHnxggJEdKhDGSwjWYUv
	QB23fJ4pju35mJcfq1+iTizo1sbQSKRv8cKtiqzVcCkXD1W03FP4TanC8zcDofzuayFeNFRo09ePs
	F7ucH4v+p8x450QdZrGsCC1YqGQ6ahbmvHEsWpOjUnFms1MQSTLN14+zv+x4FaBxrU8ottnN38Xkx
	7kjYmrfxE4JLIdmkKYGqvPoUgUcMcSsW7l4B99whiqgAVIker7n2KF47sJAwCrGUUBIwEQTkF0dOn
	328+YHANH52L0riSiUrTaoanholJk38msH/VLlHCPhOsbXzyE2PCdhKezKTNwHbAtJ8pgiy216MOj
	JLgXru5Q==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rQX4t-00000002pFb-1QhZ;
	Thu, 18 Jan 2024 18:25:23 +0000
Date: Thu, 18 Jan 2024 18:25:23 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Yosry Ahmed <yosryahmed@google.com>
Cc: Chris Li <chrisl@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Wei =?utf-8?B?WHXvv7w=?= <weixugc@google.com>,
	Yu Zhao <yuzhao@google.com>, Greg Thelen <gthelen@google.com>,
	Chun-Tse Shao <ctshao@google.com>,
	Suren =?utf-8?B?QmFnaGRhc2FyeWFu77+8?= <surenb@google.com>,
	Brain Geffon <bgeffon@google.com>, Minchan Kim <minchan@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Mel Gorman <mgorman@techsingularity.net>,
	Huang Ying <ying.huang@intel.com>, Nhat Pham <nphamcs@gmail.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Kairui Song <kasong@tencent.com>,
	Zhongkun He <hezhongkun.hzk@bytedance.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Barry Song <v-songbaohua@oppo.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Chengming Zhou <zhouchengming@bytedance.com>
Subject: Re: [PATCH 1/2] mm: zswap.c: add xarray tree to zswap
Message-ID: <ZaltEwGXHyFFuI0F@casper.infradead.org>
References: <20240117-zswap-xarray-v1-0-6daa86c08fae@kernel.org>
 <20240117-zswap-xarray-v1-1-6daa86c08fae@kernel.org>
 <CAJD7tkYEx57CPBoaN9GW4M3Mx-+jEsOMWJ02nLKSKD-MLb-WPA@mail.gmail.com>
 <ZaktH7xc72x4Xr3d@casper.infradead.org>
 <CAJD7tkapY4nx=uAXuyQhJN=rz7QPj6p9OJzpPwZGr_7+7Ywotw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJD7tkapY4nx=uAXuyQhJN=rz7QPj6p9OJzpPwZGr_7+7Ywotw@mail.gmail.com>

On Thu, Jan 18, 2024 at 08:59:55AM -0800, Yosry Ahmed wrote:
> On Thu, Jan 18, 2024 at 5:52 AM Matthew Wilcox <willy@infradead.org> wrote:
> >
> > On Wed, Jan 17, 2024 at 10:20:29PM -0800, Yosry Ahmed wrote:
> > > >         /* walk the tree and free everything */
> > > >         spin_lock(&tree->lock);
> > > > +
> > > > +       xas_for_each(&xas, e, ULONG_MAX)
> > >
> > > Why not use xa_for_each?
> >
> > xas_for_each() is O(n) while xa_for_each() is O(n log n), as mentioned
> > in the fine documentation.  If you don't need to drop the lock while
> > in the body of the loop, always prefer xas_for_each().
> 
> Thanks for pointing this out. Out of ignorance, I skipped reading the
> doc for this one and operated under the general assumption to use xa_*
> functions were possible.
> 
> The doc also says we should hold either the RCU read lock or the
> xa_lock while iterating, we are not doing either here, no?

I have no idea; I haven't studied the patches in detail yet.  I have
debugging assertions for that, so I was assuming that Chris had been
developing with debug options turned on.  If not, I guess the bots will
do it for him.
