Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B452A129A7F;
	Wed, 17 Apr 2024 18:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713377356; cv=none; b=Z0AIoX7TvR6MCH6x9KXjaHsGgfq0xhdx+qISqay1hVOKR4iqIhdrziQ6hZ8THRgsQhYtMg71gVdBXj8vVI4u5EDVXqm9l5+nTGT6UcPEvWhgmgkvSsgYmTc7ukHwvkuecbscMdHidrG1ETKK2yYiLy/bwa0h6JyzICRH2CBndgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713377356; c=relaxed/simple;
	bh=LsqwIAcZ9xcslbdJWJ70Q/boOMwoOC+KtWr2ruc17ho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pIonBG1jftxmgibikh1Z3FKSmq1augrRjN/hHgTvy2CDHEzkMX/OQkrMG+Rc641ybuzkgt4GhndzUeaEMoFtuIRGvQS9a6aXKTa9BfHgThGb+qGISlFKcVlWSKKPw31nRbqVna+WBxtZC5NKz91b0TVDthHak2ELGVISt4WRkiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tOOzaQVY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tOOzaQVY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FC76C072AA;
	Wed, 17 Apr 2024 18:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713377356;
	bh=LsqwIAcZ9xcslbdJWJ70Q/boOMwoOC+KtWr2ruc17ho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tOOzaQVY7IKpmitflD7aGK/iY/ASXphAdImXLfa6QAfAbfMVwINXSPAO4cHn3UalV
	 R4uZmQYNu+egtGbtC+03z0Zw5QZWvjOhaDRl3VE+kleWvVZmzGUTHYD+NI7X7c4BT9
	 xYFA3wcq0D/EjBROFS/bqwyoSaxIXyXKNskkczk3+/4dtVUWzCeLZyNZhhHDV3XAgE
	 rd69uifcKflEwLSaU4/ruoGhRN2dWxW5tn0sK22l4k45dxB5y8/5c0FgluyfZMM1SU
	 AnOwzU6R2lO3HylDgmNFPqOhPYvSNjsEaXz4lNyWujAi54fdO4UiTb6+RMTG0qgew/
	 ERKLx3R0CxktQ==
Date: Wed, 17 Apr 2024 13:09:14 -0500
From: Rob Herring <robh@kernel.org>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-arm-kernel@lists.infradead.org,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [PATCH v2 02/11] dt-bindings: interrupt-controller: stm32-exti:
 Add irq mapping to parent
Message-ID: <171337733789.2907077.14650412956995048525.robh@kernel.org>
References: <20240216094758.916722-1-antonio.borneo@foss.st.com>
 <20240415134926.1254428-3-antonio.borneo@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240415134926.1254428-3-antonio.borneo@foss.st.com>


On Mon, 15 Apr 2024 15:49:17 +0200, Antonio Borneo wrote:
> The mapping of EXTI events to its parent interrupt controller is
> both SoC and instance dependent.
> The current implementation requires adding a new mapping table to
> the driver's code and a new compatible for each new EXTI instance.
> 
> Use the interrupts-extended property to list, for each EXTI event,
> the associated parent interrupt.
> 
> Co-developed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> ---
>  .../interrupt-controller/st,stm32-exti.yaml     | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

