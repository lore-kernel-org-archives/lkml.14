Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 6F8573D968
	for <linux-kernel@vger.kernel.org>; Thu, 11 Apr 2024 16:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712853011; cv=none; b=c6+KkrX3jRsO2GzB/1yBfvvqfuipbc8rbWxmzLdw4/0YbtY7YpB0QAjXTR0FmihETthQyuo8WggzhLkxssKLGQGiCllC8uBLulJ5lY5rG1SN+88AjK48B3SLgjo9sQQpDz69HyVjG97SMP5N4XhQjLK7KxY11OmzElpEufE91x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712853011; c=relaxed/simple;
	bh=OqFFjJsjtdY+SN6BBo/d83Hd1BfzuyDTm6JRlX7dhmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X4Puq3+SnkaGdSmFWc+mYqAIpzUibrvRnjMc2l295g+DUudbJi44Zn3bQSlm99pTrLdwVTO7Sc8Av5zxbPSW8FWhfS6QsKc7ikKfIncBL46A6LVe5vX9c99KKwnPMrhVIcAEXDt8zGFh+L9mRDkPNEgg3CYFQCbEjg7btlkCde8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 250765 invoked by uid 1000); 11 Apr 2024 12:30:08 -0400
Date: Thu, 11 Apr 2024 12:30:08 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Marcello Sylvester Bauer <sylv@sylv.io>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
  Marcello Sylvester Bauer <marcello.bauer@9elements.com>,
  Matthias Stoeckl <matthias.stoeckl@secunet.com>,
  Uwe Kleine-Koenig <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v1 1/2] usb: gadget: dummy_hcd: Switch to hrtimer
 transfer scheduler
Message-ID: <fde7fd49-e0c3-4371-b3c1-e0ba4f438229@rowland.harvard.edu>
References: <cover.1712843963.git.sylv@sylv.io>
 <57a1c2180ff74661600e010c234d1dbaba1d0d46.1712843963.git.sylv@sylv.io>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57a1c2180ff74661600e010c234d1dbaba1d0d46.1712843963.git.sylv@sylv.io>

On Thu, Apr 11, 2024 at 05:22:10PM +0200, Marcello Sylvester Bauer wrote:
> The dummy_hcd transfer scheduler assumes that the internal kernel timer
> frequency is set to 1000Hz to give a polling interval of 1ms. Reducing
> the timer frequency will result in an anti-proportional reduction in
> transfer performance. Switch to a hrtimer to decouple this association.
> 
> Signed-off-by: Marcello Sylvester Bauer <marcello.bauer@9elements.com>
> Signed-off-by: Marcello Sylvester Bauer <sylv@sylv.io>
> ---

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>
