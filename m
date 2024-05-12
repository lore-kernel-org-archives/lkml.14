Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A20EBA53;
	Sun, 12 May 2024 13:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715520380; cv=none; b=JrDphhhw+TliGc3DiMClzdJjF+6xVNcoZ8bqcO9sbc0B/d0+a1hTZMppwx0pdd+nYpYCoOMuWQC+zzYxvjKOgObQMUdTdQ88Zl8ZfzakDlu0syycUpHGm+vEUBXZ+Y04zfAM09m7fabjPnqEAL07CkGdNOeuwdeK/ahKMT7Hef8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715520380; c=relaxed/simple;
	bh=WDtKNNP3iXCZPyTUSEcychOvwEY13GFXVMSzd5aqpnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L2OwttNR9B9irsSPEfmhy7eWkNC2XDOH42YL9QO2MNOQt4e9sqC1AHfEg7kGDfrBFOvTUwuR6MNVDx19ayoBbE2+XwGE9R0MbPL+qBJc8/6t8q2caSYnbz4GGBdJ6JwtblIGlf0BLKfue6Cq0NSYU9qyCPNr2rJYtJhaEKJi05U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=hsPOe+ht; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="hsPOe+ht"
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id DB20D1FE14;
	Sun, 12 May 2024 15:26:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1715520374;
	bh=14xTlFZyyAwub1YHid74UWqP0unctpKmhBnSJ9rOl18=; h=From:To:Subject;
	b=hsPOe+ht/lQmPxGcrmewU+3VwXIGIIVazsBpi17ROwIcRyauO6XJFUkt06waVCIHo
	 SfGVGYsNQw1pIVN6F9Dcu/U55spv11fg6poH2U6kKKAfMwWRV5beXgTZO6CfZCLRp2
	 YkURokHCC2i3Ry1S2wToOg0JPqaVykEh1c4X2dDNJPGTzAsYk7jxLhwk3KNroZJZ9l
	 22WZP5vdPMFlBejrwdddTrrDtbpnFzvHYaJmKoAxMHHHtYTGHPF/88bQmSGSoTWmh7
	 eLv3Ak0A8zgz+bVHC2JclQJXNiZ3jLOwSVWZ4kNpZL3BQWETLek4oGDvFbcmCI35/i
	 k0L7oPfO4hn5A==
Date: Sun, 12 May 2024 15:26:09 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-imx@nxp.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 1/2] arm64: dts: imx8mp-evk: Add HDMI audio sound card
 support
Message-ID: <20240512132609.GA6026@francesco-nb>
References: <1708675339-8180-1-git-send-email-shengjiu.wang@nxp.com>
 <1786327.VLH7GnMWUR@steina-w>
 <CAA+D8AMU69B1Bf3tbbvtkJz_pYY0VNaQMhBXxZvDYug=_DHxYg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA+D8AMU69B1Bf3tbbvtkJz_pYY0VNaQMhBXxZvDYug=_DHxYg@mail.gmail.com>

Hello Wang,

On Mon, Feb 26, 2024 at 11:06:48AM +0800, Shengjiu Wang wrote:
> On Fri, Feb 23, 2024 at 5:06 PM Alexander Stein
> <alexander.stein@ew.tq-group.com> wrote:
> > Am Freitag, 23. Februar 2024, 09:02:18 CET schrieb Shengjiu Wang:
> > > The AUD2HTX is a digital module that provides a bridge between
> > > the Audio Subsystem and the HDMI RTX Subsystem. This
> > > module includes intermediate storage to queue SDMA transactions
> > > prior to being synchronized and passed to the HDMI
> > > RTX Subsystem over the Audio Link.
> > >
> > > AUD2HTX works as the cpu dai in HDMI audio sound card.
> > >
> > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

...

> > Don't you need to configure the PAI as well? See [1]
> > for downstream implementation. I'm wondering because I had to hack something
> > similar. Without I got no HDMI audio.
> 
> Yes, the PAI part is needed.
> But this commit is just for sound card dts update.

I did try this series (the v3, to be correct) and to me is not working.
While I understand this is just the DTS update, did you got any chance
to send patches for the remaining bits required to have the
functionality working? Am I missing something?

Thanks,
Francesco



