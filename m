Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7425C47A76
	for <linux-kernel@vger.kernel.org>; Mon,  1 Apr 2024 19:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712000031; cv=none; b=j6hd3gHDR9KP5zXvhZBMAZckhQ4kZsJekNOKNr9WQfqVxcwFNkD2uMw4s6Q4Mrkt7pNhUKl1EfTFFgVLjYMVx5565wGiwDH6emtWetEN9iwItTF8HXrHdqpXNEAidQ3KMt7OGNbZSmF6dANaU+NoOCQGH7otllHdmj9STDmh+Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712000031; c=relaxed/simple;
	bh=oGAhchIze6owqlGCi3tngrcKGY8dhEFEeAnnwkaI+7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eCmy5IfHj5gSsaslKcI8biTHEysWO3L1VNOWEmCu83PJEvSAM/RH2OXY9T/SShueHULoq+ObfJADtCYkqcC8YsdZtiGNMiS3HroOrPWFKJSeDllnYWUFQpnFHIasz/Yx8bohUtWbqaTXQJtOBTipQtlqH3aXvGsd6eIXmnlR6Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=euTry+CI; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="euTry+CI"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dcbd1d4904dso4010738276.3
        for <linux-kernel@vger.kernel.org>; Mon, 01 Apr 2024 12:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712000028; x=1712604828; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+LHCIkXc5kFczmKalYbrfTJscdj4j7KddNDmuRCIrvk=;
        b=euTry+CIXRv2/XqjMasIYgJSGZ8y7nnujMBSsuNOyOmTgvQM4843hRFqTp0xQAWv30
         WnJf+RuuAJY5x3q1KHJ62CEN1+KGMVcCCOIm30suKUEt7xS/4SdXxado2QgxmxJuZ0wa
         m5Qm+1peoV4N0xmRhpcrvG2a2mZ51ZDs134HPTJgmnYs6ikpBu3hNtVQW63IJBaNc19U
         YWWpUPXLrPYI11HubPRptDEhJScQKekLiJi/IVg8/81bo2K1kBBOuDsT3AVDgEMO56S9
         ECXwb0qORAVzQrSJoWIFrG/GPqymdDKQz4jnvyX+HncVC5lqWZFJVFHfpx64fYHkG2nT
         hBpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712000028; x=1712604828;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+LHCIkXc5kFczmKalYbrfTJscdj4j7KddNDmuRCIrvk=;
        b=KiF6z23Z9BMOkA+lyggN5099wW90xOQfjujy/ZbwMZYBBD6AHrqxEzPz8EEOQmr5WB
         NRVBKeiPUvewhsmA03WfTxbbS10w8DPzRjYfFz8xtRfePc7WpYhvIVPjOyQuzY4EwtYm
         ILkVq+KfwpW8Y40zRrzqRAh2o54Bmg/LTJ8SVjyGmUihoDPIktkj29Ex/tGDJu0fj/oT
         LZEbjZxHfoBfDVrYgFUT13YRpZoNV8M5taFlJxrsOCH9ZNF64Jzjexxu1aj1VjFfkCyp
         L7S9vDW9pSVY/bSo8mPXtXsTudkWTPufHM0KehfUT5eV8ZeNRQz8f7tk+7kLjqnxwSoB
         QXCg==
X-Gm-Message-State: AOJu0Ywpg1avYg0KgE/OmexJQPwZpNtOe/7oXl2ocYcFLizx1M+uAK6n
	d8sfjSJkg8vN181X+bWj31LhOsxfLXEnKwfaYq0BreYmVZ8+Hl0El8wg56BXrhX1D/VjznrRpk5
	2gubB4yoG7HeB53FoiTV8oO2s2qQ9pWhzo1YkqQ==
X-Google-Smtp-Source: AGHT+IHSl9m2kJnaPCQ0YzssVwbmthydWbARdb9jv81G11vj01HVeVU4SQc3rn2c4q+JQjFkfM1C/4FcBpa1iC6qBg8=
X-Received: by 2002:a25:a83:0:b0:dcd:5e5d:4584 with SMTP id
 125-20020a250a83000000b00dcd5e5d4584mr8131109ybk.34.1712000028409; Mon, 01
 Apr 2024 12:33:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240119102215.201474-1-oleksandr@natalenko.name>
In-Reply-To: <20240119102215.201474-1-oleksandr@natalenko.name>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 1 Apr 2024 22:33:37 +0300
Message-ID: <CAA8EJpopbgOs29RTzKf=qOFdX9WFzAxEumY2WOC2B76tVgxH-w@mail.gmail.com>
Subject: Re: [PATCH] drm/display: fix typo
To: Oleksandr Natalenko <oleksandr@natalenko.name>
Cc: linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, 
	dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Jan 2024 at 12:31, Oleksandr Natalenko
<oleksandr@natalenko.name> wrote:
>
> While studying the code I've bumped into a small typo within the
> kernel-doc for two functions, apparently, due to copy-paste.
>
> This commit fixes "sizo" word to be "size".
>
> Signed-off-by: Oleksandr Natalenko <oleksandr@natalenko.name>
> ---
>  drivers/gpu/drm/display/drm_dp_dual_mode_helper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Fixes: b3daa5ef52c2 ("drm: Add helper for DP++ adaptors")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>
> diff --git a/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c b/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
> index bd61e20770a5b..14a2a8473682b 100644
> --- a/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
> @@ -52,7 +52,7 @@
>   * @adapter: I2C adapter for the DDC bus
>   * @offset: register offset
>   * @buffer: buffer for return data
> - * @size: sizo of the buffer
> + * @size: size of the buffer
>   *
>   * Reads @size bytes from the DP dual mode adaptor registers
>   * starting at @offset.
> @@ -116,7 +116,7 @@ EXPORT_SYMBOL(drm_dp_dual_mode_read);
>   * @adapter: I2C adapter for the DDC bus
>   * @offset: register offset
>   * @buffer: buffer for write data
> - * @size: sizo of the buffer
> + * @size: size of the buffer
>   *
>   * Writes @size bytes to the DP dual mode adaptor registers
>   * starting at @offset.
> --
> 2.43.0
>


-- 
With best wishes
Dmitry
