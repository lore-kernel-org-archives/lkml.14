Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0468D155307;
	Mon, 22 Apr 2024 19:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713812669; cv=none; b=VD6z8BZGSBqPNX95QnomxubkEeOSEnXR1N4mTXSPL0dNTwgOsTMwo29XUO11iCncwLYwhTINl/fN7usq5CJ/s8Rt/lEmOJ0oHyC45Nt1ikcs4XXM5mU89NN+Q3DS2lSBN9F+Mm2Hk1h1FREeKvkCi0Wlh303U48UUE8TAbdaN0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713812669; c=relaxed/simple;
	bh=olqP1aRLAAfEcgb84p5a52kKbYDcwdtnUJC4C6mq74U=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=cN7CurwVTVx6w91lK2ckpkpT6u6UKHLn7O728LhWUxUVXy1YwsdeGQOXdCK8rSzpi5kspMtKQnz7Hzo+On5sfUL4eQsfbO8XZ/onVya2ogouRHReO+VEA1ETJegMSlTl7Tt0i1JcO3p1BRIjD72t9RHeZ+sZ01OULkhHJSRvwkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qu7dq74U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qu7dq74U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78F84C113CC;
	Mon, 22 Apr 2024 19:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713812668;
	bh=olqP1aRLAAfEcgb84p5a52kKbYDcwdtnUJC4C6mq74U=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Qu7dq74UxvzbpEN3NpAX3ogMta4JCap/1wpPrkerB8vdXOcq3jU7dzY1XAyipzaSu
	 xNYzBS4P/lmp31Ga5B21ulSGTtZ40gJpA01IwI0X31rmkewrXOoDbsA5ygWdTjEkPJ
	 zwAVJR2eqgsbjbmP/YBsx5PFq1URqBAB3Tr8DV6cqFxzbJQ+Mpxoi5JhSHYeh+qXL2
	 tAvLWYCPMr/rFyjGB8W27PsxkbKSVjQQov988OGfbDn9cPDHUQ3gayxBj5ug9bYWEo
	 PJBZSKbmsUtj5Ctkp5HVxqqrW93vYiewLgx+kG/21xDvSE25N9IU9aPIwIiGZJgIWQ
	 MXf5LjXgbSVTw==
Message-ID: <3a7c286f269246ea0138ddc960d1fac1.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240415163649.895268-2-cristian.marussi@arm.com>
References: <20240415163649.895268-1-cristian.marussi@arm.com> <20240415163649.895268-2-cristian.marussi@arm.com>
Subject: Re: [PATCH v3 1/5] clk: scmi: Allocate CLK operations dynamically
From: Stephen Boyd <sboyd@kernel.org>
Cc: sudeep.holla@arm.com, james.quinlan@broadcom.com, f.fainelli@gmail.com, vincent.guittot@linaro.org, peng.fan@oss.nxp.com, michal.simek@amd.com, quic_sibis@quicinc.com, quic_nkela@quicinc.com, souvik.chakravarty@arm.com, mturquette@baylibre.com, Cristian Marussi <cristian.marussi@arm.com>
To: Cristian Marussi <cristian.marussi@arm.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 22 Apr 2024 12:04:26 -0700
User-Agent: alot/0.10

Quoting Cristian Marussi (2024-04-15 09:36:45)
> SCMI Clocks descriptors expose an increasing number of properties, thing
> which, in turn, leads to a varying set of supported CLK operations to be
> associated with each clock.
>=20
> Providing statically pre-defined CLK operations structs for all the
> possible combinations of allowed clock features is becoming cumbersome and
> error-prone.
>=20
> Allocate the per-clock operations descriptors dynamically and populate it
> with the strictly needed set of operations depending on the advertised
> clock properties: one descriptor is created for each distinct combination
> of clock operations, so minimizing the number of clk_ops structures to the
> strictly minimum needed.
>=20
> CC: Michael Turquette <mturquette@baylibre.com>
> CC: Stephen Boyd <sboyd@kernel.org>
> CC: linux-clk@vger.kernel.org
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---

Applied to clk-next
