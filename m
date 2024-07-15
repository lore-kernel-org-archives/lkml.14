Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962AC13B5B6;
	Mon, 15 Jul 2024 20:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721076650; cv=none; b=bqCxiJhBvGrWXr+8MA9Ks08BUITQBzvD06v3mCpuOUrwR0R8PYS5k98PIvDxVJUbhYYHAiwViePP5mwXrIjneLE4xGz6kSrcyOJo/av5qiVFS5m5BaTmKhJzaB+z8kiyxzLr+TQnrtRbBbM9cmFT71n5teBamfIVhMqeZRTcD/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721076650; c=relaxed/simple;
	bh=DsKv1AnbLIi/huCDomUZSsXmSWwVkesZakSY1Ot4E10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iDNfAjiHYvIUfU3p11UZi6wgtQ8VlKy7yXI5vnK7JP7dz7Ajs8iekwKW1ZXfVe5P+v0CnEK9iAYhQ41JaspChMYxOTmlpwOIfII6tCE7brMogbV7+er1LjmxMz+H0mM9KpKs5dJBIWU05naRhogyDJd7YTm/QYNdovPl7RRG/AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sBx1NCsk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sBx1NCsk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 469A4C32782;
	Mon, 15 Jul 2024 20:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721076650;
	bh=DsKv1AnbLIi/huCDomUZSsXmSWwVkesZakSY1Ot4E10=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sBx1NCskOtENzvyYcblevhJxDIA5+vo5nA5XHlD8Q4m6Fi5vfNySjP7GH624wmmTV
	 qXItdniWSCy73pv/FC48KRnouYOfB/5IKs01Thc27AWdY74qj2B0v0bjSka3lQt30/
	 i/+WZHX1L8eSayNofrevKjZofKLGlMQo2hJYc2qGjtnUpomxuunZqS07jrCcCvI9MX
	 68isftP1phj+YU/vZHAvcL0QN/PDU0NPPSjPzgnk50RCgIIJa7q7RXmU+pqEVcYYDU
	 oxg9MJ/hJD8DrEqLBQ3ybW+v4r+RaIH7zuGE8DiTYnR/Ca+9hZWFK7XdVu+GsEOJ+j
	 m5POjaD+Rnf2Q==
Date: Mon, 15 Jul 2024 14:50:47 -0600
From: Keith Busch <kbusch@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-nvme@lists.infradead.org, kernel-janitors@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Sagi Grimberg <sagi@grimberg.me>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] nvme-fabrics: Use seq_putc() in
 __nvmf_concat_opt_tokens()
Message-ID: <ZpWLpxwNTYlIbdAc@kbusch-mbp.dhcp.thefacebook.com>
References: <45f97bd8-21eb-4ef6-bc7d-9201e7447c08@web.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <45f97bd8-21eb-4ef6-bc7d-9201e7447c08@web.de>

On Sat, Jul 13, 2024 at 03:50:24PM +0200, Markus Elfring wrote:
> Single characters should be put into a sequence.
> Thus use the corresponding function "seq_putc".
> 
> This issue was transformed by using the Coccinelle software.

Thanks, applied to nvme-6.11.
