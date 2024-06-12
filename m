Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE1A180A79;
	Wed, 12 Jun 2024 15:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718206368; cv=none; b=CDvs30jo8eaBM3f4DuPKu0sP9Vib0WMdKuBDF16f1+XmihKa97IgIQnIQ/utw0fyw0gIVKtvAquNp5zXskBsPzE3ER3NglEuV5Pg8IzsBWk0vlgPXRPui0dp72s8KHjKg5YFnVC5OLa7qCjdWUGk4O7X+tBJI5m4PJInAu4WEiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718206368; c=relaxed/simple;
	bh=A4LXxVy38n/hdJk7+HDkZy7E6cYBqwA9u3vwpbFPPpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tsb0zV8NRefHc72Q2eFyJe3EP9ZtmZW6GOj4TUJ7fwp6dBf/bjmSH2yYObhzYlPejAKKeMz6KXYgiV7NbWeA/DNcYNCYkgR+uqy06vCA5qIHguBrEje5zvjdBDGOSdvnbJNP2+DPSQr1rcbU/4pjh2sjp4NPqI/jzJs4ZkSF51c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q1dk2jb0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q1dk2jb0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12B0FC32786;
	Wed, 12 Jun 2024 15:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718206368;
	bh=A4LXxVy38n/hdJk7+HDkZy7E6cYBqwA9u3vwpbFPPpg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q1dk2jb0rep78D4tnoiuqiiBrgVtN1bUOCYTIwfvuZ/b3q38BkVLLJ5MUFll4BYN4
	 DFUUEUezYt0Df2uShLAIVdPsleyPJJRzC0XkLqYbAW3wQHnvp4rL+zrU0TpyyjQtBe
	 N+ee/D0QPsI5VvieCA4hGr3aSjVy88FC5vtJ42lU45zFYLiIBOpT6Sf6OzAqE5CUe4
	 WPwI0kEt9/vo4Mn60rhgalqzG5vbZ/wh5ebbq987KmbwqOoktgO5k7UK9XAPZgtrjA
	 lo6XleH3JWS3aOxcj1yR/OzXsYsqaYQ4HIrvF1gra0iGOoMfQ83g5WzNZYjGQay83j
	 CLezwVyROkCmA==
Date: Wed, 12 Jun 2024 16:32:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: cs35l56: Disconnect ASP1 TX sources when ASP1 DAI
 is hooked up
Message-ID: <Zmm_np5cIF0MSE9U@finisterre.sirena.org.uk>
References: <20240611145746.1454663-1-rf@opensource.cirrus.com>
 <Zmh3VmRfGEU6pGps@finisterre.sirena.org.uk>
 <36219997-397b-4a26-96ee-7527fb6eb024@opensource.cirrus.com>
 <Zml2FfjbO4Vgk0jy@finisterre.sirena.org.uk>
 <92f2d6c6-2d63-42eb-ae91-59a14831145a@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ws70HyzkY6K4LGiZ"
Content-Disposition: inline
In-Reply-To: <92f2d6c6-2d63-42eb-ae91-59a14831145a@opensource.cirrus.com>
X-Cookie: Your love life will be... interesting.


--ws70HyzkY6K4LGiZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 12, 2024 at 11:42:15AM +0100, Richard Fitzgerald wrote:

> I can send a V2 of this patch with this long explanation of the
> background. I didn't put it all in V1 because it never occurred to me

Yes, please - it just needs to mention that due to the firmware we don't
have hardware defaults here.  I think it would probably be more robust
for the driver to just set all the documented registers rather than
hoping it's set all the important values and needing to keep adding to
that piecemeal.

> that defaulting the mixer sources would be controversial.

There's probably a reason you have all these use case specific
variations set in firmware...

--ws70HyzkY6K4LGiZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZpv50ACgkQJNaLcl1U
h9CtUwf+NBoXGau3/eYXKr81FuNxSnOhRdPBQp57iszrQ4weyqBab6t0wWKr5pUQ
AHAj4nwoFFaiehndPQaQol3kxvrrOn1f4vpk+n79F/eksHlXk6GOykyueklNlD99
Y2g+k2uETzBOHPTosZ99RQbLRj6aGVEWfAItaP5tAZw53ryiRcFrRTXlywlnverP
hS/uEt2Oi6SI+qdWg1BVx2+YPqbk/OnxucbLnyl90xOwa0CdZbbyIcD9rmIi0+c2
zS7t3m0NIHuiI5gz4vFChPQubxf/OSU2kwJ1O57WFySsXu0cKxI3kv2kBmURS+uS
A0UJPakozVyIIiJi2nw64Hl0IJDTcg==
=CNPA
-----END PGP SIGNATURE-----

--ws70HyzkY6K4LGiZ--
