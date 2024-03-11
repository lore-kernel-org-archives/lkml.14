Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CE7481A6
	for <linux-kernel@vger.kernel.org>; Mon, 11 Mar 2024 16:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710174526; cv=none; b=T2AWzYKSRZEu3vXHtrufXyez8AqTS2TKvwohKgxKmGqr/smufonJSZ2+Bu4tkj1DYnzEPqklXwPRp+xv0dG/1jBZnTaz2mqkA44/uyrBI2NMyqhf30u7OMrp29m3pV+gOC0ThDtc/RYfRfen2jPpPjk3FYfCm423S9ZG4F6Tyjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710174526; c=relaxed/simple;
	bh=BOe/URe3IpcizYmw7Op+xPHG8Hus1zm8G3nNk6OMm1k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=L8nBwiDs91XPdFyDpzmwZIq5+xbuqCAiOKq9bN9f9Y4RkFhe204aE6BoqmqsyWabDV2sFkDePYnyD2B3v2bHATwuOXTl/P3UzLQiV9yu9HzNYVoW44HfNQ/HgfMcsXiDU+cKkfq4Z3kbq/mumsVw8EgmIhuSTVJYJ7lYwZ+GDvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=RDPLo44s; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="RDPLo44s"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1710174519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Fz+FWvrcKcTv16JX/4rIFVS9wfxLnJCR/qRfWEpLaNk=;
	b=RDPLo44sQaeMkdNhTv6N0tAMk2tGBUxNZLmt3ZalRc47ltWKJOh7MOtOHuM2AK/IIUtWKm
	MqjCWr/HAbThPLudVpfzuo6UojtXF2Qwh51ka8asfAs3n9KrVhxNJ0k1rJucqUrwJQto1y
	VIpnvPeAog6M3OEJ0GMmYBre8yFruG0=
From: Sean Anderson <sean.anderson@linux.dev>
To: Jonathan Cameron <jic23@kernel.org>,
	linux-iio@vger.kernel.org
Cc: Conall O'Griofa <conall.ogriofa@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Lars-Peter Clausen <lars@metafoo.de>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH] iio: xilinx-ams: Don't include ams_ctrl_channels in scan_mask
Date: Mon, 11 Mar 2024 12:28:00 -0400
Message-Id: <20240311162800.11074-1-sean.anderson@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

ams_enable_channel_sequence constructs a "scan_mask" for all the PS and
PL channels. This works out fine, since scan_index for these channels is
less than 64. However, it also includes the ams_ctrl_channels, where
scan_index is greater than 64, triggering undefined behavior. Since we
don't need these channels anyway, just exclude them.

Fixes: d5c70627a794 ("iio: adc: Add Xilinx AMS driver")
Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 drivers/iio/adc/xilinx-ams.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/xilinx-ams.c b/drivers/iio/adc/xilinx-ams.c
index a55396c1f8b2..4de7ce598e4d 100644
--- a/drivers/iio/adc/xilinx-ams.c
+++ b/drivers/iio/adc/xilinx-ams.c
@@ -414,8 +414,12 @@ static void ams_enable_channel_sequence(struct iio_dev *indio_dev)
 
 	/* Run calibration of PS & PL as part of the sequence */
 	scan_mask = BIT(0) | BIT(AMS_PS_SEQ_MAX);
-	for (i = 0; i < indio_dev->num_channels; i++)
-		scan_mask |= BIT_ULL(indio_dev->channels[i].scan_index);
+	for (i = 0; i < indio_dev->num_channels; i++) {
+		const struct iio_chan_spec *chan = &indio_dev->channels[i];
+
+		if (chan->scan_index < AMS_CTRL_SEQ_BASE)
+			scan_mask |= BIT_ULL(chan->scan_index);
+	}
 
 	if (ams->ps_base) {
 		/* put sysmon in a soft reset to change the sequence */
-- 
2.35.1.1320.gc452695387.dirty

