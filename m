Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E22FF9C1
	for <linux-kernel@vger.kernel.org>; Mon, 15 Jan 2024 09:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id A684620010;
	Mon, 15 Jan 2024 09:58:10 +0000 (UTC)
Message-ID: <73f39533-9384-4067-bd81-1ddd56a16236@ghiti.fr>
Date: Mon, 15 Jan 2024 10:58:10 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: mm: implement pgprot_nx
Content-Language: en-US
To: Jisheng Zhang <jszhang@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20231121160637.3856-1-jszhang@kernel.org>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20231121160637.3856-1-jszhang@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: alex@ghiti.fr

On 21/11/2023 17:06, Jisheng Zhang wrote:
> commit cca98e9f8b5e ("mm: enforce that vmap can't map pages
> executable") enforces the W^X protection by not allowing remapping
> existing pages as executable. Add riscv bits so that riscv can benefit
> the same protection.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>   arch/riscv/include/asm/pgtable.h | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 294044429e8e..4fc6ee5226fb 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -608,6 +608,12 @@ static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
>   	return ptep_test_and_clear_young(vma, address, ptep);
>   }
>   
> +#define pgprot_nx pgprot_nx
> +static inline pgprot_t pgprot_nx(pgprot_t _prot)
> +{
> +	return __pgprot(pgprot_val(_prot) & ~_PAGE_EXEC);
> +}
> +
>   #define pgprot_noncached pgprot_noncached
>   static inline pgprot_t pgprot_noncached(pgprot_t _prot)
>   {


This one looks good too:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex

