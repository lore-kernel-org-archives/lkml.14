Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id C9D02B65D
	for <linux-kernel@vger.kernel.org>; Thu, 23 May 2024 16:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716481855; cv=none; b=USwXFSVKUk+bdcuzYiuCsVaoUr5EjNpJR4QQlnMF9hTsYY/sOF0OjAOWZ9uEOr8JwJwkqBMKTTHDT52h6NSMpOsbH7B3dQm5XMHOppkDUj+LGgpaKMGe1MOJUHuF3NHyMFOcLjzkHx4qfDt7S3Q3Q2B3qTCq+sFjec/4DFsftWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716481855; c=relaxed/simple;
	bh=zsvWlc1vONWVLufrWVoYcSWo8o0jgMR2VZPSYk4F15E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nmcVN5g+SUExkyfqkqC9uKoh4LP2gDMeRa8sZhSembPKnb5DZ+lpgqE2Sx7SSSKoCtQPMbBgVbOj/a7S3TFIz2HSSiM1dbsK7NlcMpm87LhJKZGDvQEaBVtXl+WZ5p1B76NLLSzW7C9vfINmg92UInl05O+uQyw41iON32HaVzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 543687 invoked by uid 1000); 23 May 2024 12:30:52 -0400
Date: Thu, 23 May 2024 12:30:52 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: shichao lai <shichaorai@gmail.com>
Cc: gregkh@linuxfoundation.org, oneukum@suse.com, linux-usb@vger.kernel.org,
  usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org,
  xingwei lee <xrivendell7@gmail.com>, yue sun <samsun1006219@gmail.com>
Subject: Re: [PATCHv2] Check whether divisor is non-zero before division
Message-ID: <eb995078-1923-43d5-a20f-9d4a7edee719@rowland.harvard.edu>
References: <20240523092608.874986-1-shichaorai@gmail.com>
 <a0afa88b-f84c-4b45-a265-2e6bcbb84b35@rowland.harvard.edu>
 <bb581989-4ac5-4ffe-9f80-01b5f993146f@rowland.harvard.edu>
 <CACjpba5iJ5dC=rB_Ckaqe4BKesrAN2VmsDCPZJ=frufNgA96Uw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACjpba5iJ5dC=rB_Ckaqe4BKesrAN2VmsDCPZJ=frufNgA96Uw@mail.gmail.com>

On Thu, May 23, 2024 at 11:13:08PM +0800, shichao lai wrote:
> Thanks for your comprehensive analysis.
> I added some pr_info() to check the workflow, and I found that the
> uzonesize was not initialized in fact!
> 
> The workflow is shown as below.
> Before alauda_read_data(), there are in fact many alauda_check_media(),
> but none of them enter the branch of alauda_init_media(), where
> uzonesize is set to nonzero value.
> The key branch condition is "status[0] & 0x08", which is always
> unsatisfied in this repro.
> 
> ```
> alauda_transport
>     alauda_check_media
>         if (status[0] & 0x08) // not satisfied
>             alauda_init_media()
>                 // initialize uzonesize
>     alauda_read_data
> ```

Good work!  So the problem is that the driver believes the status[0] & 
0x08 test.  

The way to fix this is to add an "initialized" flag to the alauda_info 
structure.  Then alauda_check_media() should call alauda_init_media() if 
the 0x08 bit is set in status[0] _or_ if info->initialized is 0.  And of 
course, alauda_check_media() should then set info->initialized to 1 if 
the alauda_init_media() call succeeds.

Would you like to write and test a patch that does this?

Alan Stern
