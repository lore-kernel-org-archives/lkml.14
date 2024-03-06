Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 0F4E313BAD5
	for <linux-kernel@vger.kernel.org>; Wed,  6 Mar 2024 18:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709749762; cv=none; b=jghHCPKpoZBMAzumg6//mIAdUCRfwrVZYFWf1P3AZqeNBvcp6Eyp78M03KR3Wy8SEACaSidQjXtv8IUMrwffhnn5Ofhm/7FchNgF8EO8F5PxaLbUn3MkPsQ9n0WuS905hz0qRP3cjsPVbhWhmuInjVIZtD4H8tkRWO2/OncXQ5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709749762; c=relaxed/simple;
	bh=dvxdswckegKPT2ix/+RQU7uUQfyieyXa0TGvSNHnaXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J+VkliXAfE2sXEJyAQUApQbGMXA14TOgDOTXj/C1P2MAklp5AU6eJZGxUpMOahF9p8F6INTPA++RV5A42S6vDjUkajbSLPIDY181Fvu3OFmCtjRuJ+V3x6EGTfX7bbGNyQVdF+IOcr/UEAc+9RRrbgozkgSLmA4rGZ/YP6xHTHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 197785 invoked by uid 1000); 6 Mar 2024 13:29:12 -0500
Date: Wed, 6 Mar 2024 13:29:12 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Andrea Parri <parri.andrea@gmail.com>
Cc: Kenneth-Lee-2012@foxmail.com, linux-kernel@vger.kernel.org,
  paulmck@kernel.org
Subject: Re: Question about PB rule of LKMM
Message-ID: <e05fa6a9-c810-46cb-b033-b91ae7a5c382@rowland.harvard.edu>
References: <tencent_C5266B7D6F024A916BCA7833FDEA94A74309@qq.com>
 <Zedd18wiAkK68Lzr@andrea>
 <tencent_744E0AF832049C200F96FD6582D5114D7F0A@qq.com>
 <ZeipiSVLR01jmM6b@andrea>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZeipiSVLR01jmM6b@andrea>

On Wed, Mar 06, 2024 at 06:36:09PM +0100, Andrea Parri wrote:
> > > In this sense, the propagation rule (like other "acyclicity"-constraints of
> > > the LKMM) expresses "temporal ordering", and any pb-link is (by definition)
> > > an "execute-before"-link.  The file explanation.txt can provide additional
> > > context/information, based on the (informal) operational model described in
> > > that file, about this matter.
> > 
> > So it is just a rule in the sence of mathematics? I think it would be better
> > if there were some explaination in the explaination file. It is
> > descripted in nature language, the reader might not notify it is just a
> > mathematics rule. And you cannot say an action executes before another
> > because they are in the pb link. It becomes a cycling in logic...

This _is_ described in the explanation.txt file.

The first paragraph in the section named "THE PROPAGATES-BEFORE 
RELATION: pb" mentions the mathematical rule:

---------------------------------------------------------------------
The propagates-before (pb) relation capitalizes on the special
features of strong fences.  It links two events E and F whenever some
store is coherence-later than E and propagates to every CPU and to RAM
before F executes.  The formal definition requires that E be linked to
F via a coe or fre link, an arbitrary number of cumul-fences, an
optional rfe link, a strong fence, and an arbitrary number of hb
links.  Let's see how this definition works out.
---------------------------------------------------------------------

Later on, the file includes this paragraph, which answers the question 
you were asking:

---------------------------------------------------------------------
The existence of a pb link from E to F implies that E must execute
before F.  To see why, suppose that F executed first.  Then W would
have propagated to E's CPU before E executed.  If E was a store, the
memory subsystem would then be forced to make E come after W in the
coherence order, contradicting the fact that E ->coe W.  If E was a
load, the memory subsystem would then be forced to satisfy E's read
request with the value stored by W or an even later store,
contradicting the fact that E ->fre W.
---------------------------------------------------------------------

Alan Stern

> I think you're on to something, explaining mathematical axioms or rules has
> never been an easy task AFAIU.  ;-)  (and that's why feedback is welcome)
> 
> The remark could be to continue to consider such rules "generalizations" of
> properties met by several hardware models or other specific contexts, rather
> than (mere) logically-derived facts.
> 
>   Andrea
