Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CB4617985;
	Fri, 22 Dec 2023 12:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1rGeVb-00051K-00; Fri, 22 Dec 2023 13:20:07 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 4C21EC0A2B; Fri, 22 Dec 2023 13:19:25 +0100 (CET)
Date: Fri, 22 Dec 2023 13:19:25 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	gregory.clement@bootlin.com, vladimir.kondratiev@intel.com
Subject: Re: [PATCH v2 07/10] MIPS: traps: Handle CPU with non standard vint
 offset
Message-ID: <ZYV+zdm4fjYgATVW@alpha.franken.de>
References: <20231027221106.405666-1-jiaxun.yang@flygoat.com>
 <20231027221106.405666-8-jiaxun.yang@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231027221106.405666-8-jiaxun.yang@flygoat.com>

On Fri, Oct 27, 2023 at 11:11:03PM +0100, Jiaxun Yang wrote:
> Some BMIPS cpus has none standard start offset for vector interrupts.
> 
> Handle those CPUs in vector size calculation and handler setup process.

hmm, I see no connection to what this series is fixing. How does it
work without this patch ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
