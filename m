Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4070453E08;
	Wed, 20 Mar 2024 15:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710949810; cv=none; b=Rd80WzJ2Ma2g3QU845+r3xnlTo7ZqRVg85eK+LyRNjx2MFFJmtdLKAj2PFGnT/PC49CX4ix9KEg5Ua3OaITr2D31jWpejWfeqR500nloU+BdNknAv4YwUOtN8kWUK1qyzSLlaSYjDDz49aulnUqcnm7lgRIbk1xbGFy+Ioal+kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710949810; c=relaxed/simple;
	bh=yV5kY4sIkb4jems2jacg/bWxIUWyLtY3qiw/xe978ig=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AcfXii5gjQYQbtwMf5LiJwzOLIyAJNfuuinUFRlct9aYysXcvII7lzOdlo6JJjA5Hg7yfC45s/MOGfIW059oNeiX036D1KQa18IGKgChy5EnQtjmN8Bp7tbtVzD/p5jUJqZYa5bnPj2uLai80dMeaKjj74Z5MPb4eqci3kUliV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WOAKAHvn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WOAKAHvn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B776C433F1;
	Wed, 20 Mar 2024 15:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710949809;
	bh=yV5kY4sIkb4jems2jacg/bWxIUWyLtY3qiw/xe978ig=;
	h=Date:From:To:Cc:Subject:From;
	b=WOAKAHvnOrtIFYJUKCYFDq98dNB4HPXItaOac5JExggmsDai5Zl4mfTWPRhcIhHSd
	 3VgtYCPIaGMaNRuF0j34gXLKJ7Gud1mym+9kogO84nIHnFYYCabpc75gW/qOffCmYb
	 0EorfGFVhYPXkmL8jZSA7U9Zwv0fmlFjihgJNO1RFMkmiOueA7th9LNZUPERwnnmLL
	 nBf3dwjqXWh5XWlCIt+Ih+x9ffXyraclDz1d9NB/UESEMU5GgA5AgNAM9/qolxJuMW
	 mWmmONqn5DUvqAguMOWbgXIb+Uos7mquP6NHrsz7HxEwSGxV+Nnna7GDcgvcsiuv5y
	 KZn+nBVj4TwgA==
Date: Wed, 20 Mar 2024 08:50:07 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: conor@kernel.org, ojeda@kernel.org
Subject: Prebuilt LLVM 18.1.2 uploaded
Message-ID: <20240320155007.GA12384@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I have built and uploaded LLVM 18.1.2 to
https://mirrors.edge.kernel.org/pub/tools/llvm/.

If there are any issues found, please let us know via email or
https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
opportunity to get them fixed in main and backported before the 18.x
series is no longer supported.

Cheers,
Nathan
