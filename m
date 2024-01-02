Received: from mecka.net (mecka.net [159.69.159.214])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35E7D12E5A;
	Tue,  2 Jan 2024 14:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mecka.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mecka.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mecka.net header.i=@mecka.net header.b="OlCBZLIV"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mecka.net; s=2016.11;
	t=1704206933; bh=OLsgumS1zwfIQwHwTxGsJd911hWOiA9RORKv5bCget8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OlCBZLIVeF/PoWDACRceIzqmgbYteJEJ355bQ4YJdhOXq6ILi0racCbJ6xERTAkhu
	 vs1kNQwxNsPHgrddbFYJENfb1E53QLEp3HygJqSADaZcTljUobsfwnjTEIGTHDKB+6
	 QpvLBUBJLYdG9s6rMh4rKRQPL+OLQ1h+DdI1Tjpg9ErMxLRbOHGhcTtqxRJBKuyUIX
	 lMNavOXv+doYpUl7zIvJZpSkqH7by1n8OkxzTfJkF0ZO/HLUpqQtcTjVS5Cinp+wWA
	 k/b3WUCjXkC+POgl8A32MlXHZpUPBHe90L+4TQyUTbde/H3P13qnCQFkNGvcilqhBa
	 BqX8loGptRM0A==
Received: from mecka.net (unknown [185.147.11.134])
	by mecka.net (Postfix) with ESMTPSA id 8F75D377B81;
	Tue,  2 Jan 2024 15:48:52 +0100 (CET)
Date: Tue, 2 Jan 2024 15:48:51 +0100
From: Manuel Traut <manut@mecka.net>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
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
	Diederik de Haas <didi.debian@cknow.org>,
	Segfault <awarnecke002@hotmail.com>,
	Arnaud Ferraris <aferraris@debian.org>,
	Danct12 <danct12@riseup.net>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 2/4] drm/panel: Add driver for BOE TH101MB31IG002-28A
 panel
Message-ID: <ZZQiU7o9QQrm-axU@mecka.net>
References: <20231223-pinetab2-v2-0-ec1856d0030e@mecka.net>
 <20231223-pinetab2-v2-2-ec1856d0030e@mecka.net>
 <342bf5a0-8454-4fd6-be45-462f1e31e606@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <342bf5a0-8454-4fd6-be45-462f1e31e606@quicinc.com>

On Tue, Dec 26, 2023 at 02:56:58PM -0800, Jessica Zhang wrote:
> 
> 
> On 12/23/2023 7:20 AM, Manuel Traut wrote:
> > From: Alexander Warnecke <awarnecke002@hotmail.com>
> > 
> > The BOE TH101MB31IG002-28A panel is a WXGA panel.
> > It is used in Pine64 Pinetab2 and PinetabV.
> > 

> Hi Manuel,

Hi Jessica,

> Sorry, I responded to the v1 instead of the latest version. Carrying my
> comment over to here:
> 
> If I remember correctly, commit d2aacaf07395bd798373cbec6af05fff4147aff3
> should have introduced prepared/enabled do the drm_panel struct.

thanks for the hint, I will update this in v3.

Regards
Manuel
