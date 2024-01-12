Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CB4168CC
	for <linux-kernel@vger.kernel.org>; Fri, 12 Jan 2024 19:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wEzlG3U5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 128E9C43390;
	Fri, 12 Jan 2024 19:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1705088233;
	bh=ew3UB/+/Wu+260THz1eNJAhDnDXdfU5nnyjQIahxjUQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wEzlG3U5nDzx9L1f8WqsXoRY7WdpEizjN1GQTtN0gd+d9jJjH17BtEYMazNQMDJXI
	 W6nL74b1GpvuxK9SzFSntPUclhagGAJnW5YlMykBwGgGGcon20Uc4dq+8nyKYMkS7J
	 BJt2ThgOLj8KFsNBpD034zC4x1DmBq7NgJJTFEp4=
Date: Fri, 12 Jan 2024 20:37:10 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Jakub Kicinski <kuba@kernel.org>
Subject: Re: Deliberately sending partial patch sets?
Message-ID: <2024011247-caregiver-compacted-2e6b@gregkh>
References: <ZaFKvZg-MtZgbCKA@archie.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZaFKvZg-MtZgbCKA@archie.me>

On Fri, Jan 12, 2024 at 09:20:45PM +0700, Bagas Sanjaya wrote:
> Hi,
> 
> Let's say that there is a contributor who wish to send a patch set (e.g.
> 20-30 patches in the series) to LKML. But instead of sending the full
> series, he either do one of the following:
> 
> * Send only the cover letter (analogous to movie trailers)
> * Send only a few arbitrary patches in a series that are most important
>   (e.g. patch [01,04,11,18,23/30]) (analogous to match highlights)
> * Send only the first few patches in a series (i.e. subject of one of
>   patches says [09/30]) (analogous to sample book chapters)
> 
> The rest of patches are behind closed doors (i.e. not sent), possibly
> behind charm-priced (pay)walls.
> 
> Is the submission like above acceptable (when in review)?

No, kernel development is done in public.
