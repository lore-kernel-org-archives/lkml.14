Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 152381CAA2
	for <linux-kernel@vger.kernel.org>; Tue, 16 Jul 2024 06:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721109989; cv=none; b=B3YrIP+rawhjM/KNNSXBCSuDTD3MsYpIVg8Ddqy0NPbeTe0UTuEfz3TWF+a6EaQ9dwE5T3u6FPqehWbQ0lAw+HKSHLhKe/Nv7/rtz8GSH4eUvI3YgmJVuQ1Clg9SrTXvq9aFB+NO/pIPdlle4Yzs5JCDeecaj02M8GrsIl92dX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721109989; c=relaxed/simple;
	bh=o/mVjkSUCowgwHrV7p66kcsQbQWbxcl7E8Cfocw3cgI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aOoIg/lBYX8itlegVZabMlfpfObqEqQtWFOcCy1dRdZLo2cc6UjWpiBMaSSase0WaMqySIyd5WF4SbBoHv91qgpUdhp7z98rBqLby2+xEDaXYpEQjRsB/9Q5vJur55+/BPJQXfdfAIPPmAbPxDfId/mCxjKN7kxvloc1qD0uXIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=VRtzd12N; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="VRtzd12N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=an2bI
	e2Jcqri+mB6O+W8UzQa3g7Twu9iS3sZVny7bcs=; b=VRtzd12NdX2jX4xJWfYtb
	/Bhin7sltXQ3mXuthH57X60mdjmb16MwzQFp4XuoVD/n+AmVVtJrEmnkDQa1N/ms
	4m2/Y34j1X7bpjKmwMRZPCiJGt1V0e7z5PZttJvcu1p/S0eSeNrEVZ/wJeTNRyNf
	tjJMazO7dQryjl+khm9n20=
Received: from localhost (unknown [101.132.132.191])
	by gzga-smtp-mta-g3-1 (Coremail) with SMTP id _____wDnb5ycDZZmPkULBw--.21099S2;
	Tue, 16 Jul 2024 14:05:16 +0800 (CST)
From: Xavier <xavier_qy@163.com>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org
Cc: dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	bristot@redhat.com,
	vschneid@redhat.com,
	linux-kernel@vger.kernel.org,
	oliver.sang@intel.com,
	Xavier <xavier_qy@163.com>
Subject: [PATCH-RT sched v3 0/2] Optimize the RT group scheduling
Date: Tue, 16 Jul 2024 14:05:12 +0800
Message-Id: <20240716060514.304324-1-xavier_qy@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240629112812.243691-1-xavier_qy@163.com>
References: <20240629112812.243691-1-xavier_qy@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnb5ycDZZmPkULBw--.21099S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtr4kXr4ruFW5Gry7KF1rWFg_yoW3CrXEqw
	s8KryDArs5uF4DAFWxCrn5urWftayjgF1UGan8Xry5WrW8AFWDJF1kWF1DXa48XwsxJFZx
	JrnYqF4ftrsF9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_bAw3UUUUU==
X-CM-SenderInfo: 50dyxvpubt5qqrwthudrp/1tbiwh4eEGWXvkjyKAAAsM

Hi all,

Patch 3 fixed the issue with handling tasks with prio set to 0 during
the execution of blktests.

Kindly review.

Best Regards,
Xavier

Xavier (2):
  RT SCHED: Optimize the enqueue and dequeue operations for rt_se
  RT test: Adding test cases for RT group scheduling

 MAINTAINERS                                   |   7 +
 kernel/sched/debug.c                          |  48 +++
 kernel/sched/rt.c                             | 287 +++++++++++++++---
 kernel/sched/sched.h                          |   1 +
 tools/testing/selftests/sched/Makefile        |   4 +-
 tools/testing/selftests/sched/deadloop.c      | 192 ++++++++++++
 .../selftests/sched/rt_group_sched_test.sh    | 119 ++++++++
 7 files changed, 618 insertions(+), 40 deletions(-)
 create mode 100644 tools/testing/selftests/sched/deadloop.c
 create mode 100755 tools/testing/selftests/sched/rt_group_sched_test.sh

-- 
2.45.2

