Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAD213E7F4;
	Wed,  6 Mar 2024 19:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709754940; cv=none; b=YcviusiI3mMRjsF80tqdWmujBGMlB6+pUMyWloMMZs2QgMPN0VAMs0SM4HDBxw5iGovHYW7eP55F7+1F4y3GcrhlmzJvgDP2NPgqYN6FKm8u7O6xazXOEFUYbAFoV4g7VC/OzIIG6q46YCukL4bedJxDRYGKkLD+JjC8bzI8KqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709754940; c=relaxed/simple;
	bh=DHgtZVECqapEjUjrKqRtxGGbPErg7C/K9pSZ1gA+riA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lG4xBxO0/syV4lAOPGMai66CHnXvbuzWu7+V695xbO+ieg6fyFDNMCJVR4Gd8PjVZkmClajCmbW3OxugNlbfToo2dOQDbLlneA5WSMWrXYB+WnCWKjtCTIOgWcLSUt7BBCDQkscxgWvCkkFwjsrcnRKb6vL11E0jbuoUdbkIuwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iNUgxi1u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iNUgxi1u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FB21C433F1;
	Wed,  6 Mar 2024 19:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709754940;
	bh=DHgtZVECqapEjUjrKqRtxGGbPErg7C/K9pSZ1gA+riA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iNUgxi1unkJhzgTtFI49eE10jErr1aGQy83YTmNMNHqqo9eXfysQt/o8FxluTu5v9
	 k8aQqHOi2eMLg8xg16Os2UGfM5u/Zs4kMgjgT7hRs90Fawgu3QdmyfHyY302ZAo1U2
	 Qq66BMEVb3xE4UX8Jxv7lkGPApGT+sZJeCWMP6ODmgM5tDjMnZKODSsagTG/wHm7rO
	 WBwJ8HoVstOBfTjnrXd8fxqvUBWNkMJdNtnvTt3PZofdovWZGwFWnLQvhtslM7abe6
	 DG0YFGB0ea8jkcFQSiyvuLpDca8QKY/tkihSFnYw+cRJHi3aTMIhWoP38T5NkcfqDC
	 jSockqQ8+hCMQ==
Date: Wed, 6 Mar 2024 19:55:36 +0000
From: Simon Horman <horms@kernel.org>
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: Karsten Keil <isdn@linux-pingi.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] isdn: mISDN: make elements_class constant
Message-ID: <20240306195536.GD281974@kernel.org>
References: <20240305-class_cleanup-isdn-v1-0-6f0edca75b61@marliere.net>
 <20240305-class_cleanup-isdn-v1-1-6f0edca75b61@marliere.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240305-class_cleanup-isdn-v1-1-6f0edca75b61@marliere.net>

On Tue, Mar 05, 2024 at 05:04:47PM -0300, Ricardo B. Marliere wrote:
> Since commit 43a7206b0963 ("driver core: class: make class_register() take
> a const *"), the driver core allows for struct class to be in read-only
> memory, so move the elements_class structure to be declared at build time
> placing it into read-only memory, instead of having to be dynamically
> allocated at boot time.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>

Reviewed-by: Simon Horman <horms@kernel.org>

