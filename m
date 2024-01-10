Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A954D109
	for <linux-kernel@vger.kernel.org>; Wed, 10 Jan 2024 17:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="jQnQ7Blj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Tlm8HNK9gWUhS12CM9y1YxeQQner0p1cxWc16J5vCuM=;
  b=jQnQ7BljNKzFV9iwU0QVMeF3NaHzYfpXf2ajwnqb91fPu0iflqGeBTGS
   XdoXbzf2R3YS726GJ75Y6dveIww0jYpPdlEFOTDTyvHu1T80GfKstpwfm
   +YbKdvfKH28Rro1iyd6li9g++r+s9L2Y8W0O7yUEdc5MHVKVRdV3kR2LT
   w=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=keisuke.nishimura@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.04,184,1695679200"; 
   d="scan'208";a="145952116"
Received: from dt-aponte.paris.inria.fr (HELO [128.93.67.66]) ([128.93.67.66])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 18:57:25 +0100
Message-ID: <8d9e076c-8505-4538-83f5-506ccf62f7a9@inria.fr>
Date: Wed, 10 Jan 2024 18:57:24 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2 RESEND] sched/fair: take into account scheduling
 domain in select_idle_smt()
Content-Language: en-US
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 linux-kernel@vger.kernel.org, Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 Julia Lawall <julia.lawall@inria.fr>, Xunlei Pang
 <xlpang@linux.alibaba.com>, Abel Wu <wuyun.abel@bytedance.com>
References: <20240110131707.437301-1-keisuke.nishimura@inria.fr>
 <CAKfTPtCgqkUUtWMknyHrNeb994V_L4T9bxV9A=bUXCQu-+S1SQ@mail.gmail.com>
From: Keisuke Nishimura <keisuke.nishimura@inria.fr>
In-Reply-To: <CAKfTPtCgqkUUtWMknyHrNeb994V_L4T9bxV9A=bUXCQu-+S1SQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>>
>> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
>> index 533547e3c90a..66457d4b8965 100644
>> --- a/kernel/sched/fair.c
>> +++ b/kernel/sched/fair.c
>> @@ -7311,13 +7311,19 @@ static int select_idle_core(struct task_struct *p, int core, struct cpumask *cpu
>>   /*
>>    * Scan the local SMT mask for idle CPUs.
>>    */
>> -static int select_idle_smt(struct task_struct *p, int target)
>> +static int select_idle_smt(struct task_struct *p, struct sched_domain *sd, int target)
>>   {
>>          int cpu;
>>
>>          for_each_cpu_and(cpu, cpu_smt_mask(target), p->cpus_ptr) {
>>                  if (cpu == target)
>>                          continue;
>> +               /*
>> +                * Check if the CPU is in the LLC scheduling domain of @target.
>> +                * Due to isolcpus, there is no guarantee that all the siblings are in the domain.
>> +                */
>> +               if (!cpumask_test_cpu(cpu, sched_domain_span(sd)))
> 
> commit df3cb4ea1fb6 ("sched/fair: Fix wrong cpu selecting from isolated domain")
> also checked if (!cpumask_test_cpu(cpu, p->cpus_ptr) ||
> 
> Why didn't you also re-add this test ?
> 
> 

Thank you for your comment. This is because the iterator "for_each_cpu_and(cpu, 
cpu_smt_mask(target), p->cpus_ptr)" ensures that cpu is included in p->cpus_ptr.

The iterator has changed. FYI, here is the change made in commit df3cb4ea1fb6:

         for_each_cpu(cpu, cpu_smt_mask(target)) {
-               if (!cpumask_test_cpu(cpu, p->cpus_ptr))
+               if (!cpumask_test_cpu(cpu, p->cpus_ptr) ||
+                   !cpumask_test_cpu(cpu, sched_domain_span(sd)))
                         continue;
                 if (available_idle_cpu(cpu) || sched_idle_cpu(cpu))

best,
Keisuke

