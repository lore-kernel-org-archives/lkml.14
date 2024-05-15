Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F323C68C
	for <linux-kernel@vger.kernel.org>; Wed, 15 May 2024 23:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715814113; cv=none; b=s0E4hfSoawSgYwB6/n0UcWpF1oKu0p+abU38pZeCG690GlTS8sPkIkC/MWgaAma0A2BG7HshP5j2FU3dVcZ0Y9YjsQwP+75H6xpzO1V0zQNzWzlULR1EggjkbSojrZ2+dFML0YvZejoC764VnmzmA543v6L+/hPQGWymquntCgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715814113; c=relaxed/simple;
	bh=pXGzCZDmshfrTnb/9Rlg5avRevZzvL3bKowgDp7fhkU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=k8HXSsiixgKkP5fZaxVvdPrpSrWCQn4FDf1YY1pTX+ACiig39xmDxXPRq2CWGCeLaSjyx7JLy6Xzk9yh78hn14yrZ7EVf4+Stat8TP2hQogxe37pWPqomXwczfxmrzYk9oLOfWovk7jyuz9safKYJZzbPTYIm2Dj0OPT4kBUUGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-7e1d7031f4aso542369439f.1
        for <linux-kernel@vger.kernel.org>; Wed, 15 May 2024 16:01:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715814111; x=1716418911;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pXGzCZDmshfrTnb/9Rlg5avRevZzvL3bKowgDp7fhkU=;
        b=oYVCUdM2FWJjxhgd9l85g0m16xexN6jVB8/R8xfucjeFBMqemyX88KJFznLsyCXKSJ
         Y9DyYQTm3+wKpSPs/6kRn4hxs91g+lHKA4yjAhefLMsUT4lDiTqYo4yNqkbmvnuuD9px
         MLs3+SLwjWWWAwRpsE90wqcUX8GQ2yvDXEwFLyMT5aVRE4rIxIiLi+Gf9egFw2MMsNwM
         Bl1XjfI6mInMRUTiODNp4lKdbN8MazqaEX/KNd3ILAzlqG5QdDVaF20cYfuSuBjpai93
         b7g2/LjEiNDARkWz1f++YJt6HohuSN/qvFBWcAZal2AQe8pCfNKSSwDi1AQcTNoTK1Xg
         W3Gg==
X-Gm-Message-State: AOJu0YwU9qKzgV10SX3KPmG2DWJmtLtU072Vu+TC8TTJ824gkUpDxNNT
	Nl7Ihjv2iAUFK6wjksq4LbaBc79yBajgP5rJuWIUBq6e+c0yYG6pbIUJAbO+Jk1OysBdSGjn/qJ
	1y3clEQxp/gQeM18G4WD9g0WlXTQfkYptAf7zNijJGHZ+Uym4beVY0oM=
X-Google-Smtp-Source: AGHT+IEtLiWEOaVB3tZa/h7eYeXzpXuToHTgMOaHEYeXVFY8uZHIdyDtk163jh9S1d+7aPDP5mFv7Z0f2RiMZsBPFeEeMQhWaa6W
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:8305:b0:488:e81f:845d with SMTP id
 8926c6da1cb9f-48958e18e34mr1087565173.4.1715814111686; Wed, 15 May 2024
 16:01:51 -0700 (PDT)
Date: Wed, 15 May 2024 16:01:51 -0700
In-Reply-To: <000000000000aaf7ec06186a8d13@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a0c59e0618861aa4@google.com>
Subject: Re: [syzbot] Re: [syzbot] [ext4?] KASAN: use-after-free Read in
 __ext4_check_dir_entry (2)
From: syzbot <syzbot+11af34d3c0711f233fd4@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: [syzbot] [ext4?] KASAN: use-after-free Read in __ext4_check_dir_entry (2)
Author: tytso@mit.edu

#syz test git://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
