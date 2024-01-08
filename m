Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A156E54F82
	for <linux-kernel@vger.kernel.org>; Mon,  8 Jan 2024 18:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77755C15;
	Mon,  8 Jan 2024 10:52:05 -0800 (PST)
Received: from pluto.. (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8E7653F73F;
	Mon,  8 Jan 2024 10:51:18 -0800 (PST)
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: sudeep.holla@arm.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH 1/2] firmware: arm_scmi: Use xa_insert() to store opps
Date: Mon,  8 Jan 2024 18:50:49 +0000
Message-ID: <20240108185050.1628687-1-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When storing opps by level or index use xa_insert() instead of xa_store()
and add error-checking to spot bad duplicates indexes possibly wrongly
provided by the platform firmware.

Fixes: 31c7c1397a33 ("firmware: arm_scmi: Add v3.2 perf level indexing mode support")
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/perf.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/arm_scmi/perf.c b/drivers/firmware/arm_scmi/perf.c
index cd6b7ea82436..7fd49ea68168 100644
--- a/drivers/firmware/arm_scmi/perf.c
+++ b/drivers/firmware/arm_scmi/perf.c
@@ -350,8 +350,8 @@ process_response_opp(struct scmi_opp *opp, unsigned int loop_idx,
 }
 
 static inline void
-process_response_opp_v4(struct perf_dom_info *dom, struct scmi_opp *opp,
-			unsigned int loop_idx,
+process_response_opp_v4(struct device *dev, struct perf_dom_info *dom,
+			struct scmi_opp *opp, unsigned int loop_idx,
 			const struct scmi_msg_resp_perf_describe_levels_v4 *r)
 {
 	opp->perf = le32_to_cpu(r->opp[loop_idx].perf_val);
@@ -362,10 +362,23 @@ process_response_opp_v4(struct perf_dom_info *dom, struct scmi_opp *opp,
 	/* Note that PERF v4 reports always five 32-bit words */
 	opp->indicative_freq = le32_to_cpu(r->opp[loop_idx].indicative_freq);
 	if (dom->level_indexing_mode) {
+		int ret;
+
 		opp->level_index = le32_to_cpu(r->opp[loop_idx].level_index);
 
-		xa_store(&dom->opps_by_idx, opp->level_index, opp, GFP_KERNEL);
-		xa_store(&dom->opps_by_lvl, opp->perf, opp, GFP_KERNEL);
+		ret = xa_insert(&dom->opps_by_idx, opp->level_index, opp,
+				GFP_KERNEL);
+		if (ret)
+			dev_warn(dev,
+				 "Failed to add opps_by_idx at %d - ret:%d\n",
+				 opp->level_index, ret);
+
+		ret = xa_insert(&dom->opps_by_lvl, opp->perf, opp, GFP_KERNEL);
+		if (ret)
+			dev_warn(dev,
+				 "Failed to add opps_by_lvl at %d - ret:%d\n",
+				 opp->perf, ret);
+
 		hash_add(dom->opps_by_freq, &opp->hash, opp->indicative_freq);
 	}
 }
@@ -382,7 +395,7 @@ iter_perf_levels_process_response(const struct scmi_protocol_handle *ph,
 	if (PROTOCOL_REV_MAJOR(p->version) <= 0x3)
 		process_response_opp(opp, st->loop_idx, response);
 	else
-		process_response_opp_v4(p->perf_dom, opp, st->loop_idx,
+		process_response_opp_v4(ph->dev, p->perf_dom, opp, st->loop_idx,
 					response);
 	p->perf_dom->opp_count++;
 
-- 
2.43.0

