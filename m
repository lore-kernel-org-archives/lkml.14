Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E39171650
	for <linux-kernel@vger.kernel.org>; Tue, 30 Apr 2024 13:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714483440; cv=none; b=kVMk4bqhtf5UNgj/rWGep7ubwqYC1bSC/9vg1yUjBEH+n0xc8UwxOgNY4faDGZyPO0bO5j2H6zce1uWTvcF7DJwjYZXj8uzFwu7Qa17AmY6Yoc6GJhUFsXIhcZgGRosMgTgWqh9M9Avppbl1Ru3KgBYUQ2eSgmC9CEkcZ/IqX0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714483440; c=relaxed/simple;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rF/7P5yf38ZPte9jOkr63s2Ai6VXq8DjlS0TWcx/xmERL+S2ycZnA1vCcyIEshwZg2gv72fEBLBWlPIE21dKVJFNe1HWK4I81DXOJJmH89Weak9NKTl0Um0qZ8rQxewGSKuiNyTyhFB7Pw+i2xoiFaIKG8IjsHfFJdync2xVsFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id EFBF767373; Tue, 30 Apr 2024 15:23:53 +0200 (CEST)
Date: Tue, 30 Apr 2024 15:23:53 +0200
From: Christoph Hellwig <hch@lst.de>
To: Daniel Wagner <dwagner@suse.de>
Cc: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>,
	Sagi Grimberg <sagi@grimberg.me>,
	James Smart <james.smart@broadcom.com>,
	Hannes Reinecke <hare@suse.de>, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org, Hannes Reinecke <hare@kernel.org>
Subject: Re: [PATCH v7 2/5] nvmet: return DHCHAP status codes from
 nvmet_setup_auth()
Message-ID: <20240430132353.GA2843@lst.de>
References: <20240430131928.29766-1-dwagner@suse.de> <20240430131928.29766-3-dwagner@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240430131928.29766-3-dwagner@suse.de>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

