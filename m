Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E43114D432
	for <linux-kernel@vger.kernel.org>; Thu, 11 Apr 2024 13:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712843360; cv=none; b=L/mfmDFoKCJimcp/kELEl8fM/XsWyEEhWBQ/1Bh+hKsO0/Y14aMMq0kjTEdgAPsIctlfocbnUbyvbDUP28J2KgeoO/NblYtz0PJjP/4l/TC8Hf7g0rMgGrmR8ZCesCohHXCk31bk6W9DGQ1Ob775v+WIy1RhPT579qjDv5i9N4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712843360; c=relaxed/simple;
	bh=y+ppOR7d0OTE8H4QtIsbOvIkTtRWlacAzHE67+7zkcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gVOx4/N9AZ982Ohh/TjVS0mRuAgBYBm6fdSzJpsJDWqr1WbRdUqxC5fb5/a02zxm9l3AlmAQF1n/hdqif+FBFLbT1IvgWI00C706JXx96Oj+tofTqCKuqBu97E4vtnQRdIeFrTMf2A3rGyHEoPUvt0mM7QfSHcD7Dj7vnVos3aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VP4GzfJB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VP4GzfJB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34898C072AA;
	Thu, 11 Apr 2024 13:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712843360;
	bh=y+ppOR7d0OTE8H4QtIsbOvIkTtRWlacAzHE67+7zkcE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VP4GzfJBfKc6/pyOrUI6YzRvRBQBKsGvQsg+AZqE/ueA+hpd8z/PFdHMTmOiqIEbk
	 gmySkTK2hxy9QRVNoEe9y88ZvFDAN67MHldomxxdU8MCXXg4+d2i+JSiEuD1UaNw5/
	 QIPdzBsV2gokepfJ3gcFGJy/X63C1m7Kkw3gG3cU2zBQkdFXgVnoVLAv7AElqUKKHG
	 1ei1+m0uKwk9CHqAxI8+s/x0y50VrSqq9+R3DbiHrWYYIJQi5F9DzWm0jPfsvTKCmc
	 CYKS+/DAAi781uhVAJtXLcvahz21iMtFHbniXMviRxpev8gKuXwPsvWd//jgMGf/h5
	 2hIIMGGpICmBg==
Date: Thu, 11 Apr 2024 14:49:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Fabio Aiuto <fabio.aiuto@engicam.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/1] regulator: pca9450: make warm reset on PMIC_RST_B
 assertion
Message-ID: <62e86aca-654a-40d2-a9b0-ca26ddc15217@sirena.org.uk>
References: <20240411100138.366292-1-fabio.aiuto@engicam.com>
 <243d9eb2-aaab-4ede-bd07-aa609b5d149e@sirena.org.uk>
 <ZhfkDrDYlTFd1gOJ@engicam>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6K82GOaV4w7tr4+F"
Content-Disposition: inline
In-Reply-To: <ZhfkDrDYlTFd1gOJ@engicam>
X-Cookie: How come we never talk anymore?


--6K82GOaV4w7tr4+F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 11, 2024 at 03:22:22PM +0200, Fabio Aiuto wrote:

> I've got it, thanks. Do you want me to send a v3 or are you taking in
> consideration this one?

No, it's fine this time - just a note for next time.

--6K82GOaV4w7tr4+F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmYX6lsACgkQJNaLcl1U
h9DZ8wf/YAZNqgVqJNAQeqB/oeLT8/YEisG1yVsPPpVxltZQixH8y3DQ67tLRT+Y
2k/ZOCaT2TMeKAFrhngDkjw9MZXwjbZ1liRv1FZOhurY4v9N1OdmIwmchcrzds4p
EPyqkzsK//BL79Gg71cLYbtRqcsWZI4ZSjou3MZEwrw2gw5ZJKSIeoUQXJFTwE19
//4+BOXhEYlNPqv6aC/Us5ZU2C+pyVOWgJteXrhtYHJYDk3zb2TdnOvcAA62Fgm+
c/uZly5yFQ1a828E8BKzGK75sNIkEDIxDq/fvgpMw2bC6DjQ6aZK+sUrsSiyYhda
bbhmm7KDxcaxx40Ro3k0hNrkxm0ctQ==
=YuzF
-----END PGP SIGNATURE-----

--6K82GOaV4w7tr4+F--
