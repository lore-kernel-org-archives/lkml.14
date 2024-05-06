Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED3F13D289;
	Mon,  6 May 2024 14:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715005557; cv=none; b=q3oIWrE2srGYB9gD1lap4S2u3eydfzjuwaWoO+f5tMiKeaTw80hYcKXbQzBA6u94NbOOmRjW8SnpeuPlgXk/c662akceoQR1L/s1LDknc1SK4DNqNHaLWQGAw0QWwv5Uy/+cMwJEV7aWEzoHSliM10tychy9IPoKmgMqYRnc0Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715005557; c=relaxed/simple;
	bh=EnQPE3FwCk5Ns+k1JljGSjyT4ERWWDmlzGdgIeUIZJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VgH6PtMUIxK2X5GCl99J1ZQ1rai33M823y7ZI2v7/D5PvqRDtbBCrj5TS8XCxELJv2DVfAC+qRZvVqVNJWvYY9Z1r/hURCG/dmaLH0Kq2Z4GD7lnFI1sls4Yjyn0n/f/v7sTlIG75ApSVvJVv/HO/tKKyw5DoRz0eMXgWGUk3aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HTQxxFHB; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HTQxxFHB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715005556; x=1746541556;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EnQPE3FwCk5Ns+k1JljGSjyT4ERWWDmlzGdgIeUIZJg=;
  b=HTQxxFHB7i062trcxj0lIbBlxlrYs2WhBsrDs5XG53C2F1yUGLlG7lI0
   oXjjRsS2FypCybNCabKleh4+p47b8fUlurmyyHC32Nbr7N6etbXCEzt2I
   sVjTpW1hQB5unDpmwwY1SEm6biQeR0nrk6G1b2fGb8gkksAvB3JF3pWm7
   IsTwj5BY44bJThVi++4ETmfDNR9GsWRfDArt+6+LNTZ2PKfqFpShDIC+M
   Wcaln9FIpIoEwTK27FuzaBXrqWg5lPsXcdHs+feF4zJWMtTL4qOUpF0Nj
   1DjoFSzTmZnQEF/MNmrWWlmQCiWOdALw+BzM3leVIm2qx9ImSb4iFJQ3p
   g==;
X-CSE-ConnectionGUID: bPDmbS/GSYWOtIrL/jcE7A==
X-CSE-MsgGUID: Tt60eOY+RHGwKIFCEAnslg==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="14534828"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; 
   d="scan'208";a="14534828"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 07:25:56 -0700
X-CSE-ConnectionGUID: CiJSTNs9R3Oi9MI8OGmVJA==
X-CSE-MsgGUID: 19i6sOY5RcK6PGp2uu2OEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; 
   d="scan'208";a="28182208"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 07:25:53 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s3zHq-00000004iso-3Ur8;
	Mon, 06 May 2024 17:25:50 +0300
Date: Mon, 6 May 2024 17:25:50 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	baojun.xu@ti.com
Subject: Re: [PATCH v1 1/1] ALSA: Correct the kernel object suffix of target
Message-ID: <Zjjobmw7UIv9LXim@smile.fi.intel.com>
References: <20240506085219.3403731-1-andriy.shevchenko@linux.intel.com>
 <878r0ngh9u.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878r0ngh9u.wl-tiwai@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, May 06, 2024 at 04:13:33PM +0200, Takashi Iwai wrote:
> On Mon, 06 May 2024 10:52:19 +0200,
> Andy Shevchenko wrote:
> > 
> > The correct suffix is 'y' for the kernel code and
> > 'objs' for the user space. Update documentation.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Applied now.  I added a suffix to the subject to indicate it's a
> documentation fix, too.

Thank you!

-- 
With Best Regards,
Andy Shevchenko


