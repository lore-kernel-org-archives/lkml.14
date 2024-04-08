Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0005231;
	Mon,  8 Apr 2024 03:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712545670; cv=none; b=iTnKvCIeE4aivWH/8hsLd3Wt3FKbm6bAc58Ku74ieznsuBrgowg6q0L4wvOiEeHqHxrD9m5zUHgPQ9lKpaSCJlosjwX1ilsPKpWFeeQ/dvCuAsWfYFlAmjrqMRAPo/ic8ICg0EE+2f1/jWAaKkK6vXWgonD1PR9l6eH8nDNT4x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712545670; c=relaxed/simple;
	bh=0Fjgrid+VbA5n/TkUiCycC4XJbSryN8zjjdJtEqvxd0=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=hvhaVBStdNlVslG5mNFO7Rbf+ijpB0eZTfgdWFTF6TK2mZnsMgAbut/exwvTvA+O0xEzfcoHkGhGLjY6gc4/gzkWuuRnrVAVj+hAXaOmc843zRS/NmeMx73BU4BIAV90KZkvrhJJlgSjxpiq7uLDUUWdEeSNyA/EcVrZHnxvgGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=idpxwcjt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="idpxwcjt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61B44C433C7;
	Mon,  8 Apr 2024 03:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712545669;
	bh=0Fjgrid+VbA5n/TkUiCycC4XJbSryN8zjjdJtEqvxd0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=idpxwcjtWgc3wrjw5hOV1QFDmbn1JrFg1wmt74NxKgOu+pSD2qJckRNojwtNT4r1C
	 cIfc92IjJEQKs7ljq2XrthC8Jos4XSO91kW0YZiobGYNpKNBgB9WQ4ByAt/AFI0gar
	 rqiwQ8P4Rp9kkiFxdzmPqpTd8qDCy7SLoSiYNQS48lWTvZj+wY7dZ5Svhg6pyd9+ri
	 nr4/PCP3DAh9IwkdncDG+9e/DDzhY8ZsC0W7zH8zrz74syhdGBj2AUnSeFi7PpS/fA
	 9kcWVe9PNk6Q7drh5K1cOqDeuPjYrjpG30pjmVpv1iMIJLrKHmsTiNFBUGT6n2B6Dn
	 IGluQbMn7fbaQ==
Message-ID: <2fd6e4933da60ec04799271061d994b0.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231130173757.13011-2-johan+linaro@kernel.org>
References: <20231130173757.13011-1-johan+linaro@kernel.org> <20231130173757.13011-2-johan+linaro@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: spmi: hisilicon,hisi-spmi-controller: fix binding references
From: Stephen Boyd <sboyd@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Date: Sun, 07 Apr 2024 20:07:47 -0700
User-Agent: alot/0.10

Quoting Johan Hovold (2023-11-30 09:37:56)
> Fix up the free text binding references which were not updated when
> moving the bindings out of staging and which had a leading current
> directory component, respectively.
>=20
> Fixes: 9bd9e0de1cf5 ("mfd: hi6421-spmi-pmic: move driver from staging")
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---

Applied to spmi-next
