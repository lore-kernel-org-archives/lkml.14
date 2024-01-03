Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6812B1841;
	Wed,  3 Jan 2024 00:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gQhc6c1P"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3bbbc6bcc78so5239705b6e.1;
        Tue, 02 Jan 2024 16:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704240692; x=1704845492; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vPhCoFUOrRe68PAKBuJ0XCZdiktRxtpdmXF3NphnPpo=;
        b=gQhc6c1Pz90XKZa8s85mPmZJDT1AM73TxhN0X4PpgeYUsvYvkuQRrqwiijVDxQduNK
         G7VNO3ozHTTTeCZjX4Tt1WBlAYAbEylndrb78LeE1N6vqdSrPaVuQ933JBQkvyBMrU4o
         bo/Fv2lUbSGcHTXPSBUAF/DJYBuWveEdqxkkeXfcAbVO6/jQzvtCPS+K44VVGZApCVnA
         Ubjcr+Ju4YivaWo0g1jKP8oN00EZMeMUusHatEMKPNfBHmt0qgn8TwyFYe59QlMJl0cL
         Z7pwtj1gt9LFBumxmysBfb1fVDIuHtLtNg921MVg2yHHQ/sifHBtRc/2KbP10SqYlQDj
         oSzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704240692; x=1704845492;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vPhCoFUOrRe68PAKBuJ0XCZdiktRxtpdmXF3NphnPpo=;
        b=bdWJ2lvT6VGt+huk9j4qj2yvnYe9f0tnYtBHwjgL5CQlpYNb2PZARyiN0qg30icYUW
         cSbTmjfogSoeBgrVKYovS0iD+7dBYYwY0JZhKTuhaQPRlvN401ZPCaZEcmY3ma3rL8It
         Tq1alzYolpBe6oCmR+crWzICbPvO0lquWqpA6lENptpaILpgYVlMR9JSZ1W04Mqn/kRl
         yRWA7atX6G71Pps9wUiqdxAuWK/Re7qLip0UlUmgHSj2ksM48gs6/jq4YOT7/gp7IXGO
         Ldzr+tGdwecjXoC1WOojsBqCmSKepYpPek+K/jOXcJpLfNQ8JA3LWla1295ti4Fi14i7
         leSg==
X-Gm-Message-State: AOJu0YywhQtWpuzZSmPQRtjdFkHM3eI9eK9N0IKCfDwGWbrxexmNkLYB
	FMMNvilY5ir6iiIeLb2FJZ8GXT54tU8rcQ==
X-Google-Smtp-Source: AGHT+IGhE/yALeHSypQiLTPZ6IwELmr85Vhh6yAAxpExlueWQuwRyjPkDph8C0Z8fA5XSFJdnFLr4Q==
X-Received: by 2002:a05:6358:718b:b0:175:2cec:a767 with SMTP id t11-20020a056358718b00b001752ceca767mr4225579rwt.36.1704240692039;
        Tue, 02 Jan 2024 16:11:32 -0800 (PST)
Received: from fedora (c-24-4-59-2.hsd1.ca.comcast.net. [24.4.59.2])
        by smtp.gmail.com with ESMTPSA id qc8-20020a17090b288800b0028b1fce7c01sm195551pjb.37.2024.01.02.16.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 16:11:31 -0800 (PST)
Date: Tue, 2 Jan 2024 16:11:28 -0800
From: Tao Ren <rentao.bupt@gmail.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	Andrew Jeffery <andrew@aj.id.au>, taoren@fb.com,
	openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/6] ARM: dts: aspeed: Common dtsi for Facebook
 AST2600 Network BMCs
Message-ID: <ZZSmMJ//l972Qbxu@fedora>
References: <20210805222818.8391-1-rentao.bupt@gmail.com>
 <20210805222818.8391-4-rentao.bupt@gmail.com>
 <20231220081402.GA3831@wunner.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231220081402.GA3831@wunner.de>

Hi Lukas,

On Wed, Dec 20, 2023 at 09:14:02AM +0100, Lukas Wunner wrote:
> On Thu, Aug 05, 2021 at 03:28:15PM -0700, rentao.bupt@gmail.com wrote:
> > This common descirption is included by all Facebook AST2600 Network BMC
> > platforms to minimize duplicated device entries across Facebook Network
> > BMC device trees.
> [...]
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/ast2600-facebook-netbmc-common.dtsi
> [...]
> > +		tpmdev@0 {
> > +			compatible = "tcg,tpm_tis-spi";
> 
> What's the chip used on this board?  Going forward, the DT schema for TPMs
> requires the exact chip name in addition to the generic "tcg,tpm_tis-spi".

Sorry about the late response. It's "infineon,slb9670", and I will
submit a patch for fix it soon.


Cheers,

- Tao
