Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C8220DC9
	for <linux-kernel@vger.kernel.org>; Wed, 17 Jan 2024 15:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705503710; cv=none; b=OU39kPFyv8lZWO5YH13lZKARP2EOWtv+wtuAViRgWAb12W0f+viWdGHhzVhkqYGwg06A6tEDAAqrNOrNFB7m9b3LhtdeVR11DqfghRuhvBV6qZ9lv+xkTH/Swv4on6kYtVCd08G8UJpTCM7FgnCkSeFLbXer4uz+A1K5NlaLuc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705503710; c=relaxed/simple;
	bh=RfUJH2v3w6+VOAvYElJdNIPFyq4YLRuWSvqqrp7qYMk=;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To; b=o3TdsTtpn2FwQ9lVjHk9LM6NpXENyW2F5VvThXtP5EhqSf0kv2m4lmm6QIYK+Q6otZ8+H51fOUdSLvFqbaAiwU1EvxFaWHl3FsKzwubpcKk+tCB+FaYXkRWOo/BoZFhRxwsJfHrwNuLnnY4etDkfmO2J4CzeVPN3c0/5aW8+dro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KkRLHTO6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KkRLHTO6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8E27C433C7;
	Wed, 17 Jan 2024 15:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705503710;
	bh=RfUJH2v3w6+VOAvYElJdNIPFyq4YLRuWSvqqrp7qYMk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KkRLHTO69lZT00OU/q0fndB1HqyUJgJ4Q+7fsTe2jd7tTIwa2M0U+B9xuxBOr5JzP
	 vDNaNEZB0oCI4OFxH8iYhYqnS3gP9bDQZuo1klGg3aJOsRYOsysGngZj5FSBZ7YwU1
	 Lwvjpb6gar14JqpKvSqTWb9Zz4Mo8lXp/hyMlVdEzRI6CwomLEzmVpk3VszpZC9ury
	 xtR6MoyZfGhKLr4h5SG2QSCMauaBkfjivjccgiH/G2XlHsYrUX1t3GtUK00QRlkcnJ
	 oUEsFVXXrtjwdGNDSJoNPNK5JnOegE/HHVpbpD8QIazS/VGcRJk/BYkiDrPevoPYAv
	 rkjqyaukt3WIg==
Date: Wed, 17 Jan 2024 16:01:47 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
	John Stultz <jstultz@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Eric Dumazet <edumazet@google.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Arjan van de Ven <arjan@infradead.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Rik van Riel <riel@surriel.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sebastian Siewior <bigeasy@linutronix.de>,
	Giovanni Gherdovich <ggherdovich@suse.cz>,
	Lukasz Luba <lukasz.luba@arm.com>,
	"Gautham R . Shenoy" <gautham.shenoy@amd.com>,
	Srinivas Pandruvada <srinivas.pandruvada@intel.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>
Subject: Re: [PATCH v10 01/20] timers: Restructure get_next_timer_interrupt()
Message-ID: <Zafr2_1Z9h_xov2J@localhost.localdomain>
References: <20240115143743.27827-1-anna-maria@linutronix.de>
 <20240115143743.27827-2-anna-maria@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240115143743.27827-2-anna-maria@linutronix.de>

Le Mon, Jan 15, 2024 at 03:37:24PM +0100, Anna-Maria Behnsen a écrit :
> get_next_timer_interrupt() contains two parts for the next timer interrupt
> calculation. Those two parts are separated by forwarding the base
> clock. But the second part does not depend on the forwarded base
> clock.
> 
> Therefore restructure get_next_timer_interrupt() to keep things together
> which belong together.
> 
> No functional change.
> 
> Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>

Reviewed-by: Frederic Weisbecker <frederic@kernel.org>
