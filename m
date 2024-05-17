Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A39CF18651
	for <linux-kernel@vger.kernel.org>; Fri, 17 May 2024 12:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715948289; cv=none; b=oyg/v2HAs3snVL3g9yMGEfiw2SDwWAokMe3+sFYHukxM7i4ymu359wyI5SJFRK8SsGeNnbNlclWAS/Yj+FBj0MARKCecVl9PD/W/1IxTRnNqF9nqT5jLvqXjJiCUxqzmD82wBZsC1kOc3/dU+waOClNl2tNEmsFcaMY0UmEEtC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715948289; c=relaxed/simple;
	bh=f0gaVWT5snPFYZw8tW/tFNWcykyJ1pBRVQcUhIEnkQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eaMn8bfi8K4eRaFtCiAZpoOwE1UrqkDNwrEVbxCrsjqu4fy5pbqlEkD7NkGJhjcjhv9FYZGUalpjdouH+egpaLWTVHLOjo4BFD+s7Ge+pMvjMz/rwT3gYhwRKOo11oNfAqC6i1ISSvtnwWILTLxk6Vg0q87s8PyGvHNgLednIKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 16DD21477;
	Fri, 17 May 2024 05:18:31 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 955213F7A6;
	Fri, 17 May 2024 05:18:05 -0700 (PDT)
Date: Fri, 17 May 2024 14:17:59 +0200
From: Mark Rutland <mark.rutland@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	LKML <linux-kernel@vger.kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Greg Thelen <gthelen@google.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Tuan Phan <tuanphan@os.amperecomputing.com>
Subject: Re: [PATCH] perf/arm-dmc620: Fix lockdep assert in ->event_init()
Message-ID: <ZkdK9xe3jsc3OxOF@J2N7QTR9R3>
References: <20240514180050.182454-1-namhyung@kernel.org>
 <20240517120234.GA32598@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240517120234.GA32598@willie-the-truck>

On Fri, May 17, 2024 at 01:02:34PM +0100, Will Deacon wrote:
> On Tue, May 14, 2024 at 11:00:50AM -0700, Namhyung Kim wrote:
> > for_each_sibling_event() checks leader's ctx but it doesn't have the ctx
> > yet if it's the leader.  Like in perf_event_validate_size(), we should
> > skip checking siblings in that case.
> > 
> > Fixes: f3c0eba287049 ("perf: Add a few assertions")
> > Reported-by: Greg Thelen <gthelen@google.com>
> > Cc: Robin Murphy <robin.murphy@arm.com>
> > Cc: Tuan Phan <tuanphan@os.amperecomputing.com>
> > Signed-off-by: Namhyung Kim <namhyung@kernel.org>
> > ---
> >  drivers/perf/arm_dmc620_pmu.c | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/perf/arm_dmc620_pmu.c b/drivers/perf/arm_dmc620_pmu.c
> > index 8a81be2dd5ec..88c17c1d6d49 100644
> > --- a/drivers/perf/arm_dmc620_pmu.c
> > +++ b/drivers/perf/arm_dmc620_pmu.c
> > @@ -542,12 +542,16 @@ static int dmc620_pmu_event_init(struct perf_event *event)
> >  	if (event->cpu < 0)
> >  		return -EINVAL;
> >  
> > +	hwc->idx = -1;
> > +
> > +	if (event->group_leader == event)
> > +		return 0;
> > +
> >  	/*
> >  	 * We can't atomically disable all HW counters so only one event allowed,
> >  	 * although software events are acceptable.
> >  	 */
> > -	if (event->group_leader != event &&
> > -			!is_software_event(event->group_leader))
> > +	if (!is_software_event(event->group_leader))
> >  		return -EINVAL;
> >  
> >  	for_each_sibling_event(sibling, event->group_leader) {
> > @@ -556,7 +560,6 @@ static int dmc620_pmu_event_init(struct perf_event *event)
> >  			return -EINVAL;
> >  	}
> >  
> > -	hwc->idx = -1;
> >  	return 0;
> >  }
> 
> Thanks, I'll pick this up, although Mark reckoned he'd found some other
> issues over at:
> 
> https://lore.kernel.org/r/Zg0l642PgQ7T3a8Z@FVFF77S0Q05N
> 
> but didn't elaborate on what exactly he'd found :/

Sorry; what I was referring to was that some drivers (including this
one) also forgot to validate that the group size could actually fit on
the PMU, which we're *supposed* to check, but if we fail to do so the
only fallout is that events won't count and we waste a bit of time
trying to schedule events unnecessarily.

For this patch as-is:

Acked-by: Mark Rutland <mark.rutland@arm.com>

... and I'll try to take a look at the rest when I'm back in the UK.

Mark.
