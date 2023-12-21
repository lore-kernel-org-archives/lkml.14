Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.65.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2CC21A17
	for <linux-kernel@vger.kernel.org>; Thu, 21 Dec 2023 09:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shingroup.cn
X-QQ-mid: bizesmtp90t1703151503t28eopg7
Received: from HX01040022.powercore.com.cn ( [223.112.234.130])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 21 Dec 2023 17:38:21 +0800 (CST)
X-QQ-SSF: 01400000000000B0B000000A0000000
X-QQ-FEAT: +ynUkgUhZJnjMoY4gOOx27e0bd5FjgOXH7xQMXerutlnj6SyN+ZyFlxFHokp/
	b+Z/WaNSkU7Nawdh3Dx3auVcz3fXEJDb3Ye37GaLRPm3qU4yQYJA/9n4hPdYZR90NJXuS7n
	Tjww8M7lMdbqKmxiCpOZ8/Ld+MbJSWhJ5X7M3xa5QsllHEw0pa/pNp4NUtrsxf7z8h/RHov
	Mn6Jeg8p4gwdDZ3STEnXmp0PIBjB7OHPrXJkQMf7V8kg9wskjJAt6D67tKgUQVSerSvLGXK
	yl7/Qsr/9FvWOZ2VoUDEOjyLXJX6EX8nv3ug+TjSrMtFgHvBpzzKJR/lfC4jY8gVrnDwuvq
	+KfivO6I/Y3Nn/O4oR/Ji42Ah/jGu+ZRBU9RUz8d0+hsGgSG2qrtankkq3W0ZutS0RNTgEb
	yiJTxRoJ/Gw=
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 12415120465097514307
From: "JiaLong.Yang" <jialong.yang@shingroup.cn>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: shenghui.qu@shingroup.cn,
	ke.zhao@shingroup.cn,
	zhijie.ren@shingroup.cn,
	"JiaLong.Yang" <jialong.yang@shingroup.cn>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] perf/arm_smmuv3: Omit the two judgements which done in framework
Date: Thu, 21 Dec 2023 17:38:01 +0800
Message-Id: <20231221093802.20612-1-jialong.yang@shingroup.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz6a-1

'event->attr.type != event->pmu->type' has been done in
core.c::perf_init_event() ,core.c::perf_event_modify_attr(), etc.

This PMU is an uncore one. The core framework has disallowed
uncore-task events. So the judgement to event->cpu < 0 is no mean.

The two judgements have been done in kernel/events/core.c

Signed-off-by: JiaLong.Yang <jialong.yang@shingroup.cn>
---
 drivers/perf/arm_smmuv3_pmu.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/perf/arm_smmuv3_pmu.c b/drivers/perf/arm_smmuv3_pmu.c
index 6303b82566f9..8ea4a3227165 100644
--- a/drivers/perf/arm_smmuv3_pmu.c
+++ b/drivers/perf/arm_smmuv3_pmu.c
@@ -401,19 +401,11 @@ static int smmu_pmu_event_init(struct perf_event *event)
 	int group_num_events = 1;
 	u16 event_id;
 
-	if (event->attr.type != event->pmu->type)
-		return -ENOENT;
-
 	if (hwc->sample_period) {
 		dev_dbg(dev, "Sampling not supported\n");
 		return -EOPNOTSUPP;
 	}
 
-	if (event->cpu < 0) {
-		dev_dbg(dev, "Per-task mode not supported\n");
-		return -EOPNOTSUPP;
-	}
-
 	/* Verify specified event is supported on this PMU */
 	event_id = get_event(event);
 	if (event_id < SMMU_PMCG_ARCH_MAX_EVENTS &&
-- 
2.25.1

