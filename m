Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3568D4778E
	for <linux-kernel@vger.kernel.org>; Tue,  2 Apr 2024 09:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712048469; cv=none; b=XtEl9RKN/tMyTNtfWEpKClcCMjBPL/gIuVhKhe0KAHLe0DLxx0t4xGdsx3jPvg0WRJFfmEh+GAGMajcGy1xKVxEn4z0UvdXXL5kUlev587nSEvwnQnbGA6YP1ZOCqwAIa0zUDMDAKIj4b6R6SxFISvpC0gfoCgsb2TOZIDbBVBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712048469; c=relaxed/simple;
	bh=NZvUEjNrrSg6aftshRDrRAJi+4xS6GvD6H8cljYrsFM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kbv1XoM30zf4QDRUxsMEcTiKYy4G4klPM7SttqQyYAAYLHkEHGtU2t1W/D2wxMCzN1qW514LkIm2rnhVomSYlVgwHCMAonIjEN2OP0vCLgPP4vs2gTHCwKRWrQK15CzbF6UcXFHhOfpAcd7BqMbV87P5Y50oywlq+c049ZZWyBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=cDjjv68p; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="cDjjv68p"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2a2601f0562so230738a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 02 Apr 2024 02:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1712048467; x=1712653267; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NZvUEjNrrSg6aftshRDrRAJi+4xS6GvD6H8cljYrsFM=;
        b=cDjjv68pp8Lpkc4pFaT/whgl3Fs+P6d5V2OBtHJkViOaKCAn51bVEvF0g1r+A1/7/m
         d7g5Z2lPLhOmNKyUFalTKtMbg4oBMLRMUUHm0thDbsrcrNmkvAWoBBeigo7BK2QMifAk
         AUaOIWTRxbQKcTx6BkcaAgf8UCEK3weuTAWj1dlnlvFqpxZlVjn5IACWJ3rkpwh16xld
         rOqP5bgDbA98uRMPGmbrhHnab+yl40xcsCuocGxFl8xlR8svxC6ZeTIVLo6AZCxR+jL0
         867QqlF6Y9/0s6szyppRANS9oR0vC9BfjcazjRCOk175vzLvTtW1jfxinE6dDgU9CU2z
         +Pvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712048467; x=1712653267;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NZvUEjNrrSg6aftshRDrRAJi+4xS6GvD6H8cljYrsFM=;
        b=m9Ge6z9C2AQdyR6l7W6uCiuIqi8vNxVGbw28BYS+Ee7mDuYQMnHqO9qfi92bj9XEeM
         Ko0FL4hJW307+FOffX6QBm5grJNqQtLdK7nOybhcVx8BSTEBFkIv4dc21SCfQxpWiyd1
         L6bTyxCSIXrjyb0rXPghfiUVW2PYdZrgS49Nk4rNrUon1ee+Nzz+dLj6bCjzv4d42S4t
         TTE3CK69SCpJ4Pb0JjgF1RAiseM/9dYNHZTlMQ8eTjNTZxA/4uGXVRNSXCCzJ2ozdXAn
         Eifq1qrtMCRrjrHkJPDR5xuwk+nMAuG/OwJyT7+M0m78tnKaTVO3fXvGcffoZYJtbU3A
         CiBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqJaSbGQoufr1bcASJiAkvBMYU3RO2CoTctsuHg6jIHjrjFvFEnVDhe2PIxdcSsVonWt9u8ANtdX7m1S679Uzb72JaHYdR7+iQx+LZ
X-Gm-Message-State: AOJu0YxvxehF1t4QUDjqkBSIiiiyVnr8zTuL1w4vdCtfAZfCKdoJDrwF
	1WG81h+qUrT1+r5X08zPFiU+xVZ22qv8SI7FgZ16CGSkr+FsGcnkqNPr44QIBbLwrQ87xS12uYx
	gwL3CEumDglKz/nRstI0HRuY7uZvHTE+5+bdNJw==
X-Google-Smtp-Source: AGHT+IEsH5g/yQ7549h0WSFp/og1oUajTS1sjB7Vh97/Wgv/VHLuGRQTOVZXjAhxRMgyq22jN/7H5kj6HX5rDOi6i4o=
X-Received: by 2002:a17:90a:b111:b0:2a2:47a2:9bba with SMTP id
 z17-20020a17090ab11100b002a247a29bbamr2890042pjq.3.1712048467530; Tue, 02 Apr
 2024 02:01:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <00000000000090fe770614a1ab17@google.com>
In-Reply-To: <00000000000090fe770614a1ab17@google.com>
From: Jakub Sitnicki <jakub@cloudflare.com>
Date: Tue, 2 Apr 2024 11:00:56 +0200
Message-ID: <CAGn+7TXh4gzeQ3EktnYQ=TXO_LutRU8iSQ=VbBpPpVX=Cr_UEA@mail.gmail.com>
Subject: Re: [syzbot] [bpf?] [net?] possible deadlock in ahci_single_level_irq_intr
To: syzbot <syzbot+d4066896495db380182e@syzkaller.appspotmail.com>
Cc: andrii@kernel.org, ast@kernel.org, bpf@vger.kernel.org, 
	daniel@iogearbox.net, davem@davemloft.net, edumazet@google.com, 
	john.fastabend@gmail.com, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

#syz dup: [syzbot] [bpf?] [net?] possible deadlock in ahci_single_level_irq_intr
