Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892DA21346
	for <linux-kernel@vger.kernel.org>; Thu,  4 Jan 2024 11:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-7bbad6e08b0so40243339f.3
        for <linux-kernel@vger.kernel.org>; Thu, 04 Jan 2024 03:44:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704368674; x=1704973474;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SE9nY33J67pbxjyY6dUtaj0IxWIqds1NRJCrH0WZNTk=;
        b=ro63K0OJq22B5zQxAxLSjTbYomeQoXFfE0sg7EcJ4f6pJ0g24RvNRr3Xajf00Tvsa0
         /Lj2Nywz2I2LxzgTmUiYb4Q5tSYxtZ0n1pcCKDSxzbAFWTfWhn08+0Qw3F8RwEJpJC0m
         AEymq2xsGAnOsOIgmhEidbBZWxMC872iRh1ESGbWMlNJeVk7v0GHbVq2VmsvIjsqWy8t
         TZw4ww6cgv5dYjvlra/3wJ/L3xhuXc/my0QJtayzmakSkYqBgguVK6IAVQ7nYpGgEl70
         KksxVIPyWYz/JZIORgj0JYVQewvjMjgvxVHdJc5W+C45cVIMeszwRgj404/3BzGE3RmH
         nuSA==
X-Gm-Message-State: AOJu0YzVR52A8FLvCa/O0m1r1OM7LVk3DDsqIm5CkN2lNzRXo+/PpwSs
	XjVkr99zCyNzW6MB59aQrWAzjYf7bVyqA0euYPbLP1Uc3xBg1jM=
X-Google-Smtp-Source: AGHT+IE5qBbgTVEZjHqzhazreJPSxzd96iVq+NVU8eMdCaLH4DqJ1BC6fkhFnuon5O/eYle4sgRcW4WcypmQmYdE3KsTpoLDe6a0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:4123:b0:46c:d712:4957 with SMTP id
 ay35-20020a056638412300b0046cd7124957mr34094jab.2.1704368674668; Thu, 04 Jan
 2024 03:44:34 -0800 (PST)
Date: Thu, 04 Jan 2024 03:44:34 -0800
In-Reply-To: <00000000000082f2f2060dcc3a92@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000006b8ba0060e1d4183@google.com>
Subject: Re: [syzbot] Re: [syzbot] [net?] general protection fault in htb_tcf_block
From: syzbot <syzbot+806b0572c8d06b66b234@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [net?] general protection fault in htb_tcf_block
Author: jiri@resnulli.us

#syz test: https://github.com/jpirko/linux_mlxsw.git wip_tc_block_fix
