Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DEF5225
	for <linux-kernel@vger.kernel.org>; Fri,  5 Jan 2024 04:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 0A16B68B05; Fri,  5 Jan 2024 05:31:33 +0100 (CET)
Date: Fri, 5 Jan 2024 05:31:32 +0100
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Keith Busch <kbusch@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] nvme: trace: avoid memcpy overflow warning
Message-ID: <20240105043132.GA23716@lst.de>
References: <20240103155702.4045835-1-arnd@kernel.org> <20240103155702.4045835-2-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240103155702.4045835-2-arnd@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Jan 03, 2024 at 04:56:56PM +0100, Arnd Bergmann wrote:
> -		memcpy(__entry->cdw10, &cmd->common.cdw10,
> -			sizeof(__entry->cdw10));
> +		memcpy(__entry->cdw10, &cmd->common.cdws, sizeof(__entry->cdw10));

Please avoid the overly long line.
