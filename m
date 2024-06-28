Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339497FBA0;
	Fri, 28 Jun 2024 21:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719610749; cv=none; b=gQHmNIYmpvSyTIDMrL1GzIuZnB9IEBeEj3ooxjYyUw9nrBCZZWaK0lFJVpnkW2s0Sx49rCo2Z8cRRqpKIUNwUUMVKkhZlsm/cGFYG2nS1e7z0WjAn4znIHpaGLXX4SQ0VN9Hnjae5SLPWNz0Dm5k92qcZOjKyf+zq9YK8G3D/JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719610749; c=relaxed/simple;
	bh=rPLzipj8gwiNtptMkcgDEIdoBXBcmk8bXuwas4haqkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hVDA1fhzQNcq/8Kakk5+Cocbn5rQ3nwQ0YIB6jqe9drKo6IjQWgOgXwfgKncrwDV5hAzsQoWMBUppBwPuwo40+jQ/BKds9NY/viGAw+7ahtXiVLbZe9dqzp33oJ0xQqWcnmapxb4fsQrk/wYQYM+gy3e6zZ33Ggj8luZecj6AXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jEKsQbkd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jEKsQbkd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B0EBC116B1;
	Fri, 28 Jun 2024 21:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719610748;
	bh=rPLzipj8gwiNtptMkcgDEIdoBXBcmk8bXuwas4haqkE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jEKsQbkdjx/D0QAxnGVRHWPRmGl7qVLcbrq1H0a7+p4GpAjPv9IdfP+CQP3CtePWM
	 7RGCiHKQIMU6/drhs/mA8ifMJwcg5EBE6nOodxG/XYrfWgufwFgEj686RpCdHJ3lTc
	 IpYQMvZawoW0w55UQVWmN2vt38ouEhyCH8L87SWVtlHnebCfXSXfaNF0HAUvXBD8Th
	 mb8QdmB8vQDMQ20EF9wqBSkNPKBPTNhpO27U1y6U474ieqNlaHvFVa8y9JuXeQX98g
	 y88duo44pqYC12327uRQZOGS6REiO+UQq7d4n2CL14FiRqFBSyEBRVlGpaA18HtRv7
	 GhaqF0grv56nQ==
Date: Fri, 28 Jun 2024 15:39:06 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andrew Davis <afd@ti.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Nishanth Menon <nm@ti.com>,
	Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 1/2] dt-bindings: soc: ti: am654-serdes-ctrl: Add
 simple-mfd to compatible items
Message-ID: <171961073512.253446.2203467446314091893.robh@kernel.org>
References: <20240625164528.183107-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625164528.183107-1-afd@ti.com>


On Tue, 25 Jun 2024 11:45:27 -0500, Andrew Davis wrote:
> This node contains a child which is only probed if simple-mfd is in the
> compatible list. Add this here.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  .../devicetree/bindings/soc/ti/ti,am654-serdes-ctrl.yaml       | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

