Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D998F60DCC;
	Tue, 13 Feb 2024 17:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707846886; cv=none; b=Yonmnv1AAMy1M+jyeu37RPwySXGrMgvj8GbVX0ToNTT/tucVZ3mLeGDa02SuaYCj08QcsGCgNOh2pGndnb23qp2UdNiQMN+qBP4OS4InqjFxmST0KQPkFvzCk99yMdevqDaEgPgbyhPvsA3BpxZXR/3ymUMQO/arOxnXF8fgxOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707846886; c=relaxed/simple;
	bh=XHWjviyT59gqZhXyhTnn2OydP61PHq7HtZuknRdLvcY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HioDFTLSe2E5LUDf2kYz1NkwU83PkmEYg6+Yb2tYW+u/zVZSCS21SYnmxqPY7jk+IkcI68ypsy6KZIQIYShHRZDWQb0cv6Ptadv+PGYbyYk6eKskBagyjFWoDeIOdlIANGwxXmuus6vIwBJoAlNIKQd7nACCcQ7pKIJ2+q6c9D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AVDqt2qp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AVDqt2qp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1832C433F1;
	Tue, 13 Feb 2024 17:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1707846886;
	bh=XHWjviyT59gqZhXyhTnn2OydP61PHq7HtZuknRdLvcY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AVDqt2qppekmYp2WiWiChVIXKbQKESrKK4ZyUXcav5797xDEhqGR92qc5Conmhmy0
	 xCgBPmddVb5c4BWOXYUkcMBI/kNN1gEGX1qceuUU3HZhv13yfinsCtosrKhXYkeejU
	 ZxwxgPxKOVpkP4clR/JxXWcTGS2M0qH9/z0ub7RM=
Date: Tue, 13 Feb 2024 18:29:17 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: Fenghua Yu <fenghua.yu@intel.com>, Dave Jiang <dave.jiang@intel.com>,
	Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: idxd: make dsa_bus_type const
Message-ID: <2024021313-confess-stilt-ee5a@gregkh>
References: <20240213-bus_cleanup-idxd-v1-1-c3e703675387@marliere.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240213-bus_cleanup-idxd-v1-1-c3e703675387@marliere.net>

On Tue, Feb 13, 2024 at 11:43:15AM -0300, Ricardo B. Marliere wrote:
> Since commit d492cc2573a0 ("driver core: device.h: make struct
> bus_type a const *"), the driver core can properly handle constant
> struct bus_type, move the dsa_bus_type variable to be a constant
> structure as well, placing it into read-only memory which can not be
> modified at runtime.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
