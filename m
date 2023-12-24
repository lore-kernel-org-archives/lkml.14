Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A72DDDA8;
	Sun, 24 Dec 2023 19:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i5e86193c.versanet.de ([94.134.25.60] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1rHUYk-0006HY-En; Sun, 24 Dec 2023 20:54:50 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Tianling Shen <cnsztl@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: configure pad driver strength for orangepi r1 plus lts
Date: Sun, 24 Dec 2023 20:54:46 +0100
Message-Id: <170344745823.2405994.14854102458051573585.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231216040723.17864-1-cnsztl@gmail.com>
References: <20231216040723.17864-1-cnsztl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sat, 16 Dec 2023 12:07:23 +0800, Tianling Shen wrote:
> The default strength is not enough to provide stable connection
> under 3.3v LDO voltage.
> 
> Fixes: 387b3bbac5ea ("arm64: dts: rockchip: Add Xunlong OrangePi R1 Plus LTS")
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: configure pad driver strength for orangepi r1 plus lts
      commit: fc5a80a432607d05e85bba37971712405f75c546

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
