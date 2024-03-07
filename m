Received: from mail-out.aladdin-rd.ru (mail-out.aladdin-rd.ru [91.199.251.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A9212BE84
	for <linux-kernel@vger.kernel.org>; Thu,  7 Mar 2024 13:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.199.251.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709817855; cv=none; b=UlYJUm5zrVm1Ycq2zRrKBhuiJd43iQnRS/UvpRjumkFZMJhjMUOu+754+sJpwl8x7oq3yo91bXIlwDwO98sa53i6ZEI3lxn4tT9ZhBhDxx/lrTpzqEpPCeaR3Wp/xbFHMAVxrY/+Golfji7KF1NtgqBTMjGkGx82O5PGv4kx7u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709817855; c=relaxed/simple;
	bh=FWwSJ5IJGCnInO6ndAopN+p5PC7Rv8Ze9UwyQh7OHdQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=At36mOjGfnGETIYTOto0g5FpFg0TxRetBhQpsAwr8dG4wxN9gYZKqf7WheGKXLrhowvXXUPUprIX1nokdKHewi2g2Gmm88yMS2qWn7BzbPN7vDM5ltVGEMbaB0rrFgMy9UqpboYFeePe6IvoOhOb6xk8ql3wJa8ZaD869uWT1f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aladdin.ru; spf=pass smtp.mailfrom=aladdin.ru; arc=none smtp.client-ip=91.199.251.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aladdin.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aladdin.ru
From: Daniil Dulov <d.dulov@aladdin.ru>
To: Ingo Molnar <mingo@redhat.com>
CC: Daniil Dulov <d.dulov@aladdin.ru>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel
 Gorman <mgorman@suse.de>, Daniel Bristot de Oliveira <bristot@redhat.com>,
	Valentin Schneider <vschneid@redhat.com>, <linux-kernel@vger.kernel.org>,
	<lvc-project@linuxtesting.org>
Subject: [PATCH] sched/topology: Check return value of zalloc_cpumask_var()
Date: Thu, 7 Mar 2024 16:23:40 +0300
Message-ID: <20240307132340.13192-1-d.dulov@aladdin.ru>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EXCH-2016-04.aladdin.ru (192.168.1.104) To
 EXCH-2016-01.aladdin.ru (192.168.1.101)

zalloc_cpumask_var() returns false if mask was not allocated.
So, let's check if cpu masks are allocated successfully.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 8d5dc5126bb2 ("sched/topology: Small cleanup")
Signed-off-by: Daniil Dulov <d.dulov@aladdin.ru>
---
 kernel/sched/topology.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 10d1391e7416..2df98ffdfe16 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -2600,9 +2600,10 @@ int __init sched_init_domains(const struct cpumask *cpu_map)
 {
 	int err;
 
-	zalloc_cpumask_var(&sched_domains_tmpmask, GFP_KERNEL);
-	zalloc_cpumask_var(&sched_domains_tmpmask2, GFP_KERNEL);
-	zalloc_cpumask_var(&fallback_doms, GFP_KERNEL);
+	if (!zalloc_cpumask_var(&sched_domains_tmpmask, GFP_KERNEL) ||
+	    !zalloc_cpumask_var(&sched_domains_tmpmask2, GFP_KERNEL) ||
+	    !zalloc_cpumask_var(&fallback_doms, GFP_KERNEL))
+		return -ENOMEM;
 
 	arch_update_cpu_topology();
 	asym_cpu_capacity_scan();
-- 
2.25.1

