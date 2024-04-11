Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC4236B08
	for <linux-kernel@vger.kernel.org>; Thu, 11 Apr 2024 22:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712872865; cv=none; b=C9Z0aC8FkRMM1tR9dOOlHmZtZaBRP7PeFG0h2y0flhd9oQgpBakwevGFN1Rxjk9ZV41WrWP3arHHq0tXEdhPcgCizFVanQSWlwJzCaUXiJApnhsaZoZwm045U/HK9DDoGXdliW6vsX9c6LBuUpTDKRCcQG5+MyrZ14tx6tfMXuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712872865; c=relaxed/simple;
	bh=W+FJ1/n3wnMkA0gdtJNGno77fQUp/W+T9iYB0DgVyjI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SK7IyaaofSgLoIysepNOxH/v/o/L9tn2G4ZF+JGfHQ9ArJ5qenjCtiQYuRjQA1d5LpF2d69qbZbVeC/oPYbWmWjOFEfIQdZnjYVzA0mYGoXpUDW/wNu0ZAdAT8/k7kpetdhlEyFieUl019GF4d+LxMtv/jucab/xZrSxY3NxTew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=QJTSL4jn; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=faHaHg3Y; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="QJTSL4jn";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="faHaHg3Y"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1712872859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W+FJ1/n3wnMkA0gdtJNGno77fQUp/W+T9iYB0DgVyjI=;
	b=QJTSL4jnpuauHOKWJPOyjcWV4FO6zXZehCPUrbqdAp958zGwoSF3197lucVF889UdOqURp
	EM6jmoLK4OI0Ijc5HUqF1dM8bS4wfD/IKxt9kItLbFW3d2/7gmPzIrYzRgzZgY6eQtcN0d
	vSNygraZEvh1eD2alITXemvCN6UvHaviki0IoDSVtMKoPmb66C02fs/oJvKBOQpnKzmrQ9
	Z7Z+vKuHONJqC9ncWCxUellMjiEIARAqITIx8s0AJ2meGcmJ+IMMq5YmYqzLObt8amAsAI
	cb6LV3zBxpvE62GJHoU8YZaxN8BNHpBNPk3Reet2aJ7Ed2G7DYuVpPLa9dldNQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1712872859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W+FJ1/n3wnMkA0gdtJNGno77fQUp/W+T9iYB0DgVyjI=;
	b=faHaHg3YhVVqs67kgrWO1Fo7d6lwmvv2lh0ORM9UmTDxJ90BXakgmxq1igDKHtTkWxyhd/
	0HqW75x5CLgXQoAw==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>, LKML
 <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>, John Stultz
 <jstultz@google.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar
 <mingo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Eric Biederman
 <ebiederm@xmission.com>, Oleg Nesterov <oleg@redhat.com>
Subject: Re: [patch V2 08/50] posix-cpu-timers: Save interval only for armed
 timers
In-Reply-To: <875xwougc9.fsf@somnus>
References: <20240410164558.316665885@linutronix.de>
 <20240410165551.442678509@linutronix.de> <875xwougc9.fsf@somnus>
Date: Fri, 12 Apr 2024 00:00:58 +0200
Message-ID: <8734rr1rvp.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Apr 11 2024 at 16:25, Anna-Maria Behnsen wrote:

> Thomas Gleixner <tglx@linutronix.de> writes:
>
>> There is no point to return the interval for timers which have been
>> disarmed.
>>
> common_timer_get() returns/updates interval unconditionally - so
> behavior then differs.

Good catch! We really want to make this consistent.
