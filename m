Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21BDD55E5F;
	Thu, 21 Dec 2023 15:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1rGLC9-0002qk-00; Thu, 21 Dec 2023 16:42:45 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id E556EC028A; Thu, 21 Dec 2023 16:42:30 +0100 (CET)
Date: Thu, 21 Dec 2023 16:42:30 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	gregory.clement@bootlin.com, vladimir.kondratiev@intel.com
Subject: Re: [PATCH v2 02/10] MIPS: spaces: Define a couple of handy macros
Message-ID: <ZYRc5guD3PSldr24@alpha.franken.de>
References: <20231027221106.405666-1-jiaxun.yang@flygoat.com>
 <20231027221106.405666-3-jiaxun.yang@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231027221106.405666-3-jiaxun.yang@flygoat.com>

On Fri, Oct 27, 2023 at 11:10:58PM +0100, Jiaxun Yang wrote:
> KSEGX_SIZE is defined to size of each KSEG segment.
> 
> TO_CAC and TO_UNCAC are brought to 32bit builds as well,
> TO_PHYS remains to be 64bit only as we want people to
> use __pa to avoid mixup compat address space.

the problem here is, that in the 64bit case the macros work on every address
while in 32bit only the first 512MB address space is covered. So there
is a reason to not expose TO_CAC/TO_UNCAC for 32bit.

Which leaves the problem how to handle all the CKSEG[01]ADDR()
cases nicer for 64bit... I'd prefer an extra macro/inline function
which handles 32bit and 64bit accordingly. Not sure about the name
for it, but maybe something like

CKSEG[01]ADDR_OR_64BIT()

That would at least make clear (to me) this thing is special and might
return a XPHYS uncached address.

Thomas. 

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
