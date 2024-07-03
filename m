Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79CA170854;
	Wed,  3 Jul 2024 14:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720017252; cv=none; b=T20Z98tJebTVYTYSqjQmplgAv0Iil8veDK5qzYqbkm0++s02pABmnnrTwRBCQkPsRkEX4H+nGfjWNjhQjhnZn4fMJKJK+OppxKEfIUdMjdXRepPXlfVL2HM/BaB7t6qx8M9PctYm78nA39x9ldpCLMxsMoSv96auN6/mFTC3RsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720017252; c=relaxed/simple;
	bh=LLMX3jjXZxqGijzK4Yb8leC6X2Okra+Heoqx62+HtPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SlV1TcsJny9QehpOQsF6aMUxl0cYeHMhepkypLC0uhBX7KrnlbQLt9r1ff6cbKciBVGtc8sfxuUZpTQJXwP7aQo76bGQyqK+8juYj5tm+IUR3hoW8scwAufaYr5fQ1Zb0Jio36FjOLzxUEnBUYpEo0qauomI0dKEB/FTjntz3vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OOlfFPNn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OOlfFPNn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA2D8C2BD10;
	Wed,  3 Jul 2024 14:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1720017251;
	bh=LLMX3jjXZxqGijzK4Yb8leC6X2Okra+Heoqx62+HtPI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OOlfFPNnLzV7nWg3ygWFBK5cCsOyGCdWEAXodxWJJQLsXTTOY5m3IVT8Cd7TKJMlh
	 IbX08KnYyJVnwu2KuoQXLREiSOfvvgYAmPmqvk1CDJOQwvZcV47t+sSQYvLz5W8inC
	 OlYtc60ni6tQ7OavBtI6ATzVwohfTIdpLMbR7a0Y=
Date: Wed, 3 Jul 2024 16:34:08 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Sebastian Ene <sebastianene@google.com>
Cc: Marc Zyngier <maz@kernel.org>, arnd@arndb.de, will@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Dragan Cvetic <dragan.cvetic@xilinx.com>,
	Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v2 0/2] misc: vcpu_stall_detector: Add a PPI interrupt
Message-ID: <2024070357-henna-dubiously-bc1f@gregkh>
References: <20240613141335.1134341-1-sebastianene@google.com>
 <86tthwki93.wl-maz@kernel.org>
 <Zmsh53PnONKG23MC@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zmsh53PnONKG23MC@google.com>

On Thu, Jun 13, 2024 at 04:44:23PM +0000, Sebastian Ene wrote:
> On Thu, Jun 13, 2024 at 03:52:08PM +0100, Marc Zyngier wrote:
> > On Thu, 13 Jun 2024 15:13:33 +0100,
> > Sebastian Ene <sebastianene@google.com> wrote:
> > > 
> > > Hello,
> > > 
> > > I respined the v2 version to address an issue previously found here:
> > > https://lore.kernel.org/all/202406132132.FBKSWFav-lkp@intel.com/
> > 
> > So is this v2 or v3? Having two v2s on the list is... confusing.
> > 
> > 	M.
> > 
> 
> There is a small change in the patch 2/2 so you are right it should be v3,
> sorry for the confusion.

Please send a new version, nothing we can do with duplicate series on
the lists...
