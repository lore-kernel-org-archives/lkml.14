Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3661591FC
	for <linux-kernel@vger.kernel.org>; Fri,  3 May 2024 19:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714764584; cv=none; b=NDaXaseS8U12kOzhoAdpjFq/1oCNvHJFunBwhTLgXSD7b4z8jR7vYxfR/1dJ6ClTwJ21u2Do2U7ZCgqofzCaDb38ucE+/WKIPcroX9488fphSZryT1atqC4G19JgpJSzjyfD8Hvk0msE/mRw8pmBENi5Alc+TJkc7JbY+o1Gl6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714764584; c=relaxed/simple;
	bh=u8WWhEWAz+2AyRh5uSyALGLbgl/geknl6YfJQg0xOkM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HhgrraA0ksVoyOkB8y9FUmfRqvpM9O9RNblhMbB+kLmQJgW/mbc8kIAZtsUdA1VuxPYXQCdUG3yWrztFerCgqpYMZH2sU85/KUzBbzS5hL+RuBhvDMWrW4u7giZhcHBbUMkz5yZb305nEB1ywbSAeU0MDryZoth21uMeRpc6DYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=d2SJ6rWt; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="d2SJ6rWt"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1714764581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8P24ppU8bQXf2ANSu1fjPc/dmWggy8kCrFAAgzwdOZA=;
	b=d2SJ6rWtB/AkRm8XP0h0EnEPy7AoRAg56jCh2HdZ6cprXxwPCmhP6sOUNLm3taXUG5Mpy+
	MJ2uZLJB4WaZZISf7g6UDPzlm/LzIayz43f0d5euB3yaTerVnexDIwYMBpDkVch/Znfxlu
	fNYUIenR7+nABcIgvD4DiDk1vam/uoQ=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org,
	David Airlie <airlied@gmail.com>,
	linux-kernel@vger.kernel.org,
	Daniel Vetter <daniel@ffwll.ch>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Michal Simek <michal.simek@amd.com>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH v5 06/10] drm: zynqmp_dp: Convert to a hard IRQ
Date: Fri,  3 May 2024 15:29:18 -0400
Message-Id: <20240503192922.2172314-7-sean.anderson@linux.dev>
In-Reply-To: <20240503192922.2172314-1-sean.anderson@linux.dev>
References: <20240503192922.2172314-1-sean.anderson@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Now that all of the sleeping work is done outside of the IRQ, we can
convert it to a hard IRQ.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

(no changes since v3)

Changes in v3:
- New

 drivers/gpu/drm/xlnx/zynqmp_dp.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index cec5711c7026..c9cdfb56f23e 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -1831,9 +1831,8 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub)
 	 * Now that the hardware is initialized and won't generate spurious
 	 * interrupts, request the IRQ.
 	 */
-	ret = devm_request_threaded_irq(dp->dev, dp->irq, NULL,
-					zynqmp_dp_irq_handler, IRQF_ONESHOT,
-					dev_name(dp->dev), dp);
+	ret = devm_request_irq(dp->dev, dp->irq, zynqmp_dp_irq_handler,
+			       IRQF_SHARED, dev_name(dp->dev), dp);
 	if (ret < 0)
 		goto err_phy_exit;
 
-- 
2.35.1.1320.gc452695387.dirty

