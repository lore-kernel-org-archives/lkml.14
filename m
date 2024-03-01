Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87C3C6BB21;
	Fri,  1 Mar 2024 10:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709288871; cv=none; b=lIFDUsTh4VMpCCUTmACMEnlXJ1a/SgvfcLw9GaKqOJVRVhF+KzwMHGEUVB5ZbUrAHf/5Io/IV8SjffGiuZJgZEnXiAu5If+wMe42n9ZWXRAGRY1DK3x5mbeKryMlIEq7ma/ACMC6Ns96knp2/KDvFtPmJvaMj1YRjQBtsdrzFrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709288871; c=relaxed/simple;
	bh=2ITffW4QOJpVXEcHYWvYxVYI6ZG2DSilFU7obOj8RY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e2WrFbAs81u2wG0pY83Vzcd9gnMrmbSSRm1mg4qIIfdlEROyTd2GUEoo8i28cqQ+EaGVy4f7T/1z83cDXUNpXS0/SJsbtJT6SogkQRGSGZwcjm4eM0nlnXP/C/Z25Yppz7NgwTnEV7HHOp0wTySgbEFnCbnpBzM+sqz028JW+H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00C5D1FB;
	Fri,  1 Mar 2024 02:28:27 -0800 (PST)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9B6223F762;
	Fri,  1 Mar 2024 02:27:46 -0800 (PST)
Date: Fri, 1 Mar 2024 10:27:44 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 2/5] firmware: arm_scmi: add initial support for i.MX BBM
 protocol
Message-ID: <ZeGtoJ7ztSe8Kg8R@bogus>
References: <20240202-imx95-bbm-misc-v1-0-3cb743020933@nxp.com>
 <20240202-imx95-bbm-misc-v1-2-3cb743020933@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240202-imx95-bbm-misc-v1-2-3cb743020933@nxp.com>

On Fri, Feb 02, 2024 at 02:34:40PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> The i.MX BBM protocol is for managing i.MX BBM module which provides
> RTC and BUTTON feature.

BBM as in NAND Bad Block Management ?

As mentioned elsewhere for other vendor protocol implementations,
please provide as much documentation on these extensions as possible.
Please use the SCMI spec as the reference to provide documentation
as I expected it to be versioned and all these needs to be documented
for maintenance of upstream support.

Also explain briefly why this needs to be vendor extension even if it is
obvious. I prefer that way.

-- 
Regards,
Sudeep
