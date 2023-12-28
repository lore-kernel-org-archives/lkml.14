Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB9F3C00
	for <linux-kernel@vger.kernel.org>; Thu, 28 Dec 2023 05:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-7ba74d90a71so847469639f.0
        for <linux-kernel@vger.kernel.org>; Wed, 27 Dec 2023 21:56:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703743006; x=1704347806;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0e0tkyTgAjZp6wKBBZLPGdjk/383LVlJeAZReEPGEH4=;
        b=COcgK59oiqW/iQyZea49khlBEE3nBHEYx9UElcxFnLojQ+pIV8iPWICEH8qQOG4riQ
         GpuVBITOZA5uwfl5BjF6Hv3ymph1u3qucCZ3SAr/IlH0P58S78pqNxFo5YoEiw7GWwz1
         X8iio87thN8LF+Z8Ur/RVHtM/1ASUhvYz76as2sUrlODYnKAEpkf/fKz453YKdfKItsq
         2aoJURgwvLgSewEq+cJzVXq6lnid8fG7rOmL9sj4A2Q0u18+NKCrOxpLzLjdrMiT/Vtw
         ykOJzErp3yAH8buJhbSnI7Hyz7TEI9VdLENGOYkAKLBZmM1BcAZXKbo9QiFmYnW42Wnl
         FxAg==
X-Gm-Message-State: AOJu0YyTscZxJ06b97QTPhpxEJeqLuUDeDrrJSpN89O2GGSvMEP5G0gD
	gBFb8haQqvtjHPinNolo+7Nat0kr77ZQdDMrwbvqGUglJcgkRFI=
X-Google-Smtp-Source: AGHT+IGo7k0P2XsgaRms+mHRsAvswB7yIxDjRk8aEQKEJRTbhz4Bz7C5G6JVUaYdSfTEzfUxov7QR1+k90fQciF9OPbzX6sLB0QG
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c28:b0:35f:9ada:73a8 with SMTP id
 m8-20020a056e021c2800b0035f9ada73a8mr1452787ilh.2.1703743006391; Wed, 27 Dec
 2023 21:56:46 -0800 (PST)
Date: Wed, 27 Dec 2023 21:56:46 -0800
In-Reply-To: <000000000000321c24060d7cfa1c@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000af4643060d8b94e6@google.com>
Subject: Re: [syzbot] [erofs?] KMSAN: uninit-value in z_erofs_lz4_decompress (2)
From: syzbot <syzbot+6c746eea496f34b3161d@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [erofs?] KMSAN: uninit-value in z_erofs_lz4_decompress (2)
Author: lizhi.xu@windriver.com

#syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git fbafc3e621c3

diff --git a/lib/hexdump.c b/lib/hexdump.c
index 06833d404398..e146b1bf73dc 100644
--- a/lib/hexdump.c
+++ b/lib/hexdump.c
@@ -264,7 +264,7 @@ void print_hex_dump(const char *level, const char *prefix_str, int prefix_type,
 {
 	const u8 *ptr = buf;
 	int i, linelen, remaining = len;
-	unsigned char linebuf[32 * 3 + 2 + 32 + 1];
+	unsigned char linebuf[32 * 3 + 2 + 32 + 1] = "";
 
 	if (rowsize != 16 && rowsize != 32)
 		rowsize = 16;
