Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECC7D13DDAE
	for <linux-kernel@vger.kernel.org>; Wed, 29 May 2024 11:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716983325; cv=none; b=I5Rvq18TK2Nzj793Uvr5ZIqgomw/HC9GKEIXtT50s3KEzWhrceGlaybIQzeBAezBbaj6OMQqixlIcV5/TJoBB3yiq9bVWlERUVTdSgjlMlJ/y5Cah94yX8WtpAbi8OtPdBtQ6JuVLWDCgSWxBqvr856QRNsyaioSZUu2fnD+dzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716983325; c=relaxed/simple;
	bh=2mDZUXMSLDBIPCh16+epzZP8Y3IzRgJRHYxvEmw+Z8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K6iJMx3NN2jnSWuTKOezn5YWOl41oINmevIRpiAPjIsrKXobZiqfxEKYHUWxoYidG3gBA6xiSYraCLalZyfVhqDAwWgTaMeWW+zkGUsNOJT/Lpja3paILqMe6nsHLGiUzYZcGzYCGrv7395R4pLEyJ7WfJCGOK+jskETXJJjFck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52932339;
	Wed, 29 May 2024 04:49:06 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A81B23F792;
	Wed, 29 May 2024 04:48:40 -0700 (PDT)
Date: Wed, 29 May 2024 12:48:37 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mailbox: ARM_MHU_V3 should depend on ARM64
Message-ID: <ZlcWFRftNHFOjYlr@pluto>
References: <e00498fccf6dcbcf63bd24a137bfc7abd1b98345.1716967720.git.geert+renesas@glider.be>
 <Zlb_txl4CqCfxWZz@pluto>
 <CAMuHMdUyW_RxfUaxnyWVzPsdXQWqCQbgZ+avHskinXkrSFqhtw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUyW_RxfUaxnyWVzPsdXQWqCQbgZ+avHskinXkrSFqhtw@mail.gmail.com>

On Wed, May 29, 2024 at 01:36:42PM +0200, Geert Uytterhoeven wrote:
> Hi Cristian,
> 
> On Wed, May 29, 2024 at 12:13 PM Cristian Marussi
> <cristian.marussi@arm.com> wrote:
> > On Wed, May 29, 2024 at 09:30:45AM +0200, Geert Uytterhoeven wrote:
> > > The ARM MHUv3 controller is only present on ARM64 SoCs.  Hence add a
> > > dependency on ARM64, to prevent asking the user about this driver when
> > > configuring a kernel for a different architecture than ARM64.
> >
> > the ARM64 dependency was dropped on purpose after a few iterations of
> > this series since, despite this being an ARM IP, it has really no technical
> > dependency on ARM arch, not even the usual one on ARM AMBA bus, being this a
> > platform driver, so it seemed an uneeded artificial restriction to impose...
> > ...having said that, surely my live testing were performed only on arm64 models
> > as of now.
> 
> For that, we have COMPILE_TEST=y.
> 
> > So, I am not saying that I am against this proposed fix but what is the
> > issue that is trying to solve, have you seen any compilation error ? or
> > is it just to avoid the user-prompting ?
> 
> I did not see a compile error (I didn't enable it on any non-ARM
> platform).
> 
> But it is rather futile to ask the user about (thousands of) drivers
> for hardware that cannot possibly be present on the system he is
> configuring a kernel for.

Understood, as of now it is certainly high-unlikely to find such an ARM
IP on a non-ARM SoC and I suppose that we can anyway drop this if ever the
day will come that such a system will appear.

Fine for me.

Thanks,
Cristian

