Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDD439FD7
	for <linux-kernel@vger.kernel.org>; Tue,  9 Jan 2024 14:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YVAdfTZw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25654C43394;
	Tue,  9 Jan 2024 14:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704811023;
	bh=fWjd+FR9A61A5P7lvqxtqlagPH4hwA3ZT1/Kgh6htTk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YVAdfTZwKMnc5NddYEkuEA+C0OrxydXKGALJw8URH0KPcx5vElCjP7U7Y/EHGg3mM
	 PtJtg1WbnEYA8zriuNQrIyyoia14icwYnCZQCdB2wxQ1o/qKeilgagBvtpNQVyA4Ey
	 N55btxYaTiplH8v3QyKF6OwQtmolmXAZ/PDLSHmTRx8jEYAtrxhu1kYthDodXa92Uu
	 vRkiNZCumYNd94DUExGyHRzMXnZAg3+zQ8CUMHGBvjdzX5ufTxYNDwJIWyfQO1TTBv
	 WoHuqf2jE8FvmEQYAwdeAeg0NNDJSuSPgwGbClCUL5eG2EZh7T6tDNJ4b3HePDHMaM
	 r+qqwY7Pg6cXw==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Tomer Tayar <ttayar@habana.ai>
Subject: [PATCH 2/2] accel/habanalabs/gaudi2: fail memory memset when failing to copy QM packet to device
Date: Tue,  9 Jan 2024 16:36:56 +0200
Message-Id: <20240109143656.768980-2-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240109143656.768980-1-ogabbay@kernel.org>
References: <20240109143656.768980-1-ogabbay@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tomer Tayar <ttayar@habana.ai>

gaudi2_memset_memory_chunk_using_edma_qm() calls the access_dev_mem()
ASIC function, but ignores its return value.
Add this missing check.

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index 05e2170c815e..1f061209ae21 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -10345,14 +10345,20 @@ static int gaudi2_memset_memory_chunk_using_edma_qm(struct hl_device *hdev,
 
 	pkt_size = sizeof(struct packet_lin_dma);
 
-	for (i = 0; i < 3; i++)
+	for (i = 0; i < 3; i++) {
 		rc = hdev->asic_funcs->access_dev_mem(hdev, PCI_REGION_DRAM,
 				phys_addr + (i * sizeof(u64)),
 				((u64 *)(lin_dma_pkt)) + i, DEBUGFS_WRITE64);
+		if (rc) {
+			dev_err(hdev->dev, "Failed to copy lin_dma packet to HBM (%#llx)\n",
+				phys_addr);
+			return rc;
+		}
+	}
 
 	rc = hl_hw_queue_send_cb_no_cmpl(hdev, hw_queue_id, pkt_size, phys_addr);
 	if (rc)
-		dev_err(hdev->dev, "Failed to send lin dma packet to H/W queue %d\n",
+		dev_err(hdev->dev, "Failed to send lin_dma packet to H/W queue %d\n",
 				hw_queue_id);
 
 	return rc;
-- 
2.34.1

