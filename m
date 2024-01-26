Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2751BC28
	for <linux-kernel@vger.kernel.org>; Fri, 26 Jan 2024 13:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706276708; cv=none; b=Hmk4xWFNSqt2lsV95fp/QdrnqayIfCIu/5zgncVN0V1f9O8IQlVj68Bg8s9+CYljmjlRmlIsNZJMZf4uSjdFuptjzTfYY3qEvmPLueytBSFX3X9CDBWiyYIMxf70xQrHJL3Or47A5cy5OZoX2FYmE4xvvE2HwW40nlJEc/n7bzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706276708; c=relaxed/simple;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l9nTBiHv8l8CMyvj+GhjStuu7qCgrShbibP5CI1GqIR7F8iefdUfbTctBzzunkV0XV9ijs5pLZOEc6lUyaA6HJuVbtN2yI/dBfPMQjvlP0v+Bp4xTAmJcAI/F3tl8zjqNF0YQSsvWhcpw7rolxuIkqZCxvkArwWPDi0DsuctcZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id C705C68C4E; Fri, 26 Jan 2024 14:44:55 +0100 (CET)
Date: Fri, 26 Jan 2024 14:44:55 +0100
From: Christoph Hellwig <hch@lst.de>
To: Daniel Wagner <dwagner@suse.de>
Cc: James Smart <james.smart@broadcom.com>, Keith Busch <kbusch@kernel.org>,
	Christoph Hellwig <hch@lst.de>, Hannes Reinecke <hare@suse.de>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] nvme-fc: do not wait in vain when unloading module
Message-ID: <20240126134455.GA2928@lst.de>
References: <20240126132828.15315-1-dwagner@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240126132828.15315-1-dwagner@suse.de>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
