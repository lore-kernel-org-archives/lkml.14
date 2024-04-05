Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D416A24B28
	for <linux-kernel@vger.kernel.org>; Fri,  5 Apr 2024 06:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712297813; cv=none; b=sG8E1F4Lup3XwSAHyaE0SAcnXK+wwS2CyaNZv+MrVbQVLQ5VYTfMPVNq3p0rAG1c2OILpkINTmhdTOZ4CmY75/zeASjUcz2ACo1g4MTmXVYbO7mJv4oex3+NawcPM1/CGCBQlKDV2xARtij6kvg51mjnYE0CdJtvyVyJ3vcGtQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712297813; c=relaxed/simple;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z3vPl1YWGFlox6ZlceWoRhbknyreNxNs2BlQrT+U9vlsSE25mseXReqAnQD0QWRyyqn/2r2GCng+z5Sq324bLGf6dVewf1HQDCvCWN0XxVhtJftR3L+3biYh/DgwNS1tgg+53e1k1VWxz7L88ukmbwtexIVwk3EiYFYYsyFwo4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id AE53268D07; Fri,  5 Apr 2024 08:16:48 +0200 (CEST)
Date: Fri, 5 Apr 2024 08:16:48 +0200
From: Christoph Hellwig <hch@lst.de>
To: Daniel Wagner <dwagner@suse.de>
Cc: James Smart <james.smart@broadcom.com>, Keith Busch <kbusch@kernel.org>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Hannes Reinecke <hare@suse.de>, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org, Hannes Reinecke <hare@kernel.org>
Subject: Re: [PATCH v4 2/5] nvmet: lock config semaphore when accessing
 DH-HMAC-CHAP key
Message-ID: <20240405061648.GB3107@lst.de>
References: <20240404154500.2101-1-dwagner@suse.de> <20240404154500.2101-3-dwagner@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240404154500.2101-3-dwagner@suse.de>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
