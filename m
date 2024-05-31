Received: from mail114-240.sinamail.sina.com.cn (mail114-240.sinamail.sina.com.cn [218.30.114.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF821386B4
	for <linux-kernel@vger.kernel.org>; Fri, 31 May 2024 11:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.30.114.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717153399; cv=none; b=PVIh/4lslzA9nmwQVVVGlNOVznwKANJclptPkGfIib3nue7VB/3wPhWAznU1WlK0Qa8O/C8eeMlZyK4ZcMGSWR1J995/4GhmWsHOx14hhLjXBLb8kcymxP3FcNfjCGs2Oph0Bldfvn3Y//2/T+SABts6j4wcDv+RT/lt3zLZ1Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717153399; c=relaxed/simple;
	bh=9QsDpjp3XZJ9SDKeVxkaUb+EuBoHnOO1JqN2vIeJk5s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UzA3PjRxqpuZvImvE54/1RvPZI9lUR7NJILVKYdGqGZGhgbzapp7jKYVx/qpLTKf1M/Rb+Ih+9zCmB5hJ8YTuRLCPFoZKVbFLi2KbAlRX7uuIRfJ+H0yMfQBq4EDD/o83WgtGFckM9PPfpeAbLWfxGYdTSShxQjtgAism1knulQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; arc=none smtp.client-ip=218.30.114.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([113.118.65.235])
	by sina.com (172.16.235.24) with ESMTP
	id 6659AE6200004D80; Fri, 31 May 2024 19:03:01 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 21153545089563
X-SMAIL-UIID: BF36D2333AD1401597E3C103EF7CA842-20240531-190301-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+1acbadd9f48eeeacda29@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [kasan?] [mm?] INFO: rcu detected stall in __run_timer_base
Date: Fri, 31 May 2024 19:02:50 +0800
Message-Id: <20240531110250.3333-1-hdanton@sina.com>
In-Reply-To: <00000000000022a23c061604edb3@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 13 Apr 2024 19:04:34 -0700
> syzbot found the following issue on:
> 
> HEAD commit:    fe46a7dd189e Merge tag 'sound-6.9-rc1' of git://git.kernel..
> git tree:       upstream
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=111600cb180000

#syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git  fe46a7dd189e

--- x/net/sched/sch_taprio.c
+++ y/net/sched/sch_taprio.c
@@ -1150,11 +1150,6 @@ static int parse_taprio_schedule(struct
 		list_for_each_entry(entry, &new->entries, list)
 			cycle = ktime_add_ns(cycle, entry->interval);
 
-		if (!cycle) {
-			NL_SET_ERR_MSG(extack, "'cycle_time' can never be 0");
-			return -EINVAL;
-		}
-
 		if (cycle < 0 || cycle > INT_MAX) {
 			NL_SET_ERR_MSG(extack, "'cycle_time' is too big");
 			return -EINVAL;
@@ -1163,6 +1158,11 @@ static int parse_taprio_schedule(struct
 		new->cycle_time = cycle;
 	}
 
+	if (new->cycle_time < new->num_entries * length_to_duration(q, ETH_ZLEN)) {
+		NL_SET_ERR_MSG(extack, "'cycle_time' is too small");
+		return -EINVAL;
+	}
+
 	taprio_calculate_gate_durations(q, new);
 
 	return 0;
@@ -1850,6 +1850,9 @@ static int taprio_change(struct Qdisc *s
 	}
 	q->flags = taprio_flags;
 
+	/* Needed for length_to_duration() during netlink attribute parsing */
+	taprio_set_picos_per_byte(dev, q);
+
 	err = taprio_parse_mqprio_opt(dev, mqprio, extack, q->flags);
 	if (err < 0)
 		return err;
@@ -1909,7 +1912,6 @@ static int taprio_change(struct Qdisc *s
 	if (err < 0)
 		goto free_sched;
 
-	taprio_set_picos_per_byte(dev, q);
 	taprio_update_queue_max_sdu(q, new_admin, stab);
 
 	if (FULL_OFFLOAD_IS_ENABLED(q->flags))
--
