Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE92614AD25;
	Mon,  1 Jul 2024 17:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719853473; cv=none; b=cqI59mlmR/DkmCM9ezN13l+jfuW1ng38DSMo4IysjJZdqWuJpQzHAYVZflrMFq3QbOJn4kGiGZ7vv/6uMYV3huRUX/GrTVn67c06/hCz4O78i92er2vFWSKLRyU4u0U75nL1xPbTivDFYdXUloQQ7j1fNhl/q1pDwjKRqx1pf2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719853473; c=relaxed/simple;
	bh=1ozzb/852acdo8maf7CK3uWvvUYvjaMR99Rgi2L1nMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MfL9D1kRlzuJGLtXX17j5ANJziImrG1jpUJPuCFwlD0N8WdqjyTt0EeVbXn8UhzFpDkV5hR05I4iuHNmRIVVGJuQ+ddSi3A/rYoocMWPZBCG6hSTai5Uh/zkvbZm1rCh9XF8UP9g4ORga2ZtY1cBt8VPlgv2yX3NXg2lx8Tqxjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kb38BPDg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kb38BPDg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D7C0C2BD10;
	Mon,  1 Jul 2024 17:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719853472;
	bh=1ozzb/852acdo8maf7CK3uWvvUYvjaMR99Rgi2L1nMk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kb38BPDg98IEiiykLogYdQog24ja1Ju1ivfXoaYRgwQ8XuDS81vqR3U+82FiqRQAC
	 314iwm2tUYzDDTsl+3LfuNVWtDBtORtzUpitm121ABb4bfIFmB8BPYxtiZBCTjerCQ
	 Tp3h0FXW1boa+NW5bSaxA+6faNxF2xNSaPDULORc/ULKlQwRLYuMQg8ggtC7tFPqyl
	 yG9A8d6mNfXazVLxvrnaEVQTeK1WYLmgJNuU3uY973oiidVV2RZcM3Q+luV/dsVj9f
	 xIslnBtOdmOFZ42JdhXIx5SHbnppLSuR6GFwU4wXVMysZx/OE5oW/PNSCJYpWhHFCH
	 nz3RAQVfWFxRw==
Date: Mon, 1 Jul 2024 11:04:31 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: sudeep.holla@arm.com, linux-kernel@vger.kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, cristian.marussi@arm.com,
	krzk+dt@kernel.org, Peng Fan <peng.fan@nxp.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RESEND] dt-bindings: firmware: arm,scmi: support system
 power protocol
Message-ID: <171985347002.119709.17589124239067617690.robh@kernel.org>
References: <20240628030309.1162012-1-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240628030309.1162012-1-peng.fan@oss.nxp.com>


On Fri, 28 Jun 2024 11:03:09 +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add SCMI System Power Protocol bindings, and the protocol id is 0x12.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  Documentation/devicetree/bindings/firmware/arm,scmi.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

