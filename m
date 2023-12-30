Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA05C8F5C;
	Sat, 30 Dec 2023 15:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1rJacG-0004OZ-00; Sat, 30 Dec 2023 15:47:08 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 3DD4EC0A5A; Sat, 30 Dec 2023 15:45:45 +0100 (CET)
Date: Sat, 30 Dec 2023 15:45:45 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] MIPS: Remove unused shadow GPR support from vector
 irq setup
Message-ID: <ZZAtGYY89SrffYBQ@alpha.franken.de>
References: <20231221125405.229100-1-tsbogend@alpha.franken.de>
 <20231221125405.229100-2-tsbogend@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231221125405.229100-2-tsbogend@alpha.franken.de>

On Thu, Dec 21, 2023 at 01:54:04PM +0100, Thomas Bogendoerfer wrote:
> Using shadow GPRs for vectored interrupts has never been used,
> time to remove it.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  arch/mips/kernel/traps.c | 94 +++++++++++++---------------------------
>  1 file changed, 30 insertions(+), 64 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
