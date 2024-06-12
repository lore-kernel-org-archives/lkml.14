Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C7517E46F
	for <linux-kernel@vger.kernel.org>; Wed, 12 Jun 2024 14:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718203250; cv=none; b=O5dQOvuHyNGQroUmgP3bCB04/HY6EsQoPuCGJpPcEW1U/XPBZIjON71CW3hvS/AE5dxg8vrm3EY4G+/OWHiT6lf+upWhzCDtFhF+OYMeCU5vBtagnY99QkdNaJi7RDZJVNFk5r0YkDfimBqoge3QDt1KAt6rA0e3wnc8MCeHASY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718203250; c=relaxed/simple;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HL3I/9YhyfTiCQOgDU1Jy12F7TEyiUfS9zXLRKBcF04xR0UAJph7QCSuJF1gh7SOrNnFL02P8tr9yD8NjCAepgoU7aPZOo0wPpL+8bjLahrX4gjjjGV1EDlMtwHIRthNEnRPH3mJXEIMfP9ksVKm/3Q2ux2Ak9Ot/22aieGO4iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 7323668AFE; Wed, 12 Jun 2024 16:40:43 +0200 (CEST)
Date: Wed, 12 Jun 2024 16:40:43 +0200
From: Christoph Hellwig <hch@lst.de>
To: Daniel Wagner <dwagner@suse.de>
Cc: Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Hannes Reinecke <hare@suse.de>, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvmet: always initialize cqe.result
Message-ID: <20240612144043.GB27924@lst.de>
References: <20240612-nvmet-always-init-v1-1-0c0fd94461f0@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612-nvmet-always-init-v1-1-0c0fd94461f0@suse.de>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

