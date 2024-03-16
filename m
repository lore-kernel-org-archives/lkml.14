Received: from mail115-63.sinamail.sina.com.cn (mail115-63.sinamail.sina.com.cn [218.30.115.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37CBD27D
	for <linux-kernel@vger.kernel.org>; Sat, 16 Mar 2024 08:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.30.115.63
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710579155; cv=none; b=oq3N4QpshcYjfhvx65tl4xXxrBKk+NjoDP/QVR5dHa5H1yVx6uNW+8NphBOF8nNGaK750XWMZZBAN6VXWOSKDcr8hD2SXnY9H1Kz6if4MzZ7sDG6wG1oKVdkww0RCSa2uRDX2vCor6/7ZtaKHPlSVMjM8xAmPD1LceNqbH2VGek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710579155; c=relaxed/simple;
	bh=6ooMEYug8biKx7VZdn3SdFzIEdqjcFYgiuy+RGh9MjY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Qtr/VmczwjCpaHTqjF3Tu+xXot3IgjoHkKy8pGYXumrztvo+JliGX3iGhQ5AplMhUtWcga/+kzQS4SGXkDKOA7KzO4qWZ6DkQAXcUytGjIFDxYhS30hmk8cTKyHqFqs9004eo9sbaU7ZfFPjljAhFJVLlArLmEv7KU0bjj71Ahc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; arc=none smtp.client-ip=218.30.115.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([116.25.117.148])
	by sina.com (10.75.12.45) with ESMTP
	id 65F55DC300009983; Sat, 16 Mar 2024 16:52:21 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 76942431458057
X-SMAIL-UIID: DC3F8470115B41159AB8B91E9E770289-20240316-165221-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+f3bc6f8108108010a03d@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [sound?] possible deadlock in snd_timer_close_locked
Date: Sat, 16 Mar 2024 16:52:11 +0800
Message-Id: <20240316085211.1816-1-hdanton@sina.com>
In-Reply-To: <00000000000099d9850613b12348@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git fe46a7dd189e

--- x/sound/core/timer.c
+++ y/sound/core/timer.c
@@ -409,8 +409,9 @@ static void snd_timer_close_locked(struc
 	struct snd_timer *timer = timeri->timer;
 
 	if (timer) {
-		guard(spinlock)(&timer->lock);
+		spin_lock_irq(&timer->lock);
 		timeri->flags |= SNDRV_TIMER_IFLG_DEAD;
+		spin_unlock_irq(&timer->lock);
 	}
 
 	if (!list_empty(&timeri->open_list)) {
--
