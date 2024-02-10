Received: from r3-11.sinamail.sina.com.cn (r3-11.sinamail.sina.com.cn [202.108.3.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4973FF4
	for <linux-kernel@vger.kernel.org>; Sat, 10 Feb 2024 10:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707559647; cv=none; b=kK0Vg1xbCKZJ7m/lUVFsGq/u/jUTONhR+108vCnmytcqfpwT8q1vzC5nZ9yxiWITQ37U/LeWB7cXBw/CPYqZELvU6qs/4uSAKYwlQbvy7FYEx71oWLr040obkeZNtyW3TdxVJCMO+hc0hvbxdH53FZERUGIPwmviMIPRxwxHhZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707559647; c=relaxed/simple;
	bh=bncHp+KynKit5GdnRUvkkBOQVy4uDJEyH4StRfN55pY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uauj7gRgdrvYtefexqpvwsBK3VWYnFPjuPpg7ykiYA5xnAfhizXEUZbmNxFTDf1HOVzB6t6cTZRYK5Fc1F1TI+1geeONiPjzjC//jd5klxhgyVW1BVhmDWuf+321/5n9gdy1XcmrHV3HyFXb5Nu7adNaNdTQT/8F2bM/xe9Buf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; arc=none smtp.client-ip=202.108.3.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.59.61])
	by sina.com (10.182.253.22) with ESMTP
	id 65C74AD5000024FA; Sat, 10 Feb 2024 18:07:19 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 5193346816294
X-SMAIL-UIID: 19E4F75DB47141EDADB04BEC8D45A340-20240210-180719-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+5a630f8ca0120ab43f55@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	Kuniyuki Iwashima <kuniyu@amazon.com>
Subject: Re: [syzbot] [kernel?] KASAN: slab-use-after-free Read in __unix_gc
Date: Sat, 10 Feb 2024 18:07:05 +0800
Message-ID: <20240210100707.817-1-hdanton@sina.com>
In-Reply-To: <000000000000ee09930610f42470@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 09 Feb 2024 06:57:17 -0800
> HEAD commit:    e7689879d14e ethtool: do not use rtnl in ethnl_default_dum..
> git tree:       net-next
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=165f9cec180000

Test KI's fix [1].

[1] https://lore.kernel.org/netdev/20240209220453.96053-1-kuniyu@amazon.com/

#syz test https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git  main

--- x/net/unix/garbage.c
+++ y/net/unix/garbage.c
@@ -340,10 +340,11 @@ static void __unix_gc(struct work_struct
 	__skb_queue_purge(&hitlist);
 
 #if IS_ENABLED(CONFIG_AF_UNIX_OOB)
-	list_for_each_entry_safe(u, next, &gc_candidates, link) {
-		struct sk_buff *skb = u->oob_skb;
+	while (!list_empty(&gc_candidates)) {
+		u = list_entry(gc_candidates.next, struct unix_sock, link);
+		if (u->oob_skb) {
+			struct sk_buff *skb = u->oob_skb;
 
-		if (skb) {
 			u->oob_skb = NULL;
 			kfree_skb(skb);
 		}
--
