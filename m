Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467E15FEED
	for <linux-kernel@vger.kernel.org>; Thu, 18 Apr 2024 08:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713428523; cv=none; b=ICusRkvUZq8dCk7i20mMQHgZGgNC5LIPQcwu7w/yr3ru0492uMkriPxZ5bHrIRkXndX+WNvOoDlmL4uM7GIJZUId1GXnoH7xwuFTfCKspHPl3FoqVO/OiPhaf1FzTaGZbUiSvEhSK0NKZcSwcJ8gsGfh4A3yZEq9Fn82Hy9gOgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713428523; c=relaxed/simple;
	bh=0ZDj0G/BGIyYtXLBhUWNKzrpPYx4AB0yhF4/Ou7P5iQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X2BoR9O0/4nwbdN9m5925ZAyyGqCEvkiq9VLW+mlA1fHBGmQQE12Yzn2Jjm6M8jbXCncAlJuCWV+Tc/ZbgHyezQKeJC2juq/YIYrdZBL17p5A+TXSvOGL3REV957aY/jL6D8HJijbHuKkuVoE6dOYGnf1yUj80tFtKttNWzq/Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=C2RmqyBv; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C2RmqyBv"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-7e978e12390so176184241.3
        for <linux-kernel@vger.kernel.org>; Thu, 18 Apr 2024 01:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713428521; x=1714033321; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K+8bkpMeAf9u6G5CwH+yaUjM/yOhNANN61v8jzel8hY=;
        b=C2RmqyBvS152diBHytk9gbTz8/EKx7MaL5kJ6nTgOuK9spFSaKJj/8Hwz/UZtJ+Qp9
         EAl+sWKAM43Mqm4ZEEAOfAwqLW+FbjkE0SK1T3biqqEh2chJJf+wEx9wVDpQSxse3s48
         +MRT2nO4Xov3W2hpzRVIycUbfXrzpPIpSleksYLzdvxV9w+TNHPuYfedJiqy66e8qNwM
         aKlwAJwyG7PMNJDjNDYZEC21Gmb017OriCzUimLQgWQkZbaxuwZnfndmEtDjDPq2HgYK
         usGrzBbF3DICgYcPiDtTgp6IwBP1E4QBcpU2qiMmEHvq9mKTsKT3LKERxJIvAShsKeN1
         Ds5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713428521; x=1714033321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K+8bkpMeAf9u6G5CwH+yaUjM/yOhNANN61v8jzel8hY=;
        b=DtFX84DfD/JqHlGbUz04afGXTexf84tw7mkDsUdgQ9+GYnnRNLTKIL+CZLwdC5o1ob
         kuy1cXApXFkEQ8JI8C3ACOa52lrZSK16er/Rf/JZniW8TdFFbF6eIUKpBKp9APaEAI/l
         dnaio//IvoEewKK2Yc9RZezw38E0bMK0jPaC5YyRZB/MHNplXoKS7TquiCMPivYh1ezG
         tQRZfvyuzjrwfXG4WSsoLM0OseAMdElhvRdnxmxhh7VAQB9EpvMNVpZH3/IgkA228yfj
         AiWVjQgMhQ7ojbdksciRVPhuVvll/3oG4v5mg4btCqan0Cy2ZhaU3PlnhXHLGS5AdLte
         Q+Ag==
X-Forwarded-Encrypted: i=1; AJvYcCWspGQMCjIwhIFGBo4B6XKFvW5HwUm1CJpgIZ1x14OfBs2xAnH+a1LW9IOfF7yIsW+s5pqBka6IYmdVWXJLoxCV1BMEXM1ChCC3nCoF
X-Gm-Message-State: AOJu0YxZ5HxEpvr3MaOgppo7H0T4P2fzRLHdwaSBfnPXwjN5SFl3qxmX
	1CYnGCpBE6t4r1exYsXMp7WokHrPZUQvC+lfwKsEeUs91ORrU4Tb6brL1w5+epBrgYP6bgd9B2O
	YebeGQbbrqt6WeC1wLcT7yn9Z1mjHao8HekmS
X-Google-Smtp-Source: AGHT+IEUOJTBAR2iL+ELdgsREv5GHKjxwTtv4asZUy+RiErrHbJm524xwjfu0xd/Stgxsku30/Zgd0S3nI7G/Bxbn8A=
X-Received: by 2002:a05:6122:208f:b0:4da:9aa1:dd5e with SMTP id
 i15-20020a056122208f00b004da9aa1dd5emr2606088vkd.10.1713428520877; Thu, 18
 Apr 2024 01:22:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240417191418.1341988-1-cmllamas@google.com> <20240417191418.1341988-4-cmllamas@google.com>
In-Reply-To: <20240417191418.1341988-4-cmllamas@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 18 Apr 2024 10:21:49 +0200
Message-ID: <CAH5fLghRmYFLa-ag9vo4vv_P281jXGFfsDFyGq5pk5g0PUXtUA@mail.gmail.com>
Subject: Re: [PATCH 3/4] binder: add support for PF_LARGE_HANDLES
To: Carlos Llamas <cmllamas@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Christian Brauner <brauner@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Tim Murray <timmurray@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 17, 2024 at 9:15=E2=80=AFPM Carlos Llamas <cmllamas@google.com>=
 wrote:
>
> Introduce the PF_LARGE_HANDLES flag to enable the use of monotonically
> increasing counters to generate handles. This improves performance in
> transactions when dealing with a large number of references.
>
> The legacy logic performs an inorder traversal of an rbtree to find the
> smallest unused handle. This limitation is due to userspace using the
> handles as indexes (e.g. in vectors). The new logic scales much better
> but requires userspace to support large handle numbers.
>
> The benchmark below with 100,000 references shows the performance gains
> in binder_get_ref_for_node_olocked() calls with PF_LARGE_HANDLES.
>
>   [  167.855945] binder_get_ref_for_node_olocked: 17us (flag on)
>   [  237.088072] binder_get_ref_for_node_olocked: 18178us (flag off)
>
> Suggested-by: Tim Murray <timmurray@google.com>
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Carlos Llamas <cmllamas@google.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
