Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415BAEAC2;
	Tue,  2 Jan 2024 11:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=savoirfairelinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=savoirfairelinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.b="HfBx0L9S"
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id DFB4E9C0888;
	Tue,  2 Jan 2024 06:37:40 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id oH47By21Q_s9; Tue,  2 Jan 2024 06:37:40 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 50F959C0957;
	Tue,  2 Jan 2024 06:37:40 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 50F959C0957
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1704195460; bh=bAsNfTDPGcy9UE/qR8q9C/MYhrYIBcUMKG2G3Oi4VLE=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=HfBx0L9SYhFxNTXnatyaVVD/0MKoxKv1DkFPwS4FhP21ZdGhZFAP2Yw2hgXG5W1+t
	 DG22L6dYlNdqI/yA4nolhiQbAYRMk3Yvd1vhj35YZTZ1keQ1XC+emTImMoQmjgdIjh
	 alA58hoYPXIYl8/8523fTVCfrQVCNMBqb6qPyKUQ1uoRLrwWFtxWeVm73HyoV71weA
	 Vcvll8Fbldw/DCB9WQCaUVbMMf9+FXj0uatTbgq9RGC183UtRM5ockSfi6AD3jQlfV
	 NlAXW2vSrvxzA0K2KrHkaWWkgrrQsn+4DCiJZlStF1JhWW5TYl6ACLELjZgkVicaEV
	 5OCMfpqr9RX7g==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 20Ly5X62OB9G; Tue,  2 Jan 2024 06:37:40 -0500 (EST)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [192.168.48.237])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 1AD139C0888;
	Tue,  2 Jan 2024 06:37:40 -0500 (EST)
Date: Tue, 2 Jan 2024 06:37:39 -0500 (EST)
From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
To: Rob Herring <robh@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	shengjiu wang <shengjiu.wang@gmail.com>, 
	Xiubo Lee <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound <linux-sound@vger.kernel.org>, 
	devicetree <devicetree@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	alsa-devel <alsa-devel@alsa-project.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	Philip-Dylan Gleonec <philip-dylan.gleonec@savoirfairelinux.com>
Message-ID: <1300509761.24764.1704195459987.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: <20231220222550.GA1232936-robh@kernel.org>
References: <20231218124058.2047167-1-elinor.montmasson@savoirfairelinux.com> <20231218124058.2047167-11-elinor.montmasson@savoirfairelinux.com> <20231220222550.GA1232936-robh@kernel.org>
Subject: Re: [PATCHv3 RESEND 10/10] ASoC: dt-bindings: fsl-asoc-card: add
 compatible for generic codec
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.8.15_GA_4581 (ZimbraWebClient - GC112 (Linux)/8.8.15_GA_4581)
Thread-Topic: ASoC: dt-bindings: fsl-asoc-card: add compatible for generic codec
Thread-Index: r/qDupTL/n3XOuEH8yE+GIqg/zABBQ==

Hello,

On Wednesday, 20 December, 2023 23:25:50, Rob Herring wrote:
> On Mon, Dec 18, 2023 at 01:40:58PM +0100, Elinor Montmasson wrote: 
> > +Optional, relevant only with the "fsl,imx-audio-generic" compatible: 
> > + 
> > + - cpu-slot-width : Indicates a specific TDM slot width in bits. 
> > + - cpu-slot-num : Indicates a specific number of TDM slots per frame. 
> 
> Pretty sure I've seen other bindings with TDM slot properties. A sign we 
> need something common if we don't already have something. 

That's right, "tdm-slot.txt" already defines TDM bindings, I will
use them with the utility function snd_soc_of_parse_tdm_slot().

> > + - cpu-sysclk-freq-rx : Frequency of the CPU DAI sys clock for Rx. 
> > + - cpu-sysclk-freq-tx : Frequency of the CPU DAI sys clock for Tx. 
> > + 
> > + - cpu-sysclk-dir-rx-out : Boolean property. Specifies sys clock direction 
> > + as 'out' on initialization for Rx. 
> > + If not set, default direction is 'in'. 
> > + - cpu-sysclk-dir-tx-out : Boolean property. Specifies sys clock direction 
> > + as 'out' on initialization for Tx. 
> > + If not set, default direction is 'in'. 
> 
> Looks like clock stuff. Use the clock binding. 

simple-card defines similar properties at the dai level:
"system-clock-frequency" and "system-clock-direction-out".
The first is used if no "clocks" binding is specified for the dai node.

Maybe I could use a similar logic with fsl-asoc-card ?
* adding a "clock-cpu" phandle property which should be the cpu clock.
It will be used to retreive the frequency for both RX and TX.
* keeping "cpu-sysclk-freq-rx"/"cpu-sysclk-freq-tx", which are used if
no clock is provided, like "system-clock-frequency" in simple-card.
* keep using "cpu-sysclk-dir-rx-out"/"cpu-sysclk-dir-tx-out", like
"system-clock-direction-out" in simple card.

Also, maybe I could rename my new properties:
cpu-system-clock-frequency-tx, cpu-system-clock-direction-out-rx, ...
It would better match those in simple-card as they do the same thing.

Best regards,
Elinor Montmasson
