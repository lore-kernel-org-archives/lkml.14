Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0556B52F60;
	Thu, 21 Dec 2023 15:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f0haTT01"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703173841; x=1734709841;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jEUQihnDzkmv8ekA6ouDy34WzKe2mVhUjC7xFNBQteY=;
  b=f0haTT017d9UJL1FLVBwJV/G0QmfjBus5/vtG1sU0c/WpAyu+N0tOxpd
   lBUUkDh+VthTe3qdhXgfl2TgMA/7Xpv2vnZEtB4wFc2iZ59m6+6T3NHBE
   4oXI5c7ePN3u2S0zHxwPewH4zTfV4NYUoRUK+EW32HIv2jhI4omidXdDH
   aidFkxovCd8WcKYtfETO47hR+Qb8b01C9CW94LStcalGJHjKSPzguD1LO
   UYp71AnVYIbKJPn7lWOxARZ7U4eBR3wGBZ/GijKTIs6AkH30ixqAnDz2j
   Fvt4PMeckXu2w3MHbfXdU6bn8VHZRE8dv3zV+ifUp11ZMRVxxtLlBfq5I
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="460327158"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="460327158"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 07:50:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="847150181"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="847150181"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 07:50:35 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rGLJg-00000007t2s-2P9L;
	Thu, 21 Dec 2023 17:50:32 +0200
Date: Thu, 21 Dec 2023 17:50:32 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: broonie@kernel.org, conor+dt@kernel.org, krzysztof.kozlowski@linaro.org,
	robh+dt@kernel.org, kevin-lu@ti.com, baojun.xu@ti.com,
	devicetree@vger.kernel.org, lgirdwood@gmail.com, perex@perex.cz,
	pierre-louis.bossart@linux.intel.com, 13916275206@139.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	liam.r.girdwood@intel.com, soyer@irl.hu, tiwai@suse.de,
	peeyush@ti.com, navada@ti.com
Subject: Re: [PATCH v2 1/5] ASoC: dt-bindings: remove tas2563 from yaml
Message-ID: <ZYReyHQxMAe-DKq4@smile.fi.intel.com>
References: <20231221101346.429-1-shenghao-ding@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231221101346.429-1-shenghao-ding@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Dec 21, 2023 at 06:13:41PM +0800, Shenghao Ding wrote:
> Remove tas2563 from tas2562, it will be supported in tas2781 to better
> support dsp mode.

DSP

Shouldn't this patch go after the actual change happen?
I don't know the answer myself, I would like to hear DT
people on this.


-- 
With Best Regards,
Andy Shevchenko


