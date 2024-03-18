Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E48955766;
	Mon, 18 Mar 2024 17:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710784745; cv=none; b=r3dqBluepXgKgWB7Y1zgUgOu+DX8jILUcsITNc4kmKiP9P+ZGC5CU+ETrOpAQvPeJ65RrP+/Lwy3PmKILQzODq7f8yODoMeM8yBPU4iDOL8KMRBMiRJ4QotEaRZCTif0RbcOl1Rrl9f4hopBv2Cu3Tysoq4/9LdtRDM0OZfw3Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710784745; c=relaxed/simple;
	bh=1rbgafauMNzbfjSczN+XLRcsZLi0aEvPFIPHqSDsegI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B8LpVrvGVU/MEMOj3/98XMZLKTak4Wd95/0m04DdLzp5nieQXGDCNlXm/HKMPpI7fpknQ7p8zwwRhYUYnSlNDh7FsPFwM+uXf3b7fQJ6TofKdkmEBYR85FlOtncL3mXgnwyBgLUXqZKs2Cf1WUnAtPQpV934nQ3VgiIyJyRs9SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AIwQCEIM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AIwQCEIM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EE84C433C7;
	Mon, 18 Mar 2024 17:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1710784744;
	bh=1rbgafauMNzbfjSczN+XLRcsZLi0aEvPFIPHqSDsegI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AIwQCEIMEoXcAc4CLXdze6dD8Y8s/jnf0yIDVkDTP14aBUdBerlaNtuWCpzHxVAHN
	 RPUeDbRCdnDMCt+TWoDAcSE7iuVlvmcKmqZEGDJ2YmGlU0JK9XOCyfA23QPeI2sy0G
	 ozgNAJ3SRbn3Z25Yi/FLkSH7Gw0NvA3NIP9DdtZk=
Date: Mon, 18 Mar 2024 13:59:00 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: stable docs.kernel.org links?
Message-ID: <20240318-jumping-neon-vole-b02af3@lemur>
References: <20240318170309.GA1187959@bhelgaas>
 <87zfuvo32c.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87zfuvo32c.fsf@intel.com>

On Mon, Mar 18, 2024 at 07:35:55PM +0200, Jani Nikula wrote:
> This works, but I don't know if there are any guarantees that it keeps
> working:
> 
> https://www.kernel.org/doc/html/v6.8/core-api/genalloc.html

Also works as https://docs.kernel.org/6.8/core-api/genalloc.html

No guarantees beyond the usual "we did this on purpose and don't intend to break this." :)

-K
