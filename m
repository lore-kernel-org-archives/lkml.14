Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B1E57302
	for <linux-kernel@vger.kernel.org>; Tue, 20 Feb 2024 05:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708408438; cv=none; b=Z1Fv73l3CMrd1O7qCfcR78egbj8Pfq+FxHHv2lhNkilZ9MImuBhBEyBxx22uO+hsIpQfztkcZDzz/hMeLRDldE4VMoCG1GtBpHiZna+l7MJF4gM+PyEViniMl/JHh8fVkMfBjtzJMId8lLoi2VyASNxx5jOqTNqmABFOVAb64oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708408438; c=relaxed/simple;
	bh=mGAsuJ4JUrAAtk/Y4GdBXmsxhu1i6DQQWGtABcrWkbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gXVjMlt1mBen6q2b1Oe6z61ur6Gkqcqeebl/rVHONQJiNX5DDje9sZGB55TYkNliRGPETUzMm4iee3J1Xbk3iylVbEK821mKWrVLsPodoC3GyZ45TLd3aGS6JT+i1/CiCRmLl+YSa6Y7AfDKRpPrpLQSD5HJ+BhiZCK2I3TPNaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id A54E168AFE; Tue, 20 Feb 2024 06:53:53 +0100 (CET)
Date: Tue, 20 Feb 2024 06:53:53 +0100
From: Christoph Hellwig <hch@lst.de>
To: Keith Busch <kbusch@kernel.org>
Cc: Daniel Wagner <dwagner@suse.de>, James Smart <james.smart@broadcom.com>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Hannes Reinecke <hare@suse.de>, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/6] nvme-fabrics: introduce connect_sync option
Message-ID: <20240220055353.GB7554@lst.de>
References: <20240219131531.15134-1-dwagner@suse.de> <20240219131531.15134-2-dwagner@suse.de> <ZdOheNNssYuhBT9w@kbusch-mbp.mynextlight.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZdOheNNssYuhBT9w@kbusch-mbp.mynextlight.net>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Feb 19, 2024 at 11:44:08AM -0700, Keith Busch wrote:
> The series looks good to me. My only feedback is this patch doesn't
> change anything without patch 6, so I think these two go together.

And it needs to clearly document why fc is different and why we believe
that's reasonable (if we do, I'll chime into that thread in a bit).
