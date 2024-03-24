Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A28C12FF96;
	Sun, 24 Mar 2024 23:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711321334; cv=none; b=I2lvx3i/2kuhUQ68lrQwj70ImzHuns5akNPi7EPQUAQh1xdqoVRNRw60OkwuxuM3CnF7hQVUx0ROYWBRabiV/BrV2JfLuil52IjA6hLIJja+BAB7UEfM0393czpkEfedCOOklsC/Jwo54u87bnA5CKtIrjkl2+K7P4CJSsaP5uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711321334; c=relaxed/simple;
	bh=sBKfeRf+SOb4Z0NMMrTDerZGmhl2+28QErjJRkaV8bw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cJo95VU10estb9SN+OFSds1QAr9pVUbWrU7G6m2WUt5sP86PKwstuXm8tHPaUzq6P517xqMOfcARuj1SQ9/XWoN2R3TJbqPQ2xN9x0Vqx2yGz2+BqQiafOa9f6aHOJbAToaqdspnWU4tyjfefBZzexKa6FUE3w5tWimyVbI5lYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rm5f8bdI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rm5f8bdI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4360C433C7;
	Sun, 24 Mar 2024 23:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711321333;
	bh=sBKfeRf+SOb4Z0NMMrTDerZGmhl2+28QErjJRkaV8bw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rm5f8bdIb8WmClf191EjOB5lsVxFEDiI+INcpYuAKRcOX84ijmz1WDFLFhbR9krL5
	 ODwUpSgPnbVWkmBaMOSZ/wKRQXT8zlVjGzeNDdb7TirTVbU7AYNTogo6XaLYrgKJ+f
	 urE6efotI0YWfQATM7fHTeNnox6oZdFsVL3tBe2+ETcn7EAuCx94KrLTNOJHIzwMi9
	 YqWjd2TJbgqO7XDBE9y4eGigI89t4oFhFJhYTkYeX34jMb++u2pZO/uq2TdyXGudLq
	 UCklQa8RKdONiAMVIu0PexkdTzc+QfKuDplB+zKhUSEAlwvkPMVadj6pNxG3S/w2Ee
	 bhxbqPcUo98/A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Thierry Reding <treding@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 6.6 057/638] arm64: tegra: Set the correct PHY mode for MGBE
Date: Sun, 24 Mar 2024 18:51:34 -0400
Message-ID: <20240324230116.1348576-58-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240324230116.1348576-1-sashal@kernel.org>
References: <20240324230116.1348576-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

[ Upstream commit 4c892121d43bc2b45896ca207b54f39a8fa6b852 ]

The PHY is configured in 10GBASE-R, so make sure to reflect that in DT.

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
index 4413a9b6da87a..bf2ccc8ff93c4 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
@@ -174,7 +174,7 @@ ethernet@6800000 {
 			status = "okay";
 
 			phy-handle = <&mgbe0_phy>;
-			phy-mode = "usxgmii";
+			phy-mode = "10gbase-r";
 
 			mdio {
 				#address-cells = <1>;
-- 
2.43.0

