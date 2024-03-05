Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8278593E;
	Tue,  5 Mar 2024 13:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709645723; cv=none; b=rEjC87wkdaEKaOzmtUS6aRJY4U+et/Z3ZlN6gWAkAdJkm2ALY+x2uLIBJ92wPGsX77sMehoty1WCRQq5qaY10/pdXF5MK/o0nTcJ+NQc1+CtVL0SFGq6fLPu7vStblPOTw9syb6gZVVzO8lEIrvhrWzYJtP3DBxqd0oS2/sJHYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709645723; c=relaxed/simple;
	bh=oiHeawagXvJcQ1MNhjuE3hTeoiG9E8Iex70tagYEp7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BbaV1LYqKWwQIA7ooqVq/4l6Z+AF02FjjI2O3A3DeODrqBJbcQ6vQXH+eBKkhL+eFDjlwYheDZx6bSYLg/9yfQDD5ARF/opTXIISxnRjOnMFbsWyQpGPcFNoMgVNbC4SqKMBV4yvUEerNNZ12Xz1BSJSlKy3J65SkBRha6AkK1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cVmWNKCJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cVmWNKCJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 892AFC43394;
	Tue,  5 Mar 2024 13:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709645722;
	bh=oiHeawagXvJcQ1MNhjuE3hTeoiG9E8Iex70tagYEp7s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cVmWNKCJ2cTRNGR7KpwWe+kAMekLQ+tz52cwqdZBs100bjzobEtW+obocRQ15jdPr
	 pUG34iyjoqM4AywpvaMNTevcngOdHIctILwrFMbwzRQT60S7uX4yBhpzyttWt7N16E
	 K/wh4acQCYii6Ppjo2bseNZlSVujJkBERxWEREsemOx5qVuot/l2qfkWKM6wGPz9KP
	 9Hyg/OTppNvQH+YCyi5P84/NK624y3Cj2PYRvjyqn+soqEKkP1I9AWwLUx9sj1PoZL
	 VNWRX5cKCytB/46DG/QeriTAArmBGmLxy4kz/pIhn3/tyYfM/8VAjmdOgPyIswOmp5
	 3b4aletxJg76w==
Date: Tue, 5 Mar 2024 13:35:18 +0000
From: Simon Horman <horms@kernel.org>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, justinstitt@google.com, andrew@lunn.ch,
	linux-usb@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sr9800: Add check for usbnet_get_endpoints
Message-ID: <20240305133518.GF2357@kernel.org>
References: <20240305075927.261284-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240305075927.261284-1-nichen@iscas.ac.cn>

On Tue, Mar 05, 2024 at 07:59:27AM +0000, Chen Ni wrote:
> Add check for usbnet_get_endpoints() and return the error if it fails
> in order to transfer the error.
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Hi Chen Ni,

I guess that this is a bug fix and as such it should be targeted
at the net tree and annotated as such:

	Subject: [PATCH net] ...

And have a fixes tag, perhaps:

Fixes: 19a38d8e0aa3 ("USB2NET : SR9800 : One chip USB2.0 USB2NET SR9800 Device Driver Support")

I don't think there is a need to repost to address the above,
but please keep it in mind for future Networking patch submissions.

Link: https://docs.kernel.org/process/maintainer-netdev.html

The above notwithstanding, this looks good to me.

Reviewed-by: Simon Horman <horms@kernel.org>

...
