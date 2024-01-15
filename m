Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D3C1101CA
	for <linux-kernel@vger.kernel.org>; Mon, 15 Jan 2024 10:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41D0A2F4;
	Mon, 15 Jan 2024 02:01:55 -0800 (PST)
Received: from [192.168.1.100] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A18233F6C4;
	Mon, 15 Jan 2024 02:01:07 -0800 (PST)
Message-ID: <87686a59-8efa-c144-cd9b-f398a8531c46@arm.com>
Date: Mon, 15 Jan 2024 10:01:06 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] coresight: etm3x: add a kernel-doc "blank line"
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Pratik Patel <pratikp@codeaurora.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
References: <20240115050504.30980-1-rdunlap@infradead.org>
From: James Clark <james.clark@arm.com>
In-Reply-To: <20240115050504.30980-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 15/01/2024 05:05, Randy Dunlap wrote:
> Change an empty line inside of kernel-doc to a " *" (kernel-doc
> blank line) to prevent a kernel-doc warning:
> 
> drivers/hwtracing/coresight/coresight-etm3x-core.c:118: warning: bad line: 
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Pratik Patel <pratikp@codeaurora.org>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Cc: Mike Leach <mike.leach@linaro.org>
> Cc: James Clark <james.clark@arm.com>
> Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
> Cc: coresight@lists.linaro.org
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/hwtracing/coresight/coresight-etm3x-core.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff -- a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> --- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> @@ -115,7 +115,7 @@ static void etm_clr_pwrup(struct etm_drv
>   *
>   * Basically the same as @coresight_timeout except for the register access
>   * method where we have to account for CP14 configurations.
> -
> + *
>   * Return: 0 as soon as the bit has taken the desired state or -EAGAIN if
>   * TIMEOUT_US has elapsed, which ever happens first.
>   */

Duplicate of
https://lore.kernel.org/linux-arm-kernel/20231123120459.287578-3-james.clark@arm.com/
which should appear in coresight-next soon. But either way, thanks for
the fix.

James
