Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F2C160
	for <linux-kernel@vger.kernel.org>; Sat,  9 Mar 2024 00:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709942856; cv=none; b=naYdM5fRpoKc+lYwDEguOSHXNvdUGj1XGwcqqyiwde080PD9Z6Ojpm9pwnfGGfGhRU+RVMt5Ywu+S4+i5ADmgUXdpguHEtqLinlkT7wPam8HkEirmkBz2dZAWlMrniy2rXmyQ4C0xSxb+f7i8NcsMeWr85QVvDWN0PTiXVRKvUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709942856; c=relaxed/simple;
	bh=ugVhjQhgBSAD+43FnlFyaltP1EF/yJu/p7ZLiGoaYko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rpvj+y3/SVDd2ZxAZADHs52mgzIXN4x5zBNGPOMNKWw/a0rxEGOrCIr66Ac4w8Cbh6JHQQl/C7UP44Ss8Rj1VYiW9g3syXDrj4U3x0fVzI4ZWCtO35+FJZqRd+MKwaYshs3LXkmz4jo6wJdtjGdmxsvIHTvYVlgUx8hwUyqaGyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk; spf=none smtp.mailfrom=davidwei.uk; dkim=pass (2048-bit key) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b=H3sDkhCQ; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b="H3sDkhCQ"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1dc0d11d1b7so22336555ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 08 Mar 2024 16:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=davidwei-uk.20230601.gappssmtp.com; s=20230601; t=1709942854; x=1710547654; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oMrCgLv3jG4NNwZNrs6bqElnsyDgAMtLztDlY+R2QaM=;
        b=H3sDkhCQ/fOzNw+jekRFVOHlVbJSNyEtiGbBJ6DsotxPMobUb31fz+hsMd8w8iLO53
         MghgnmCWAuef3MinbS8CFQVafinrWonDt0k+qSiungfdw5tYaTZEDhXar01QDOTA9kuM
         rOGcgM4f8qzIJ4I8pk6LkJNDGpBy9u3iAEwLFr+gTMGlppmUNvuyBQFbcQs8+ukCoPBK
         /+SHK1eld+TkilZvtMqOP+3LEXpJvueUzD76Tft/a4gNrfqOM4rCryRpJxn348w406sx
         6/lKvOa0XqKAQBjrwHHLmSYdrTxGDsdHV7orstgx0tXFwgN8EHp9Z8YM/zEUqb4B5z7Z
         kBuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709942854; x=1710547654;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oMrCgLv3jG4NNwZNrs6bqElnsyDgAMtLztDlY+R2QaM=;
        b=lsOxG1qMYtEwIsGJmVVIFyXsB/QQqG9rmq7h3xfukl5OQ+7iGT/ChyuAvqBzGKSXUr
         e/+LrVdjYJviLS+Vnd/7Ft67R5jGrAEQGvbmLz9IERMGIPKSX8jekKdcjjeQsMaYw+rL
         9QJssCj5MSuMz9G5T3GjYjtYbT+hyrdnX5WT44Zxuxq9HvSCUfoBRkjFaq5OFwGCcycy
         etcqc49Ps7SQWpIaX8nog4z3apD47xIltnPTCWeQQ06yo5sHUUb/tz7tk3PbXKasWBIU
         zRewEi4JfgJqSs9tWydC99Maqezl4NJwdp6zvPsxtX1RIqqZrfVg4LFR3Uc9mUGawQjl
         PSkw==
X-Forwarded-Encrypted: i=1; AJvYcCWe276R+l0PWuzdn+Ip+19R/a0W7EEDm7GcGCACesq4e2v0nNbNWx8En+Ghg254pEVrGpLzLtlDEelJlxxIoBDTuErB2eZWp9ER+pWO
X-Gm-Message-State: AOJu0YxR6rU0J+l5BEvsgvhL8GCXFAeKQd29rhjq1SsNx7bbRiaw+i42
	jrxLw13IbsIAaTkD8qQETUCuKIGcdfJxsxvKTvOjo4L6+ab8LiiXi8xpBLCehH9HIBtXsIEHjmy
	cqu4=
X-Google-Smtp-Source: AGHT+IG6ZUMAAnOFkY3Rm5OD8HXt4AdXmeVDqcxUVMwhVvlFBd7+/ZtOpm0IKmraDNkMhjqtxLV6Ng==
X-Received: by 2002:a17:902:ea94:b0:1dc:afd1:9c37 with SMTP id x20-20020a170902ea9400b001dcafd19c37mr209779plb.24.1709942854270;
        Fri, 08 Mar 2024 16:07:34 -0800 (PST)
Received: from ?IPV6:2a03:83e0:1156:1:1cbd:da2b:a9f2:881? ([2620:10d:c090:500::5:2342])
        by smtp.gmail.com with ESMTPSA id f10-20020a17090274ca00b001dcc8c26393sm200555plt.225.2024.03.08.16.07.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Mar 2024 16:07:33 -0800 (PST)
Message-ID: <b0291385-873a-4335-8c2a-b2d51f2f3924@davidwei.uk>
Date: Fri, 8 Mar 2024 16:07:32 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v1] net: page_pool: factor out page_pool recycle
 check
Content-Language: en-GB
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Yunsheng Lin <linyunsheng@huawei.com>
References: <20240308204500.1112858-1-almasrymina@google.com>
 <8adb69f3-b0c0-42bf-b386-51b2be76cbb4@davidwei.uk>
 <CAHS8izOm18Rv7QJfpKmquEgf74PvqZeY4zBnyG73BVFDbCvWmw@mail.gmail.com>
From: David Wei <dw@davidwei.uk>
In-Reply-To: <CAHS8izOm18Rv7QJfpKmquEgf74PvqZeY4zBnyG73BVFDbCvWmw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2024-03-08 16:04, Mina Almasry wrote:
> On Fri, Mar 8, 2024 at 3:50 PM David Wei <dw@davidwei.uk> wrote:
>>
>> On 2024-03-08 12:44, Mina Almasry wrote:
>>> The check is duplicated in 2 places, factor it out into a common helper.
>>>
>>> Signed-off-by: Mina Almasry <almasrymina@google.com>
>>> Reviewed-by: Yunsheng Lin <linyunsheng@huawei.com>
>>> ---
>>>  net/core/page_pool.c | 9 +++++++--
>>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/net/core/page_pool.c b/net/core/page_pool.c
>>> index d706fe5548df..dd364d738c00 100644
>>> --- a/net/core/page_pool.c
>>> +++ b/net/core/page_pool.c
>>> @@ -657,6 +657,11 @@ static bool page_pool_recycle_in_cache(struct page *page,
>>>       return true;
>>>  }
>>>
>>> +static bool __page_pool_page_can_be_recycled(const struct page *page)
>>
>> Could this be made inline?
>>
> 
> Looking at the rest of the static functions in this file, they don't
> specify inline, just static. I guess the compiler is smart enough to
> inline static functions in .c files when it makes sense (and does not
> when it doesn't)?
> 
> But this doesn't seem to be a kernel wide thing. net/core/dev.c does
> have static inline functions in it, only page_pool.c doesn't do it. I
> guess if there are no objections I can make it static inline to ask
> the compiler to inline it. Likely after the merge window reopens if it
> closes today.

Thanks for checking. Otherwise the change looks good to me, pulling out
the same check in two locations into a(n inline) function then calling
that function instead.
