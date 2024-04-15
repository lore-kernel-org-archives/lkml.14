Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AD028DD0;
	Mon, 15 Apr 2024 07:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713167513; cv=none; b=RSCgoQnUEzqDHPdgIYcGDguwlaNsXQNcnJQDjDgDlxa7J/NRG8NZAd+YfbG2RuWBj/q+g7tM14YR7kQVpF+YkqeRp/b6w346pby+2JInHJu20+V84RmA9SCpXGT8J8ZOUyX/bzRMLF9t2It+GvhoQbGFsmihFnTCdR/uNsiPqaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713167513; c=relaxed/simple;
	bh=UsM8a13Gnro1FM5BAtfiLfKvuFi5qmz03DjUXodqKQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JZUv4edk4K2wHa07rMT4f6Cyhy5CX94cJjJKtX6G8sdoE5advM5wFqC+qEF/rgpfBLn2ZJiqn8r8Cy/JDgPS23DpxTmrPqs2bMlgNuLXkS9gMp7GxE87j1ZOsOz+AcpMGauNuZHphafuqd1rhqOmgb95fx6KXOYzDRLMqkXA5uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JvZsR0xB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JvZsR0xB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36E26C113CC;
	Mon, 15 Apr 2024 07:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713167513;
	bh=UsM8a13Gnro1FM5BAtfiLfKvuFi5qmz03DjUXodqKQg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JvZsR0xBA47iQH91+CEK6z51vdvMDxZsUvSJS0efpOUG6c/6aCflLDBk4Wk3mgxW9
	 wU4xMYmvHWBIa17T2UKpilS1hvYWl3/9NnkeW0yqwv5pvnb6/DYOTkjgEvQbplxHUY
	 2YsgcP6M7ugUmaZFfVZg2YLiYv2BmwbUC4ggRNLRYqnuihdQ5JBz7Cf86Ed2EwuRjd
	 Jn0eNQWXT0obwFTGzSt7p8rjhGgsmgStdCX8DFZd3NibYKmYOyov51uSLwvS6KjMWk
	 FvT1KzM03/WuuFVuiEA+nM0Ja4bPym7cKWSeSEpqgcXRSiYXWxYlmdYnMrzBmCRbWp
	 Zcltm1gRypFWg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1rwH82-000000005Rh-42ua;
	Mon, 15 Apr 2024 09:51:51 +0200
Date: Mon, 15 Apr 2024 09:51:50 +0200
From: Johan Hovold <johan@kernel.org>
To: bolan wang <bolan.wang@fibocom.com>, Lars Melin <larsm17@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] USB: serial: option: add Fibocom FM135-GL variants
Message-ID: <ZhzcluUcwvi-VrC6@hovoldconsulting.com>
References: <20240306110339.1353496-1-bolan.wang@fibocom.com>
 <ZhzbjokBKaPg6Lww@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZhzbjokBKaPg6Lww@hovoldconsulting.com>

On Mon, Apr 15, 2024 at 09:47:27AM +0200, Johan Hovold wrote:
> On Wed, Mar 06, 2024 at 07:03:39PM +0800, bolan wang wrote:
> > Update the USB serial option driver support for the Fibocom
> > FM135-GL LTE modules.
> > - VID:PID 2cb7:0115, FM135-GL for laptop debug M.2 cards(with MBIM
> > interface for /Linux/Chrome OS)
> > 
> > 0x0115: mbim, diag, at, pipe
> 
> > Signed-off-by: bolan wang <bolan.wang@fibocom.com>
> 
> Patch looks good, now applied.

And thanks for your help reviewing this one too, Lars.

Johan
