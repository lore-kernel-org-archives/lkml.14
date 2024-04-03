Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD1B614AD12
	for <linux-kernel@vger.kernel.org>; Wed,  3 Apr 2024 15:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712156812; cv=none; b=awX1nzxY90tSVmSzEu2ur8h3sra5G81SVfnzmPf9gxo4VDD1Kr9B/Yc/uEIEzFKkTNjiSL/5eSTLpoeitBiRasVq+hA6lMeUS20wUmYTvRTxIA3KE3/e++iqieSKIlarIfV4b0rg8j8+vgzeZuODM4ouiUNXe0x/uYnkqIPzZtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712156812; c=relaxed/simple;
	bh=KP3KQkWwmKSjgJr+k2KTuvgcjSIjuAYMNmf/QgiXrPU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=brImyySHLoX3Qp84yqT5kfX/wFTsTtxdIXCGwcXnISxRIKiSX48TZ8e1jDBujL5iznENCSZcP7T4CZrsdivkNPTlIVHl0b6WNV7yyrLdlP0HcgehkoAcQsMr4hPkYby7Ynj0/19DmtOwQMvdJyPNei3lH//FlSxgwCJA89Tc6V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5301F168F;
	Wed,  3 Apr 2024 08:07:21 -0700 (PDT)
Received: from e126645.arm.com (unknown [10.57.74.15])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B37DA3F7B4;
	Wed,  3 Apr 2024 08:06:45 -0700 (PDT)
From: Pierre Gondois <pierre.gondois@arm.com>
To: linux-kernel@vger.kernel.org
Cc: Aaron Lu <aaron.lu@intel.com>,
	Rui Zhang <rui.zhang@intel.com>,
	Pierre Gondois <pierre.gondois@arm.com>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Daniel Bristot de Oliveira <bristot@redhat.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Tejun Heo <tj@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Waiman Long <longman@redhat.com>
Subject: [PATCH 5/7] sched/topology: Remove CPUs with NULL sd from HKR_TYPE_SCHED mask
Date: Wed,  3 Apr 2024 17:05:37 +0200
Message-Id: <20240403150543.2793354-6-pierre.gondois@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240403150543.2793354-1-pierre.gondois@arm.com>
References: <20240403150543.2793354-1-pierre.gondois@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Upon attaching a NULL sched domain to a CPU, remove the CPU from
the HKR_TYPE_SCHED isolation mask. CPUs present in this mask
are prevented from being added to the fair.c variables:
- nohz.idle_cpus_mask
- nohz.nr_cpus

Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>
---
 kernel/sched/topology.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 63aecd2a7a9f..b4fc212ccfb0 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -775,6 +775,11 @@ cpu_attach_domain(struct sched_domain *sd, struct root_domain *rd, int cpu)
 
 	sched_domain_debug(sd, cpu);
 
+	if (sd)
+		housekeeping_runtime_set_cpu(cpu, HKR_TYPE_SCHED);
+	else
+		housekeeping_runtime_clear_cpu(cpu, HKR_TYPE_SCHED);
+
 	rq_attach_root(rq, rd);
 	tmp = rq->sd;
 	rcu_assign_pointer(rq->sd, sd);
-- 
2.25.1

