Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E51E14AB0
	for <linux-kernel@vger.kernel.org>; Sat, 20 Apr 2024 11:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713612449; cv=none; b=ahsUozdgUAxIJJ8jfACztvkYOKn/f3XVCOLb4yKyhKMpDV6Rccit8D8laIIhgI2W3bBBt0jOOwh+X7UD2iDbR5albjnPSc4BnyoKoPpJGp3yf2scLuxiKhlXcBDAtzHMS2jmKt/ot59RbQWlPUrhyQ9Ox1fHaa1O29LBgGre470=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713612449; c=relaxed/simple;
	bh=jR9+PQS0C6UjViyX4ksvc7AyeHuS8XLvRHVeZXVWYvQ=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=qKpciRyKBYdVevnVbu0vOHvkZIvBvA/MvFNPk5IPbVPjkuXhmvfmat1232GpIjvGElnZwumkX0/cs3BRUaPNGrV1eXyU1rAbhuywznhDNjOvjB72XEOR6JBn9bXnqHgs9B750mHW+YowXfzYEaQc4utzKX22d03mvXyo/3cRmIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from fsav415.sakura.ne.jp (fsav415.sakura.ne.jp [133.242.250.114])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 43KBRK9J082939;
	Sat, 20 Apr 2024 20:27:20 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav415.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav415.sakura.ne.jp);
 Sat, 20 Apr 2024 20:27:20 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav415.sakura.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 43KBRJg2082936
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Sat, 20 Apr 2024 20:27:20 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <17d95ca8-c7b0-4645-9c6d-d1bd6fa4ed45@I-love.SAKURA.ne.jp>
Date: Sat, 20 Apr 2024 20:27:19 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: syzbot+b687fe9bf10db0839715@syzkaller.appspotmail.com,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        LKML <linux-kernel@vger.kernel.org>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: Re: BUG: sleeping function called from invalid context in gsm_send
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

#syz fix: Revert "tty: n_gsm: avoid call of sleeping functions from atomic context"
