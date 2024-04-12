Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58413148FFC
	for <linux-kernel@vger.kernel.org>; Fri, 12 Apr 2024 16:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712939023; cv=none; b=RSYcec7ToVUJx5GnFGYL0AU0tgEAnt54pHM/zzAFz4eh25Tc8BdSKyt1kjyq5R28DE69kIwiuQpla6b5kQzsYSuKAs5GlpG7GHtfVM/2/vbCPRqSOyxMa6r/3cM+udz5Ze8X8g3Gt5AiXekbWFg1wUmrrW3PtenPY2sMywUPAkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712939023; c=relaxed/simple;
	bh=64X3LLbSaCOSlnkxg3lTMOHA/8UyVzC0UufYmcg9tF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rSsxg7yJ8w6QrGqglVMGRqt2LEJFBkU8YG+57y2duwtLkp3c8oR0rf0BIpHuw/X0sIlrPscJr+fnBLzs8xJX46lDjKArSKUhhtw3v//qYD7YypE09EZ0iOFmhiI7RKjnNfx3IcAi+bXKvKeSueCpcJXqBt5igbByM+zkU6UE3Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D940F339;
	Fri, 12 Apr 2024 09:24:10 -0700 (PDT)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E87CF3F64C;
	Fri, 12 Apr 2024 09:23:38 -0700 (PDT)
Date: Fri, 12 Apr 2024 17:23:36 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Babu Moger <Babu.Moger@amd.com>
Cc: James Morse <james.morse@arm.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, Fenghua Yu <fenghua.yu@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	H Peter Anvin <hpa@zytor.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	shameerali.kolothum.thodi@huawei.com,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	carl@os.amperecomputing.com, lcherian@marvell.com,
	bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
	baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
	Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
	dfustini@baylibre.com, amitsinght@marvell.com,
	David Hildenbrand <david@redhat.com>,
	Rex Nie <rex.nie@jaguarmicro.com>
Subject: Re: [PATCH v1 29/31] fs/resctrl: Add boiler plate for external
 resctrl code
Message-ID: <ZhlgCIhEqdTCS6pW@e133380.arm.com>
References: <20240321165106.31602-1-james.morse@arm.com>
 <20240321165106.31602-30-james.morse@arm.com>
 <fb4abe11-5859-4a53-a4db-bb4e59a571c6@intel.com>
 <ZhfzObobGI/p9ISP@e133380.arm.com>
 <23afb7ff-222f-40d0-a68e-3d7b0c3df55d@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23afb7ff-222f-40d0-a68e-3d7b0c3df55d@intel.com>

Hi Babu,

[see below]

On Thu, Apr 11, 2024 at 10:42:48AM -0700, Reinette Chatre wrote:
> Hi Dave,
> 
> On 4/11/2024 7:27 AM, Dave Martin wrote:
> > On Mon, Apr 08, 2024 at 08:41:04PM -0700, Reinette Chatre wrote:
> >> Hi James,
> >>
> >> On 3/21/2024 9:51 AM, James Morse wrote:
> >>> Add Makefile and Kconfig for fs/resctrl. Add ARCH_HAS_CPU_RESCTRL
> >>> for the common parts of the resctrl interface and make X86_CPU_RESCTRL
> >>> depend on this.
> >>>
> >>> Signed-off-by: James Morse <james.morse@arm.com>

[...]

> >>> diff --git a/fs/resctrl/Kconfig b/fs/resctrl/Kconfig
> >>> new file mode 100644
> >>> index 000000000000..36a1ddbe6c21
> >>> --- /dev/null
> >>> +++ b/fs/resctrl/Kconfig
> >>
> >> Could you please review the contents of this file for
> >> appropriate line length and consistent tab usage?
> > 
> > Noted.
> > 
> >>> @@ -0,0 +1,23 @@
> >>> +config RESCTRL_FS
> >>> +	bool "CPU Resource Control Filesystem (resctrl)"
> >>> +	depends on ARCH_HAS_CPU_RESCTRL
> >>> +	select KERNFS
> >>> +	select PROC_CPU_RESCTRL               if PROC_FS
> >>> +	help
> >>> +	  Resctrl is a filesystem interface
> >>> +	  to control allocation and
> >>> +	  monitoring of system resources
> >>> +	  used by the CPUs.
> > 
> > (Not quite a haiku, but I don't know how many syllables "resctrl"
> > counts as...)
> > 
> > Since this is the Kconfig user's primary knob for enabling resctrl,
> > maybe flesh this out and make it a bit more generic and newbie-friendly?
> > Something like:
> > 
> > 	  Some architectures provide hardware facilities to group tasks and
> > 	  monitor and control their usage of memory system resources such as
> > 	  caches and memory bandwidth.  Examples of such facilities include
> > 	  Intel's Resource Director Technology (Intel(R) RDT) and AMD's
> > 	  Platform Quality of Service (AMD QoS).
> 
> Nit: We should double check with AMD how they want to refer to their
> feature. Their contribution to the resctrl docs used the term you provide
> but their spec uses PQOS.

Babu, do you have a view on this?

Initially I just pasted this across from the existing text in
resctrl.rst and arch/x86/Kconfig.

Looking at the AMD's spec though, I'd probably follow Reinette's
suggestion and go for:

	[...] AMD's Platform Quality of Service (PQOS)

but I'm happy to take your recommendation if you think AMD would prefer
different text here.

Cheers
---Dave
