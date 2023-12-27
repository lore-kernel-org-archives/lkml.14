Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58A9481A5
	for <linux-kernel@vger.kernel.org>; Wed, 27 Dec 2023 21:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-35fe9fa7f4fso44420155ab.2
        for <linux-kernel@vger.kernel.org>; Wed, 27 Dec 2023 13:35:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703712906; x=1704317706;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pbQTOD/Ltd9C2PJIubwu4JdPZB/ZwoLzMfKrTF30tQM=;
        b=CQekWbadh6c0/r10LOGvoTRh6vbHn7hatEQ7iqrEQNBalVIfbeQ1p52doTDB1Q4emU
         u/DsNvJUjW+doSnbsTzb52PXJiw1P4Y2bdj1DLOY/tuHgr0Gu4+4Tv1SX+sLIWOFcAcf
         LlXtoFwixr2WAiJBcaFs5jR8hFIIGHF5JwIYPBeqFeRq3tiQ3FIPvGr5Ti9luHC+KvgV
         cnkaYGcf9czivrkb+V5my4/Dw6Zf9IzZiRDAtqe3tdzPIz4ydxnEJKabL92X4CWziIm2
         rvU21bf/gP3C/khEBtHBM1CDZMCGOdbUryIrxwb7xGE3sgb4CmqF8VIeHv3uVR9Yku3a
         Uh6Q==
X-Gm-Message-State: AOJu0YxThLJNOvi/cBVzeM/L5S0xCc8o5PSsvgmvQVTv+lq3a6es/aoy
	vDvNUtUDBTpq6qwEo+S3DTX5a8LgGrcyaPe4WA/PvbA0TNeD
X-Google-Smtp-Source: AGHT+IESHqvKiy/A8nyx+QaDLdqzH3R119TI4RChAvP2HWtKKFejDSNQtJ99zWFHavl5JUAy63E8bzvuHwUfhDOcGBA24lRJ6556
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c28:b0:35f:d4dc:1b1d with SMTP id
 m8-20020a056e021c2800b0035fd4dc1b1dmr1007441ilh.1.1703712905942; Wed, 27 Dec
 2023 13:35:05 -0800 (PST)
Date: Wed, 27 Dec 2023 13:35:05 -0800
In-Reply-To: <00000000000046566805e997132d@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000008edf40060d8492e2@google.com>
Subject: Re: [syzbot] [jfs?] UBSAN: array-index-out-of-bounds in xtInsert
From: syzbot <syzbot+55a7541cfd25df68109e@syzkaller.appspotmail.com>
To: brauner@kernel.org, dave.kleikamp@oracle.com, ghandatmanas@gmail.com, 
	jfs-discussion@lists.sourceforge.net, jlayton@kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	liushixin2@huawei.com, mirimmad17@gmail.com, mushi.shar@gmail.com, 
	nogikh@google.com, osmtendev@gmail.com, shaggy@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit a779ed754e52d582b8c0e17959df063108bd0656
Author: Dave Kleikamp <dave.kleikamp@oracle.com>
Date:   Thu Oct 5 14:16:14 2023 +0000

    jfs: define xtree root and page independently

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=104e23c9e80000
start commit:   830b3c68c1fb Linux 6.1
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=1b610daf3807bd5c
dashboard link: https://syzkaller.appspot.com/bug?extid=55a7541cfd25df68109e
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=175d3e57880000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: jfs: define xtree root and page independently

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
