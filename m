Received: from mail.codeweavers.com (mail.codeweavers.com [4.36.192.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE77B181BB0
	for <linux-kernel@vger.kernel.org>; Tue, 14 May 2024 21:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=4.36.192.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715723118; cv=none; b=oFNejv4Edx5iZgOotVuXnavaUWpy1VyCWybcVDdgcLNZEgaV6T5GG+aXirCTvLRjpEEgdxQdQsrkim0y+PS6Dpd5hoUIVJn1qMv+wsG413lwSfuKBmMHdaunTlUxK6zfyAcaE3kW/uC1etOr+WnLQ7clp1vX2qA33WY/8oCxST4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715723118; c=relaxed/simple;
	bh=tziv604qZlibS++2mEJNNkzIBE7jl7XamSsnA5/dX+A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fbhV+xASOBV1EWSK2habtoCRIKLgvuux4SawQXX78xaszM/st2057TcsHmAUHfBHCTBlhsRIKD4AHov6prtEOKIlCd8LL5Hqw/xE3Dm5VKYZh5A7CQ+LOYb+TFQSu5zjHXfgmIJmE5q3lIzRLqXz5xCM03WXyCleETViqnDcO/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeweavers.com; spf=pass smtp.mailfrom=codeweavers.com; dkim=pass (2048-bit key) header.d=codeweavers.com header.i=@codeweavers.com header.b=ZB7mZQEk; arc=none smtp.client-ip=4.36.192.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeweavers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeweavers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeweavers.com header.i=@codeweavers.com header.b="ZB7mZQEk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codeweavers.com; s=s1; h=Message-ID:Date:Subject:To:From:Cc:Sender;
	bh=OhI+HzqmcnuBP2LdgO9mbsFMxHDT6dqpMeBbtQADdAM=; b=ZB7mZQEkZXm39446UFhUrUHC/a
	tFfgZLNOdVYfsmbdy4yDO6IaVDeKNyTFEGjY0xpdJELNngKwyoYdXORxsrLQKyzBnUXLc0jY0NfHF
	v1ZfnARI9O5+nZmX7RIF4w7KRKiVUGIv8+U1E7vbGUxvu0eQfY+UYjo0cD/+0vZyBhCgs8Bd4MrL6
	jW0jWeu1d+U8GJrFp1qgnWwfbDGk72IPsB1IIK8OJutb8jVr4tQqQiYjqC88ei3keA3hcUukXBLrG
	6k8LoTY4x9VbCv1wdwslxokoeIm015PqVlCejKE2Qt7e5nVlblwMa0yWTm4hcdIw8l3mkLh2uB/i1
	UnuCEZZg==;
Received: from [10.69.139.17] (helo=watership.localnet)
	by mail.codeweavers.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <zfigura@codeweavers.com>)
	id 1s6zxS-004lFj-17;
	Tue, 14 May 2024 16:45:14 -0500
From: Elizabeth Figura <zfigura@codeweavers.com>
To: linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject:
 Re: [PATCH] misc: ntsync: mark driver as "broken" to prevent from building
Date: Tue, 14 May 2024 16:45:13 -0500
Message-ID: <12433821.O9o76ZdvQC@watership>
In-Reply-To: <2024051450-abrasion-swizzle-550b@gregkh>
References: <2024051450-abrasion-swizzle-550b@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Tuesday, May 14, 2024 2:16:51=E2=80=AFAM CDT Greg Kroah-Hartman wrote:
> The ntsync code is only partially enabled in the kernel at this point in
> time, creating the device node and that's about it.  Don't confuse
> systems that expect to see a working ntsync interface by teasing it with
> this basic structure at this point in time, so mark the code as "broken"
> so that it is not built and enabled just yet.
>=20
> Once the rest of the code is accepted, this will be reverted so that the
> driver can be correctly built and used, but for now, this is the safest
> way forward.

Reviewed-by: Elizabeth Figura <zfigura@codeweavers.com>

=2D-

I was even thinking of suggesting something like this myself. Sorry for
taking so long to get the rest of the patches into acceptable shape...


