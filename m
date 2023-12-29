Received: from mail115-171.sinamail.sina.com.cn (mail115-171.sinamail.sina.com.cn [218.30.115.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42CD10A25
	for <linux-kernel@vger.kernel.org>; Fri, 29 Dec 2023 11:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([113.88.48.91])
	by sina.com (172.16.235.25) with ESMTP
	id 658EA744000068AB; Fri, 29 Dec 2023 19:02:31 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 54383334210437
X-SMAIL-UIID: 36E1B2CE68CB4074B6B6069F7C8FF0C1-20231229-190231-1
From: Hillf Danton <hdanton@sina.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Pierre Gondois <pierre.gondois@arm.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] sched/fair: Check a task has a fitting cpu when updating misfit
Date: Fri, 29 Dec 2023 19:02:18 +0800
Message-Id: <20231229110218.1928-1-hdanton@sina.com>
In-Reply-To: <20231212154056.626978-1-qyousef@layalina.io>
References: <20231212154056.626978-1-qyousef@layalina.io>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 12/12/23 16:40 Qais Yousef <qais.yousef@arm.com>
> 
> If a misfit task is affined to a subset of the possible cpus, we need to
> verify that one of these cpus can fit it. Otherwise the load balancer
> code will continuously trigger needlessly leading the balance_interval
> to increase in return and eventually end up with a situation where real
> imbalances take a long time to address because of this impossible
> imbalance situation.
> 
> This can happen in Android world where it's common for background tasks
> to be restricted to little cores.

What sense could you make by forcing a pill down through Peter's throat
to fix the insane userspace behavior that blindly drives load balance mad
by binding background tasks to littles cores? Is eevdf failing to handle
your background tasks?
