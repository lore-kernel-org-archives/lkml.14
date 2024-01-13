Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C81EAEA
	for <linux-kernel@vger.kernel.org>; Sat, 13 Jan 2024 06:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zu0BG6xh"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5955a4a9b23so3814949eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 12 Jan 2024 22:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705129192; x=1705733992; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NlgYvwiglw69wHFjINoNp8yqad8MaijuxDEGtBymTH8=;
        b=Zu0BG6xhXPB+9YCtjst74ANp7drr2eT4LToTYTo/OpCu+J0jfMcN7sQPQ9SQalD8Ga
         g+N0UWDYbarA/voMTpVDIXuYOVFsnF4N4yBev3n+3zmc11Btam2CCWfzYCO8ht6pmYq+
         izgyY0VFdQVbp3S1t9wBwvvoJp9j4RleDByIG/HbjWaQk1iVIavI+TySUHvo1JBaUCVm
         7yv2//mi7qAdFkpwCDtTyEqg419Wif1BvxEYWtuPDyiD051BjG05B2FmWwRsOCFEvgqw
         uj8oO6v5jUSm0vkRkpSr2yJlZYs1407NVu9n6GZ6hhq8GUDYzOz3oRqsK+isWVDsZacc
         8hNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705129192; x=1705733992;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NlgYvwiglw69wHFjINoNp8yqad8MaijuxDEGtBymTH8=;
        b=bbYwGTfC+6PAiQJacN/t0mM4s3m/YctbEaC4I3L8S500lZ3G0XVAAygMYWWk+xh2EJ
         vI9tHSkZHMaeQWaOLR/l5hRLUWDWixW/Lp8QZ2bcZ2gjFF7WNLOOz+8KAPXxdZOb2ahJ
         mzKjDAjNlrw69IUQzs6Xss3MUb7qvZo/mLkVvAvAsKyExx9icTFJ1ZmgCl7c8Xd6nmxC
         RvkBX91wwr+qn7ETCXo4SgnfcOzV6AtCJ8/FVw9cdbvVnn+sO0GO3mBy1lypM4AqqbLD
         051AlzuQjkIfZ/10a2/Kf58ptdtSBfGh0wKE7yFllXBeExVYLGt6aFaXShpMoE1GGzMm
         ktZA==
X-Gm-Message-State: AOJu0YzzzQwlotctMqTju8JBbMy+flr8Mu3aJittFJyhT95kCnzfFGV2
	ig8OZovwbMcBJujp3lpNig0=
X-Google-Smtp-Source: AGHT+IGMlNH1KGB9T9u3vnj/HuPr6ixY9mPlH6aUgxMBF5/o5PkKsuQfSQCr7mnvkgyvCPRBJZOtSw==
X-Received: by 2002:a05:6870:d886:b0:1fb:75a:de75 with SMTP id oe6-20020a056870d88600b001fb075ade75mr3376971oac.99.1705129191682;
        Fri, 12 Jan 2024 22:59:51 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id px8-20020a17090b270800b0028dc4b598b7sm7306985pjb.55.2024.01.12.22.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 22:59:51 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 2798A184F261F; Sat, 13 Jan 2024 13:59:47 +0700 (WIB)
Date: Sat, 13 Jan 2024 13:59:47 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Jakub Kicinski <kuba@kernel.org>
Subject: Re: Deliberately sending partial patch sets?
Message-ID: <ZaI04-HDHbBxKYbS@archie.me>
References: <ZaFKvZg-MtZgbCKA@archie.me>
 <2024011247-caregiver-compacted-2e6b@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6erqZN2grqY835Et"
Content-Disposition: inline
In-Reply-To: <2024011247-caregiver-compacted-2e6b@gregkh>


--6erqZN2grqY835Et
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 12, 2024 at 08:37:10PM +0100, Greg Kroah-Hartman wrote:
> On Fri, Jan 12, 2024 at 09:20:45PM +0700, Bagas Sanjaya wrote:
> > Hi,
> >=20
> > Let's say that there is a contributor who wish to send a patch set (e.g.
> > 20-30 patches in the series) to LKML. But instead of sending the full
> > series, he either do one of the following:
> >=20
> > * Send only the cover letter (analogous to movie trailers)
> > * Send only a few arbitrary patches in a series that are most important
> >   (e.g. patch [01,04,11,18,23/30]) (analogous to match highlights)
> > * Send only the first few patches in a series (i.e. subject of one of
> >   patches says [09/30]) (analogous to sample book chapters)
> >=20
> > The rest of patches are behind closed doors (i.e. not sent), possibly
> > behind charm-priced (pay)walls.
> >=20
> > Is the submission like above acceptable (when in review)?
>=20
> No, kernel development is done in public.

That is, the submitter must send the full series, right? Why not partial
like above?

Confused...

--=20
An old man doll... just what I always wanted! - Clara

--6erqZN2grqY835Et
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZaI03wAKCRD2uYlJVVFO
o4SMAQDgU6LGkJ5QHxX1OJjYE93Cm81LrGipy16/+a/lCQM+bQEA8SJnbFfqHUkX
TiJGS0czcU8L6YELBlsXKRUGcP59bQQ=
=zqMT
-----END PGP SIGNATURE-----

--6erqZN2grqY835Et--
