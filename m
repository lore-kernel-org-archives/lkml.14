Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2ACEEAC7
	for <linux-kernel@vger.kernel.org>; Fri, 12 Jul 2024 14:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720795977; cv=none; b=feq7uDxM4nES2xdZawu6AdO1lQd+c0YeokTcXEpqVvmcfVXAT742yOKDR6o0rFsqPNbmzGBvVeG3DN9E1xvNLd9p3+FO149+zQ8PZFZRSZ2lKpFiezXjt4W3k32Tl71Tf8xMXouw00j8iguD/7jHeVNSjwRQBuf3KbLasm2W3pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720795977; c=relaxed/simple;
	bh=1ijLP0HhgFE16gV1CN7tTDt7cJc4bDrFZR0LJrpbdOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WtCcP6zUf32nDQwA42qQBwCwL5M07NlUdm5FquF4vCK+twbLcl6mrZ3Z6cDjGWS3RGn9bx4byHnzV2lkG9qxAOSgyH3scF7KkxBdPq7LoMehe2/wOVq4I8f66fFBn6ZGgkwqVAypvb+qV7prWUmQi6AJ/Olq+ptF8Id39UVvSjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=AJX/Gq2T; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="AJX/Gq2T"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=eG8rBNU3He2qB+Tm9pn4g7s4F8KvjEdgg/u3rv+d7sQ=; b=AJX/Gq2Ttzdv05KJwvnbOKHzF2
	YwKz6c+eDoIfg7BGS+oT/2YmvGEc6ZWSoB64fGa9qycFj8txm18ffdaSrmm+BvxRu5cMZPCB5o6YI
	Nu4oKqDifnQFsHuAAal4ZNrM6PIOYvAYBhQfYSiyYigWIXNjdaBaQPbbNs/uJthWOsF1cEidLNodX
	rNSqlDslhs2UjO078ZgwO/IuDf9l+CUXuAfAEFSu5s1/kW+qs/pMgZsB3/Jgm/uKSvGjf7g2cbvIi
	h0fWNly55WOMyipMMLZg0yxGAX0w8G7xL8CM0h1d6h8HgQOTylg3dHMQaXGFgzm+WMg5Wx8DfeBeb
	d2BTm7GA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSHdg-0000000CZQU-11Oq;
	Fri, 12 Jul 2024 14:52:48 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id A898530050D; Fri, 12 Jul 2024 16:52:47 +0200 (CEST)
Date: Fri, 12 Jul 2024 16:52:47 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: John Stultz <jstultz@google.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Joel Fernandes <joelaf@google.com>,
	Qais Yousef <qyousef@layalina.io>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Zimuzo Ezeozue <zezeozue@google.com>,
	Youssef Esmat <youssefesmat@google.com>,
	Mel Gorman <mgorman@suse.de>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Metin Kaya <Metin.Kaya@arm.com>,
	Xuewen Yan <xuewen.yan94@gmail.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>, kernel-team@android.com,
	Davidlohr Bueso <dave@stgolabs.net>
Subject: Re: [PATCH v11 1/7] locking/mutex: Remove wakeups from under
 mutex::wait_lock
Message-ID: <20240712145247.GL27299@noisy.programming.kicks-ass.net>
References: <20240709203213.799070-1-jstultz@google.com>
 <20240709203213.799070-2-jstultz@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240709203213.799070-2-jstultz@google.com>

On Tue, Jul 09, 2024 at 01:31:44PM -0700, John Stultz wrote:
> @@ -405,8 +409,10 @@ ww_mutex_set_context_fastpath(struct ww_mutex *lock, struct ww_acquire_ctx *ctx)
>  	 * die or wound us.
>  	 */
>  	lock_wait_lock(&lock->base);
> -	__ww_mutex_check_waiters(&lock->base, ctx);
> +	__ww_mutex_check_waiters(&lock->base, ctx, &wake_q);

  preempt_disable()

>  	unlock_wait_lock(&lock->base);
> +
> +	wake_up_q(&wake_q);

  preempt_enable();

>  }
>  
>  static __always_inline int
