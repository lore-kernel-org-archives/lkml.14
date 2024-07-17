Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03DAE566A
	for <linux-kernel@vger.kernel.org>; Wed, 17 Jul 2024 03:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721185361; cv=none; b=AJcR074yDHEjvMunYIF93So3/jCueLBehwWHCyRdhPmZarxwLZy+4huP9ouDcnzNhvA+3EAuQCnRBPisDz2re9f8sGVXkhq1pXRW0n4gzeoSUYooNTHB+m/d4i2kJjeoREBO1/KDSgRO6GF0Wg5V+lWtUoap63L05p4U40d+kuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721185361; c=relaxed/simple;
	bh=uAOqFgS87m/95ZQ3MSEFnLGgchIODNd86R8bhuc3w+o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ahYkc1wlbD583ol6iqrVlGhqVo24xNwtcv1dQ3yxVFZqzlALKF6304rc8Wl03L5NAgwRZquMDlU/7iCzrfGsKnNT2napxiuNtqNi5FjuLPTe0PSZZgfjppoC0Wf815RFic1ajvA3wWd2i0wZw4qfvyO8KTuTQ9nebTMOPBQFlXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=gB0pCghZ; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="gB0pCghZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=RqICW
	fo6kWbIEix4+q/sdik5KvVb3MlbOrXlDKWD6As=; b=gB0pCghZeL4WTxzADYwYu
	cxYUR1eUSbSoKSopcKLml1wtYvMcwC2NxOe68nmbH8FhDQRhXMRavp/q8Rgqhhdj
	1XqjdiXVx2FqbCpamauxsgKQDXfkJCfZKP4pz6jVFM0Oj6/1V+TjaPBRhr3OoHmM
	Iopr2LVoGdBHsJKn8ABixg=
Received: from localhost (unknown [101.132.132.191])
	by gzga-smtp-mta-g2-4 (Coremail) with SMTP id _____wD3H3XTM5dmbLOBAQ--.7666S2;
	Wed, 17 Jul 2024 11:00:35 +0800 (CST)
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
Subject: [PATCH-RT sched v4 0/2] Optimize the RT group scheduling
Date: Wed, 17 Jul 2024 11:00:31 +0800
Message-Id: <20240717030033.309205-1-xavier_qy@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <202407170411.vRtOCOzx-lkp@intel.com>
References: <202407170411.vRtOCOzx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3H3XTM5dmbLOBAQ--.7666S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jw4rCF1UJr4xZr13Ar4UXFb_yoW3KwbEqw
	s8KryDAF4kZFWDAFW7uwn5urWftayjgF1UJFs0qry3WrWkAa98XF1kWF1kXFWrXa13JF9x
	trnaqF4ftrnFkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_bAw3UUUUU==
X-CM-SenderInfo: 50dyxvpubt5qqrwthudrp/1tbiZRUfEGXAnFk6xQAAsg

Hi all,

Fix compilation warnings in debug.c

To Peter,

When is the new RT group implementation expected to be proposed?
Do you think my current patch is appropriate for optimization until then?


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

