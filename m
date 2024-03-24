Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABAC19CAD1;
	Sun, 24 Mar 2024 22:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711320164; cv=none; b=XbDwxBOdXrcfwzDPAKa1uF1pngY5WWNZHqDt0BAzZEE2ic3WNR6WF7faoAreJCXm2XsDV2gm85zwaeQymmRDVnXEfv20XlZmb36zGWk3YWv8RrJJoDp9jMioyQppQWt6Hno1Nze+AAb+/b7r9T7qij9szLTWpMSh4jHKSq1hozs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711320164; c=relaxed/simple;
	bh=d5wm9NWCMBTCjhYdCMoJjoryg24+6cqYKHj5nu1pVGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L+0MKJhXJUgoOZUml35ItuFVT03e4zHHNodatrbYBKkSYr5Lk7MgTqCIWpuvMAXR1Vb/2KXuVYqu9aP02izyYT+o2wl6qh8PZGHjt1e4r0AQEqk4wHzOBZC4C6+pktFkzGxaxC03X+eZciZQ73HIDSSxrJUEexyiGs9q1YQJBYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mu5+VHES; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mu5+VHES"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9D7AC433C7;
	Sun, 24 Mar 2024 22:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711320164;
	bh=d5wm9NWCMBTCjhYdCMoJjoryg24+6cqYKHj5nu1pVGk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Mu5+VHESf9+HRB+ZfWFZUak3fvHhiSjS7YPI0uHn4wW5BoyndGJTuQFhtPsKeK/Qm
	 XfQkfIOTW3VX2/nLND5SjEz0G9Lg2KiePp0kQwIZFemrZg1YJ1cLxC7E/d8+MdGpQu
	 J8E/k543PUdqZDKPJ/QeWzZchOnDCwOLon38jskbVSK80EwY/QMwbBKLjHBseXGzwL
	 WrSsRfpq3U5ZgvBnXhEMDNivaiKNz+UfZoUnF97gESo+KZ4OM9L07iqc92BUOpuYci
	 Yl1J4jXkZxBYu216xVEHxkWzmrL1BUKGnJxCz7jdOWsIZZ3tXMVLFAnXXtpPg9rZzc
	 /pK6VdDh5tY5A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Damian Muszynski <damian.muszynski@intel.com>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 6.8 472/715] crypto: qat - fix ring to service map for dcc in 420xx
Date: Sun, 24 Mar 2024 18:30:51 -0400
Message-ID: <20240324223455.1342824-473-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240324223455.1342824-1-sashal@kernel.org>
References: <20240324223455.1342824-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Damian Muszynski <damian.muszynski@intel.com>

[ Upstream commit a20a6060e0dd57fecaf55487985aef28bd08c6bf ]

If a device is configured for data compression chaining (dcc), half of the
engines are loaded with the symmetric crypto image and the rest are loaded
with the compression image.
However, in such configuration all rings can handle compression requests.

Fix the ring to service mapping so that when a device is configured for
dcc, the ring to service mapping reports that all rings in a bank can
be used for compression.

Fixes: fcf60f4bcf54 ("crypto: qat - add support for 420xx devices")
Signed-off-by: Damian Muszynski <damian.muszynski@intel.com>
Reviewed-by: Giovanni Cabiddu <giovanni.cabiddu@intel.com>
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/crypto/intel/qat/qat_420xx/adf_420xx_hw_data.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/crypto/intel/qat/qat_420xx/adf_420xx_hw_data.c b/drivers/crypto/intel/qat/qat_420xx/adf_420xx_hw_data.c
index a87d29ae724fe..7909b51e97c30 100644
--- a/drivers/crypto/intel/qat/qat_420xx/adf_420xx_hw_data.c
+++ b/drivers/crypto/intel/qat/qat_420xx/adf_420xx_hw_data.c
@@ -372,6 +372,13 @@ static u16 get_ring_to_svc_map(struct adf_accel_dev *accel_dev)
 	if (!fw_config)
 		return 0;
 
+	/* If dcc, all rings handle compression requests */
+	if (adf_get_service_enabled(accel_dev) == SVC_DCC) {
+		for (i = 0; i < RP_GROUP_COUNT; i++)
+			rps[i] = COMP;
+		goto set_mask;
+	}
+
 	for (i = 0; i < RP_GROUP_COUNT; i++) {
 		switch (fw_config[i].ae_mask) {
 		case ADF_AE_GROUP_0:
@@ -400,6 +407,7 @@ static u16 get_ring_to_svc_map(struct adf_accel_dev *accel_dev)
 		}
 	}
 
+set_mask:
 	ring_to_svc_map = rps[RP_GROUP_0] << ADF_CFG_SERV_RING_PAIR_0_SHIFT |
 			  rps[RP_GROUP_1] << ADF_CFG_SERV_RING_PAIR_1_SHIFT |
 			  rps[RP_GROUP_0] << ADF_CFG_SERV_RING_PAIR_2_SHIFT |
-- 
2.43.0

