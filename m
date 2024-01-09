Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CF939AEE;
	Tue,  9 Jan 2024 14:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qJ4139m1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5D1BC433F1;
	Tue,  9 Jan 2024 14:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704811246;
	bh=JtUnKmh82+8hl9yHpHolXJPlKOMneCk3xUxEKY3Bryo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qJ4139m1Mz2HSk++A9C0OnpR8xxIJ5Hv4D+nuIC4WdWPYWKTLRzJmLPIm8PzfR/ES
	 vvfwGNdlyjG+Fv0yOSgbvFWQs6IeGNMNpkdX/2sTRxTN96ECzc+LkmmED6xXXg2gBa
	 7d/oC/UGNvKLGfZqmzZ1/9KALPVhtpVf+LyMgtkMt0y9zFAVBD3aF7qdYPYYrVAW4u
	 vUxCYGVOhwUAjTDo/aZuE5KaVfGGz4gEI6XQ5y7DnG3+/8kEwx9LgYPR5FGUnytng/
	 Q5UqNu3f9pfG4zd0PSPj45hFn6HnoGnRsiEZFGLEOb3Z12NNEfqvpQqLgrdS8iZRIC
	 Kw00w7LHDdL/w==
Message-ID: <b8e02569-1bd3-4a04-857e-e7209b493d97@kernel.org>
Date: Tue, 9 Jan 2024 16:40:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] accel/habanalabs: remove redundant assignment to
 pointer 'input'
To: Colin Ian King <colin.i.king@gmail.com>, Ofir Bitton <obitton@habana.ai>,
 Benjamin Dotan <bdotan@habana.ai>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240106124213.51392-1-colin.i.king@gmail.com>
Content-Language: en-US
From: Oded Gabbay <ogabbay@kernel.org>
In-Reply-To: <20240106124213.51392-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/01/2024 14:42, Colin Ian King wrote:
> From: Colin Ian King <colin.i.king@intel.com>
> 
> The pointer input is assigned a value that is not read, it is
> being re-assigned again later with the same value. Resolve this
> by moving the declaration to input into the if block.
> 
> Cleans up clang scan build warning:
> warning: Value stored to 'input' during its initialization is never
> read [deadcode.DeadStores]
> 
> Signed-off-by: Colin Ian King <colin.i.king@intel.com>
> ---
>   drivers/accel/habanalabs/goya/goya_coresight.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/accel/habanalabs/goya/goya_coresight.c b/drivers/accel/habanalabs/goya/goya_coresight.c
> index 41cae5fd843b..3827ea4c02f7 100644
> --- a/drivers/accel/habanalabs/goya/goya_coresight.c
> +++ b/drivers/accel/habanalabs/goya/goya_coresight.c
> @@ -576,7 +576,6 @@ static int goya_config_spmu(struct hl_device *hdev,
>   		struct hl_debug_params *params)
>   {
>   	u64 base_reg;
> -	struct hl_debug_params_spmu *input = params->input;
>   	u64 *output;
>   	u32 output_arr_len;
>   	u32 events_num;
> @@ -592,7 +591,7 @@ static int goya_config_spmu(struct hl_device *hdev,
>   	base_reg = debug_spmu_regs[params->reg_idx] - CFG_BASE;
>   
>   	if (params->enable) {
> -		input = params->input;
> +		struct hl_debug_params_spmu *input = params->input;
>   
>   		if (!input)
>   			return -EINVAL;
Thanks for the patch.
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Applied to -next.
Oded
