Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32F94C80
	for <linux-kernel@vger.kernel.org>; Tue, 26 Dec 2023 21:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o3VIqnLt"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5e7bb1e0db8so37015027b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 26 Dec 2023 13:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703625767; x=1704230567; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EKXaXe5/aBY0WPXnTl0QRM2iwcbJuRjGywFUfxTWdAE=;
        b=o3VIqnLtoSIFR0CLvp0uMP9Rn2X9iIfVcHxOnn5R/JsoYtObh/juMm4TDImYEEG1HC
         Hr7I8kxG3nqTlKRjL9eQMheXD66X5cgVi8kIK6OS4PQ/xKBJQJvzK5vKSReLn5EYWwyV
         7f8Tc+0bLz7UFznCUXiUbebujCuCldV5U2s8ROUJA6FsxoDKqirV2lpQgtXEahVN6DYC
         uEz8rDjnscQkRAPG0lg7C3sBdC0yR4xFFt92N4dfzV5zSWHwzIDV+xADZtFeDrzNOvxf
         RmLVP9FRE9un+zU/KgucwqR4w+soCXPCj6OBhw0z0K62/I3mb9SzQ7WKlCAsX+PqY9vn
         YJ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703625767; x=1704230567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EKXaXe5/aBY0WPXnTl0QRM2iwcbJuRjGywFUfxTWdAE=;
        b=K99W98qbXkJpRwI9hP5z9asLPfM03zw8HVIaXlasfBcuXe8yaKR7wkUkNbNbzJswO0
         N+4OvE7CyGKAN1YQEmmMhWv0saoVv6HDpz0v/O2uV/6gzPChVuNTXk36DCDltBJDJtzJ
         eznw5wGcGYl5646S+yzGo8EB8RbcIIN1rPPVYUKnyJLXd9fM3eEzUO0uklAfj4fW10gJ
         AqdISc9aKEJSq1I3NuAic1QBxqXgMbggodGFKHZHP/ww77IuPtxdC0s8xiG3N71tEAEJ
         rexMFEDTeRRZtO460AqVl2jmsp6syd9JdqFxFaqP3FS8rbCg4551F3/a3tQ1oDVNfDtk
         hvVw==
X-Gm-Message-State: AOJu0YwyKY4vGYMXnWCwoxCFbfu5ctds5+uM1A5n2aFXvM0pquO0ONQm
	aF0dHZjW6lATZAzJZSW8dhJxD2BgveR8iZH4HGRmHnJfV8VQTQV2VM6+eJJJ
X-Google-Smtp-Source: AGHT+IHs34mNu+SAplAd7KqkPTJF/zUdmIDD7/SO85Jsl+hfOQIrXGkgRgt2s+SO+1MoV/G8xoql+s3f67qHdsrmnS0=
X-Received: by 2002:a05:690c:fc3:b0:5e8:8073:8fb3 with SMTP id
 dg3-20020a05690c0fc300b005e880738fb3mr4369443ywb.79.1703625766829; Tue, 26
 Dec 2023 13:22:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231225092843.5993-1-xiazhengqiao@huaqin.corp-partner.google.com>
 <20231225092843.5993-3-xiazhengqiao@huaqin.corp-partner.google.com>
In-Reply-To: <20231225092843.5993-3-xiazhengqiao@huaqin.corp-partner.google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 26 Dec 2023 22:22:35 +0100
Message-ID: <CACRpkdYP4As4dFnMqWiUBSibbMaLCx9=tPpcZ=c2CkZr2jvTXg@mail.gmail.com>
Subject: Re: [v1 2/2] HID: i2c-hid: elan: Add ili2901 timing
To: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dmitry.torokhov@gmail.com, robh+dt@kernel.org, 
	jikos@kernel.org, benjamin.tissoires@redhat.com, dianders@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 25, 2023 at 10:29=E2=80=AFAM xiazhengqiao
<xiazhengqiao@huaqin.corp-partner.google.com> wrote:

> ILI2901 requires reset to pull down time greater than 10ms,
> so the configuration post_power_delay_ms is 10, and the chipset
> initial time is required to be greater than 100ms,
> so the post_gpio_reset_on_delay_ms is set to 100.
>
> Signed-off-by: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
