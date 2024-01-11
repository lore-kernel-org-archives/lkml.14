Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE9E4D590
	for <linux-kernel@vger.kernel.org>; Thu, 11 Jan 2024 15:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hFCn/Gly"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 653072000C;
	Thu, 11 Jan 2024 15:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1704987707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gz2qyMG5KacG52vhNr2H+ss9bld0Bz6NXbBlbIdH07M=;
	b=hFCn/GlyWu1ZHysP6KLzKDCQBIiZu8BnTmvVksQyr08QQ2W0/vKHyX60i2smCoHtCB9EDC
	fQsbQduIotYdUU6UNE3XkdV9BABqQy+fU2CoHoW+KDhjqI7bmAqLlg47baO2sTXube+ivn
	6gjDnQd8Ni4VfR3H+wX6vKBcYDDQrzAFVXF/EIYu5qoQL5wX1eK7MZEbto+k86tkQddijt
	5ke2VgRBZZ71yWC3IHGh/5OQNMwUeWh4G+0n/mn7ApFenQJiI+iqShkoABsM6nYLnO3eZ5
	2apM+dDvtCpm/xdiKZxx42z9Fglb6aUZuMMf9qFgxBlygWeFItP8Zr3EYZSG3Q==
Date: Thu, 11 Jan 2024 16:41:45 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Catalin Popescu <catalin.popescu@leica-geosystems.com>
Cc: srinivas.kandagatla@linaro.org, michael@walle.cc, rafal@milecki.pl,
 robh@kernel.org, linux-kernel@vger.kernel.org,
 bsp-development.geo@leica-geosystems.com, gregkh@linuxfoundation.org,
 luca.ceresoli@bootlin.com
Subject: Re: [PATCH] nvmem: core: add fixed-layout declaration
Message-ID: <20240111164145.39255eac@xps-13>
In-Reply-To: <20240111152849.3649549-1-catalin.popescu@leica-geosystems.com>
References: <20240111152849.3649549-1-catalin.popescu@leica-geosystems.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hi Catalin,

catalin.popescu@leica-geosystems.com wrote on Thu, 11 Jan 2024 16:28:49
+0100:

> Declare fixed-layout as a supported layout and use add_cells
> callback to parse the cells. This adds consistency over layouts
> parsing as fixed-layout parsing is now handled in the same way
> than others nvmem layouts.

Thanks for submitting a new version, next time you'll need to increase the =
version number in the title (use git-send-email -v <version>) and also plea=
se append a changelog below the three dashes...

>=20
> Signed-off-by: Catalin Popescu <catalin.popescu@leica-geosystems.com>
> ---

...here.

Also, I think you should rebase on top of -rc1 when it will be out (in
less than two weeks) because I believe the code snipped below will no
longer apply...

>  drivers/nvmem/core.c | 24 +++++++++++++++++-------
>  1 file changed, 17 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index 608b352a7d91..d7f34cbea34b 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -746,7 +746,9 @@ static int nvmem_add_cells_from_legacy_of(struct nvme=
m_device *nvmem)
>  	return nvmem_add_cells_from_dt(nvmem, nvmem->dev.of_node);
>  }
> =20
> -static int nvmem_add_cells_from_fixed_layout(struct nvmem_device *nvmem)
> +static int nvmem_add_cells_from_fixed_layout(struct device *dev,
> +					     struct nvmem_device *nvmem,
> +					     struct nvmem_layout *layout)

... this one.

Otherwise LGTM.

Thanks,
Miqu=C3=A8l
