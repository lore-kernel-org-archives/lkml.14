Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F0E3128811;
	Mon, 26 Feb 2024 15:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708960637; cv=none; b=PfE+tfCTc+XEC+IMOF2yqynanuV/alqPvIuQu/cPqPKRwRZAP4p1MFJrrOukGIMug2jZTdFrzoTunbJvgiRwiK63OdUFs3ceY2Bwt2LKYqK//ANG7GgJDjcqXq7r6kUtYmihZ4ENQHGsDtQ3OJgZG4obJUtsdre//QupH8tBnXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708960637; c=relaxed/simple;
	bh=09HsgNF9nVk+pfhzUS+EWxSsgRTQA1ssEWqc69aOPkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B6/DqdmR+ifHbxcU0FUzhVQK/KBiPJzRfWqdinb4gD7YNYqcreIFMmYgJk6fZ09mM4g9PQlPXh50WaMmX5hLj5tJK1xi5nq3AmoQmLY+9DEihwRbDV/F42jRrh4Pg8kdPqA2VWoS5KcmJyuQhtW5sLn2KSe4L65iFNoPdV1pU3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0BA17DA7;
	Mon, 26 Feb 2024 07:17:52 -0800 (PST)
Received: from pluto (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E4C783F762;
	Mon, 26 Feb 2024 07:17:10 -0800 (PST)
Date: Mon, 26 Feb 2024 15:17:08 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	"sudeep.holla@arm.com" <sudeep.holla@arm.com>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	Aisheng Dong <aisheng.dong@nxp.com>,
	Nitin Garg <nitin.garg_3@nxp.com>,
	Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>,
	Ye Li <ye.li@nxp.com>
Subject: Re: [PATCH] pinctrl: scmi: support i.MX OEM pin configuration type
Message-ID: <ZdyrdOmtYH0paGIh@pluto>
References: <20240223071557.2681316-1-peng.fan@oss.nxp.com>
 <DU0PR04MB94172086AB4EF0389B78CA6A885A2@DU0PR04MB9417.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DU0PR04MB94172086AB4EF0389B78CA6A885A2@DU0PR04MB9417.eurprd04.prod.outlook.com>

On Mon, Feb 26, 2024 at 01:16:51PM +0000, Peng Fan wrote:
> Hi Linus, Sudeep, Cristian,
> 
> > Subject: [PATCH] pinctrl: scmi: support i.MX OEM pin configuration type
> 
> Sorry to ping early, but this impacts the design and i.MX95 SoC upstream(
> although I removed pinctrl to let uboot init pinmux as of now), so I would
> like see whether are you ok with the approach or not. This is the best as
> of now I could think out to not adding more size to firmware and make the
> dts format similar as previous i.MX.
> 

I'll let Linus and Sudeep argument better, but, for my understanding,
does this solve all the issue with supporting custom iMX DT pinctrl
bindings on top of the current SCMI pinctrl generic driver without the
need of your last 2 downstream patches, or I am missing somethimg?

Thanks,
Cristian
