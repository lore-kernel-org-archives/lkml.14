Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9129E45BF0;
	Mon,  4 Mar 2024 14:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709562425; cv=none; b=HPxxkPQn4LNg3eeAbrLche8HB3su3ZUjgUp37EdLcZqJeuHae52gOv2eJ22fZWUTal/YZhoMqC6wdpH9IshoWa3PLVggBaTBdyZ7HWFH3gUjeuWYvirymydONtOePQOjArv/eaT/I647+K945vcz2Yw6uXWFZnVYKS8Xr7j9MMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709562425; c=relaxed/simple;
	bh=8oTA6o+beFUam63h39H+nP7j7L+MEdytbx/GsplFdO8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HGrI+oaTWTY1O+KhMCz6/GX37G5ky5hMvb80ViKXcATLZTQUPFy4wuNFhYVvTJtnJZCefbfC1Hvq9IyhZ1uJel4n6TxdjZFpXZZrRCeWrISrp56UTFJDTxneuQVT3yFEp7UFEsr1Jrm6UTqe/qHphI1smV2RhlPxVGUtYAKunaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F7941FB;
	Mon,  4 Mar 2024 06:27:39 -0800 (PST)
Received: from [10.57.12.135] (unknown [10.57.12.135])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B62A03F762;
	Mon,  4 Mar 2024 06:27:00 -0800 (PST)
From: Balint Dobszay <balint.dobszay@arm.com>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: op-tee@lists.trustedfirmware.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jens.wiklander@linaro.org, corbet@lwn.net, sudeep.holla@arm.com,
 rdunlap@infradead.org, krzk@kernel.org, gyorgy.szing@arm.com
Subject: Re: [PATCH v2 1/3] tee: optee: Move pool_op helper functions
Date: Mon, 04 Mar 2024 15:26:58 +0100
X-Mailer: MailMate (1.14r5937)
Message-ID: <1A75CF74-D486-4A3B-9004-250F870D7330@arm.com>
In-Reply-To: <CAFA6WYNz57v_S9CBQHUjvPdzcP9FWuDN0ciPNvgUZY_-m3JKRg@mail.gmail.com>
References: <20240223095133.109046-1-balint.dobszay@arm.com>
 <20240223095133.109046-2-balint.dobszay@arm.com>
 <CAFA6WYNW9-7gCZQSEaV=Gcr+GLdu25rQ8MpTg9yNpX7OwyZ0Tg@mail.gmail.com>
 <4E68610D-8F2B-4E27-AE5C-45CB59D7FEC0@arm.com>
 <CAFA6WYNz57v_S9CBQHUjvPdzcP9FWuDN0ciPNvgUZY_-m3JKRg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 4 Mar 2024, at 10:17, Sumit Garg wrote:

> Hi Balint,
>
> On Mon, 4 Mar 2024 at 14:33, Balint Dobszay <balint.dobszay@arm.com> wrote:
>>
>> Hi Sumit,
>>
>
> [snip]
>
>>>> diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
>>>> index 911ddf92dcee..4cf402424e71 100644
>>>> --- a/include/linux/tee_drv.h
>>>> +++ b/include/linux/tee_drv.h
>>>> @@ -275,6 +275,17 @@ void *tee_get_drvdata(struct tee_device *teedev);
>>>>  struct tee_shm *tee_shm_alloc_priv_buf(struct tee_context *ctx, size_t size);
>>>>  struct tee_shm *tee_shm_alloc_kernel_buf(struct tee_context *ctx, size_t size);
>>>>
>>>> +int tee_shm_pool_op_alloc_helper(struct tee_shm_pool *pool, struct tee_shm *shm,
>>>> +                                size_t size, size_t align,
>>>> +                                int (*shm_register)(struct tee_context *ctx,
>>>> +                                                    struct tee_shm *shm,
>>>> +                                                    struct page **pages,
>>>> +                                                    size_t num_pages,
>>>> +                                                    unsigned long start));
>>>> +void tee_shm_pool_op_free_helper(struct tee_shm_pool *pool, struct tee_shm *shm,
>>>> +                                int (*shm_unregister)(struct tee_context *ctx,
>>>> +                                                      struct tee_shm *shm));
>>>> +
>>>
>>> These rather belong to drivers/tee/tee_private.h as we shouldn't
>>> expose them to other kernel client drivers.
>>
>> As per the discussion in the other thread I'll ignore this.
>>
>
> Then it will have conflicts with this [1] patch. If you are fine to
> incorporate [1] in your series then the right place for these function
> declarations should be include/linux/tee_core.h.
>
> [1] https://www.spinics.net/lists/kernel/msg5122983.html

You're right, I'll rebase my patches on this.

By incorporating your patch in my series, do you mean that I should just
add it as the first patch in the series for the next version? Or keep my
series as is (do the rebase of course) and just mention that it's using
your patch as base?

Regards,
Balint

>>
>>>>  struct tee_shm *tee_shm_register_kernel_buf(struct tee_context *ctx,
>>>>                                             void *addr, size_t length);
>>>>
>>>> --
>>>> 2.34.1
>>>>
