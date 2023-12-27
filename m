Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CBC18ECF
	for <linux-kernel@vger.kernel.org>; Wed, 27 Dec 2023 09:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="J3rQw10p"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=zy714SvT+DQeUe4111cxTQNYwzGCyzYcljCEfmIN3GU=; b=J3rQw10p6C7CX49UsXweFs1cNn
	gVz02pGjxc+pgEAJH3mTDQmPaR3lBr9hi0VJJ0VGjC7qpUlnsl/uGmVhDoneemf+g5noLNGLopWQm
	NtORqDXsAH6dYYP1vUJxq/M/RJvcKYVAPKXgqGiEaBuk9MlS5UkiDec3yChcuA63niL4BSGDgAk0T
	pkFdC3opykDnmNsLfCQwxnnJttskyKqTzU3/W/jIMJqBXZ8s3AtaG0AFozVaaW2OGlVVEJDe3TruO
	ULdZXrsHPoCOg6bnjl24y0OCxKUmnbYOEkrKZF35n8DnkLNeEgqtI7HKm5Ncp8vZJp2zfid4EtAUm
	DhH5wSBg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1rIQeU-002aB4-7Y; Wed, 27 Dec 2023 09:56:38 +0000
Date: Wed, 27 Dec 2023 09:56:38 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Xiaobing Luo <luoxiaobing0926@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/cma: change print format of pointer in pr_debug()
 With %p, the pointer will be hashed and print (____ptrval____) instead.
Message-ID: <ZYv01tdp6/igAkJN@casper.infradead.org>
References: <20231227061825.116177-1-luoxiaobing0926@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231227061825.116177-1-luoxiaobing0926@gmail.com>

On Wed, Dec 27, 2023 at 06:18:25AM +0000, Xiaobing Luo wrote:
>  [    0.070467] cma: cma_alloc(cma (____ptrval____), count 256, align 8)
>  [    0.073003] cma: cma_alloc(): returned (____ptrval____)
> 
> Use 0x%px instead of %p to print the pointer. Then the print will be like:
> 
>  [    0.054963] cma: cma_alloc(cma 0xffffffde9ad42a60, count 256, align 8)
>  [    0.057385] cma: cma_alloc(): returned 0xfffffffe003b0000

Please explain why we should leak this information to userspace,
making it easy for an attacker?
