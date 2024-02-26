Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E021E498;
	Mon, 26 Feb 2024 15:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708960358; cv=none; b=BCiQnBb1pydiIm9Uq9wc1KyA1W1robbD9IxyfzRgCgqQLH7gh7fYjKZ91/D/kyWjV8rRabaTcONCtreQr5DiofqV008q3klNF/pWkSzTk/r2JID/+qrygm6FX9jKfFaze5OLSE2gtw6/Tzdbaw6gwqKzVKa4ynoMG/daIanA6Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708960358; c=relaxed/simple;
	bh=p/wyrwKVlNK4WhB2eT+NE9IKehJPl+cCxb+H/wAZwrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bf29tEzQ5ncOoqZXxLXs8DQF6KDIg1fDqOrE+TvKk1pZ8b+A+hTS0vXEzI4qWPTFtvttMM256Uftm8l3IZwVd+vLZc03ZkCdn5FI7yunoGNOjCXZMvVOT3MR0jMMdvI0hUqMqhgSevJ4KhOcZIRRnLKlLS80WWdn2Dzisv5JmOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L3ndgiBa; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L3ndgiBa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708960357; x=1740496357;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=p/wyrwKVlNK4WhB2eT+NE9IKehJPl+cCxb+H/wAZwrk=;
  b=L3ndgiBaPGddz8OXMd599OmCi1ZrhlH1VocSMJ3JkaGWuMTRZXG36BJ9
   77ily0QnlaylS96D52r3g/8VcP4QSJnW4Pa0rDb3+xjldK4NlQt/nRSDe
   +NNNkmAl7KJn1wGvEiqY6o0v+WartlK6KrNbYKfzW3GwzZAgdsnOt9JTg
   mILKFcqq4ALMpyuukPkQOdlzhLPiyHxiCHhhIQ+988guLjonytehDu9fg
   E8YLWqpSDFZOqYaZSoXg1+B4azQhSTYielV+G3yGwanNWZhoKsHD+Z9rZ
   qs8HIAAfx6m4zj8txAlN/T0kehDL8Yw2RWgKyi/ZEQaDZmVlBFHlObOdY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="3107990"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="3107990"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 07:12:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="913875991"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="913875991"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 07:12:34 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1reced-00000007iFh-2zHT;
	Mon, 26 Feb 2024 17:12:31 +0200
Date: Mon, 26 Feb 2024 17:12:31 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <rmk+kernel@armlinux.org.uk>
Subject: Re: [PATCH v3] clkdev: Update clkdev id usage to allow for longer
 names
Message-ID: <ZdyqX_nMKVuTG2Gy@smile.fi.intel.com>
References: <20240223202556.2194021-1-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240223202556.2194021-1-michael.j.ruhl@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Feb 23, 2024 at 03:25:56PM -0500, Michael J. Ruhl wrote:
> clkdev DEV ID information is limited to an array of 20 bytes
> (MAX_DEV_ID).  It is possible that the ID could be longer than
> that.  If so, the lookup will fail because the "real ID" will
> not match the copied value.
> 
> For instance, generating a device name for the I2C Designware
> module using the PCI ID can result in a name of:
> 
> i2c_designware.39424
> 
> clkdev_create() will store:
> 
> i2c_designware.3942
> 
> The stored name is one off and will not match correctly during probe.
> 
> Increase the size of the ID to allow for a longer name.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


