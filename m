Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id D376F76C6A
	for <linux-kernel@vger.kernel.org>; Tue, 30 Jan 2024 17:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706634747; cv=none; b=WmYfiEvlh5YN7bXNgjT8DaMU2R5fhXaMi1PiQuhjQ8LZYLlHjHr/GA5+5wh1mJ9pwPvOeGo0Sc36Flg4XIxgYNCTIv5qil9UhT9SPa+0sOPY3ry5BdaDeUBgAcMR91ZOB9Mlnj/v3zSVOuhNH7C0I4TPl+nA+vIymxJy5m+kZuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706634747; c=relaxed/simple;
	bh=hR47GmGj2RdK1d7gKYDeYQwmG0DVJI+5y0VYDSSUr5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=heHxMyv983lW+L3FBS0ZXWbXtTRHwljxcTbjJkqjSWpyfFO3ghCiL16oVzpW5c0ucyTUHQwaaekMUWvIrVWoFAAftDD/r+Wy6K+D9qJ2p2BxvtmjIwtFGoFNai1WquW64EeoZppTQQZ24iyQv5x1YR8Frce8AswYSpTU3uoi1WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 410195 invoked by uid 1000); 30 Jan 2024 12:12:19 -0500
Date: Tue, 30 Jan 2024 12:12:19 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Guan-Yu Lin <guanyulin@google.com>
Cc: gregkh@linuxfoundation.org, mathias.nyman@intel.com, royluo@google.com,
  hadess@hadess.net, benjamin.tissoires@redhat.com,
  heikki.krogerus@linux.intel.com, oneukum@suse.com, grundler@chromium.org,
  yajun.deng@linux.dev, dianders@chromium.org, linux-kernel@vger.kernel.org,
  linux-usb@vger.kernel.org, badhri@google.com, albertccwang@google.com,
  pumahsu@google.com
Subject: Re: [PATCH] [RFC] usb: host: Allow userspace to control usb suspend
 flows
Message-ID: <0e4221b5-bafe-4bea-b533-0ed8add81ef1@rowland.harvard.edu>
References: <20240130064819.1362642-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240130064819.1362642-1-guanyulin@google.com>

On Tue, Jan 30, 2024 at 06:47:13AM +0000, Guan-Yu Lin wrote:
> In a system with sub-system engaged, the controllers are controlled by

What is a sub-system and how does it become engaged?

> both the main processor and the co-processor. Chances are when the main
> processor decides to suspend the USB device, the USB device might still
> be used by the co-processor. In this scenario, we need a way to let
> system know whether it can suspend the USB device or not. We introduce a
> new sysfs entry "deprecate_device_pm" to allow userspace to control the
> device power management functionality on demand. As the userspace should
> possess the information of both the main processor and the co-processor,
> it should be able to address the conflict mentioned above.

This description and the comments and documentation in the patch all
talk about "device power management".  But in fact the patch only
affects system power management; it does not affect runtime power
management.

Also, "deprecate_device_pm" does not seem like a very good name.
You're not deprecating power management; you're just disabling it
temporarily.  You should find a better name.

Do you really want your new flag to affect device suspend during
hibernation?  Does the co-processor remain powered when the system is
powered off and unplugged?

Do you really want the new sysfs flag to be present even on systems
that don't have a co-processor?

Why does this affect only the USB subsystem?  Can't the co-processor
use other, non-USB, devices on the system?

Alan Stern
