Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1C67D3F1
	for <linux-kernel@vger.kernel.org>; Thu, 18 Jul 2024 08:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721292582; cv=none; b=k1QVv0Bfs7C0HiewVQ7canwF+YH07a1wTjlAkGzVZxsVjNwy05oaBImIu6EZodX81QqHzyFDgtSt6v3hi6Ml2tqufSoqwV5LeT3sXnMAJHDsLtYIVQZdnuEjZ+WJ9p7cg8sh2YeoAG0NQsAAGeTfeOadzBnuaBTAHLGBt3EJ3ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721292582; c=relaxed/simple;
	bh=YON3qQZRadOsGV3/dzsrJ+NuUTonvuNjaJNMNLEy8h0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hj8TrQ2SmT5NYAzf3yfALijWL7m+SfBkd+FAsYGIAyhafcdSnspa4StEfE7BF7zwpuJt1fOW770u59A056EsjwcqZ3dkXtUisS/YaxgGEp+8C6k5GDZL+vAA7OXSQ01rQW1o/kH9uW1Njg+jHkyP3cfcU3DfCIntl7jBbLjwbWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GW7c9hfe; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GW7c9hfe"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2eee083c044so6348811fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 18 Jul 2024 01:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1721292579; x=1721897379; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P5XSGgt22gfhlNdwJOJsw/pH5jU2PiKPxPPeoeirhoI=;
        b=GW7c9hfeO3ZUZjgJOz9iVqLtaJ2rQyh6dvFpJutl6gqQrXs3BOGYJ+eoT/hgMx/73R
         yOP1j5frR7xz4kcFCeIFdTxWbc4+OsjEMYPjk85zNaxbT0sU8fVE+IG4TRPntsB994X0
         PMNh98CsFUU8g2GnRUaygpGvs+FKHdYIXh20w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721292579; x=1721897379;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P5XSGgt22gfhlNdwJOJsw/pH5jU2PiKPxPPeoeirhoI=;
        b=ssM9dAr2UGtEFAyTWgh1jvch/5ymNZDp+MXIjfv421dQItOFBjztkEU1JCyhJMBUkC
         1FqS64wMSQ/QHXd2jGIhA3dGf73wNLQCpgIVp1Hu9Zl3vprSwbY17eVDWN3aqKUsO7DL
         ila6kMOd79spyRSrSMj+Qoh/Hlf4L7KY4X85mKwf0BFrTekB3f05cSA4PMUySs0HjS5B
         nbn5k/rU0QbZOobHmJTixDY4D9QHl3XXuFjDiv84N2pjArT7iGUSykAFvSTa/ezZqAFV
         JJdwZtgUhb4zUhXllfFdfxdFOXYXkHJIP22452MxiTaFjOw0aHudh0CiUiEOpJ62pZUO
         G2hg==
X-Forwarded-Encrypted: i=1; AJvYcCV2G8LNRLDW6DffRpeC0L16wKgZOnOSI8fnppjkQos494yIF12Iq4SsFgyBfIgm6UhLX9BeGkcfLGqgrTfPn26N6fXxos4afjZVyjk/
X-Gm-Message-State: AOJu0YwnwYQSHFJUAkdKL6SSOZIw+Q1ueM6MqQJ5iltveLEjF0QzFnq1
	EIsD6Lg7uANdQXeMEheMJMeBwfQyTPST4er8y3uScf3UrXv8/3I0mdPASHQRUk4iw7YvDi14Fm8
	ecG1gTzQJDNJiIZ3U1tSHAX7EDvNft+0PDDCI
X-Google-Smtp-Source: AGHT+IG2DjunGNz+AEb1WXabve2JGyl+FmIAwPg8sY9p8UhtyfkrR6meUMRp3lKB0WgoJmvcUUvoRzt5fDDJIVdF3V8=
X-Received: by 2002:a2e:9b89:0:b0:2ec:5945:6301 with SMTP id
 38308e7fff4ca-2ef05c79995mr11185471fa.18.1721292578930; Thu, 18 Jul 2024
 01:49:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240718082410.204459-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240718082410.204459-1-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 18 Jul 2024 16:49:27 +0800
Message-ID: <CAGXv+5GBg73kWuiDt=9s7M4oJeHhWOF3bPY7Ju+qn1kJgNNaGw@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Set sensible cursor width/height values to
 fix crash
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	daniel@ffwll.ch, matthias.bgg@gmail.com, shawn.sung@mediatek.com, 
	ck.hu@mediatek.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
	Fei Shao <fshao@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

(CC-ed Fei Shao)

On Thu, Jul 18, 2024 at 4:24=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Hardware-speaking, there is no feature-reduced cursor specific
> plane, so this driver reserves the last all Overlay plane as a
> Cursor plane, but sets the maximum cursor width/height to the
> maximum value that the full overlay plane can use.
>
> While this could be ok, it raises issues with common userspace
> using libdrm (especially Mutter, but other compositors too) which
> will crash upon performing allocations and/or using said cursor
> plane.
>
> Reduce the maximum width/height for the cursor to 512x512 pixels,
> value taken from IGT's maximum cursor size test, which succeeds.
>
> Fixes: a4c9410b31ca ("drm/mediatek: Set DRM mode configs accordingly")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index 6f0b415a978d..b96763664c4f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -540,8 +540,8 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>         }
>
>         /* IGT will check if the cursor size is configured */
> -       drm->mode_config.cursor_width =3D drm->mode_config.max_width;
> -       drm->mode_config.cursor_height =3D drm->mode_config.max_height;
> +       drm->mode_config.cursor_width =3D 512;
> +       drm->mode_config.cursor_height =3D 512;

Fei already did the same (?) workaround downstream just recently.

OOTH, Intel recently added a feature for enumerating "suggested"
cursor sizes. See https://patchwork.freedesktop.org/patch/583299/

Not sure if other compositors will end up using it or not.

ChenYu

>         /* Use OVL device for all DMA memory allocations */
>         crtc =3D drm_crtc_from_index(drm, 0);
> --
> 2.45.2
>
