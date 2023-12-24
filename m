Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.198])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 476C7111C;
	Sun, 24 Dec 2023 07:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="EIjE2mLz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=TqfJ3
	7v1hcf1qB5MLxc/7ON3/Qaooss1EFg7ByuJihQ=; b=EIjE2mLzUHL7Nts/G0VhM
	Bn7P5V+Abugoq5Wpm/s+Fxr8OsNtsCirS1w7QVuaZmUKTriPrU8nM2G+WnP3dCfc
	MO2Za91hxCMQxSAptiPi6TNEKmXya1iKZjVe3ehDurXK/K6lRQdbdjBHxdNk9Ne3
	ktStE3ZBb4XrOCUrvrIlfg=
Received: from ProDesk.. (unknown [58.22.7.114])
	by zwqz-smtp-mta-g5-4 (Coremail) with SMTP id _____wD3Xwyr4odl89+HEA--.46538S2;
	Sun, 24 Dec 2023 15:50:08 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	lasstp5011@gmail.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	zhangn1985@outlook.com,
	Andy Yan <andyshrk@163.com>
Subject: [PATCH] arm64: boot: dts: rockchip: Fix led pinctrl of lubancat 1
Date: Sun, 24 Dec 2023 15:50:01 +0800
Message-Id: <20231224075001.3032214-1-andyshrk@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3Xwyr4odl89+HEA--.46538S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7WryrXFyfuw1UJF4DKr1DGFg_yoWDCFcEga
	4xWF1kJFs7JryFv3sIya95Wwn3K3sak34rGa1UAF1DGa4aqr48ZFyrJa48Cw1UG34IkrZ7
	J3yDXF1kCa1YgjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRMFApUUUUUU==
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBEBNQXmVOBJGtlAAAsK

According to the sch, the gpio control sys_led
is GPIO0_C5.

Fixes: 8d94da58de53 ("arm64: dts: rockchip: Add EmbedFire LubanCat 1")
Reported-by: zhangn1985@outlook.com
Closes: https://lore.kernel.org/linux-rockchip/OS0P286MB06412D049D8BF7B063D41350CD95A@OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM/T/#u
Signed-off-by: Andy Yan <andyshrk@163.com>
---

 arch/arm64/boot/dts/rockchip/rk3566-lubancat-1.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3566-lubancat-1.dts b/arch/arm64/boot/dts/rockchip/rk3566-lubancat-1.dts
index 1c6d83b47cd2..6ecdf5d28339 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-lubancat-1.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3566-lubancat-1.dts
@@ -455,7 +455,7 @@ &pcie2x1 {
 &pinctrl {
 	leds {
 		sys_led_pin: sys-status-led-pin {
-			rockchip,pins = <0 RK_PC7 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <0 RK_PC5 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
-- 
2.34.1

