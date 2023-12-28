Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0521095F
	for <linux-kernel@vger.kernel.org>; Thu, 28 Dec 2023 22:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iUTI1ESZ"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4279c2ada00so1572461cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 28 Dec 2023 14:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1703800892; x=1704405692; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B9iLz1qExh8jOY0KccJqlCpjSYXXMCvG7v66ldMC2Rc=;
        b=iUTI1ESZQtj+ItC0lgvWaJMMVegBaNmJghHgI8+CZ26UyeH87zECE5/iq6oOMuRdsz
         LtZtfeZRIIcGd3v7ytW5pazAaN0PHPSK5PY07iGuvCKjScae7QtMp5TpPGDYBlsA+5Ib
         DHpF7oZoruQkXbvtbVzMrY5AJpdC9gK+njSJnDazidTdRIi23igulSrXXh9IbZ7dw3fl
         /OV4S8uSjnbF6WDbyGt42uU+x4wjP21xIvxfk08gpL4mTXEXdtxZ2Rt90i2StlMyoZcI
         WRJzhcFuSYhdaYoMB0YHlMYc0hEYZru6bKzdeZDOngpYY625fFdxCqK4CJhmElVQcrHd
         k7SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703800892; x=1704405692;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B9iLz1qExh8jOY0KccJqlCpjSYXXMCvG7v66ldMC2Rc=;
        b=ttxsPoKBF8TZMZfIgLN8n5DUG+HfzrpAaYaxyq81UYbJV/2yZ/0+3cEF5p9sKshUBR
         M2rh8PrB6rhP8BkusnKMsq6xQPz/OZPhDGb519ZaKRik8OXLPrs/4jLz36yv1Pgpy1N2
         ZccQNjcUBMwhLX3pnps+GcJScEEQ4rnCNrP8jowijiZiRE5cBKv50M1v9qVGm2T6uhlm
         MLhV12IsmAl3JuHyS3575NKQ3ceUKjC+jS6q8aN3RMu+09fBLGgyr/2KqAssB8VMiiLF
         C4AVfADV+sQo8Mc1HxP7/vMZkXLndfQn5WEqPTRPeiecuEkaUe0yOYjbt42gqHykmHx+
         y4XQ==
X-Gm-Message-State: AOJu0YxbMI8QlVnqjJ+jFsbWErMEuQbXZQZ1GRO7WuE7tWqi4eaJDYoH
	/QKZg0vsO3tWOpjEPEtL28YgkBklERn2I1ECo+oIQ+uHEI++
X-Google-Smtp-Source: AGHT+IHjAASMo6HzHAzKdZISJhtS/pYGoNbxXDW9Ml1LOCJxXfnARL611hNUWxYQSATRkXlFJp0GYF3N2MkZ0L6kHTs=
X-Received: by 2002:ac8:5dca:0:b0:425:9957:5fd7 with SMTP id
 e10-20020ac85dca000000b0042599575fd7mr908328qtx.19.1703800892342; Thu, 28 Dec
 2023 14:01:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231228-extable-v1-1-32a18c66b440@google.com> <20231228212511.GCZY3nt3gKI+aDvSF1@fat_crate.local>
In-Reply-To: <20231228212511.GCZY3nt3gKI+aDvSF1@fat_crate.local>
From: Tanzir Hasan <tanzirh@google.com>
Date: Thu, 28 Dec 2023 14:01:20 -0800
Message-ID: <CAE-cH4rEWU-+ovwo8_-i3b2F8pK17kORJ3gV5tnjnUpRJA+B0Q@mail.gmail.com>
Subject: Re: [PATCH] x86/vdso: shrink vdso/extable.i via IWYU
To: Borislav Petkov <bp@alien8.de>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, 
	Nick Desaulniers <nnn@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Boris,

> Maybe I'm missing something but this sounds like the build-time
> "improvement" is so minute that you have to look at preprocessed sizes.
>
> Do you have any, more "noticeable" numbers to justify this churn?

These changes are mainly targeted at reducing preprocessing size which is why
it was brought up. You're not wrong about build times. The changes in build time
are small. To build the original file as is, it takes .69 seconds on
average on my
devices. This changes it to be .55 seconds on average so ~17%.

The intention with these changes is to add up the impact of these small changes
over time to improve build time and also use more direct inclusions where
possible.

Best,
Tanzir
