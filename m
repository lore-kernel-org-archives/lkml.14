Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B3A134405;
	Sun, 24 Mar 2024 23:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711321457; cv=none; b=s0CG3SWwcDgqHb3U9iCSojfcMSsSOAd2Am5zRv0SQdugV7j1o+7GAL6hvOpIG+Ros9MXP1Gh3ahADWbO7Ont1dimxqEum2wYCQERuzyRzRNa42FBjGfhjvJM2M3bnB8k1WujsxRARywNvxTrHNJ90WvBhSXAscH1tyhVaTIo5dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711321457; c=relaxed/simple;
	bh=OkQag3fGV2PD8R+QrG3u5lsG7MCrCma4Ow49X1gbOkg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BkUg1VgFCSPfMmH8sDTltXZLt5NXjj042KY7Gz+1dUesf781DgfDDa9RXCnjjq3NqRhec2QarYPPfBlkqKBwJnFc+gtevY/HpMbVABchBz7rkWNGW7PibeK7sy4InZRBHONOrXPuuAQZjW0A1/0AO+St6WoKiO5aKsrrwf5+ZMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HGQTv4/x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HGQTv4/x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0F9CC43390;
	Sun, 24 Mar 2024 23:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711321456;
	bh=OkQag3fGV2PD8R+QrG3u5lsG7MCrCma4Ow49X1gbOkg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HGQTv4/xbwrHUCGq5jVgYRciuDrwk5AeeIZFfv5qGrBduSikkoVaj92bxjSBkOmP7
	 sbhz5iorliMty5BBtOVjEL9sIESZDFgqhjsvyyMjtLl0Kuvf8GX7cZF9tRB/dBC0Nu
	 JZ3W0Y7cH4HzbMI46i3M7peOKFSv432zY757qfJzTYo5fOeLaHZlXpgMd9MCsDLQy5
	 I365xJHG4r4rniCIviqkJbuhqbj25EHdk/bGeq96QWxQXfefNSn5kwTnCpHZEHXiWC
	 C5Ngu9MPoxeVMy8IZpEYN+hJ1EKBC9CKI88ihOVXMcvnEKxMpt1f0hYE7QHpaR8LO+
	 AWHO924L/KlOA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Manorit Chawdhry <m-chawdhry@ti.com>,
	Andrew Davis <afd@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 6.6 181/638] arm64: dts: ti: k3-j784s4: Fix power domain for VTM node
Date: Sun, 24 Mar 2024 18:53:38 -0400
Message-ID: <20240324230116.1348576-182-sashal@kernel.org>
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

From: Manorit Chawdhry <m-chawdhry@ti.com>

[ Upstream commit e4d252e6d29208aea56d4c04270523e306b1e3c2 ]

Fix the power domain device ID for wkup_vtm0 node.

Link: https://software-dl.ti.com/tisci/esd/latest/5_soc_doc/j784s4/devices.html
Fixes: 64821fbf6738 ("arm64: dts: ti: j784s4: Add VTM node")
Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
Reviewed-by: Andrew Davis <afd@ti.com>
Link: https://lore.kernel.org/r/20240201-b4-upstream-j721s2-fix-vtm-devid-v2-2-85fd568b77e3@ti.com
Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/boot/dts/ti/k3-j784s4-mcu-wakeup.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-mcu-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-mcu-wakeup.dtsi
index 4ab4018d36953..8d26daf7fa3d1 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-mcu-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-mcu-wakeup.dtsi
@@ -616,7 +616,7 @@ wkup_vtm0: temperature-sensor@42040000 {
 		compatible = "ti,j7200-vtm";
 		reg = <0x00 0x42040000 0x00 0x350>,
 		      <0x00 0x42050000 0x00 0x350>;
-		power-domains = <&k3_pds 154 TI_SCI_PD_SHARED>;
+		power-domains = <&k3_pds 243 TI_SCI_PD_SHARED>;
 		#thermal-sensor-cells = <1>;
 	};
 
-- 
2.43.0

