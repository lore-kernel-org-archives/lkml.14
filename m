Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 7D94315EFA2
	for <linux-kernel@vger.kernel.org>; Wed, 24 Apr 2024 14:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713970722; cv=none; b=CHhMNvuQVo502uko6nhgVV2NMwEQ+NFgbZUbJgtoMkGl/gzSObFNDrmHlgWdnu9vPO3IrHqYFn/c7/vgjZiZgbsf5TufUqjzgvk72XH4pQCnAli1l2cc8tmD2bMClHyjuF5hJ3AeDs6dSVP07flgXQQDqD83kaDHKJ9Gouw6PYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713970722; c=relaxed/simple;
	bh=ke0g6uownmljC0XA5VR2r33zqHWAonjQKaaVhUfRp9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=luNjRnorIwmV2waEnfvHJkdJ9XmSXbEp1KSy5/MCER3bCo799WfSE9iY+Z6wH/yomzbuMPZ/f35K8pRQkBmOB7uvnhxjdsltPOkkER/XME7FXVpq2oramS/TNQ5PaQfGXuVvWxfsC347HgEBYuLUU+f6DfC5yzrVH41rkORHyss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 453580 invoked by uid 1000); 24 Apr 2024 10:58:40 -0400
Date: Wed, 24 Apr 2024 10:58:40 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Norihiko Hama <Norihiko.Hama@alpsalpine.com>
Cc: gregkh@linuxfoundation.org, corbet@lwn.net, linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
  usb-storage@lists.one-eyed-alien.net
Subject: Re: [PATCH v4] usb-storage: Optimize scan delay more precisely
Message-ID: <515c273c-9bb0-4830-a3a5-e9a485356434@rowland.harvard.edu>
References: <20240424013134.17307-1-Norihiko.Hama@alpsalpine.com>
 <c06aaaa1-a2af-47c6-a615-602f2c70de86@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c06aaaa1-a2af-47c6-a615-602f2c70de86@rowland.harvard.edu>

On Wed, Apr 24, 2024 at 10:51:57AM -0400, Alan Stern wrote:
> On Wed, Apr 24, 2024 at 10:31:34AM +0900, Norihiko Hama wrote:
> > +			Example:
> > +				delay_use=2.567
> 
> This could go on the previous line.
> 
> 			Example:  delay_use = 2.567

Oops, this shouldn't have the extra spaces around the '=' sign.

			Example:  delay_use=2.567

Alan Stern
