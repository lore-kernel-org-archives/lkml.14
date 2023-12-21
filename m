Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BD4F3608D
	for <linux-kernel@vger.kernel.org>; Thu, 21 Dec 2023 14:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Rf3VqILF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=7E0l/
	L8nVuavVnXr+aRtwhRXPQi7+D2p+B85CF2u3hk=; b=Rf3VqILFBG8MpYgafdTOu
	hLCuKZ37nfZwPpTtCwCgsn8epjUGPBf5NMTtEyNfCSmjcRFkmDzwxlJL86HS3CYH
	J8xjNAOi8WBu8Hi252s6jJ8zvPbObaflvokwxNnyDfdCLxmwfybbAG3xbVQY3d4b
	r+OCBlKostKb5fqFIxJ7Yw=
Received: from localhost.localdomain (unknown [223.74.158.200])
	by zwqz-smtp-mta-g1-2 (Coremail) with SMTP id _____wDnT1jMUIRlefexBw--.44752S2;
	Thu, 21 Dec 2023 22:50:55 +0800 (CST)
From: Junwen Wu <wudaemon@163.com>
To: laoar.shao@gmail.com
Cc: bristot@redhat.com,
	bsegall@google.com,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	vincent.guittot@linaro.org,
	vschneid@redhat.com,
	wudaemon@163.com
Subject: Re: [PATCH v1] sched/rt: Fix rt task's sched latency statistics error in sched_stat_wait trace_point
Date: Thu, 21 Dec 2023 14:50:51 +0000
Message-Id: <20231221145051.852562-1-wudaemon@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CALOAHbAXdRbX9Wbn8qpH5eFUKcju4Ahb+VjMx=JjJL=cVox5tg@mail.gmail.com>
References: <CALOAHbAXdRbX9Wbn8qpH5eFUKcju4Ahb+VjMx=JjJL=cVox5tg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnT1jMUIRlefexBw--.44752S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjfUn189UUUUU
X-CM-SenderInfo: 5zxgtvxprqqiywtou0bp/1tbisBRNbWV4G7fD8gAAsE

>Ah, you are right.
>
>> I this we can use if (p && p != rq->curr) /*Mark the end of the wait period if dequeueing task*/
>
>Agreed.
>
>> because schedstats is not supported for rt group,we only need to update rt_se that is realy task.
>> --
>> Best regards
>>
ok, I send PATCH v2 later
--
Best regards

