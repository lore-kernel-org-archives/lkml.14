Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B1A5D47A
	for <linux-kernel@vger.kernel.org>; Wed,  6 Mar 2024 08:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709713114; cv=none; b=Yz6RHzyJkQJKelk5jApJcXfzIPYSLSouMEx0R7H0Iqcdk+W9j5BQKru7pCwuvAbFdYrB9E6KiAJOA4sW8fe8MmRLTUXYlsbEyf/WM2rWD2j663wu9r+eystGEhnqovs7gJ/j7CPQ1Ku2VOMKhGPrXEEuU0w5PQy2e173Yht4fEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709713114; c=relaxed/simple;
	bh=h8XXqk5f2pfXsGsB1q/7dSgEGxtkFADaEPnlSDZcT8k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BR0gdb9WMjA9F7E32cmJrO/mgE6HT1ALKPVH2XaKWDX9mfwklODSOff0HZINdPIPPt3Q0VNn00+Kq11UZGLaeWCBiMnFU3YSOZZ+e8/EZ1wfIdFvLWbyDQNgsyDUv8qQdR8xU0JlNcBGT24gx7Plh1Q/7ol6ZglAmDUs4GphNBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZZtNRngS; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZZtNRngS"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 84FD140004;
	Wed,  6 Mar 2024 08:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709713110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h8XXqk5f2pfXsGsB1q/7dSgEGxtkFADaEPnlSDZcT8k=;
	b=ZZtNRngSLTZ7iLkt8KhZOOWvfrzABaMm7oCChRAMU9i2c6I20DiH8SOKfXynxy8tGNOj+c
	UuEMY8EHwr6baHhTOt/oKz1Bhb7FxwlvaPdxoaN5401jjJOFHtS0pak5olY+CpV3DK1Tlu
	Tude/i9e6vYCFIrO1PBOLMy3A+J5/9qZ4AIa246Cn+Ev69FrlEA4Sn2ggs7yU9GCJDJO8Z
	+IYujJBcHKhykoj068hyRf7aUX7ScvjEzK0uhetUZschha5FyXBdOSIR7xfTeNQAauiA+t
	TqeYJP8phPra2c7T8gOwG5V1wLPoXHsJcSZ4xswL84yZbZdaB9m2ECcUu4Kv/A==
Date: Wed, 6 Mar 2024 09:18:28 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] mtd: ubi: make ubi_class constant
Message-ID: <20240306091828.04cf4d1e@xps-13>
In-Reply-To: <20240305-class_cleanup-mtd-v1-1-7861914e2218@marliere.net>
References: <20240305-class_cleanup-mtd-v1-1-7861914e2218@marliere.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hi Ricardo,

ricardo@marliere.net wrote on Tue, 05 Mar 2024 16:35:38 -0300:

> Since commit 43a7206b0963 ("driver core: class: make class_register() take
> a const *"), the driver core allows for struct class to be in read-only
> memory, so move the ubi_class structure to be declared at build time
> placing it into read-only memory, instead of having to be dynamically
> allocated at boot time.
>=20
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l
