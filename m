Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E9B013ADA
	for <linux-kernel@vger.kernel.org>; Wed, 29 May 2024 13:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716989801; cv=none; b=Im+lXTZlcGEiwXSoJ3ESSOrVmAHl6hfaFAYSnt+zlixKOX1o7pvtNiDWnlp2eGLkqLhpdRWy2eiqM96XpO6BErtgz4/s+xdh5JzuwiZGYUzQp1pn0o+YokNQ2XfOYZb8agrgmycUydHtSjjEl/wBretErV5ORl8iv5einrXhGDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716989801; c=relaxed/simple;
	bh=o+zJGzqtKdmET2MPzNUDK3LtL/wyPC8NNUFalrWeqYM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UnpHaPnA86U8mzm/gS/5Pjf/d4nwFryTg8mmvNwBfqZ9nF5sEjIrqf38fP40BmNX+671FHP2V4vBBydv6QhVKj2hF9HF3/u2gpTUax4TgresDjDCjMsCJq7CLKSEec87nXMRhzF+9XVL3Pbr89wb708nQhPxMArrNSChuSxY2LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C09F9339;
	Wed, 29 May 2024 06:37:02 -0700 (PDT)
Received: from e127643.broadband (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 14A563F792;
	Wed, 29 May 2024 06:36:36 -0700 (PDT)
From: James Clark <james.clark@arm.com>
To: coresight@lists.linaro.org,
	suzuki.poulose@arm.com
Cc: laurent.pinchart@ideasonboard.com,
	James Clark <james.clark@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] coresight: Fix ref leak when of_coresight_parse_endpoint() fails
Date: Wed, 29 May 2024 14:36:26 +0100
Message-Id: <20240529133626.90080-1-james.clark@arm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_graph_get_next_endpoint() releases the reference to the previous
endpoint on each iteration, but when parsing fails the loop exits
early meaning the last reference is never dropped.

Fix it by dropping the refcount in the exit condition.

Fixes: d375b356e687 ("coresight: Fix support for sparsely populated ports")
Signed-off-by: James Clark <james.clark@arm.com>
---
 drivers/hwtracing/coresight/coresight-platform.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
index 9d550f5697fa..57a009552cc5 100644
--- a/drivers/hwtracing/coresight/coresight-platform.c
+++ b/drivers/hwtracing/coresight/coresight-platform.c
@@ -297,8 +297,10 @@ static int of_get_coresight_platform_data(struct device *dev,
 			continue;
 
 		ret = of_coresight_parse_endpoint(dev, ep, pdata);
-		if (ret)
+		if (ret) {
+			of_node_put(ep);
 			return ret;
+		}
 	}
 
 	return 0;
-- 
2.34.1

