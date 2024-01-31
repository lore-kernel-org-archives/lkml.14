Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9967412CDB4
	for <linux-kernel@vger.kernel.org>; Wed, 31 Jan 2024 17:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706722305; cv=none; b=E/mtLn2FNaUOhuQPtyL4iIcXZWhJJ0RiF66g3+7EebjduJUNzpYHv5ZzVtC5nqo1YeoIJ9UGHSIfptzIadbNVbKWRw9YCc3T82mwRu3ZwhOl8B6wfVjkyd+cCt6loYMaUJjx0Muno6Pjg2dm2dT3TBlxTv9Qc7/51W8lO48EzyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706722305; c=relaxed/simple;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K2XpjVPonPAyluLjc2Y2sb4WkkX7GmsmaCXod9PgQO7ZUikzICoY6iC8Ls6c9Bqkrh8x4e/RwU1Ydu8G04ObdbFNoiwNFm5AdiSNXiLuMS//U2aWX8pBKZuM4Z7wecUQrhjOQ6MyAvjPmGKD47yULMA+yk3dKVGS4t6+DQrZsj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 2FB3D68BFE; Wed, 31 Jan 2024 18:31:37 +0100 (CET)
Date: Wed, 31 Jan 2024 18:31:36 +0100
From: Christoph Hellwig <hch@lst.de>
To: Daniel Wagner <dwagner@suse.de>
Cc: James Smart <james.smart@broadcom.com>, Keith Busch <kbusch@kernel.org>,
	Christoph Hellwig <hch@lst.de>, Hannes Reinecke <hare@suse.de>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 12/12] nvmet-fc: use RCU list iterator for assoc_list
Message-ID: <20240131173136.GA31567@lst.de>
References: <20240131085112.21668-1-dwagner@suse.de> <20240131085112.21668-13-dwagner@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240131085112.21668-13-dwagner@suse.de>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

