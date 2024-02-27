Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D9EF149DE1;
	Tue, 27 Feb 2024 19:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709063341; cv=none; b=iP7VcJS9REdJSgGW9FF8a+A9mWoTEDPiT2eWe/sagTxurVu8M1pfBvNvVZ2d/GH6WAhhB/1vSEmJgzdk5fEjbtZb/SVoreT4afcoU3QygryYxSZaS8HjmSisdvHcbtKRXRZGuD4R3KGMJGmxVA+9YZ0incStcUh6aTEBTSlB4wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709063341; c=relaxed/simple;
	bh=wAQ5DpWIMEk/AKt1aTsBb2sccdq8gkiwLmigUoYGSt8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qHqJ3Q+lVG9bIIY6+hQuQifVcNFyvFsWy8CzexVTa6JxpD7ZB0srCl3jMm5sMRpAufN093Rxg59plX0nXkktJmOREOl1IIniAEeo/RLgK94MUXqabCsquSj+kqDztfanj5RfnNH8AiZ6y5IYzuyuhmpg/VPkgoLvQS0mz+pppSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6CDC8DA7;
	Tue, 27 Feb 2024 11:49:37 -0800 (PST)
Received: from pluto.. (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 490503F762;
	Tue, 27 Feb 2024 11:48:56 -0800 (PST)
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: sudeep.holla@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	quic_sibis@quicinc.com,
	quic_nkela@quicinc.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	souvik.chakravarty@arm.com,
	Cristian Marussi <cristian.marussi@arm.com>,
	linux-clk@vger.kernel.org
Subject: [PATCH 3/5] clk: scmi: Add support for rate change restricted clocks
Date: Tue, 27 Feb 2024 19:48:10 +0000
Message-ID: <20240227194812.1209532-4-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240227194812.1209532-1-cristian.marussi@arm.com>
References: <20240227194812.1209532-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some exposed SCMI Clocks could be marked as non-supporting rate changes.
Configure a clk_ops descriptors which does not provide the rate change
callbacks for such clocks when registering with CLK framework.

CC: Michael Turquette <mturquette@baylibre.com>
CC: Stephen Boyd <sboyd@kernel.org>
CC: linux-clk@vger.kernel.org
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/clk/clk-scmi.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
index fc9603988d91..d20dcc60f9d1 100644
--- a/drivers/clk/clk-scmi.c
+++ b/drivers/clk/clk-scmi.c
@@ -19,6 +19,7 @@
 enum scmi_clk_feats {
 	SCMI_CLK_ATOMIC_SUPPORTED,
 	SCMI_CLK_STATE_CTRL_FORBIDDEN,
+	SCMI_CLK_RATE_CTRL_FORBIDDEN,
 	SCMI_CLK_MAX_FEATS
 };
 
@@ -248,7 +249,8 @@ scmi_clk_ops_alloc(struct device *dev, unsigned long feats_key)
 	ops->recalc_rate = scmi_clk_recalc_rate;
 	ops->round_rate = scmi_clk_round_rate;
 	ops->determine_rate = scmi_clk_determine_rate;
-	ops->set_rate = scmi_clk_set_rate;
+	if (!(feats_key & BIT(SCMI_CLK_RATE_CTRL_FORBIDDEN)))
+		ops->set_rate = scmi_clk_set_rate;
 
 	/* Parent ops */
 	ops->get_parent = scmi_clk_get_parent;
@@ -296,6 +298,9 @@ scmi_clk_ops_select(struct scmi_clk *sclk, bool atomic_capable,
 	if (ci->state_ctrl_forbidden)
 		feats_key |= BIT(SCMI_CLK_STATE_CTRL_FORBIDDEN);
 
+	if (ci->rate_ctrl_forbidden)
+		feats_key |= BIT(SCMI_CLK_RATE_CTRL_FORBIDDEN);
+
 	/* Lookup previously allocated ops */
 	ops = clk_ops_db[feats_key];
 	if (!ops) {
-- 
2.43.0

