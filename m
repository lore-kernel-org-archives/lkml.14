Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0D36EB66
	for <linux-kernel@vger.kernel.org>; Thu, 21 Dec 2023 10:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Swn5Z0FJqz4xMw;
	Thu, 21 Dec 2023 21:40:50 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: npiggin@gmail.com, christophe.leroy@csgroup.eu, Kunwu Chan <chentao@kylinos.cn>
Cc: kunwu.chan@hotmail.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20231204023223.2447523-1-chentao@kylinos.cn>
References: <20231204023223.2447523-1-chentao@kylinos.cn>
Subject: Re: [PATCH v3] powerpc/mm: Fix null-pointer dereference in pgtable_cache_add
Message-Id: <170315510015.2192823.7515374595652036540.b4-ty@ellerman.id.au>
Date: Thu, 21 Dec 2023 21:38:20 +1100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On Mon, 04 Dec 2023 10:32:23 +0800, Kunwu Chan wrote:
> kasprintf() returns a pointer to dynamically allocated memory
> which can be NULL upon failure. Ensure the allocation was successful
> by checking the pointer validity.
> 
> 

Applied to powerpc/next.

[1/1] powerpc/mm: Fix null-pointer dereference in pgtable_cache_add
      https://git.kernel.org/powerpc/c/f46c8a75263f97bda13c739ba1c90aced0d3b071

cheers
