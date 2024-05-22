Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86860149E0F
	for <linux-kernel@vger.kernel.org>; Wed, 22 May 2024 23:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716420509; cv=none; b=NiZsib/CasZC6yQE58udoYDF47xDF6UmU1OAPxFqXKOe/as+YJmTNXsbUvt5ZPu0MHvGWOSGGTsN8OY3S2eKFA6fF5O5angLgtf/rNCVlTRdQejysF/qnmZdmRu0enenOYD1IXwfiy8p8a3zewQ0m9aJVcOd/4JPJdrfNlsPoog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716420509; c=relaxed/simple;
	bh=XuI9+/6ucJCdq4IO/jy84dizsrQLccnzPHLmR5KF+oE=;
	h=Message-ID:Date:From:To:Cc:Subject; b=KI9CDreGmPk7S5mkYZuMLgqsOm1qQ6LplGmVz+fUSLqbmoFGwKKaaRcvXyRTSExeXI5csJ8afFMj7j/sa2p9m+H0oG2O5Rq6SJuWYnpAwA8tvQoopy3JEzx7nN32wsICni8jcT0hbKpRnDFwLgBuewmacjoZRe5YAvc6o7dMzO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28181C2BBFC;
	Wed, 22 May 2024 23:28:29 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.97)
	(envelope-from <rostedt@goodmis.org>)
	id 1s9vOS-00000006Qgy-3cTP;
	Wed, 22 May 2024 19:29:12 -0400
Message-ID: <20240522232851.522913754@goodmis.org>
User-Agent: quilt/0.68
Date: Wed, 22 May 2024 19:28:51 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-linus][PATCH 0/4] tracing: Small last minute fixes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>


tracing: Minor last minute fixes

- Fix a very tight race between the ring buffer readers and resizing
  the ring buffer.

- Correct some stale comments in the ring buffer code.

- Fix kernel-doc in the rv code.

- Add a MODULE_DESCRIPTION to preemptirq_delay_test

  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace/urgent

Head SHA1: 1e8b7b3dbb3103d577a586ca72bc329f7b67120b


Jeff Johnson (1):
      tracing: Add MODULE_DESCRIPTION() to preemptirq_delay_test

Petr Pavlu (2):
      ring-buffer: Correct stale comments related to non-consuming readers
      ring-buffer: Fix a race between readers and resize checks

Yang Li (1):
      rv: Update rv_en(dis)able_monitor doc to match kernel-doc

----
 kernel/trace/preemptirq_delay_test.c |  1 +
 kernel/trace/ring_buffer.c           | 25 ++++++++++++-------------
 kernel/trace/rv/rv.c                 |  2 ++
 3 files changed, 15 insertions(+), 13 deletions(-)
