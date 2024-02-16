Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8861BC26
	for <linux-kernel@vger.kernel.org>; Fri, 16 Feb 2024 09:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708076990; cv=none; b=lTlETz9eQW72a9l60C0DvmfJAsp6eV/Nh5Zcu8hQ9+VnWCDDAAY5whnfWcFhagxm8HKbMV7ifvTh4VhIV0vSpNWoOOqNnPYfKES9S1LLB38pwawkN3a0o4T4bRPQHLTnfcS6luEatXVGrB6I895Zea3qyHnAK2+hw+MUlpq2IKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708076990; c=relaxed/simple;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cTmn+kjdX9kGRsnb7hVn53xxAsYzQDd3mZTvKHsmrC5LLmXqd0lxBhuGzjAvd4ujvhGJ3aBP1RcE+oqv7d29lRVamTwX9ihrhyaSjza5NB9UFPqnfNlQhOlCJVEbRvvjyxt9P2As7MtnI+TnnrzOEXVz+av9PSfmGuMuPOJ4ESg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id EB77868BFE; Fri, 16 Feb 2024 10:49:45 +0100 (CET)
Date: Fri, 16 Feb 2024 10:49:45 +0100
From: Christoph Hellwig <hch@lst.de>
To: Daniel Wagner <dwagner@suse.de>
Cc: James Smart <james.smart@broadcom.com>, Keith Busch <kbusch@kernel.org>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Hannes Reinecke <hare@suse.de>, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v0 3/6] nvme-fc: do not retry when auth fails or
 connection is refused
Message-ID: <20240216094945.GC19961@lst.de>
References: <20240216084526.14133-1-dwagner@suse.de> <20240216084526.14133-4-dwagner@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240216084526.14133-4-dwagner@suse.de>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
