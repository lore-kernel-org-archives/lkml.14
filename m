Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581152A1D2;
	Sun, 19 May 2024 11:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716119915; cv=none; b=VlfAehjLVfS+54BowgXs1XB+iJmtC6vxeUEx65YH94FFmGJHnvm1lnrFEc9UZPGcL9rI54uSaAgvfYtetGv/hry8gDkni4hY7I1DUI7iu/qJPf2LAefcfSYja60d9swKIfPBV4VZF4IqJrV+5uht4oBNa+lp7nbxQs9FmnBe+JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716119915; c=relaxed/simple;
	bh=dcVEt97hUxkGKz1aWzRDKQTnNqLSCp0T8noaZJtuUzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZM/mrq4EGQjmrjaox2DNIgAC5FOiwRhkAqRfQEzfJT7VpQtlr74OrCO+lFTua8G1GPb0OxTSeSmpuwP+5eDJk2mbqmcQZPrrtwVJ72BLV3eWL3ZuR4gPqi7MRwBSCyZgx1Hazg+L++hzwXCnWHhIazspthBV5SHMztmBMLze91g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bvP2t5vj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bvP2t5vj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B85DC32781;
	Sun, 19 May 2024 11:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716119914;
	bh=dcVEt97hUxkGKz1aWzRDKQTnNqLSCp0T8noaZJtuUzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bvP2t5vj1ksvtvlcenwM+cQPxcydvPT89O86WQreTgAy27RGmvJZf9wz7pmSXItGs
	 eXmsHk3HScT6KmOacZkZlbj2Y/ivzBFrWRfWw/jtOqzbHDdiakUjGLIBF5nw0qQpBf
	 Uw+0FGDT+8DbNIYOKV5WJa9XA5W4mOptqXYDiiRDFac78wpDh2UorIZNdCTQwtEzR3
	 P14cQR6uPtiG83G4QWYEokKt8GTJJ4THc/+CPODCfySIt58o3WOAKq2YCKF8GEzaoc
	 G1H3sSiEImi0+hjTzIcg21O3Q5OdNNVsGS9tcYR+2L4UbxtY0d4vkImhCCK/kjVhzZ
	 cqxLRYE5cBYGA==
Date: Sun, 19 May 2024 12:58:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Kanak Shilledar <kanakshilledar@gmail.com>
Cc: Kanak Shilledar <kanakshilledar111@protonmail.com>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2] dt-bindings: interrupt-controller: riscv,cpu-intc:
 convert to dtschema
Message-ID: <20240519-ideology-nervous-eb30a92e1e42@spud>
References: <20240518061925.43549-1-kanakshilledar111@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zy1Bb1+InXaHquRd"
Content-Disposition: inline
In-Reply-To: <20240518061925.43549-1-kanakshilledar111@protonmail.com>


--zy1Bb1+InXaHquRd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, May 18, 2024 at 11:49:21AM +0530, Kanak Shilledar wrote:
> +allOf:
> +  - $ref: /schemas/riscv/cpus.yaml#/properties/interrupt-controller
> +
> +properties:
> +  compatible:
> +    $ref: /schemas/riscv/cpus.yaml#/properties/interrupt-controller/properties/compatible


Unfortunately, this is still not what I was asking you to do :/
I said to make the copy in cpus.yaml a reference to this binding.

Cheers,
Conor.

--zy1Bb1+InXaHquRd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZknpYgAKCRB4tDGHoIJi
0ipvAQCE3mguMXiwmqezXEUwqtkp5cDzTgZtQWbNBe5f5n+cfAEAnohxuGJ3V23p
6rPB3lvwGKhNzA2dPsrKc1nFDlLqcAI=
=4iLx
-----END PGP SIGNATURE-----

--zy1Bb1+InXaHquRd--
