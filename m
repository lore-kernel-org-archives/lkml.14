Received: from new-mail.astralinux.ru (new-mail.astralinux.ru [51.250.53.244])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C0515D5D1;
	Thu,  1 Feb 2024 12:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.250.53.244
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706789442; cv=none; b=enrW3h6evKiBF6ooYRb62g6Bgn8Y4XJtg1nQKUWQ4Q3X5I+JjWJii3zjN4iDNj7C2npn65DUCNNtKa3YVIglqSWZNUWERhpPexpvHB16TABn9e32dCIWfqDIEg+dWOAh57WCIedvial/lCCeYtcxf+CYXnfOLo4NiymA4auN0cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706789442; c=relaxed/simple;
	bh=XEc06V1n4FSn+Ug40uuVMig1sywikd4XSsElhJISztc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SKBQCMrZHs/LN+rYSmALGwyE9UBFruZ3914NBfIVDi94QroKz9gmiAJJV94gHduDGvhOh2/r7MODtUkZQenhTxV8BqEWJiBFL0EfSskKjGfFU4p7YTLZ1t89UFkSWVm/1n5yiETt2WGseBKhsSYgd8EonQog4BZdmMyGB9cCqhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=astralinux.ru; spf=pass smtp.mailfrom=astralinux.ru; arc=none smtp.client-ip=51.250.53.244
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=astralinux.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=astralinux.ru
Received: from [10.177.233.61] (unknown [10.177.233.61])
	by new-mail.astralinux.ru (Postfix) with ESMTPA id 4TQcx26v5mzGptc;
	Thu,  1 Feb 2024 15:03:02 +0300 (MSK)
Message-ID: <93df720b-1d99-47e5-8a89-187d2bc119a1@astralinux.ru>
Date: Thu, 1 Feb 2024 15:02:52 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: RuPost Desktop
Subject: Re: [PATCH] clk: keystone: sci-clk: check devm_kmalloc_array() return
 value
Content-Language: ru
To: Nishanth Menon <nm@ti.com>
Cc: Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 lvc-project@linuxtesting.org
References: <20240110134621.17209-1-adiupina@astralinux.ru>
From: =?UTF-8?B?0JDQu9C10LrRgdCw0L3QtNGA0LAg0JTRjtC/0LjQvdCw?=
 <adiupina@astralinux.ru>
In-Reply-To: <20240110134621.17209-1-adiupina@astralinux.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DrWeb-SpamScore: -100
X-DrWeb-SpamState: legit
X-DrWeb-SpamDetail: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehuddgtddvucetufdoteggodetrfcurfhrohhfihhlvgemucfftfghgfeunecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttderjeenucfhrhhomhepteipvghktggrhhipphgrucippihnpihhrgcuoegrughiuhhpihhnrgesrghsthhrrghlihhnuhigrdhruheqnecuggftrfgrthhtvghrnheptedvhedvkeeileejheejvddutddvieegudfgieegleeiheevtefgvdffueefheehnecuffhomhgrihhnpehlihhnuhigthgvshhtihhnghdrohhrghenucfkphepuddtrddujeejrddvfeefrdeiudenucfrrghrrghmpehhvghloheplgdutddrudejjedrvdeffedriedungdpihhnvghtpedutddrudejjedrvdeffedriedumeeggedvuddvpdhmrghilhhfrhhomheprgguihhuphhinhgrsegrshhtrhgrlhhinhhugidrrhhupdhnsggprhgtphhtthhopeelpdhrtghpthhtohepnhhmsehtihdrtghomhdprhgtphhtthhopehkrhhishhtoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhsrghnthhoshhhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmthhurhhquhgvthhtvgessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtohepshgsohihugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvg
 hlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqtghlkhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlvhgtqdhprhhojhgvtghtsehlihhnuhigthgvshhtihhnghdrohhrgh
X-DrWeb-SpamVersion: Vade Retro 01.423.251#02 AS+AV+AP Profile: DRWEB; Bailout: 300
X-AntiVirus: Checked by Dr.Web [MailD: 11.1.19.2307031128, SE: 11.1.12.2210241838, Core engine: 7.00.61.08090, Virus records: 12290912, Updated: 2024-Feb-01 10:21:37 UTC]

just a friendly reminder

10/01/24 16:46, Alexandra Diupina:
> devm_kmalloc_array() may return NULL, so
> check return value to avoid null pointer
> dereferencing
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Fixes: 3c13933c6033 ("clk: keystone: sci-clk: add support for dynamically probing clocks")
> Signed-off-by: Alexandra Diupina <adiupina@astralinux.ru>
> ---
>   drivers/clk/keystone/sci-clk.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.c
> index 35fe197dd303..a2fa24e4f88a 100644
> --- a/drivers/clk/keystone/sci-clk.c
> +++ b/drivers/clk/keystone/sci-clk.c
> @@ -459,6 +459,9 @@ static int ti_sci_scan_clocks_from_fw(struct sci_clk_provider *provider)
>   			tmp_clks = devm_kmalloc_array(dev, max_clks + 64,
>   						      sizeof(sci_clk),
>   						      GFP_KERNEL);
> +			if (!tmp_clks)
> +				return -ENOMEM;
> +
>   			memcpy(tmp_clks, clks, max_clks * sizeof(sci_clk));
>   			if (max_clks)
>   				devm_kfree(dev, clks);


