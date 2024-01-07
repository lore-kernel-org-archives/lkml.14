Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9CD10A0A
	for <linux-kernel@vger.kernel.org>; Sun,  7 Jan 2024 18:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="bStquiGf"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ccb4adbffbso11814901fa.0
        for <linux-kernel@vger.kernel.org>; Sun, 07 Jan 2024 10:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1704652929; x=1705257729; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s0prdEAj89MfCO6uINX9NF3GFv49wanD+YL5iJFREZs=;
        b=bStquiGfXB78TOKeTSMx6QP5PWm5mQgB2XAtLeCaNGkEJMxqJAfakmzbF2iMETpI8S
         Ga02jpnDeLrhIlGA3lFrFAdDyPLQumYYj2uqYlrLsvnUNc742Xa+PaNw9pbCJ0fjb2Yi
         up0yAiTAwkCqEJBkFDKLqFwQo2CdrAfyqQ3XU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704652929; x=1705257729;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s0prdEAj89MfCO6uINX9NF3GFv49wanD+YL5iJFREZs=;
        b=QxE4fiXQxggTBJALidNYmJu8s1CVz/mn+IJIgk1A80dfnlvWUwzpprYNwDZydjLQ1L
         YI5bubO5u8SZ4lRNzjscIuC03RSJb8KnbNRyrXijxBNmyb7JprnjFkjockbQthb79Vbo
         1rN5MGYpxSk3OUIQWml5dO+13+9UP4yneiwEXi5gdJyERKTbrAYPr2ZixVdGUIspWhhm
         ACyWgTsOOMZDgwI5yEsB/0PYScBV6EgaiFTCkFAu+Obv7NgjQvlPWVtm1ckfHbbFBmGG
         WHnLG1a4kS0J/GrXn3ezhsE8lPGh+68LoZNRzJZc3j6lVBjVbA+sXeGKoON8K2zqn5mx
         uHzA==
X-Gm-Message-State: AOJu0YzfIWG8ZNUeOsnlrPItiFCuirZEnqYQQgL5bpNECtXHFKexeA5l
	ucfsGdKVw/p0QIE1E++XyHHScF056MFEOjchMvK+419DXVh3yVsi
X-Google-Smtp-Source: AGHT+IHvZfGT0D8tK4l2i+OWCgwoTu9YSJE2Sp8QBsCEnxTt8tu6GBXEb5yqp0zr44OVeuvAZv3kXw==
X-Received: by 2002:a2e:a553:0:b0:2cd:50a7:12d2 with SMTP id e19-20020a2ea553000000b002cd50a712d2mr382671ljn.58.1704652929173;
        Sun, 07 Jan 2024 10:42:09 -0800 (PST)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id h26-20020a2e901a000000b002cceb7bd648sm1224107ljg.92.2024.01.07.10.42.07
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jan 2024 10:42:08 -0800 (PST)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-50e7d6565b5so1118925e87.0
        for <linux-kernel@vger.kernel.org>; Sun, 07 Jan 2024 10:42:07 -0800 (PST)
X-Received: by 2002:ac2:548b:0:b0:50e:7dca:7f93 with SMTP id
 t11-20020ac2548b000000b0050e7dca7f93mr823836lfk.77.1704652927542; Sun, 07 Jan
 2024 10:42:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240104185138.169307-1-jeffxu@chromium.org> <20240104185138.169307-3-jeffxu@chromium.org>
In-Reply-To: <20240104185138.169307-3-jeffxu@chromium.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 7 Jan 2024 10:41:50 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiy0nHG9+3rXzQa=W8gM8F6-MhsHrs_ZqWaHtjmPK4=FA@mail.gmail.com>
Message-ID: <CAHk-=wiy0nHG9+3rXzQa=W8gM8F6-MhsHrs_ZqWaHtjmPK4=FA@mail.gmail.com>
Subject: Re: [RFC PATCH v4 2/4] mseal: add mseal syscall
To: jeffxu@chromium.org
Cc: akpm@linux-foundation.org, keescook@chromium.org, jannh@google.com, 
	sroettger@google.com, willy@infradead.org, gregkh@linuxfoundation.org, 
	usama.anjum@collabora.com, jeffxu@google.com, jorgelo@chromium.org, 
	groeck@chromium.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, pedro.falcato@gmail.com, 
	dave.hansen@intel.com, linux-hardening@vger.kernel.org, deraadt@openbsd.org
Content-Type: text/plain; charset="UTF-8"

One comment:

On Thu, 4 Jan 2024 at 10:51, <jeffxu@chromium.org> wrote:
>
> diff --git a/kernel/sys_ni.c b/kernel/sys_ni.c
> index 9a846439b36a..02280199069b 100644
> --- a/kernel/sys_ni.c
> +++ b/kernel/sys_ni.c
> @@ -193,6 +193,7 @@ COND_SYSCALL(migrate_pages);
>  COND_SYSCALL(move_pages);
>  COND_SYSCALL(set_mempolicy_home_node);
>  COND_SYSCALL(cachestat);
> +COND_SYSCALL(mseal);
>
>  COND_SYSCALL(perf_event_open);
>  COND_SYSCALL(accept4);

Move this part to PATCH 1/1, so that it all builds cleanly.

Other than that, this seems all reasonable to me now.

                  Linus
