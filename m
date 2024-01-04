Received: from smtp.smtpout.orange.fr (smtp-24.smtpout.orange.fr [80.12.242.24])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2360F225A5
	for <linux-kernel@vger.kernel.org>; Thu,  4 Jan 2024 14:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="hB3dCT7j"
Received: from [192.168.1.18] ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id LOOSrLWbxQhj4LOPRruE0t; Thu, 04 Jan 2024 15:09:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1704377362;
	bh=jbwAKIGk/qogUj3VanIMfnGkTuiYS2UsI5HBNN8+DoQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=hB3dCT7jJhJAQj3p40Zm+dmv99GGpaOM1ttYQw4dURZYnkU5fM4QdXHCDcO1lcYfC
	 ssdqTOPpKQAg9Wmjemm5GjQs7v8reu3zeW9FLU2pS0yk5f9QUW1WjmZqGq/ZvtYWns
	 xPu7tVtZ3C01Fo6yy8smn0H+PBhDp0GF4pHP7dbLpQXUbtkjFojBSX4NcK+NV0Sweg
	 IZK7gchUvmWjfbHyQOkX8maWV6iUkCHKdrtQJCvSnkoWc+cRuy7I4L6kuy81N8vHMA
	 jBljfJ2sQ6pBL7WKOl1gNazqqavhdGBxIKdvbvavESj7XXX9/YhtnWo9/zxdZ9/TJb
	 P2heprm3bQTYw==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 04 Jan 2024 15:09:22 +0100
X-ME-IP: 92.140.202.140
Message-ID: <f3a0ca01-f94d-41e2-be1c-a098f3e8c2fa@wanadoo.fr>
Date: Thu, 4 Jan 2024 15:09:21 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/panel: ltk050h3146w: only print message when GPIO
 getting is not EPROBE_DEFER
Content-Language: fr
To: Quentin Schulz <foss+kernel@0leil.net>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <20240104-ltk-dev_err_probe-v1-0-8ef3c0b585d8@theobroma-systems.com>
 <20240104-ltk-dev_err_probe-v1-1-8ef3c0b585d8@theobroma-systems.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240104-ltk-dev_err_probe-v1-1-8ef3c0b585d8@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 04/01/2024 à 13:41, Quentin Schulz a écrit :
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> 
> devm_gpiod_get_optional may return EPROBE_DEFER in case the GPIO
> controller isn't yet probed when the panel driver is being probed.
> 
> In that case, a spurious and confusing error message about not being
> able to get the reset GPIO is printed even though later on the device
> actually manages to get probed.
> 
> Use dev_err_probe instead so that the message is only printed when it
> truly matters.
> 
> Cc: Quentin Schulz <foss+kernel@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Reviewed-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

> ---
>   drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
> index 30919c872ac8d..ecfa4181c4fd9 100644
> --- a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
> +++ b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
> @@ -646,10 +646,8 @@ static int ltk050h3146w_probe(struct mipi_dsi_device *dsi)
>   		return -EINVAL;
>   
>   	ctx->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
> -	if (IS_ERR(ctx->reset_gpio)) {
> -		dev_err(dev, "cannot get reset gpio\n");
> -		return PTR_ERR(ctx->reset_gpio);
> -	}
> +	if (IS_ERR(ctx->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio), "cannot get reset gpio\n");
>   
>   	ctx->vci = devm_regulator_get(dev, "vci");
>   	if (IS_ERR(ctx->vci)) {
> 

