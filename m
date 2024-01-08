Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BC454661
	for <linux-kernel@vger.kernel.org>; Mon,  8 Jan 2024 17:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H4FawNVI"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-467d58e133eso270711137.0
        for <linux-kernel@vger.kernel.org>; Mon, 08 Jan 2024 09:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704734474; x=1705339274; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZspM8ajCmHKs1p1EXAdq5Q/lVaLYsqAVwFloDCnQslo=;
        b=H4FawNVIQW3t5ESrijxSNS34Uq60/dGGdzTp2c/XN6SD33RCfOmhjixf0FNHA8oBHD
         nSD+ABAcRROvjQ8gzBTmFiIFqOTQKTViZF5kFERx84RY4pDJGE15G3113oflm3oyb7ti
         8H2Vl5cjMkFzvPILRgF5UJXKVRApqYqHvLzGMxCS/kncK8sY8j6ZUoJF6ML/Jpgl1Xqv
         KWsIqap8s/Vs4wiYqqMOAhrca2tslpUGuqf84rcUYbpA8tKWQZ070+f3l+uhUi/5fW4s
         VFNxiDZ7dgZoCTTkj1Ft9yFb+tOl97RSc9numm+lEuXWWF3y/XUm1X1zN5CzB+CyO9Ht
         NQWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704734474; x=1705339274;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZspM8ajCmHKs1p1EXAdq5Q/lVaLYsqAVwFloDCnQslo=;
        b=iqWPWtgH3NmNIO0RLiMYHBCG6J7RFUA4sauBFElBsT4OqEfuD9RdYQIrQhs7BP4oOm
         pDAXUbgwuOBCWLo9TfVNSUcONi9hh/DI8vrY1JyMfL2mRmzlo4E15YUcHhZ8TRSPurPn
         QeYbPcR/gKqQq0VYSusD8QdJu5MVqDLhTcrloLjH8IEh6Q4IBGBjb8NiYzsX59ifwW6y
         ODotlQIlPbiH6nK0vZO7ITcLKHWXBvOpw1id0ON7Jg68ko+zcwFvB4JUKqHNPEaafKut
         iWkNtmq5MnseeoLVr5NPVge9WCbEvfW5cKYf+kYqxmGyQyrWUGpTO4BSliINasATgm6R
         woFg==
X-Gm-Message-State: AOJu0Yz/cT60FSvr24PcNQL5Gw3+Th2tyI2ljsnnZyEDbgAO1BBPVCBD
	ce3vW0BoElHaMbCSGa3wiySh3iHEn1mE6Q==
X-Google-Smtp-Source: AGHT+IGTjXXswi02o1zMkJMWTYM15rRnnmTFCThZ4ddDiIq33W1KHzxm1R7JydTv4AV40yYLr1HXAw==
X-Received: by 2002:a05:6122:2526:b0:4b6:dbfd:f89b with SMTP id cl38-20020a056122252600b004b6dbfdf89bmr1495975vkb.27.1704734474077;
        Mon, 08 Jan 2024 09:21:14 -0800 (PST)
Received: from ubuntu-server-vm-macos (072-189-067-006.res.spectrum.com. [72.189.67.6])
        by smtp.gmail.com with ESMTPSA id ee11-20020a056130158b00b007ce1febd008sm20474uab.34.2024.01.08.09.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 09:21:13 -0800 (PST)
Date: Mon, 8 Jan 2024 17:21:11 +0000
From: William Breathitt Gray <william.gray@linaro.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: lee@kernel.org, alexandre.torgue@foss.st.com, linux-iio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 07/10] counter: stm32-timer-cnt: introduce channels
Message-ID: <ZZwvB6+m0Zqn9ih8@ubuntu-server-vm-macos>
References: <20231220145726.640627-1-fabrice.gasnier@foss.st.com>
 <20231220145726.640627-8-fabrice.gasnier@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rAMR63FHT8DTNWPr"
Content-Disposition: inline
In-Reply-To: <20231220145726.640627-8-fabrice.gasnier@foss.st.com>


--rAMR63FHT8DTNWPr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 20, 2023 at 03:57:23PM +0100, Fabrice Gasnier wrote:
> Simply add channels 3 and 4 that can be used for capture. Statically
> add them, despite some timers doesn't have them. Rather rely on
> stm32_action_read that will report "none" action for these currently.
>=20
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Reviewed-by: William Breathitt Gray <william.gray@linaro.org>

--rAMR63FHT8DTNWPr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZZwvBwAKCRC1SFbKvhIj
K6SEAP9QD1Yp25uS0XO3CQ36ysN3V/FOYL1wXT84afqp73IEtgD7B3TRLqc08WKj
3tpytIRAvMJ3S2hohbR9EGI3ZjCfWgM=
=5MFJ
-----END PGP SIGNATURE-----

--rAMR63FHT8DTNWPr--
