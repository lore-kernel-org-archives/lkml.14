Received: from mecka.net (mecka.net [159.69.159.214])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF4EBCA4C;
	Sat, 23 Dec 2023 11:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mecka.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mecka.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mecka.net header.i=@mecka.net header.b="NztlpVQN"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mecka.net; s=2016.11;
	t=1703329289; bh=ex4+oWyKh7OTgVh1dHGylYv3zVuujQIpgzSgPmA8rfY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NztlpVQN2fpI8YW67tmpz6vcufmN/GzaPIF2pkDoMhIUzWsfBxC20hKV5vY79Sg+A
	 wNaDBAyLtT0psl4Ko3SMyoZFSup0sI3f1X06A+SC/mckPbIV0rXwg/AQw/X6PQMOjh
	 dthFnRk8ICjm0b+CSv3lWJBifXoyOCurhpyHKlkIk3jJyYUDTYnOD6rsb0Vog4RbyL
	 8m7MUFnLoTYhxAcW7CVAJTkdhY1m/DhdzEgE0rlZRWZU3L/DCNF8oQHsCiAFRjSf1s
	 6mXh0ParwarIfgUQDv2k15Zmd7PoL2qC2tx3eil11gbTBCZYIXyehbHSMKqwwL4kdb
	 wpdW9WucK8wcg==
Received: from mecka.net (unknown [185.147.11.134])
	by mecka.net (Postfix) with ESMTPSA id D9896371740;
	Sat, 23 Dec 2023 12:01:28 +0100 (CET)
Date: Sat, 23 Dec 2023 12:01:27 +0100
From: Manuel Traut <manut@mecka.net>
To: Diederik de Haas <didi.debian@cknow.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
	Mark Yao <markyao0591@gmail.com>,
	Segfault <awarnecke002@hotmail.com>,
	Arnaud Ferraris <aferraris@debian.org>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 0/6] arm64: rockchip: Pine64 pinetab2 support
Message-ID: <ZYa-Bw61x-BPaGsi@mecka.net>
References: <20231222-pinetab2-v1-0-e148a7f61bd1@mecka.net>
 <2631715.l0DajZZ3Y3@bagend>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2631715.l0DajZZ3Y3@bagend>

On Fri, Dec 22, 2023 at 05:51:41PM +0100, Diederik de Haas wrote:
> On Friday, 22 December 2023 12:05:40 CET Manuel Traut wrote:
> > [3]
> > https://salsa.debian.org/Mobian-team/devices/kernels/rockchip-linux/-/blob/
> > mobian-6.6/debian/patches/display/0018-drm-panel-add-BOE-TH101MB31IG002-28A-
> > driver.patch?ref_type=heads 
> > [4]
> > https://salsa.debian.org/Mobian-team/devices/kernels/rockchip-linux/-/blob/
> > mobian-6.6/debian/patches/device-tree/0134-arch-arm64-add-Pine64-PineTab2-de
> > vice-trees.patch?ref_type=heads
> 
> FWIW I believe the actual sources are from
> https://github.com/TuxThePenguin0/linux/commits/device/pine64-pinetab2_stable

Thanks for pointing this out, there are also some other relevant changes.
I will take care on this and Krzysztofs review and post a v2 later.

Thanks
Manuel
