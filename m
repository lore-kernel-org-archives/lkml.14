Received: from msa.smtpout.orange.fr (msa-210.smtpout.orange.fr [193.252.23.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054E213AA3C;
	Mon, 15 Jul 2024 05:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.23.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721021305; cv=none; b=NttMjRUL4FYwUzitW2AYTv1lY2KmU8jNQON/7Ksr2n0rzoGeb52hgtxm35oXCbjqu96f8u8FGGe/OkNDrKv36PCazZZc+BKm1CNhU93yzRRTinWn+2zi0m3JXskY+W1tEDzLi9I8NHgKv3r7QtdAbtbo1cA5KwWPtpmK5EPamhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721021305; c=relaxed/simple;
	bh=rWOqtJZDZPB7SwsAkct7kJU0BnvB2/PkdXaSKgpv3ZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=obLgpachIfOJXXxa0hTL9D7As9herAY6X7P3pVPbeHWW0QqoXy+zWt/HGC0edwEvoGC8n7sdQbOGHWDy0vtN8FQOhDsppCrB7Eeh/YPygyBxoot1ILSN4G5p80CheV1bHkWZRoCKAJNt3oxQcm3L1xt7b+RbBFOAE3vUO/T4nzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=ttWVj4Mn; arc=none smtp.client-ip=193.252.23.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="ttWVj4Mn"
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id TE6zs6b1eJY7cTE6zsLvjj; Mon, 15 Jul 2024 07:18:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1721020739;
	bh=ixooxXojxH6zu9TLhjVNWVQ/LL8FsaWEC/zDEHZ7c2Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=ttWVj4Mnct5iuI1ZtuMIVIzHDFK+14SyqFveNKbkOFmDzTQvmlgJOiNnNG6rDz08c
	 JavN7zbThUmllsa29Hlc4tCJcOSXw1T/c5cJ4w8/8S002rGqY/wc+c9Ykgd5QU6PlO
	 pcEWDUm5gKbK9z0XWvASM7xrPv7rM3TyQU0Coy3ijPxxL+hHB/SFEdqyJ2kZN2IlHX
	 YSixy3CiHhDiEO0HwLpv6TK/qf0RpF0Cy9HR4EA9kZjHBgq+jV/RFvpmdZ+619RENu
	 hk9n25dfyCgykQzTuz28gr66w7veY0jOhIKLU2sCWYh7VE9fZOYntUH6JN420QdutN
	 uiFe1UsVnYYtw==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Mon, 15 Jul 2024 07:18:59 +0200
X-ME-IP: 90.11.132.44
Message-ID: <7560b341-27b4-45b9-8b73-202ec7f27200@wanadoo.fr>
Date: Mon, 15 Jul 2024 07:18:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] locking/lockdep: Use seq_putc() in five functions
To: Waiman Long <longman@redhat.com>, kernel-janitors@vger.kernel.org,
 Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Markus Elfring <Markus.Elfring@web.de>
References: <aa9e1986-8631-405e-96f5-86a0f5a1eab2@web.de>
 <975d2b0f-f84c-4c84-adf2-098fef59d90b@redhat.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <975d2b0f-f84c-4c84-adf2-098fef59d90b@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 14/07/2024 à 23:31, Waiman Long a écrit :
> On 7/14/24 06:25, Markus Elfring wrote:
>> From: Markus Elfring <elfring@users.sourceforge.net>
>> Date: Sun, 14 Jul 2024 12:18:16 +0200
>>
>> Single characters should be put into a sequence.
>> Thus use the corresponding function “seq_putc”.
>>
>> This issue was transformed by using the Coccinelle software.
>>
>> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
>> ---

...

>> @@ -422,10 +422,10 @@ static void seq_line(struct seq_file *m, char c, 
>> int offset, int length)
>>       int i;
>>
>>       for (i = 0; i < offset; i++)
>> -        seq_puts(m, " ");
>> +        seq_putc(m, ' ');

Hi,

Most of the time, this kind of modification is useless because it is 
already done by the compiler, see [1].

>>       for (i = 0; i < length; i++)
>>           seq_printf(m, "%c", c);

But changing this seq_printf() into a seq_putc() would, IMHO, make sense 
and save a few cycles, should it matter.

CJ

[1]: 
https://elixir.bootlin.com/linux/v6.10-rc7/source/include/linux/seq_file.h#L123

>> -    seq_puts(m, "\n");
>> +    seq_putc(m, '\n');
>>   }
>>
...

>> -- 
>> 2.45.2
>>
> Acked-by: Waiman Long <longman@redhat.com>
> 

