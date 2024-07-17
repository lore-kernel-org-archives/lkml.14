Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64451E515
	for <linux-kernel@vger.kernel.org>; Wed, 17 Jul 2024 14:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721226731; cv=none; b=PYa5GFrrBezdhOgNLU1MhTOfw8WhK1flmJSw/1TlIKFfw5nLDBYGbMnCDvaan/NEubNRc/FHo3LLFd8QrOvEEfIQPgSADu8NwsL/MMB6EaJlLCHM1ZruB/4BUIPlEtLYeTbYambR7qU3wS0cFYDWPvNTANvXOaCG3dKwhydsngI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721226731; c=relaxed/simple;
	bh=ldPDBayLKEtVOpo5HRMHZsg1E0cwAYQyTsZ+Sza/7j0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KG0o5xISxgkKLL9Oys2sYAhx24NCQgEmWf1G83+BX6hQmHLSIK8InZcgsJ38sovmk3hcQFgkdYf47Lcu9rw/LWO998i6IUPNLbuyvv21bsstoDRiVs297bWrzjXP3hv7HpILrWE7T6jyZB5Kivdasyq9h2bJu55/H5wEoF037mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=dxu+Sgep; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="dxu+Sgep"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52e9fe05354so9594748e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 17 Jul 2024 07:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1721226727; x=1721831527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6gb3SRaVbWvMQnGBqh6xxdD/QGtCXs5NHaYcgYJYvDM=;
        b=dxu+SgepPgtz54WRGi2wmbvA+cr7kfGvTA2Pp8Y62yYBROVjnwnJJv+61QGR6nfrfd
         iqOnLa8BQqIzuP5AEoFDsPY5RiEsCpLZr9w/jcTitIEDdQ//5RyyOSjJYEK0XBYskWwX
         ZCFqZZhdgH5vhj38io7UrP9zZNmLZwA6erEfpowom8ADOGP9UXlZ2zM/cmN8h6G0OqCA
         M0kJpWpDgBEq/dpZgwwGH1vUzoktjkm9aTuAtuHCLjAQEo1Xirtv6SQ48XMoh/dN4gyy
         iAAELYU2eaN3HYbtUHSgpCvUprRS1bcYQOY9LWucgN1pDai07MnS8jJWFhcpEdlC0EJr
         HDtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721226727; x=1721831527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6gb3SRaVbWvMQnGBqh6xxdD/QGtCXs5NHaYcgYJYvDM=;
        b=goS8U7Z2UBcWcuuvSabK+tMu6Q1+jNO9jjWIVJSPfFZO6EnPTiCI408DEss4fvr/Fl
         JoTTO/TevEXL+iIm2RBQdH2hScN6j8i4ENxT8Y1QwIIEq/FZlNLduRSjTupYUBFvNvtH
         6sN2Z4dLmn1lfz/qNuRivkLHuvTO7Ril4UHm500EdPX1IPd/jwbUxmXdKLKcOVTLwxzw
         k53X4QkUUIMVsRkGa1OMI0aclkW+2E9UI5EkZKjbq1hsnVNgRIL0E6/c7/k3DqXn+aa1
         GccHNaLKYQDN9QFSg1UnyoKCx/Cga1G9nNxV6LUEN5ZoxRD3tgihA9T8T7clDLcsWgZ8
         GEJA==
X-Forwarded-Encrypted: i=1; AJvYcCW+Er3mCyUWi9FtUaqRB6MI5rXIgiW3Wdm+R7wss5Y6/xW+5WngMCHVv8535Hj+yYVSByddkf+t1eVT4C+QLLSWECS6gaj5nSpORpJl
X-Gm-Message-State: AOJu0YxHpbMEhTRpw9plao2/2IkPCxT1CE06sxNE7wPkP5QfIPAz9Fzf
	68+37BHP/QmuQOHIj2gbVi62DHhdYi5H2cVNmqZ877akXYXnufzUCUfhDGn8fCU=
X-Google-Smtp-Source: AGHT+IH4TeKDJCqXJMc9M7g8eUuhq5rsLBoWKS9KDDV7esGEVAF0qeFguGmnZJcn/fXIFfLS+8/5PA==
X-Received: by 2002:a05:6512:3d8b:b0:52c:b09e:136d with SMTP id 2adb3069b0e04-52ee53c9858mr1632255e87.32.1721226727575;
        Wed, 17 Jul 2024 07:32:07 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:6724:3f6f:5a36:d95d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5ef57aesm170330585e9.45.2024.07.17.07.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 07:32:07 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Dan Carpenter <dan.carpenter@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] power: sequencing: fix an invalid pointer dereference in error path
Date: Wed, 17 Jul 2024 16:32:06 +0200
Message-ID: <172122672402.53664.14935726474313794841.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240712194004.241939-1-brgl@bgdev.pl>
References: <20240712194004.241939-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 12 Jul 2024 21:40:04 +0200, Bartosz Golaszewski wrote:
> We may end up calling pwrseq_target_free() on a partially initialized
> target object whose unit is either NULL or an ERR_PTR(). Avoid
> dereferencing invalid memory by adding an appropriate check to
> pwrseq_target_free().
> 
> 

Applied, thanks!

[1/1] power: sequencing: fix an invalid pointer dereference in error path
      commit: a19ce320c379e0519b68178c596e43d1d5dda03b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
