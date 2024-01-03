Received: from wxsgout04.xfusion.com (wxsgout03.xfusion.com [36.139.52.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FA0171C4
	for <linux-kernel@vger.kernel.org>; Wed,  3 Jan 2024 04:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xfusion.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xfusion.com
Received: from wuxshcsitd00600.xfusion.com (unknown [10.32.133.213])
	by wxsgout04.xfusion.com (SkyGuard) with ESMTPS id 4T4bw92tcmzB13y6;
	Wed,  3 Jan 2024 12:14:49 +0800 (CST)
Received: from localhost (10.82.147.3) by wuxshcsitd00600.xfusion.com
 (10.32.133.213) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 3 Jan
 2024 12:18:31 +0800
Date: Wed, 3 Jan 2024 12:18:31 +0800
From: Wang Jinchao <wangjinchao@xfusion.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel
 Gorman <mgorman@suse.de>, Daniel Bristot de Oliveira <bristot@redhat.com>,
	Valentin Schneider <vschneid@redhat.com>, <linux-kernel@vger.kernel.org>
CC: <stone.xulei@xfusion.com>, <wangjinchao@xfusion.com>
Subject: [PATCH] sched/fair: Optimize min_vruntime update on unchanged
 vruntime
Message-ID: <202401031216+0800-wangjinchao@xfusion.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: wuxshcsitd00601.xfusion.com (10.32.135.241) To
 wuxshcsitd00600.xfusion.com (10.32.133.213)

When (!(curr && curr->on_rq) && !se) is true, there is no need
to update min_vruntime.
Simplify the if-else logic accordingly.

Signed-off-by: Wang Jinchao <wangjinchao@xfusion.com>
---
 kernel/sched/fair.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index d7a3c63a2171..a4afdeee515d 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -755,21 +755,16 @@ static void update_min_vruntime(struct cfs_rq *cfs_rq)
 	struct sched_entity *se = __pick_first_entity(cfs_rq);
 	struct sched_entity *curr = cfs_rq->curr;
 
-	u64 vruntime = cfs_rq->min_vruntime;
+	u64 vruntime = U64_MAX;
 
-	if (curr) {
-		if (curr->on_rq)
-			vruntime = curr->vruntime;
-		else
-			curr = NULL;
-	}
+	if (curr && curr->on_rq)
+		vruntime = curr->vruntime;
+	if (se)
+		vruntime = min_vruntime(vruntime, se->vruntime);
 
-	if (se) {
-		if (!curr)
-			vruntime = se->vruntime;
-		else
-			vruntime = min_vruntime(vruntime, se->vruntime);
-	}
+	/* no need to update if vruntime is unchanged */
+	if (vruntime == U64_MAX)
+		return;
 
 	/* ensure we never gain time by being placed backwards. */
 	u64_u32_store(cfs_rq->min_vruntime,
-- 
2.40.0

