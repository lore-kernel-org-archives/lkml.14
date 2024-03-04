Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id C8034629FE
	for <linux-kernel@vger.kernel.org>; Mon,  4 Mar 2024 18:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709577038; cv=none; b=DfW9t08CwGJVFiXL8w83fAj+rkkBeumzYWyjGbjjTX+Zhk9wi6dlL2Pj3t63MgsvLus6BLNg4m8PT8mQHEELZZ98OPFNiBiB/owgTg8IH12gNA+smFENUtGwIyi0triD/RQ16kkDtv+LmVAlFniD2QDgZxrBLp7WGIn0ep31LRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709577038; c=relaxed/simple;
	bh=l327Ek1rRgFTLb2cxfeLPD9z9HIgRjSnb72Lw1JuUNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jp2wbCtPUw06FnCC+JKIYC58CDl4/6E9ThtuLUF1hWWSu6ui0O3MWpaAjx0NJSPvmUEzuvmcDzMgAgfD6AhppXIDhGf0oN+Yrq26I4gYNAZQVPTwXXaLokDVYW/zuWZg7lhINW5WW+H618dcTWK+YD2cZ7ky8Dx8TJY96mWlMYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 130228 invoked by uid 1000); 4 Mar 2024 13:30:35 -0500
Date: Mon, 4 Mar 2024 13:30:35 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Sam Sun <samsun1006219@gmail.com>, Tejun Heo <tj@kernel.org>,
  linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
  "xrivendell7@gmail.com" <xrivendell7@gmail.com>, hgajjar@de.adit-jv.com,
  quic_ugoswami@quicinc.com, stanley_chang@realtek.com,
  heikki.krogerus@linux.intel.com
Subject: Re: [Bug] INFO: task hung in hub_activate
Message-ID: <416a8311-c725-419a-8b22-74c80207347f@rowland.harvard.edu>
References: <CAEkJfYO6jRVC8Tfrd_R=cjO0hguhrV31fDPrLrNOOHocDkPoAA@mail.gmail.com>
 <e9d710fc-eace-44de-b3cc-1117c3575ef7@rowland.harvard.edu>
 <2024030428-graph-harmful-1597@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024030428-graph-harmful-1597@gregkh>

On Mon, Mar 04, 2024 at 05:36:19PM +0100, Greg KH wrote:
> On Mon, Mar 04, 2024 at 11:15:24AM -0500, Alan Stern wrote:
> > Third, this must be a generic problem.  It will occur any time a sysfs
> > attribute callback tries to lock its device while another process is
> > trying to unregister that device.
> > 
> > We faced this sort of problem some years ago when we were worrying
> > about "suicidal" attributes -- ones which would unregister their own
> > devices.  I don't remember what the fix was or how it worked.  But we
> > need something like it here.
> > 
> > Greg and Tejun, any ideas?  Is it possible somehow for an attribute file 
> > to be removed while its callback is still running?
> 
> Yes, it's a pain, and I hate it, but I think SCSI does this somehow for
> one of their attributes.  I don't remember how at the moment, and I
> can't look it up (am traveling), but this should be a good hint.

Are you thinking of the sysfs_break_active_protection() and 
sysfs_unbreak_active_protection() functions?  They seem to be the 
appropriate ones to use here.

Alan Stern
