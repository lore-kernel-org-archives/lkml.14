Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3E817F363
	for <linux-kernel@vger.kernel.org>; Wed, 12 Jun 2024 14:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718203228; cv=none; b=aE4Wxux4+Tu2M9f6+tFRi6baapywk2vkiAARc1urmbfpIEduiDU77qqgABtirFxUe6Jv+fJ/O1Q179dqsVIexjpZmPBHWD/7MOBa/udOOfRW3UA0v0Ne6LIM5Os8mwuB6J40VSY8TXKC4AOmllSkXDGsvtlEY7ya7bhMB3m1Dg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718203228; c=relaxed/simple;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=urTs6rJZ/TnLSBCwgfvnnSxuQtSirDq9wDJGIOsEIxrH8fn48pKzlIPQxHhA5gnXcQ9cmocdNKdWrTyte1u0981NxSw2ST+g+VkOJ2irtpCGz2JPTE071H2DV4U0wZszhMAc+0YJePa43Li3PTLmW7UUYJpMXNHSaPrPP84hjNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id DBE9868AFE; Wed, 12 Jun 2024 16:40:19 +0200 (CEST)
Date: Wed, 12 Jun 2024 16:40:19 +0200
From: Christoph Hellwig <hch@lst.de>
To: Daniel Wagner <dwagner@suse.de>
Cc: Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvmet-passthru: propagate status from id override
 functions
Message-ID: <20240612144019.GA27924@lst.de>
References: <20240612-nvmet-passthru-fix-v1-1-f583f8affa2f@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612-nvmet-passthru-fix-v1-1-f583f8affa2f@suse.de>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
