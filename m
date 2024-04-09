Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D75BB12DDA7;
	Tue,  9 Apr 2024 12:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712667154; cv=none; b=XQhlpjiMJIgBWWDWcfvNOmtZYtMTALLDr52FRHClYGPhYXE4L48HNxi2rpbB8Y1XZMyEkKFgdD8WahdRvYuGp/D7gocyCxXRHv7peKoCyLp5eYrGuHbik3G5MfWarKfCbZKBh0FtlnnZcUTRmgwmXx4adVNW3zykduroQImvFFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712667154; c=relaxed/simple;
	bh=pAdz7cQhfGznm7umSll9NW7JRcSZF77NwVghKKYKusw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oALtNTyDJwQQ1QNv/NQ/vGEuv5p0TKJJtfObkC+ld4MxPN/BRbBZQNJI9xsaC7A0nH91S7OQZz08TdejVJS8/ks7s/NxrDCFux0E6Px1rNdp1Ek7nkyXD8ED3q6O0xg6ncRHSN0CcQ0Z3OK9swzc+1RAVefDRvWaRLliP0wmyQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 578D1139F;
	Tue,  9 Apr 2024 05:53:02 -0700 (PDT)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E37D3F766;
	Tue,  9 Apr 2024 05:52:30 -0700 (PDT)
Date: Tue, 9 Apr 2024 13:52:27 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/6] firmware: arm_scmi: add initial support for i.MX
 BBM protocol
Message-ID: <ZhU6C2Ovh7xxeREP@bogus>
References: <20240405-imx95-bbm-misc-v2-v2-0-9fc9186856c2@nxp.com>
 <20240405-imx95-bbm-misc-v2-v2-3-9fc9186856c2@nxp.com>
 <ZhQxu8LVNKf5QDLm@pluto>
 <ZhUDZGJilhczKlDD@bogus>
 <DU0PR04MB94175384AD9113AC6F60546588072@DU0PR04MB9417.eurprd04.prod.outlook.com>
 <ZhUdQ6M0GkL0do_l@bogus>
 <AS1PR04MB9431F99D49D6A777B09814FB88072@AS1PR04MB9431.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS1PR04MB9431F99D49D6A777B09814FB88072@AS1PR04MB9431.eurprd04.prod.outlook.com>

On Tue, Apr 09, 2024 at 11:19:31AM +0000, Peng Fan wrote:
>
> ok, will add more comment in the patch for the commands.
>

No I meant add document/description similar to SCMI spec for each of these
commands. Not just one line comment. For std protocols, we can refer spec,
for these vendor protocols, just one like comment will not suffice. Describe
in more details and hence the request for separate TXT file for that.
Hope that is clear now, I have mentioned it several times already.

--
Regards,
Sudeep
