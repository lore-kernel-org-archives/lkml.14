Received: from forward502c.mail.yandex.net (forward502c.mail.yandex.net [178.154.239.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01FB856B87;
	Mon, 19 Feb 2024 22:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708382131; cv=none; b=lZiN5c1BKAK875eo1iYg+TvWuxiNrkmwy03HvRwK8O1WbsGxZY2LOQG8XzkRxODjcxKxYXJy3TYD78zIc6u06rglzzl9QKs3mJ3YVYo0e0v1qTD6KWC2xtu0p4pQLribNp0WqE6HUiBcT29Q94QhIJFm7syhFqK4VJ9U6zoMF1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708382131; c=relaxed/simple;
	bh=9kzD+xHSBMYRQ3AfdceDMPo82fl/t6sSn/swEFrNv3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lem93MFd6ILQGo3lofRYUXS5oLn8XbS6ZHNOJrwpHSZVr0HHZBfbCTUgXukrDvGLwogfK51DrzwddE+8zQlFZw6bt1k7BwJU9PiDBLdlfIt3QsNGEWMD4SkHvviClGPXh9IrbGc8z9DcVr+3n0DbvCpza/wvoT5q4ico41uUd0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=6tel.net; spf=pass smtp.mailfrom=6tel.net; dkim=pass (1024-bit key) header.d=6tel.net header.i=@6tel.net header.b=COeQMxXC; arc=none smtp.client-ip=178.154.239.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=6tel.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6tel.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=6tel.net header.i=@6tel.net header.b="COeQMxXC"
Received: from mail-nwsmtp-smtp-production-main-46.myt.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-46.myt.yp-c.yandex.net [IPv6:2a02:6b8:c12:3285:0:640:fd1e:0])
	by forward502c.mail.yandex.net (Yandex) with ESMTPS id 0E82660F86;
	Tue, 20 Feb 2024 01:35:28 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-46.myt.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id bYZIDNh7RSw0-8uC7ISLC;
	Tue, 20 Feb 2024 01:35:27 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=6tel.net; s=mail;
	t=1708382127; bh=tjOeEAQ/Gd5EHzC20z6YlhmTnhYEtnY97/66ZuEpgP0=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=COeQMxXCKQ43K+rRMKwHrtY+skG2ILaQO0qPV65mVLYCvNWCpvJ2KctR6Fg3nqya1
	 2WF56xkoG1yyKDsK9axNl8ds2BXOAefaR9L5aAcEYXXcsLr12rAWoV0gKIwlri6Uq7
	 9Pw+J/oLSXKV9OphJ9Bzk93sak6LmJ6+OXbx1ywY=
Authentication-Results: mail-nwsmtp-smtp-production-main-46.myt.yp-c.yandex.net; dkim=pass header.i=@6tel.net
From: efectn@6tel.net
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	sebastian.reichel@collabora.com,
	Muhammed Efe Cetin <efectn@protonmail.com>
Subject: [PATCH 9/9] arm64: dts: rockchip: Add RTC to Khadas Edge 2
Date: Tue, 20 Feb 2024 01:34:25 +0300
Message-ID: <4c4c9140ff36f290ba64ecc8b3e218df6a5ab273.1708381247.git.efectn@protonmail.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <5a7bd2cd8703e51382abfc11242de59d45286477.1708381247.git.efectn@protonmail.com>
References: <5a7bd2cd8703e51382abfc11242de59d45286477.1708381247.git.efectn@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Muhammed Efe Cetin <efectn@protonmail.com>

Khadas Edge 2 has PT7C4363 RTC that compatible with HYM8563.
The RTC pinctrl is also connected to MCU.

Signed-off-by: Muhammed Efe Cetin <efectn@protonmail.com>
---
 .../arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts b/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts
index 767e21b2dc34..2022a174594c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts
@@ -216,6 +216,18 @@ regulator-state-mem {
 	};
 };
 
+&i2c2 {
+	status = "okay";
+
+	hym8563: rtc@51 {
+		compatible = "haoyu,hym8563";
+		reg = <0x51>;
+		#clock-cells = <0>;
+		clock-output-names = "hym8563";
+		wakeup-source;
+	};
+};
+
 &pinctrl {
 	vdd_sd {
 		vdd_sd_en: vdd-sd-en {
-- 
2.43.1

