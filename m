Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EE6573182
	for <linux-kernel@vger.kernel.org>; Mon, 25 Mar 2024 20:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711399607; cv=none; b=IfIbpqlFX9qss4k1PabC5QU4UWN+Zmq8FtVH8pWxPjIMz8F8PyE7ew9GrQa3frMUE84C0VM5ySBBA6Yh0IfAeOIq4AefEzgx77r6dfUouPlu2hQKcrVZaWFZlT7IR8ApXFlghjYYQsdbKeKOJ99rp7OvixrV0sRQFXXKjFWF2Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711399607; c=relaxed/simple;
	bh=COo9h/c3ZOoNfFclLceJbjG5YdpauNjCzeGTguBMgqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hUh/A+y50vA3fI1fD4M8KsSwTeoXvcfUYPPCIlixxZ6g2PpGmHUfXqxIa37jZF5MLNroJ1LcpVruLr89pH1ju6fTS0qBDSgfFec0ZuRN7YvRniNsl2xyhqeZ+qzS57Q04BI4vCrwtDQdfpC8xtVwLtBOxxjh/d+hiyT2Io1nZ9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A1F31596;
	Mon, 25 Mar 2024 13:47:19 -0700 (PDT)
Received: from pluto.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E0F743F64C;
	Mon, 25 Mar 2024 13:46:44 -0700 (PDT)
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: sudeep.holla@arm.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v2 5/5] firmware: arm_scmi: Use dev_err_probe to bail out
Date: Mon, 25 Mar 2024 20:46:20 +0000
Message-ID: <20240325204620.1437237-6-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240325204620.1437237-1-cristian.marussi@arm.com>
References: <20240325204620.1437237-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use dev_err_probe on the failure path of SCMI core probing.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/driver.c | 34 +++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 207ed1a52d69..d0091459a276 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2540,6 +2540,10 @@ scmi_txrx_setup(struct scmi_info *info, struct device_node *of_node,
 			ret = 0;
 	}
 
+	if (ret)
+		dev_err(info->dev,
+			"failed to setup channel for protocol:0x%X\n", prot_id);
+
 	return ret;
 }
 
@@ -2809,6 +2813,7 @@ static int scmi_debugfs_raw_mode_setup(struct scmi_info *info)
 static int scmi_probe(struct platform_device *pdev)
 {
 	int ret;
+	char *err_str = "probe failure\n";
 	struct scmi_handle *handle;
 	const struct scmi_desc *desc;
 	struct scmi_info *info;
@@ -2859,27 +2864,37 @@ static int scmi_probe(struct platform_device *pdev)
 
 	if (desc->ops->link_supplier) {
 		ret = desc->ops->link_supplier(dev);
-		if (ret)
+		if (ret) {
+			err_str = "transport not ready\n";
 			goto clear_ida;
+		}
 	}
 
 	/* Setup all channels described in the DT at first */
 	ret = scmi_channels_setup(info);
-	if (ret)
+	if (ret) {
+		err_str = "failed to setup channels\n";
 		goto clear_ida;
+	}
 
 	ret = bus_register_notifier(&scmi_bus_type, &info->bus_nb);
-	if (ret)
+	if (ret) {
+		err_str = "failed to register bus notifier\n";
 		goto clear_txrx_setup;
+	}
 
 	ret = blocking_notifier_chain_register(&scmi_requested_devices_nh,
 					       &info->dev_req_nb);
-	if (ret)
+	if (ret) {
+		err_str = "failed to register device notifier\n";
 		goto clear_bus_notifier;
+	}
 
 	ret = scmi_xfer_info_init(info);
-	if (ret)
+	if (ret) {
+		err_str = "failed to init xfers pool\n";
 		goto clear_dev_req_notifier;
+	}
 
 	if (scmi_top_dentry) {
 		info->dbg = scmi_debugfs_common_setup(info);
@@ -2916,9 +2931,11 @@ static int scmi_probe(struct platform_device *pdev)
 	 */
 	ret = scmi_protocol_acquire(handle, SCMI_PROTOCOL_BASE);
 	if (ret) {
-		dev_err(dev, "unable to communicate with SCMI\n");
-		if (coex)
+		err_str = "unable to communicate with SCMI\n";
+		if (coex) {
+			dev_err(dev, err_str);
 			return 0;
+		}
 		goto notification_exit;
 	}
 
@@ -2972,7 +2989,8 @@ static int scmi_probe(struct platform_device *pdev)
 	scmi_cleanup_txrx_channels(info);
 clear_ida:
 	ida_free(&scmi_id, info->id);
-	return ret;
+
+	return dev_err_probe(dev, ret, err_str);
 }
 
 static void scmi_remove(struct platform_device *pdev)
-- 
2.44.0

