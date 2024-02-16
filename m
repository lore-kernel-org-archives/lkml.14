Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB1A1B959
	for <linux-kernel@vger.kernel.org>; Fri, 16 Feb 2024 09:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708076964; cv=none; b=TzulwTe/jY9C0Oeo3hYdGPxApbHmpuPpbao2+JM/9md8KJtXCKCNBR5cE1p/VEpVDBl4NSvvm4uvuix2sQhgr91WcwftMHyyRmljnATZY3Ay7hqN1VMNQW04cENTaqf/9z771Q0xmnGokpKF3VPwH8AWzfYkKwzaZp227BTg+BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708076964; c=relaxed/simple;
	bh=SX3rfEZ2V/LrYP8qAfhIuKY32PglZ6mFq7UDcr04PwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qK3HBflgejn/O/OUzHuC3+k6joTToc0Blc2eh1jYGT4ZpFu9hiFzGr0Juc2ZKmrAzteGKRsTjJhRzheHRcUzdltlvlHx6e+Ji/dITysTA9qGVENQunQFes1mQBpjAe/M33/bH643kKpbxtNHsrIdjmxK2y+u4pVlLmLfVCjquso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 1585968BFE; Fri, 16 Feb 2024 10:49:10 +0100 (CET)
Date: Fri, 16 Feb 2024 10:49:09 +0100
From: Christoph Hellwig <hch@lst.de>
To: Daniel Wagner <dwagner@suse.de>
Cc: James Smart <james.smart@broadcom.com>, Keith Busch <kbusch@kernel.org>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Hannes Reinecke <hare@suse.de>, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v0 1/6] nvme-fabrics: introduce connect_sync option
Message-ID: <20240216094909.GA19961@lst.de>
References: <20240216084526.14133-1-dwagner@suse.de> <20240216084526.14133-2-dwagner@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240216084526.14133-2-dwagner@suse.de>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, Feb 16, 2024 at 09:45:21AM +0100, Daniel Wagner wrote:
> The TCP and RDMA transport are doing a synchronous connect, meaning the
> syscal returns with the final result, that is. it either failed or
> succeeded.
> 
> This isn't the case for FC. This transport just setups and triggers
> the connect and returns without waiting on the result.

That's really weird and unexpected.  James, can you explain the reason
behind this?

> Introduce a flag
> to allow user space to control the behavior, wait or don't wait.

I'd expect this to be the default, but I'll wait to hear more about
the rationale.  If we keep the async default the option looks sensible.

