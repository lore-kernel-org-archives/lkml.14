Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338B02375B;
	Thu,  4 Jan 2024 14:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="ozXQIbL7"
Received: from localhost (unknown [IPv6:2601:280:5e00:7e19::646])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 5509A736;
	Thu,  4 Jan 2024 14:59:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5509A736
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1704380356; bh=zE8trZHBrNElb2KpwEMAkQtL13NFiH44pG8CqyNTtl4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ozXQIbL7PFlidCFD//xZ7XMgiebPtf99JvCij/kZBtmvb1k1Z3EE2HUmR0xJVGe+q
	 9vDNhXDis91x+ycXrbXhU98fMj4/BnLD4mbec3vydC+eA9ohSp5nwTfsGS26B4mGo4
	 P4EaECHZsBlLVpFYaCTusBO8WxPzoqOYzr4JX2oFK1T/iRB6PZpKgjaYs9pp6ljYqX
	 wIfYB6x9EppO0E9IIwn2T2pwnUDQoWt4AyYzidRGFhT3WjGJ8gloijWgZZuoU+M97J
	 ImUtnPYpsIA+7wuj10INdJOOHIQCI5UwXHAEBjgXxGcIMrb+ObKfZqAAnkXU+XsKyY
	 I1SQL7v3nAO3w==
From: Jonathan Corbet <corbet@lwn.net>
To: Jani Nikula <jani.nikula@linux.intel.com>, Randy Dunlap
 <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org, Mauro Carvalho
 Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] scripts/get_abi.pl: ignore some temp files
In-Reply-To: <87v889z7h3.fsf@intel.com>
References: <20231228233113.5218-1-rdunlap@infradead.org>
 <87plyi86zg.fsf@meer.lwn.net> <87v889z7h3.fsf@intel.com>
Date: Thu, 04 Jan 2024 07:59:15 -0700
Message-ID: <871qax6t6k.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jani Nikula <jani.nikula@linux.intel.com> writes:

> On Wed, 03 Jan 2024, Jonathan Corbet <corbet@lwn.net> wrote:
>> It would have been nice to create all of those files with a .abi
>> extension so we didn't have to do this kind of blocklisting, but so be
>> it.
>
> Alternatively, we could switch to yaml instead of using another homebrew
> format with another homebrew parser, and rename them .yaml.

But ... we didn't invent that! :)

That is, of course, a better idea.  It would be a good project for
somebody.

Thanks,

jon
