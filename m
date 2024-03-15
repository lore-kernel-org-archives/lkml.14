Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE39424A1D
	for <linux-kernel@vger.kernel.org>; Fri, 15 Mar 2024 14:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710511425; cv=none; b=ogaKdgvaxzWFKhczMoFAuc6D7dOgS6fHrDwff+mNe490SK2bdZH+xesDUNxuO0WX3PjTsa4Ddc/wlZK32FpHFCfFDsNyChi+029k0hmcYOdcLqAvka3rZkF35Ge8K6pemtdpzl51Al8Ni/um60G7GT39qaJ1nkLfaPi10DqhCUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710511425; c=relaxed/simple;
	bh=yyfcqlpo5C7f0iWyBlzuaGUA0GESIJDsS4zzva3QJiI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J6MIg+Nuhgjpv+ipOxkymSpK0bIj/ComO8MZWe6l3KL5IvMSOVjiA0HJQp6EtGeKJ8QcfmfJf7o3vYeaqgGGENevE9Xltw3QC8jEwi01nX3L/oudtN0tMzxBAhT+9QWBgwTSpEuj5KzV4t7WGO5Z0ESi23BOx/7NIabjvdJ742g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A5BEC15;
	Fri, 15 Mar 2024 07:04:13 -0700 (PDT)
Received: from pluto.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4C75B3F73F;
	Fri, 15 Mar 2024 07:03:35 -0700 (PDT)
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: sudeep.holla@arm.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH] firmware: arm_scmi: Make raw debugfs entries non-seekable
Date: Fri, 15 Mar 2024 14:03:24 +0000
Message-ID: <20240315140324.231830-1-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SCMI Raw debugfs entries are used to inject and snoop messages out of the
SCMI core and, as such, the underlying virtual files have no reason to
support seeking.

Modify the related file_operations descriptors to be non-seekable.

Fixes: 3c3d818a9317 ("firmware: arm_scmi: Add core raw transmission support")
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/raw_mode.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/raw_mode.c b/drivers/firmware/arm_scmi/raw_mode.c
index 350573518503..130d13e9cd6b 100644
--- a/drivers/firmware/arm_scmi/raw_mode.c
+++ b/drivers/firmware/arm_scmi/raw_mode.c
@@ -921,7 +921,7 @@ static int scmi_dbg_raw_mode_open(struct inode *inode, struct file *filp)
 	rd->raw = raw;
 	filp->private_data = rd;
 
-	return 0;
+	return nonseekable_open(inode, filp);
 }
 
 static int scmi_dbg_raw_mode_release(struct inode *inode, struct file *filp)
@@ -950,6 +950,7 @@ static const struct file_operations scmi_dbg_raw_mode_reset_fops = {
 	.open = scmi_dbg_raw_mode_open,
 	.release = scmi_dbg_raw_mode_release,
 	.write = scmi_dbg_raw_mode_reset_write,
+	.llseek = no_llseek,
 	.owner = THIS_MODULE,
 };
 
@@ -959,6 +960,7 @@ static const struct file_operations scmi_dbg_raw_mode_message_fops = {
 	.read = scmi_dbg_raw_mode_message_read,
 	.write = scmi_dbg_raw_mode_message_write,
 	.poll = scmi_dbg_raw_mode_message_poll,
+	.llseek = no_llseek,
 	.owner = THIS_MODULE,
 };
 
@@ -975,6 +977,7 @@ static const struct file_operations scmi_dbg_raw_mode_message_async_fops = {
 	.read = scmi_dbg_raw_mode_message_read,
 	.write = scmi_dbg_raw_mode_message_async_write,
 	.poll = scmi_dbg_raw_mode_message_poll,
+	.llseek = no_llseek,
 	.owner = THIS_MODULE,
 };
 
@@ -998,6 +1001,7 @@ static const struct file_operations scmi_dbg_raw_mode_notification_fops = {
 	.release = scmi_dbg_raw_mode_release,
 	.read = scmi_test_dbg_raw_mode_notif_read,
 	.poll = scmi_test_dbg_raw_mode_notif_poll,
+	.llseek = no_llseek,
 	.owner = THIS_MODULE,
 };
 
@@ -1021,6 +1025,7 @@ static const struct file_operations scmi_dbg_raw_mode_errors_fops = {
 	.release = scmi_dbg_raw_mode_release,
 	.read = scmi_test_dbg_raw_mode_errors_read,
 	.poll = scmi_test_dbg_raw_mode_errors_poll,
+	.llseek = no_llseek,
 	.owner = THIS_MODULE,
 };
 
-- 
2.44.0

