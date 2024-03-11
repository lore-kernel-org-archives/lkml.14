Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283433D993
	for <linux-kernel@vger.kernel.org>; Mon, 11 Mar 2024 13:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710162426; cv=none; b=cQZf5snc216suaVVMXPx9ceQw8dLLYNpapkNIvszpL9sNLvWcnINI3xF6UKJetNRRNLTYewTzNuTMs68HK3Te6bDNdvqEU6zlpDGYpMt9uOnNBJh3u5dISPjtcNLqtjxFHM9lpWkaaxSmsmeHPCkH+O23rRPoa2UUn99fdjFq9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710162426; c=relaxed/simple;
	bh=E3OXxot3hvZ6l5uVDn106scjzmfgShzTmKoDwiIHUHI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=KV9CC1DvLzwfmhVrHtXvtoOu8Z/NceeKglyz2jmNjhWryWeIQStrKgliJ0SgASKEJH7Xa/+oUjyOqOkkQ+LUAEwz03uCKCUdJiAJE7w5EAEiMVlefUJ5b3sBiLLvmA9inbxXiUSG7Smr3oqgBptXTEIozKl6gSEQbDCN2lv7Z7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-7c8a8526f03so133630939f.0
        for <linux-kernel@vger.kernel.org>; Mon, 11 Mar 2024 06:07:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710162424; x=1710767224;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s1jODo470ZjAysWTo8t75gsZuF3KAKex/gblYXdrU7o=;
        b=n66asfN77x4AbTBPsjLDlXTjSryI4A+H636p9+m1CfDsmRLnJYvDfmJFPRGoYVfD+C
         pUzYTgCOBZ5moyQKhzs4KrecxmaNTTFiUAM9UdOdQVolVMAuDIhG4y7ljYpPn4iTB0TB
         QIGBy6nEJjURRAZ6BEC9IX7sRdqq5zDEndU+qFHyuccfR55nTkX6sjGwQOMSbKv1eXk7
         ZvUIDpOaKUoZpeiKnS9bc4w88y/5VkNAM3b9rfSAoZ04IZDQjcaxFc/jUHidpSh7s5vz
         oHQMN2FmxGMk+NamvTVC13gvCBe9vQdnYiFPJG0iZJlXD0iLtLQnx1FF2c5SmoVZ183z
         RtPA==
X-Forwarded-Encrypted: i=1; AJvYcCVAnMf51xobv5i0SMFRYxQeCRUWhXLTSB4QB883gfgwdYRbHqs05MnHyIhchDf/YFcXjCbjfI3+8A7d8KgNUecf8nYVDcNEquuiEDZL
X-Gm-Message-State: AOJu0YzXQ0EshJsnV0oxedUjUTBrV8JCQObI2juXNAi3U1uk7+Sc3HhC
	UY6Yh4y9M1UTTzSjfa+6wOLMay87/+su8+EMExPFJeJYdDoElxueoBn/tOshhMR4MzWVP454blA
	cEyYKCA4a3HRE2iy87E9TLuwLbHPwhn9WUViedZtlalaMS3Ll/TwmDxs=
X-Google-Smtp-Source: AGHT+IE/deeiMdWnTIrKVOnvr+2763iezMKFt/JhfpyPJtazgzyEblCCB5qPmoU2JefIrI+4MqWQnxCOTFmQM006aGBXEMgbG30C
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:1684:b0:476:e7e9:7528 with SMTP id
 f4-20020a056638168400b00476e7e97528mr104453jat.4.1710162424322; Mon, 11 Mar
 2024 06:07:04 -0700 (PDT)
Date: Mon, 11 Mar 2024 06:07:04 -0700
In-Reply-To: <tencent_7B6E46C35367636DE97C83A16448F7623705@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000cf7095061362372b@google.com>
Subject: Re: [syzbot] [bpf?] KASAN: slab-out-of-bounds Read in btf_datasec_check_meta
From: syzbot <syzbot+cc32304f6487ebff9b70@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+cc32304f6487ebff9b70@syzkaller.appspotmail.com

Tested on:

commit:         afe0cbf2 mm: Introduce vmap_page_range() to map pages ..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=15dad8d6180000
kernel config:  https://syzkaller.appspot.com/x/.config?x=92e06b597766606e
dashboard link: https://syzkaller.appspot.com/bug?extid=cc32304f6487ebff9b70
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1002c63e180000

Note: testing is done by a robot and is best-effort only.
