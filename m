Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4E6482897;
	Mon, 15 Apr 2024 16:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713199031; cv=none; b=dqwa6kXRiaOAfnSIHShRgkp/0HK5ZPmvPLrOgpXafat87j6f+tov14iLxTWPi6Sfw6V4bx3yYSGTxk82bZ/Agu4Q9JnOnUarkM8H2G5BVLCaQAlVXYNOUySa+qUL+NrchFOUbbj1A4W25Ks0ht/qdcRx8zVNf4J+ib7hW/dbjUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713199031; c=relaxed/simple;
	bh=QjR7z+IUvta/EMx7HFog6puX37jtBuP+gN6KnJSleTs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SX3OjNkzT1PskuO5lu56ik7V9oATf39nwBRGMua1/vP95x6SJ/TzVN+W8FwbcnYxqgetvSJ2sHFg3532BAry3XufiYvP0bsWj+mxRvqFMasRch9RMs+ULzS2ylq86zchYOfBIhP8xAlR5w+3BFdFWJy/43ELcWOpogjs4O2gOf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C764F2F4;
	Mon, 15 Apr 2024 09:37:37 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 182BF3F64C;
	Mon, 15 Apr 2024 09:37:06 -0700 (PDT)
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Cc: sudeep.holla@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	quic_sibis@quicinc.com,
	quic_nkela@quicinc.com,
	souvik.chakravarty@arm.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v3 2/5] clk: scmi: Add support for state control restricted clocks
Date: Mon, 15 Apr 2024 17:36:46 +0100
Message-ID: <20240415163649.895268-3-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240415163649.895268-1-cristian.marussi@arm.com>
References: <20240415163649.895268-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some exposed SCMI Clocks could be marked as non-supporting state changes.
Configure a clk_ops descriptor which does not provide the state change
callbacks for such clocks when registering with CLK framework.

CC: Michael Turquette <mturquette@baylibre.com>
CC: Stephen Boyd <sboyd@kernel.org>
CC: linux-clk@vger.kernel.org
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v2 -> v3
- using SCMI_CLK_STATE_CTRL_SUPPORTED instead of _FORBIDDEN
---
 drivers/clk/clk-scmi.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
index 4b6c43d7f5f3..e70708573965 100644
--- a/drivers/clk/clk-scmi.c
+++ b/drivers/clk/clk-scmi.c
@@ -19,6 +19,7 @@
 
 enum scmi_clk_feats {
 	SCMI_CLK_ATOMIC_SUPPORTED,
+	SCMI_CLK_STATE_CTRL_SUPPORTED,
 	SCMI_CLK_FEATS_COUNT
 };
 
@@ -230,15 +231,19 @@ scmi_clk_ops_alloc(struct device *dev, unsigned long feats_key)
 	 * only the prepare/unprepare API, as allowed by the clock framework
 	 * when atomic calls are not available.
 	 */
-	if (feats_key & BIT(SCMI_CLK_ATOMIC_SUPPORTED)) {
-		ops->enable = scmi_clk_atomic_enable;
-		ops->disable = scmi_clk_atomic_disable;
-		ops->is_enabled = scmi_clk_atomic_is_enabled;
-	} else {
-		ops->prepare = scmi_clk_enable;
-		ops->unprepare = scmi_clk_disable;
+	if (feats_key & BIT(SCMI_CLK_STATE_CTRL_SUPPORTED)) {
+		if (feats_key & BIT(SCMI_CLK_ATOMIC_SUPPORTED)) {
+			ops->enable = scmi_clk_atomic_enable;
+			ops->disable = scmi_clk_atomic_disable;
+		} else {
+			ops->prepare = scmi_clk_enable;
+			ops->unprepare = scmi_clk_disable;
+		}
 	}
 
+	if (feats_key & BIT(SCMI_CLK_ATOMIC_SUPPORTED))
+		ops->is_enabled = scmi_clk_atomic_is_enabled;
+
 	/* Rate ops */
 	ops->recalc_rate = scmi_clk_recalc_rate;
 	ops->round_rate = scmi_clk_round_rate;
@@ -294,6 +299,9 @@ scmi_clk_ops_select(struct scmi_clk *sclk, bool atomic_capable,
 	if (atomic_capable && ci->enable_latency <= atomic_threshold_us)
 		feats_key |= BIT(SCMI_CLK_ATOMIC_SUPPORTED);
 
+	if (!ci->state_ctrl_forbidden)
+		feats_key |= BIT(SCMI_CLK_STATE_CTRL_SUPPORTED);
+
 	if (WARN_ON(feats_key >= db_size))
 		return NULL;
 
-- 
2.44.0

