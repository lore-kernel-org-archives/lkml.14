Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 843BB155314
	for <linux-kernel@vger.kernel.org>; Mon, 29 Jan 2024 15:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706542951; cv=none; b=sho5aKi5u1DSKwVYi0jmEMa9QnsAkcdumoZWtsDQywk+TNLzjpGhX2ftY7Ycx6LwXY6ISZfVn5Q2rNeT91OvNRxfyqAU3aMyPhfi8A3OnFaVjDH89YYKSupbQ6oJiaBIulU5obOgcnGe4USJMJEUx5n+38zXTWY1D85O3RGou30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706542951; c=relaxed/simple;
	bh=+GMc+PmkxPWlaPL4jq5IVDpcwC6cB1Rh6SUA3tCwKsk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UEthd1owrFrj//HBvt/L2Sod3y5Azr4u7MGlhfbonR/+9k8vn/kvOKtngtKlYtDwUH3F1B6puyWafdOgPR8a6E0EVwnYrH+s8MNd99jGu4VplxAuW1IpM/LAfCx06CNGpJ0ShRZ1wQgQEFYECmClwCkM1lSmj0cDdfjiHOMaiDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 10D0EDA7;
	Mon, 29 Jan 2024 07:43:13 -0800 (PST)
Received: from e127643.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A493A3F738;
	Mon, 29 Jan 2024 07:42:26 -0800 (PST)
From: James Clark <james.clark@arm.com>
To: coresight@lists.linaro.org,
	suzuki.poulose@arm.com
Cc: James Clark <james.clark@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v2 09/12] coresight: Add explicit member initializers to coresight_dev_type
Date: Mon, 29 Jan 2024 15:40:40 +0000
Message-Id: <20240129154050.569566-10-james.clark@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129154050.569566-1-james.clark@arm.com>
References: <20240129154050.569566-1-james.clark@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These could potentially become wrong silently if the enum is changed,
so explicitly initialize them.

Signed-off-by: James Clark <james.clark@arm.com>
---
 drivers/hwtracing/coresight/coresight-sysfs.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
index 5992f2c2200a..fa52297c73d2 100644
--- a/drivers/hwtracing/coresight/coresight-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-sysfs.c
@@ -378,22 +378,22 @@ static struct attribute *coresight_source_attrs[] = {
 ATTRIBUTE_GROUPS(coresight_source);
 
 struct device_type coresight_dev_type[] = {
-	{
+	[CORESIGHT_DEV_TYPE_SINK] = {
 		.name = "sink",
 		.groups = coresight_sink_groups,
 	},
-	{
+	[CORESIGHT_DEV_TYPE_LINK] = {
 		.name = "link",
 	},
-	{
+	[CORESIGHT_DEV_TYPE_LINKSINK] = {
 		.name = "linksink",
 		.groups = coresight_sink_groups,
 	},
-	{
+	[CORESIGHT_DEV_TYPE_SOURCE] = {
 		.name = "source",
 		.groups = coresight_source_groups,
 	},
-	{
+	[CORESIGHT_DEV_TYPE_HELPER] = {
 		.name = "helper",
 	}
 };
-- 
2.34.1

