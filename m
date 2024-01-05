Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6C1328D8
	for <linux-kernel@vger.kernel.org>; Fri,  5 Jan 2024 18:00:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54438C433C8;
	Fri,  5 Jan 2024 18:00:10 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.97)
	(envelope-from <rostedt@goodmis.org>)
	id 1rLoVS-000000012UP-3jbP;
	Fri, 05 Jan 2024 13:01:18 -0500
Message-ID: <20240105180051.741934288@goodmis.org>
User-Agent: quilt/0.67
Date: Fri, 05 Jan 2024 13:00:51 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-next][PATCH 0/4] eventfs: More updates for 6.8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
eventfs/for-next

Head SHA1: 1de94b52d5e8d8b32f0252f14fad1f1edc2e71f1


Steven Rostedt (Google) (4):
      eventfs: Have eventfs_iterate() stop immediately if ei->is_freed is set
      eventfs: Do ctx->pos update for all iterations in eventfs_iterate()
      eventfs: Read ei->entries before ei->children in eventfs_iterate()
      eventfs: Shortcut eventfs_iterate() by skipping entries already read

----
 fs/tracefs/event_inode.c | 67 ++++++++++++++++++++++++++----------------------
 1 file changed, 36 insertions(+), 31 deletions(-)
