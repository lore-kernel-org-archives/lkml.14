Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0663F8CD
	for <linux-kernel@vger.kernel.org>; Wed, 31 Jan 2024 06:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706682528; cv=none; b=QQlrQZpF18pWfeHf+sHlE3lYGxwQhflIaXpkuis+6nxXnPaPbK4LHYOiMrTzXMhQJ8+1T3W24cSPCVZkXiijbGSfU0fBjo5ZvtjD/IygkBvEBm3oao9o48B1BlBbKCner/GExkM79Wjjv2HPDsV8zigZSW53N7MfAPYThMgW2/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706682528; c=relaxed/simple;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aL+Z0X5ukOMqh/ylAUbkAaoR4MtmpV96L5PQIrkRSNXXyUBHcPEPYJnVWiIYCM+noHj0ey1+IGJTmllZ23gyV/P4NHtzsew0x+DoER8K2ETMmTCy0Z9MnBzlOlvBZnB8vcXvaxZML8PVzUqP6z+b9Bbx3O7iOfKjY0gpW20+ImI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id BE61A68B05; Wed, 31 Jan 2024 07:28:43 +0100 (CET)
Date: Wed, 31 Jan 2024 07:28:43 +0100
From: Christoph Hellwig <hch@lst.de>
To: Daniel Wagner <dwagner@suse.de>
Cc: James Smart <james.smart@broadcom.com>, Keith Busch <kbusch@kernel.org>,
	Christoph Hellwig <hch@lst.de>, Hannes Reinecke <hare@suse.de>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 10/12] nvmet-fc: avoid deadlock on delete
 association path
Message-ID: <20240131062843.GI16225@lst.de>
References: <20240130094938.1575-1-dwagner@suse.de> <20240130094938.1575-11-dwagner@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240130094938.1575-11-dwagner@suse.de>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
