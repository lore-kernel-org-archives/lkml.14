Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA7614F10A;
	Wed, 27 Mar 2024 17:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711561702; cv=none; b=W/73GdOSg5k/YgQH6LVKiI/CRGvz55gmmI44qymRI+doogChqfQD8cMbhF2ehw873YkKicqsf/OTJ7bGox5L6OiktPsU01l7umAzY82jOcIehnE2QB3nbw3iCGYF/z/MfUnk2J7nGHYQoJDQrO8MnJOOhotz7FCz3CKA/zVsJvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711561702; c=relaxed/simple;
	bh=rm13xFUqa0pa+J1GB/zpMNsrp2zZsiEdLV5ecYAW7uA=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=O57/aWjqOCUoktHahbSWrNlisUzory1jRc508d+3b8rle5zihWNtVzFuFfUtLEbxUH7T/mQ6K0/FEefH+AWZQ2AfTC1t9WG2APsMPGcA7VBLOEVQaTr9/OCvZQ1W5yC5f3Efq09+UI8oyP5wVH0NqEno6dMn27VEwZGpGNjJVdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C495C433F1;
	Wed, 27 Mar 2024 17:48:19 +0000 (UTC)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Loic Poulain <loic.poulain@linaro.org>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 2/4] net: wwan: mhi: drop driver owner assignment
Date: Wed, 27 Mar 2024 18:48:08 +0100
Message-Id: <20240327174810.519676-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240327174810.519676-1-krzysztof.kozlowski@linaro.org>
References: <20240327174810.519676-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Core in mhi_driver_register() already sets the .owner, so driver
does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/net/wwan/mhi_wwan_mbim.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wwan/mhi_wwan_mbim.c b/drivers/net/wwan/mhi_wwan_mbim.c
index 3f72ae943b29..f2aef84fc08d 100644
--- a/drivers/net/wwan/mhi_wwan_mbim.c
+++ b/drivers/net/wwan/mhi_wwan_mbim.c
@@ -648,7 +648,6 @@ static struct mhi_driver mhi_mbim_driver = {
 	.id_table = mhi_mbim_id_table,
 	.driver = {
 		.name = "mhi_wwan_mbim",
-		.owner = THIS_MODULE,
 	},
 };
 
-- 
2.34.1

