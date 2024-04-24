Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653A316F0E4;
	Wed, 24 Apr 2024 23:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714001011; cv=none; b=hEfmJOOJ831MJCpeBmTYhTSVewyYzYtGSWFO6dNCwuXd2Bur0mj97NKzmWJj7CNgLxVP7RMlEnUyV/LuL2XqTwilPs1JeaKbyzd7hzur8TSk4QNojcdszy793h5CiZuiGs7yMfGF/kU8YVTxVpkj1USedTvGatamd1m5AQA1Gpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714001011; c=relaxed/simple;
	bh=DSAXl2btpRruVeSuCey2pQknc9s3ykYHZffTIbKEnUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ozd5yoi5Q7rytyCPAWPM1AzXpnqkAwccbylI2MaGZQsWy4MoNz+HcPPH3ZCC8rrtwgfrUYoD6ckwcdznltNFzKnHX2OP472NDceJ80PeRQ2ogf1XC+46dKIU+ySCH7AvIbEAoJrNobUhTNOuVkCCHG0D36MQ42eJn8CLxjj7QBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e6giXf1m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e6giXf1m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C264BC113CD;
	Wed, 24 Apr 2024 23:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714001010;
	bh=DSAXl2btpRruVeSuCey2pQknc9s3ykYHZffTIbKEnUs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e6giXf1mdbPmaRvjLfk3QvkQVpBKGuA8GQgr4giCn/vx5EkatwZ/GEiYacxtctN6v
	 fYzTtlhbBZQhSIJruD/zmx/8lt6ckA5Xw/luBDERgXbyBGxJR8vtvWqnkd6D6uyd3O
	 fkUXwnKFl4crRdKoIIH0tz+8zOTQQ/c2pAsavnJjz3RDKachrp4aRjChEzgJOEV4VR
	 MHCwyHW0+/6mriJgiDU6b3F7IXfBBeOUvNDieyw/oQih39YYogDIIERbhrR9U6y6fF
	 QA15ggbqFX32OJwAXCg9nyuklzByu9jWDJVjujTU7wNkykHFWolLicXx5AXWQdaRFK
	 lrH42Q5AQmjFw==
Date: Wed, 24 Apr 2024 16:23:29 -0700
From: Lee Jones <lee@kernel.org>
To: cve@kernel.org, linux-kernel@vger.kernel.org
Cc: linux-cve-announce@vger.kernel.org
Subject: Re: CVE-2024-26922: binder: check offset alignment in
 binder_get_object()
Message-ID: <20240424232329.GB5414@google.com>
References: <20240424231031.709209-2-lee@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240424231031.709209-2-lee@kernel.org>

On Wed, 24 Apr 2024, Lee Jones wrote:

> Description
> ===========
> 
> In the Linux kernel, the following vulnerability has been resolved:

Revoked.  This CVE number is already in use.

Apologies for the noise.

-- 
Lee Jones [李琼斯]
