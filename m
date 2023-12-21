Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A19EC5823E;
	Thu, 21 Dec 2023 16:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1rGMKH-0003he-00; Thu, 21 Dec 2023 17:55:13 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 5E137C028A; Thu, 21 Dec 2023 17:55:02 +0100 (CET)
Date: Thu, 21 Dec 2023 17:55:02 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Paul Burton <paulburton@kernel.org>, linux-mips@vger.kernel.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v5 00/22] Add support for the Mobileye EyeQ5 SoC
Message-ID: <ZYRt5rghFn6s4NsM@alpha.franken.de>
References: <20231212163459.1923041-1-gregory.clement@bootlin.com>
 <878r5vctdg.fsf@BL-laptop>
 <ZYNhbQjMbAH6I0kI@alpha.franken.de>
 <87frzwasxo.fsf@BL-laptop>
 <ZYRR7zIZax7yUgsZ@alpha.franken.de>
 <87a5q3bmr9.fsf@BL-laptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a5q3bmr9.fsf@BL-laptop>

On Thu, Dec 21, 2023 at 04:26:02PM +0100, Gregory CLEMENT wrote:
> Thomas Bogendoerfer <tsbogend@alpha.franken.de> writes:
> But in arch/mips/generic/Platform we have:
> 
> load-$(CONFIG_MIPS_GENERIC)    += 0xffffffff80100000
> 
> So, the load address is defined during compilation; for example, I don't
> think there is such a mechanism currently for ARM. hat's what I mean by
> 'relocatable,' but perhaps it's not exactly what you have in mind.

but that's not used, when you have your own Platform file. See
arch/mips/Kbuild.platforms.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
