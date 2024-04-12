Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DABE18633
	for <linux-kernel@vger.kernel.org>; Fri, 12 Apr 2024 04:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712895447; cv=none; b=Y6CnodVtfXAeKc09f13umEwLdEaIpzhFm2icdDwi7crHP1DVMirOXKWMIW+ZbMlzYDQVXV/6hxXtO2LtSLJa1prtBHuZ73rSJYhZacyXdH41S/p+0Vi3QjFQQx0wEQJu615WvL0I7GotyGYwLxRC/7s10LE8ZsF4SSHms4NvJwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712895447; c=relaxed/simple;
	bh=g28bGrM54so83tuq2ucH1HsXbdYucezVmfu+9i1+pKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ExTxRAsZ4bn7cwUgVOsjrqxOsD4Jg3JdnW0uFSf7rMN+UJ9zSQr2Xqp8JapU6Y2cEHx4QOx9dICAiaWSp2ZAVlBPLOa8krJj7prCbG6SS5Myu8gMxDVw4XyGN9JOOHv2ZkDQOuWgzT5rM7lnelBFSSowzwjSeoqT+kW1pCx0qYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PkZQvqf/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PkZQvqf/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65964C2BD10;
	Fri, 12 Apr 2024 04:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712895447;
	bh=g28bGrM54so83tuq2ucH1HsXbdYucezVmfu+9i1+pKo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PkZQvqf/cKXPoeVh7TOPpgxhOhlq4ngUJCvkHpyQn9JV75DvCvzJNHBGrIYohoQzt
	 GwNcJTxglhWNqbynG807WY5/cp7d3x57WaGQqU8LbdwMuC8bORIKG4jMYrSMWbAdGn
	 V9+DNjuCiq+1V0E2WWH/+omCXgTPZyozoU+uVSB5QPBMUsGm0uLKfYAhNDXncoCs+g
	 SRfTbYV1xcFzFHIaRwvnxXlLBDhua92rVmMJtmcjzzqdqBPaowNuzOgYYkasqx81q2
	 z0Md2usDc4HORzfirrOFFsO1HV8KCIdq3cpKJvF1OmubI9lKrOGhR3L0/Ewutwiu1g
	 5fUqehNP9VN5w==
Date: Thu, 11 Apr 2024 21:17:24 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Daniel Sneddon <daniel.sneddon@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alexandre Chartre <alexandre.chartre@oracle.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sean Christopherson <seanjc@google.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Nikolay Borisov <nik.borisov@suse.com>,
	KP Singh <kpsingh@kernel.org>, Waiman Long <longman@redhat.com>,
	Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 5/7] x86/bugs: Only harden syscalls when needed
Message-ID: <20240412041724.gx6jtx7tpz2c7gbe@treble>
References: <cover.1712813475.git.jpoimboe@kernel.org>
 <97befd7c1e008797734dee05181c49056ff6de57.1712813475.git.jpoimboe@kernel.org>
 <20240412001522.3zp2mzked4ksglkl@desk>
 <20240412035740.ojgvlqahqlm2umsx@treble>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240412035740.ojgvlqahqlm2umsx@treble>

On Thu, Apr 11, 2024 at 08:57:42PM -0700, Josh Poimboeuf wrote:
> For similar reasons I'm thinking we should also remove the non-eIBRS
> version (SPECTRE_V2_LFENCE).

Actually I guess that's still the default mitigation for AMD so I'll
leave that one in.

-- 
Josh
