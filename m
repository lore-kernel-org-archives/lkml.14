Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15AB2107
	for <linux-kernel@vger.kernel.org>; Wed, 28 Feb 2024 01:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709084721; cv=none; b=Xp43T/+TtC6a3A6pHfCytdDAu9yy81URT6zv94jilc9ktzYJtpw6CFzcKuhyKjylkpqKOYJnnRNemib1DXC87sNvhA7aaT0PM3F1zqIGJq+H4ZErqyM9aB5vancOSBk/N9ulI0mn9dwSax/9Ddn+/ZbypQzngjflX/gG03s3tqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709084721; c=relaxed/simple;
	bh=aUhYnlIpBJqOZBs9lCR1IssHEcMlvOje0saxlAdAohs=;
	h=Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=ZT09dmM8jsjYP8AIi4hIgpVNMMNdZvjFddsaOmV48OEndvHGUAVkEvd6Lxaz0FhPRApCnV9ElaZ4dyno/gTMJErKpZTqSmLwejh+ithYqy55PIgDJWJt2SCMqt6aFumhUGjEa018EG/YRnAwD+A/EV5wG6KH5zVGV/LuTID4LKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Tkxr0701Pz1b15m;
	Wed, 28 Feb 2024 09:40:16 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id CD0EF18002F;
	Wed, 28 Feb 2024 09:45:15 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 28 Feb 2024 09:45:14 +0800
Subject: Re: [PATCH v2] mtd: ubi: fix NVMEM over UBI volumes on 32-bit systems
To: Daniel Golle <daniel@makrotopia.org>, Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra
	<vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <31a20aead3419209991bf01aaeaefe07ab94d23a.1709081052.git.daniel@makrotopia.org>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <8ae44e8e-fc3d-28bd-5d1e-e900ce53529f@huawei.com>
Date: Wed, 28 Feb 2024 09:45:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <31a20aead3419209991bf01aaeaefe07ab94d23a.1709081052.git.daniel@makrotopia.org>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600013.china.huawei.com (7.193.23.68)

ÔÚ 2024/2/28 8:46, Daniel Golle Ð´µÀ:
> A compiler warning related to sizeof(int) != 8 when calling do_div()
> is triggered when building on 32-bit platforms.
> Address this by using integer types having a well-defined size.
> 
> Fixes: 3ce485803da1 ("mtd: ubi: provide NVMEM layer over UBI volumes")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
> v2: use size_t for 'bytes_left' variable to match parameter type
> 
>   drivers/mtd/ubi/nvmem.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/ubi/nvmem.c b/drivers/mtd/ubi/nvmem.c
> index b7a93c495d172..e68b8589c4279 100644
> --- a/drivers/mtd/ubi/nvmem.c
> +++ b/drivers/mtd/ubi/nvmem.c
> @@ -23,9 +23,12 @@ struct ubi_nvmem {
>   static int ubi_nvmem_reg_read(void *priv, unsigned int from,
>   			      void *val, size_t bytes)
>   {
> -	int err = 0, lnum = from, offs, bytes_left = bytes, to_read;
>   	struct ubi_nvmem *unv = priv;
>   	struct ubi_volume_desc *desc;
> +	size_t bytes_left = bytes;
> +	uint32_t offs, to_read;
There still exist a type truncation assignment 'to_read = bytes_left' 
below, although it's safe in logic.
> +	uint64_t lnum = from;
> +	int err = 0;
>   
>   	desc = ubi_open_volume(unv->ubi_num, unv->vol_id, UBI_READONLY);
>   	if (IS_ERR(desc))
> 

