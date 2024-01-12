Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FD365E
	for <linux-kernel@vger.kernel.org>; Fri, 12 Jan 2024 02:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="mc3oPQll"
Received: from [IPV6:2601:646:8002:4641:eb14:ad94:2806:1c1a] ([IPv6:2601:646:8002:4641:eb14:ad94:2806:1c1a])
	(authenticated bits=0)
	by mail.zytor.com (8.17.2/8.17.1) with ESMTPSA id 40C2eH2Y051720
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Thu, 11 Jan 2024 18:40:22 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 40C2eH2Y051720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2023121201; t=1705027223;
	bh=cxiBoXcpI6do1qu/gXK5vZWzZUsb+Oimr50yzy7oH00=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mc3oPQllywgN0XlVHwTsPad2JWiPEtbs4MrNtEbbrxJt5QEVsOY5q1KcrpPPJc6MQ
	 fOCMbXqUWl9MK4c+ySQQLNhVVXEMH378cb4D5aFjeJJl+Wv3weLvkI3QyHDtsDC1JH
	 dOmvpnqsve0gQYz2A2p9KtPO3qbKdLL2S9TpmaIHUf9KoF9zDMfZC8YSe/KehxrSAn
	 dbgkrmpe9XH8fLVxREH4cn/naq8l2tThHufaXc3ue3NTedFUqHIC94SQh+k1rsXEBZ
	 o9gTH6DvRQDzgGVv1A/8VVNWH1APiNsNJhiiML94CMHBtv0EnUaLGeTjmVr9HMdttB
	 +16R7iDIQKzJA==
Message-ID: <f2eeab9e-9454-48c5-91e4-65a090f8fa85@zytor.com>
Date: Thu, 11 Jan 2024 18:40:11 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/45] C++: Convert the kernel to C++
Content-Language: en-US
To: David Howells <dhowells@redhat.com>
Cc: pinskia@gmail.com, Alexey Dobriyan <adobriyan@gmail.com>,
        linux-kernel@vger.kernel.org
References: <3465e0c6-f5b2-4c42-95eb-29361481f805@zytor.com>
 <152261521484.30503.16131389653845029164.stgit@warthog.procyon.org.uk>
 <1681813.1704843645@warthog.procyon.org.uk>
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <1681813.1704843645@warthog.procyon.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/9/24 15:40, David Howells wrote:
> 
>>> Issues:
>>>    (1) Need spaces inserting between strings and symbols.
>>
>> I have to admit I don't really grok this?
> 
> You're not allowed to do things like:
> 
> 	asm volatile("btl "__percpu_arg(2)",%1"
> 
> but rather have to do:
> 
> 	asm volatile("btl " __percpu_arg(2) ",%1"
> 
> as you're now allowed to specify type qualifiers.  See
> 
> 	https://en.cppreference.com/w/cpp/language/user_literal
> 

Oh, right. This one should be easy enough to automate, though.

	-hpa
