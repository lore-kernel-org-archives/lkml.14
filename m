Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97E3747B;
	Fri, 29 Dec 2023 08:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id E478924E24F;
	Fri, 29 Dec 2023 16:33:15 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 29 Dec
 2023 16:33:15 +0800
Received: from [192.168.125.131] (183.27.96.32) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 29 Dec
 2023 16:33:15 +0800
Message-ID: <58c244d9-c754-420c-8c34-73dc09af0e72@starfivetech.com>
Date: Fri, 29 Dec 2023 16:30:38 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: ASoC: Add Cadence I2S controller for
 StarFive JH8100 SoC
To: Mark Brown <broonie@kernel.org>
CC: Conor Dooley <conor@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Claudiu Beznea <Claudiu.Beznea@microchip.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Walker Chen <walker.chen@starfivetech.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>
References: <20231221033223.73201-1-xingyu.wu@starfivetech.com>
 <20231221033223.73201-2-xingyu.wu@starfivetech.com>
 <20231221-saddlebag-tricolor-d02a17d66795@spud>
 <f1210b31-25af-4cbd-b73e-2a72aa6c41bf@sirena.org.uk>
 <11c932a8-5596-4186-9c9d-ec8ca5a6ea35@starfivetech.com>
 <229ffec0-3a8d-4ce8-a4bb-ef6ece639ad8@sirena.org.uk>
Content-Language: en-US
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <229ffec0-3a8d-4ce8-a4bb-ef6ece639ad8@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag

On 2023/12/22 21:03, Mark Brown wrote:
> On Fri, Dec 22, 2023 at 05:55:14PM +0800, Xingyu Wu wrote:
> 
>> The Cadence I2S can support 8 channels. But on the JH8100 SoC, two
>> instances of this just provide 4 channels to use, one just provides 2
>> channels, and the other one can provide 8 channels. Should I use the
>> property name of 'jh8100,i2s-max-channels' instead for some special
>> instances on the JH8100 SoC?
> 
> No, your current name is fine if the binding is generic for all Cadence
> users.  I do think it would be good to have a separate compatible for
> these two channel instances, if there's been one customisation there may
> well have been others.
> 
> Please fix your mail client to word wrap within paragraphs at something
> substantially less than 80 columns.  Doing this makes your messages much
> easier to read and reply to.

Great, thank you for your support.

Best regards,
Xingyu Wu
