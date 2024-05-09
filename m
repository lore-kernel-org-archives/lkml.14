Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D3085653
	for <linux-kernel@vger.kernel.org>; Thu,  9 May 2024 21:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715290080; cv=none; b=UpxdDLjgOMKBWfhozcK7nJPPIG1vzb+kzrvYY1LM2Ssa/CQUvuWCyWRFVTxtRY+LzFx4XzESKjeZu6WezKi+AMkePh/oqiRziRcsKPc4kn0FCudATSt8xFYPwcktAzbs5/DgDpcK6UWgUK4X+sOzp/JQOK4xMW+MmtDafbzXyrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715290080; c=relaxed/simple;
	bh=YVruU+gL+BXqUUrQiqkQwEYdVT2GuXKAdE/QuaqQGQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bVuiBQn76ht/EeYbatcXQyzaZCIiyvUpQgoJN7sTTdA21JCad/mkm846DtONa7er6sCWyEZQqe4uYuce3WjmX5Ri3h/jF99uWMfYGLRljfV9PuYVcXXgM952OfZCjsE8t01u7g5XTx3l+anVIl/wqbmC7D/1iaKYaZ8GT/BCRYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=NpRE6WFa; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="NpRE6WFa"
Date: Thu, 9 May 2024 14:27:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1715290074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SmqeenREIXLnDtPPi5h/0UPpVA3VxQ2o7DJ06oKLD54=;
	b=NpRE6WFaZ9tvfG6IJT2v+yelSrqkZkx6kMCcN2/wg1Q8St4VBZAvT0F9XdjVG/3XVgPLZE
	kHCyuIHuO8549K3uIMCfGuzQzFqspwyxc3pNFgGPFOgqxIkbFiyosT14hKX58wCC80WDGN
	QPj57LNNEIxtFKjZkRF4oU09fUWQ63s=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Xiu Jianfeng <xiujianfeng@huawei.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com, 
	hannes@cmpxchg.org, mhocko@kernel.org, roman.gushchin@linux.dev, 
	muchun.song@linux.dev, akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
	cgroups@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH -next] memcg, oom: cleanup unused memcg_oom_gfp_mask and
 memcg_oom_order
Message-ID: <qjaw4iz4ojpmhtxjgzpm7ng4f427jis2l5znagguw7fglemsdx@km5o2zvegkxn>
References: <20240509032628.1217652-1-xiujianfeng@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240509032628.1217652-1-xiujianfeng@huawei.com>
X-Migadu-Flow: FLOW_OUT

On Thu, May 09, 2024 at 03:26:28AM +0000, Xiu Jianfeng wrote:
> Since commit 857f21397f71 ("memcg, oom: remove unnecessary check in
> mem_cgroup_oom_synchronize()"), memcg_oom_gfp_mask and memcg_oom_order
> are no longer used any more.
> 
> Signed-off-by: Xiu Jianfeng <xiujianfeng@huawei.com>

Acked-by: Shakeel Butt <shakeel.butt@linux.dev>
