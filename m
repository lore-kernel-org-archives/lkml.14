Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E0028DDA
	for <linux-kernel@vger.kernel.org>; Fri,  5 Jan 2024 14:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="SoMPbgil"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=JF1aSc64LWeupLUmhqppZtU612Ye+is04mh5J5L6T7M=;
  b=SoMPbgil+i1vrzct20kWFea6a+pjeq/rHQBX4tfAe/q0vvX5qTIl7HvW
   al6jfonSRfWTHrZBgASjINm0uWP1Yf4CZ8YQQRlNmsRM04pImH0oIPGFR
   E8TNztNvYlp8MgjLJQe+0dOwh4KmNVl7JESllOr7x8yyMpZVK1cggdYTG
   E=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.04,334,1695679200"; 
   d="scan'208";a="145104196"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2024 15:51:50 +0100
Date: Fri, 5 Jan 2024 15:51:50 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Vincent Guittot <vincent.guittot@linaro.org>
cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
    Dietmar Eggemann <dietmar.eggemann@arm.com>, Mel Gorman <mgorman@suse.de>, 
    linux-kernel@vger.kernel.org
Subject: Re: EEVDF and NUMA balancing
In-Reply-To: <CAKfTPtCAcHuzhcDvry6_nH2K29wc-LEo2yOi-J-mnZkwMvGDbw@mail.gmail.com>
Message-ID: <cfae246d-9383-59d-ee5b-81ea3dd0a795@inria.fr>
References: <alpine.DEB.2.22.394.2310032059060.3220@hadrien> <b8ab29de-1775-46e-dd75-cdf98be8b0@inria.fr> <CAKfTPtBhWwk9sf9F1=KwubiAWFDC2A9ZT-SSJ+tgFxme1cFmYA@mail.gmail.com> <alpine.DEB.2.22.394.2312182302310.3361@hadrien>
 <CAKfTPtALEFtrapi3Kk97KLGQN4259eEQEwwftVUK4RG42Vgoyw@mail.gmail.com> <98b3df1-79b7-836f-e334-afbdd594b55@inria.fr> <CAKfTPtCRN_eWgVdK2-h6E_ifJKwwJEtMjeNjB=5DXZFWyBS+tQ@mail.gmail.com> <93112fbe-30be-eab8-427c-5d4670a0f94e@inria.fr>
 <CAKfTPtAeFvrZxApK3RruWwCjMxbQvOkU+_YgZSo4QPT_AD6FxA@mail.gmail.com> <9dc451b5-9dd8-89f2-1c9c-7c358faeaad@inria.fr> <CAKfTPtDCsLnDnVje9maP5s-L7TbtSu4CvF19xHOxbkvSNd7vZg@mail.gmail.com> <2359ab5-4556-1a73-9255-3fcf2fc57ec@inria.fr> <6618dcfa-a42f-567c-2a9d-a76786683b29@inria.fr>
 <CAKfTPtDrULyOB9+RhjoPfCpHKVhx5kRf6dq79DSE6jZgsEairw@mail.gmail.com> <edbd8ecd-148c-b366-fd46-3531dec39d49@inria.fr> <cecfd395-f067-99e1-bdd2-fec2ebc3db3@inria.fr> <CAKfTPtCAcHuzhcDvry6_nH2K29wc-LEo2yOi-J-mnZkwMvGDbw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

> Your system is calling the polling mode and not the default
> cpuidle_idle_call() ? This could explain why I don't see such problem
> on my system which doesn't have polling
>
> Are you forcing the use of polling mode ?
> If yes, could you check that this problem disappears without forcing
> polling mode ?

I expanded the code in do_idle to:

                if (cpu_idle_force_poll) { c1++;
                        tick_nohz_idle_restart_tick();
                        cpu_idle_poll();
                } else if (tick_check_broadcast_expired()) { c2++;
                        tick_nohz_idle_restart_tick();
                        cpu_idle_poll();
                } else { c3++;
                        cpuidle_idle_call();
                }

Later, I have:

        trace_printk("force poll: %d: c1: %d, c2: %d, c3: %d\n",cpu_idle_force_poll, c1, c2, c3);
        flush_smp_call_function_queue();
        schedule_idle();

force poll, c1 and c2 are always 0, and c3 is always some non-zero value.
Sometimes small (often 1), and sometimes large (304 or 305).

So I don't think it's calling cpu_idle_poll().

x86 has TIF_POLLING_NRFLAG defined to be a non zero value, which I think
is sufficient to cause the issue.

julia
