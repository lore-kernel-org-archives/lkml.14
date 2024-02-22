Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204987464
	for <linux-kernel@vger.kernel.org>; Thu, 22 Feb 2024 05:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708578988; cv=none; b=S1ckEmu0nkERrPAR/j2meiewgVNaCSDEbH01IJ3B9GpG1DGqji780tCcM7pRak2A9vcTAgyxy+noM1rZszTGLKO6KJlvM8X0nHvqLrsEKKvuEmmsjtjr2i1W6zUIq+6WlBPzsYi7h3aFaof0qgtJ4VOYMHH7Yf5kI95P2XYFVMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708578988; c=relaxed/simple;
	bh=tvXfqp8UvH2AW0EzEnXM+vkivsBB7XzVfVHdppIWjNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fjCDNZjstiqwh68vV30ILX0Q9h5G+K9pEuiDAUgWmNaug7Um95k76uPMn6TmRRSSs6Bai7/gaFuwVdLp9kuOkJ+V8ATrq8sXPNqvVsciAEzbkK9pkqQv15LX9kbXpxysrYeGvhMxii5SodhSOM2zcPobK2a9Nzt4ruG8sADYrLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aqtFJlbv; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aqtFJlbv"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-21e2673a206so4738724fac.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Feb 2024 21:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708578986; x=1709183786; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rD5K6UG4S2jRQ0lZUUyLSIDv5TVlF6XY/eKOdyWGS4E=;
        b=aqtFJlbvgE82dB5kfF4wVQ5F/hKzJ74+CyuJ3t2r/tLpaSSQpejChz3n8pNmP+AH21
         vOPUTJuCnWMeuUVp5z27FWSfK2b3+UDsaT5Yebb7+2JEXMB8Bqlw12qFp/IVUunyjBns
         3RAB/Cd3RGNRIakm4Ij0Z/oj/WFt/00Knamrg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708578986; x=1709183786;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rD5K6UG4S2jRQ0lZUUyLSIDv5TVlF6XY/eKOdyWGS4E=;
        b=pBVPwaL3KcIGfpMVherFCeaWwwb/gTDkf92A4lNbvAYWon+xBfRgFQIAdgnvWcqwHv
         NvpE3scsBBTOGzq8AwMHk2r9ApPh/7G781mY+D3cKAVvaakviu8n/yxTLZGl/FSwDo6p
         ZPzIruWY41QlBJXMDXlsvcYKdr5XOavEKBsuH27mRbY2VjGzIjeW3JmZULcU9ESt/8NP
         V/JtAZ1sd6Z83XMUA8X43LcsSHMZsitxD8seeIE3rHTqsxAvnfI21qRzDQCMZU0S0vhJ
         ZdM8U16NKUffaBU1uaFrEu1VRCItGMh/Nt2pm6n6Ue9GbBYNqBSW2VvUeftvZLv6fAMn
         WxMA==
X-Forwarded-Encrypted: i=1; AJvYcCUQvUB9Pq/mnRjx7W5LqZs7LGGOxZsYtsSvngYHl3fvgxVjBIHNTjKS0aC+PgTPqk0/6A4AhMtASuSqNqw458/x0cNwED+kxYxBAVlb
X-Gm-Message-State: AOJu0YxFArWVqe+zkeuXZNOK592DnI9BwDvj/Hvc9mbdveQPWm7Vx1rE
	v5SMQoeXoHdnnMp2pOz6LPCJ18MGCFSSyBd6aUQ9x5bcmziruyWRsJ+Lc6wTPg==
X-Google-Smtp-Source: AGHT+IGzWbkFtwPUOhmgSOZKD7Kj1xtlZSmOun2EkP1bA57V8dSpyutsjCWHQljWrkEoMi6+7hibiA==
X-Received: by 2002:a05:6870:5b9b:b0:21e:623d:1824 with SMTP id em27-20020a0568705b9b00b0021e623d1824mr19688847oab.8.1708578986068;
        Wed, 21 Feb 2024 21:16:26 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:480:9ded:eece:6cb3])
        by smtp.gmail.com with ESMTPSA id k6-20020a635a46000000b005db034d1514sm9383494pgm.82.2024.02.21.21.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 21:16:25 -0800 (PST)
Date: Thu, 22 Feb 2024 14:16:21 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2] kconfig: add some Kconfig env variables to make help
Message-ID: <20240222051621.GH11472@google.com>
References: <20240222031801.GG11472@google.com>
 <20240222032559.496127-1-senozhatsky@chromium.org>
 <CAK7LNARo4L6qxoqRU-0dgABarukJKAaZpCRtfA3MyUHhSuDQxQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNARo4L6qxoqRU-0dgABarukJKAaZpCRtfA3MyUHhSuDQxQ@mail.gmail.com>

On (24/02/22 13:57), Masahiro Yamada wrote:
> On Thu, Feb 22, 2024 at 12:26 PM Sergey Senozhatsky
> <senozhatsky@chromium.org> wrote:
> >
> > Add a new section "Configuration environment variables" to
> > `make help` output in order to make it easier for people to
> > discover KCONFIG_WERROR, etc.
> >
> > Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> > ---
> >  scripts/kconfig/Makefile | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> > index ea1bf3b3dbde..0044d49e149c 100644
> > --- a/scripts/kconfig/Makefile
> > +++ b/scripts/kconfig/Makefile
> > @@ -158,6 +158,10 @@ help:
> >                 if help=$$(grep -m1 '^# Help: ' $(f)); then \
> >                         printf '  %-25s - %s\n' '$(notdir $(f))' "$${help#*: }"; \
> >                 fi;)
> > +       @echo  ''
> > +       @echo  'Configuration environment variables:'
> > +       @echo  '  KCONFIG_WERROR                 - Turn some Kconfig warnings into error conditions'
> > +       @echo  '  KCONFIG_WARN_UNKNOWN_SYMBOLS   - Make Kconfig warn about all unrecognized config symbols'
> >
> >  # ===========================================================================
> >  # object files used by all kconfig flavours
> > --
> > 2.44.0.rc0.258.g7320e95886-goog
> >
> >
>
> Why only two, while Kconfig supports more env variables?

Right.  I wanted to add only those that we use (and familiar with) for
starters.  I'm not familiar with things like KCONFIG_PROBABILITY, for
instance, and not sure how to document it (its Documentation/kbuild/kconfig.rst
description is pretty lengthy).
