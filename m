Received: from mail.nfschina.com (unknown [42.101.60.195])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 9C9555027F
	for <linux-kernel@vger.kernel.org>; Tue, 28 May 2024 06:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716878799; cv=none; b=uhPCHNodm1gjLZ+Mkwx0dpaWOpShheYJU3XPbEOdvCJd/P24uTtxmZ126TOyoK5IxkX79qcEb5pfoJUJeJB50zCYj+4v6f/2gdmbM1+fsT6NPSQ9Z2fmy4GEsJ8hx/Y0LS7c3qB18GFRgklrMZbk3bHuSBERpom65AR9PD58Fvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716878799; c=relaxed/simple;
	bh=nMWPmJZVqC4aT0whXmkWZmkHWM8YxD+zyIjlp7n+mwc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=fEY0DSIigIoN6QD1efeFrGLMR89yGqpN9W0D891Gf2gXrZ6QtrXBb5WOAL5f5kzPhaBZCiYCc3HB6SLyn0YIH9TZ/0LLBm2jtJtQazZf3dqgz6guNTt8sNG+u/KulYpxrLs3ha8uUS9oPOG/UCzXKbwPGDgmuz1k5KysR8CxRP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from localhost.localdomain (unknown [219.141.250.2])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id D9564621BCF3F;
	Tue, 28 May 2024 14:46:09 +0800 (CST)
X-MD-Sfrom: kunyu@nfschina.com
X-MD-SrcIP: 219.141.250.2
From: kunyu <kunyu@nfschina.com>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	bristot@redhat.com,
	vschneid@redhat.com
Cc: linux-kernel@vger.kernel.org,
	kunyu <kunyu@nfschina.com>
Subject: [PATCH] =?UTF-8?q?sched:=20core:=20Remove=20unnecessary=20?= =?UTF-8?q?=E2=80=98NULL=E2=80=99=20values=20from=20pending?=
Date: Tue, 28 May 2024 14:45:32 +0800
Message-Id: <20240528064532.42532-1-kunyu@nfschina.com>
X-Mailer: git-send-email 2.18.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

pending is assigned first, so it does not need to initialize the
assignment.

Signed-off-by: kunyu <kunyu@nfschina.com>
---
 kernel/sched/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index bcf2c4cc0522..e32fea8f5830 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -2969,7 +2969,7 @@ static int affine_move_task(struct rq *rq, struct task_struct *p, struct rq_flag
 	__releases(rq->lock)
 	__releases(p->pi_lock)
 {
-	struct set_affinity_pending my_pending = { }, *pending = NULL;
+	struct set_affinity_pending my_pending = { }, *pending;
 	bool stop_pending, complete = false;
 
 	/* Can the task run on the task's current CPU? If so, we're done */
-- 
2.18.2

