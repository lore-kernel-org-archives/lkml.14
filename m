Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56022182CC
	for <linux-kernel@vger.kernel.org>; Sun,  5 May 2024 13:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.58.86.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714914243; cv=none; b=d5EopMKabq34b6Q1T5XDsXgYZZ+KxL9VEbpRkEnOIrit4OADuTAM7M+eK7qDipf2BNz0Ac/S8InV9Q8L2yOf/CpyxfbLzBBuwGjIkWNqY0HTNB0EUJrH2GSdEtKLYeBzi0NmwjtSiauDsUsOvtmRTa+Dm7K2S/QKQd2SpddESJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714914243; c=relaxed/simple;
	bh=LWjHih/OHSy6SrCfOa9X/24rEFm3Ua2BeaQBjdKPJY4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=oGlwSRr4kyQI0V3lI6B3/klgUAFmVPdz0pMbc218i4BOvwRM99afhlJcL/8I66ze/Zb/BTltg5aYplpTu5rY3jcD06KzIHiFx++kgMz322ivIZlyEXqychMe2qf92DFym23BtOY0EUgFRkxsYsVsut855h1Jr+ytqFQ82eoQ7UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ACULAB.COM; spf=pass smtp.mailfrom=aculab.com; arc=none smtp.client-ip=185.58.86.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aculab.com
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-273-fKqCY0TxOgquqS3S8_PQKQ-1; Sun, 05 May 2024 14:03:57 +0100
X-MC-Unique: fKqCY0TxOgquqS3S8_PQKQ-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Sun, 5 May
 2024 14:03:23 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Sun, 5 May 2024 14:03:23 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Kuan-Wei Chiu' <visitorckw@gmail.com>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "yury.norov@gmail.com" <yury.norov@gmail.com>
CC: "linux@rasmusvillemoes.dk" <linux@rasmusvillemoes.dk>,
	"n26122115@gs.ncku.edu.tw" <n26122115@gs.ncku.edu.tw>,
	"jserv@ccns.ncku.edu.tw" <jserv@ccns.ncku.edu.tw>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 1/2] lib/test_bitops: Add benchmark test for fns()
Thread-Topic: [PATCH v3 1/2] lib/test_bitops: Add benchmark test for fns()
Thread-Index: AQHam5eHsEz2ZjZaTki/tQEkD/csqLGIn56Q
Date: Sun, 5 May 2024 13:03:23 +0000
Message-ID: <44e9ab62e0f543439eb7566a9f134af6@AcuMS.aculab.com>
References: <20240501071647.10228-1-visitorckw@gmail.com>
 <20240501071647.10228-2-visitorckw@gmail.com>
In-Reply-To: <20240501071647.10228-2-visitorckw@gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Kuan-Wei Chiu
> Sent: 01 May 2024 08:17
>=20
> Introduce a benchmark test for the fns(). It measures the total time
> taken by fns() to process 1,000,000 test data generated using
> get_random_long() for each n in the range [0, BITS_PER_LONG).
>=20
> example:
> test_bitops: fns:          5876762553 ns, 64000000 iterations

Great benchmark....

The compiler almost certainly optimises it all away.

Assigning the result of fns() to a file scope (global) volatile int
should stop that happening.

And a real test would actually check the result - just in case
someone does something silly.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

