Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71C7554F83
	for <linux-kernel@vger.kernel.org>; Mon,  8 Jan 2024 18:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A780DFEC;
	Mon,  8 Jan 2024 10:52:06 -0800 (PST)
Received: from pluto.. (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D8BED3F73F;
	Mon,  8 Jan 2024 10:51:19 -0800 (PST)
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: sudeep.holla@arm.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH 2/2] firmware: arm_scmi: Use xa_insert() when saving raw queues
Date: Mon,  8 Jan 2024 18:50:50 +0000
Message-ID: <20240108185050.1628687-2-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240108185050.1628687-1-cristian.marussi@arm.com>
References: <20240108185050.1628687-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use xa_insert() when saving per-channel raw queues to better check for
duplicates.

Fixes: 7860701d1e6e ("firmware: arm_scmi: Add per-channel raw injection support")
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/raw_mode.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/arm_scmi/raw_mode.c b/drivers/firmware/arm_scmi/raw_mode.c
index 0493aa3c12bf..350573518503 100644
--- a/drivers/firmware/arm_scmi/raw_mode.c
+++ b/drivers/firmware/arm_scmi/raw_mode.c
@@ -1111,7 +1111,6 @@ static int scmi_raw_mode_setup(struct scmi_raw_mode_info *raw,
 		int i;
 
 		for (i = 0; i < num_chans; i++) {
-			void *xret;
 			struct scmi_raw_queue *q;
 
 			q = scmi_raw_queue_init(raw);
@@ -1120,13 +1119,12 @@ static int scmi_raw_mode_setup(struct scmi_raw_mode_info *raw,
 				goto err_xa;
 			}
 
-			xret = xa_store(&raw->chans_q, channels[i], q,
+			ret = xa_insert(&raw->chans_q, channels[i], q,
 					GFP_KERNEL);
-			if (xa_err(xret)) {
+			if (ret) {
 				dev_err(dev,
 					"Fail to allocate Raw queue 0x%02X\n",
 					channels[i]);
-				ret = xa_err(xret);
 				goto err_xa;
 			}
 		}
@@ -1322,6 +1320,12 @@ void scmi_raw_message_report(void *r, struct scmi_xfer *xfer,
 	dev = raw->handle->dev;
 	q = scmi_raw_queue_select(raw, idx,
 				  SCMI_XFER_IS_CHAN_SET(xfer) ? chan_id : 0);
+	if (!q) {
+		dev_warn(dev,
+			 "RAW[%d] - NO queue for chan 0x%X. Dropping report.\n",
+			 idx, chan_id);
+		return;
+	}
 
 	/*
 	 * Grab the msg_q_lock upfront to avoid a possible race between
-- 
2.43.0

