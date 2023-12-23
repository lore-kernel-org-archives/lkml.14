Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E100246A2
	for <linux-kernel@vger.kernel.org>; Sat, 23 Dec 2023 04:32:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAAF0C433C7;
	Sat, 23 Dec 2023 04:32:25 +0000 (UTC)
Date: Fri, 22 Dec 2023 23:33:31 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>, Dongliang Cui
 <cuidongliang390@gmail.com>, Hongyu Jin <hongyu.jin@unisoc.com>
Subject: Re: [GIT PULL] tracing: Fix eventfs ownership again
Message-ID: <20231222233331.5a1eb717@gandalf.local.home>
In-Reply-To: <CAHk-=wjxd29418Y913yQAZH9-Ye4S8yOvubAaDN4fg8v6sKnhg@mail.gmail.com>
References: <20231222082959.7d08894a@gandalf.local.home>
	<CAHk-=wjxd29418Y913yQAZH9-Ye4S8yOvubAaDN4fg8v6sKnhg@mail.gmail.com>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 22 Dec 2023 14:24:41 -0800
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Fri, 22 Dec 2023 at 05:29, Steven Rostedt <rostedt@goodmis.org> wrote:
> >
> > tracing: Fix eventfs owenrship  
> 
> Instead of doing these daily pulls for fixes that fix the previous fix
> that fixed another fix from a week ago, I'll just wait a few weeks and
> maybe it will actually be right then.

Whatever. Things are settling down, as I'm able to focus on other parts of
the tracing system and eventfs hasn't caused any troubles.

I'll add this to linux-next so that others hopefully will not hit this.

-- Steve
