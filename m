Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7D617CE
	for <linux-kernel@vger.kernel.org>; Fri, 29 Dec 2023 01:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="JZIN6RQL"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3bb7344a0e1so5468835b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 28 Dec 2023 17:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1703814004; x=1704418804; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X83wfcIZjdEzwkgoaoOF5TgcwBhLow4MMDfeVCMjkfI=;
        b=JZIN6RQLPwWPrNYejknxjeb3NsRvRn5EOS6CM4zI6ZQ0XqQneJr6Fi0UENAed7XG6I
         YwcBno33XYUt1huylG1ibVDWNSQwuwWR8qycMDQOikLeHCM0yqUiqpZWthLGymoRc9L0
         werbAd1WSrGY1C7RHyU6vh0y28I1L7l52d/5E2n7Temu1EMFF/xFt/gLHzgpuSlsp3Dj
         mMHOBYCkKTAFAhaQFSprsR+DWVIJJc5mM8Goq9/1IAzgMdIZh2z7PmOgWYPtfwn1537F
         ZFIe0dXG3y7wULB1TKVqj8GzuNpBhSZNEe4A9LbtvoiejZJPWCtz2McRomeM5DsqeUI3
         i4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703814004; x=1704418804;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X83wfcIZjdEzwkgoaoOF5TgcwBhLow4MMDfeVCMjkfI=;
        b=bjRU0fjhSpw/Kcjbno2HAqyt1sj1jHWliMcO7LIEO9+Wz0d4cGEu2wSDhgh9+HzUym
         RMntN+JL6MiNS+VZSZJyLxlE9qWkVSXWon9kxYGuI4kAlsqEcixY1teVFvoQ8tFlZmBB
         i0FKbPTE6ABBX6cVWydYQYZuFnkSFQ3sHSECreiqUe1ry0U7x7ZvWO7zJweel9oflrN6
         /OTZ05up6v1MPyNxFeFaBp15FOCJRpvVu5QET6ZYWpzgNVsxG9v41tsUv8MlYe+kYLmO
         NngNo6Zmd/2gYZn50Y2bLAQBVLwFdDegeKwwVabJrEYojB2w/v3MpDD5zlizqSvm4UOX
         4DtA==
X-Gm-Message-State: AOJu0Yzb8RkZWOtOdQvanf/iVMjBxm1tDDB5pnhURw3ytXG6ZWaObBXw
	Dfwb/Znyse1FOq343Qivdkn7XyoRkhJH
X-Google-Smtp-Source: AGHT+IGF60wU+mSoalWd6UHlhEo308YpqtgcdbGQB135dpTj1IDi5N7qX5FYXhcD2SQ93Jv2z2NSnQ==
X-Received: by 2002:a05:6808:318d:b0:3bb:a777:e891 with SMTP id cd13-20020a056808318d00b003bba777e891mr10630353oib.104.1703814004373;
        Thu, 28 Dec 2023 17:40:04 -0800 (PST)
Received: from smtpclient.apple (76-10-188-40.dsl.teksavvy.com. [76.10.188.40])
        by smtp.gmail.com with ESMTPSA id p2-20020a056a0026c200b006d99170ab87sm11391939pfw.182.2023.12.28.17.40.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 28 Dec 2023 17:40:03 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: Re: [PATCH] PCI: switchtec: Fix an error handling path in
 switchtec_pci_probe()
From: Daniel Stodden <dns@arista.com>
In-Reply-To: <20231228235626.GA1559849@bhelgaas>
Date: Thu, 28 Dec 2023 17:39:50 -0800
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
 Logan Gunthorpe <logang@deltatee.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Dmitry Safonov <0x7f454c46@gmail.com>,
 linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org,
 linux-pci@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <A483D7C9-07FD-40E8-93F5-5688AB6C9040@arista.com>
References: <20231228235626.GA1559849@bhelgaas>
To: Bjorn Helgaas <helgaas@kernel.org>
X-Mailer: Apple Mail (2.3731.700.6)




> On Dec 28, 2023, at 3:56 PM, Bjorn Helgaas <helgaas@kernel.org> wrote:
>=20
> [+to Daniel, can you take a look?  If you like this, I'd like to
> squash it into df25461119d9 and credit Christophe since that's not
> upstream yet]

Thanks very much for fixing this, Christophe.

The fix looks correct to me. If it can still fold into the previous =
change, all the better.

Best,
Daniel

PS: without trying to complicate this thread, does one know idr.[ch] =
well enough to state
whether ida_free() could have gone into stdev_release()? The way the two =
idr_free calls have
been placed looks intentional. But stdev_release would look more obvious =
+ cleaner to me.
Was only starting to wonder while reviewing the err_put side of this =
patch.=
