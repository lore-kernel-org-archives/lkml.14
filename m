Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C743EA67
	for <linux-kernel@vger.kernel.org>; Wed, 31 Jan 2024 06:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706682479; cv=none; b=EGypK4x23uVWaGMji/01cZapw0sKIBX0BuStUgtJudBhpuGCPlW4N62CsijCia7hZrgwJ2AEQMgF6taYWyt0PzeYIGfhC74NoeUuKgP5fE5XEPOasvUsAPz529uPhxtsL69EcUvt8Vo3fRer4OWDXSOSURtx7bif0yA7op5DZr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706682479; c=relaxed/simple;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eskqVXDqvkw4g3ry6BMvKtlQ6WK14s0A5rIi57DNPtuzu8YB5eB7VZLqkxjhs7lve97Io/Obr3cdDkA2R3yWZbJhS+TIVxEEraO+WMZI9hkvt5c/R+NP8fMROz6vq3qcGpkprBlXJAQXYaZBLGunWowYDqKc+a6Oa+z57DKqLpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 6B32D68C4E; Wed, 31 Jan 2024 07:27:55 +0100 (CET)
Date: Wed, 31 Jan 2024 07:27:55 +0100
From: Christoph Hellwig <hch@lst.de>
To: Daniel Wagner <dwagner@suse.de>
Cc: James Smart <james.smart@broadcom.com>, Keith Busch <kbusch@kernel.org>,
	Christoph Hellwig <hch@lst.de>, Hannes Reinecke <hare@suse.de>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 07/12] nvmet-fc: remove null hostport pointer check
Message-ID: <20240131062755.GF16225@lst.de>
References: <20240130094938.1575-1-dwagner@suse.de> <20240130094938.1575-8-dwagner@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240130094938.1575-8-dwagner@suse.de>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
