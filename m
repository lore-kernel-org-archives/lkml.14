Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 4790E16D318
	for <linux-kernel@vger.kernel.org>; Tue, 28 May 2024 14:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716904870; cv=none; b=EqEP4VdzZM9BP0U/1j/jWtMpHTp56bX+vkmz1E3V8hfiTxicPEoXArf3Y2Oze62cC8130OoXi6jBYNkjKp/34bm0q56VL0T4KVunH6uLPoFHdouL/HNQUst0IWYhe6stBdZYqSnRihm6d9+EGgpf6gMxCg6Gp3jvOLiGNzRHn3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716904870; c=relaxed/simple;
	bh=qeyOjL/52tnllRKfWs0Wm3xoH3SnaQ0fiYrsAx0iLNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gG2NEbsGiwQ3P795ZlIYaRzOfRI6puN8d3lx1U9qvwHmy+0iWvxLv1vUADpbTma9QCHA5nqkMT+w7O0hhEx8x2NBPwBp7Sfe3/i00+GPlecEMHWYsoroHg53dzwJOjURd7FQWRW+yma0BJ1z8fe80GflowyA1AWa8AfRfHzVC7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 688704 invoked by uid 1000); 28 May 2024 10:01:01 -0400
Date: Tue, 28 May 2024 10:01:01 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
Cc: paulmck@kernel.org, parri.andrea@gmail.com, will@kernel.org,
  peterz@infradead.org, boqun.feng@gmail.com, npiggin@gmail.com,
  dhowells@redhat.com, j.alglave@ucl.ac.uk, luc.maranget@inria.fr,
  akiyks@gmail.com, dlustig@nvidia.com, joel@joelfernandes.org,
  urezki@gmail.com, quic_neeraju@quicinc.com, frederic@kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [RFC][PATCH 4/4] tools/memory-model: Distinguish between
 syntactic and semantic tags
Message-ID: <f9ea1b36-b345-4c94-a19f-4fa124d8f7c3@rowland.harvard.edu>
References: <20240527152253.195956-1-jonas.oberhauser@huaweicloud.com>
 <20240527152253.195956-5-jonas.oberhauser@huaweicloud.com>
 <5ce0c8a3-bd9c-475a-9427-7edef47a90f2@rowland.harvard.edu>
 <dbcecf28-98e8-4f7e-957b-e73a4d811051@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dbcecf28-98e8-4f7e-957b-e73a4d811051@huaweicloud.com>

On Tue, May 28, 2024 at 02:49:38PM +0200, Jonas Oberhauser wrote:
> > > +let Mb = MB \ FailedRMW
> > > >>   (* Compute marked and plain memory accesses *)
> > > -let Marked = (~M) | IW | Once | Release | Acquire | domain(rmw) | range(rmw) |
> > > +let Marked = (~M) | IW | ONCE | RELEASE | ACQUIRE | MB | domain(rmw) | range(rmw) |
> > 
> > The new MB term isn't needed, because MB tags on memory accesses are
> > filtered out unless the access also belongs to domain(rmw) | range(rmw).
> > 
> > Alan
> 
> 
> Thanks for all the notes.
> I think on this one is needed though under the assumption that herd7 would
> no longer know internally to replace the MB with ONCE in case
> of failure.

And I was wrong because failed RMW instructions are filtered out of Mb, 
not out of MB.

Hmmm, this raises another question: Shouldn't the R event for a failed 
cmpxchg_release count as marked?  At the moment it's not clear how such 
events will be tagged.  Perhaps the best thing to do is add RMW to 
this list, which would make domain(rmw) and range(rmw) unnecessary.

And then we probably don't need to keep MB -- unless smp_store_mb()'s 
definition ever gets reduced to __store{MB}(X,V).

Alan
