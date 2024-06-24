Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B9C3EA71
	for <linux-kernel@vger.kernel.org>; Mon, 24 Jun 2024 07:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719212608; cv=none; b=WXTla44NQp+01u4neyclll50irLiOPCRR0LyDHxvJhRazqHetIceMM3JfgMwzbHwm4xKxaBTbtKSJ5jE2K0v6iRYqWgId1xF1+Lz42etxZme8+hM3tSapMg9+HZu/N0I0/lunMpyMd0H7c46cWuAZ0bOHCnEhi0KtTSA6vZpnlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719212608; c=relaxed/simple;
	bh=OhbeKU5PGmC3rJg9eOX/nttNp9XdCEMiMzC1dugWFm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rOxbqwuG+1bU7mcMAUTM3PtYbMOvKDr//8mLVkVQbHWAK6Iwz//y5iIems1I/JNyTi7d71TFoBJ7Px2w66mOpfLEZ+/OM3uvUxuu5MOBxaNb+WwrVe2wRDx13fiOcw+NBZem2dNA6BEBSBEwTBavbRLCzTTEuKGFXcbMhTCwZwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MvpjzQm6; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MvpjzQm6"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-80f50f01b32so2599181241.0
        for <linux-kernel@vger.kernel.org>; Mon, 24 Jun 2024 00:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719212606; x=1719817406; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ke6A02wcwTzqEfBmxWsw7RF5epZb5Ch9DOCFjfy+RV4=;
        b=MvpjzQm6YlQRKQIjxAy1fiLD20FdNwbKwC53qrEaQmj1fQ0dSgFXuTHGQ0Yc20ZJPT
         Zv/K+sB6zyHu+UXql8GSvsQ7V7nfxcFnheKWJXfl/0yGovaVkV6kOrrd4NzO1Vk+2Zmx
         8ZH8kjbCNfqgEgtEPcspz1kBLEOcRSmiQpb8CXmBa04UAj9QuEwwm+s2ziPKEzImgfOu
         Tu+iXMQpoQ63AlrB0rdV0HwMRjPV4PcBs4DpzCRVFP8u2UlEGSDw2+gp01bpc4kVN4Xu
         NbfpS+ObEz8zttpW5DQhZE5baHSQqBXCiIhEbJIM2YR9qGqC7FuLepFqgQLkQZddEQSs
         GJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719212606; x=1719817406;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ke6A02wcwTzqEfBmxWsw7RF5epZb5Ch9DOCFjfy+RV4=;
        b=sCeU7RZo4AZi5KtjsafySFSlpORLi18s4BdggRyOTP8XLSN2buYsttikSkdqbXru1a
         tLzdp6dclByNvXSztOA4GSIi9IFB/fogrAfVOKeTRHe+jTJaedHJFeijaypQO2xMp+DE
         i1wIWSW0s1nmm/4bqxCoPOrCuLXf46VdqFJjWHXMiPAG9+dUnzmUKCwxkKlTXnMDRA5f
         DpIPz75V6ZxhslvM+OUsMAEofSQ6N6oNEd8Ileo0l7wNE95cNLAg5F4dm1GQfhnza9Pq
         ueXH7ln62J6UvcoBgmZcKT1Cxovt1+X4zY3KJKQTNmn9bG+W6OWBNQSR74KfEKdRqrGv
         RezQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYt5nPUSpVolRmCGZvzFAkvtM8FLDSyDJ9yBxqO3oioE/VsSF1lgEvlAOXsk6V9ZTTxmC+LmdvxO+UmqiueEo8GdsV/AigVLRu27Wf
X-Gm-Message-State: AOJu0YzZvsxc/4QArvGRXg6XNGSfVD6dD7tpF9YwqBx7YOySlsQTKvIx
	9OGhujofwTA6GFiHdL+7Yw07/5j88pcW9hrq6valBWqfZBx+m3NRkvY/Q9durLVOcSQrtW3i/8a
	/0/k/td3C61eSYLZ7sIJoj0JkfdFiLuD4fiid
X-Google-Smtp-Source: AGHT+IHpfm6RC7tXo0O5T5QYMOGZ1SH6K1uKjfS9LqWVpO/D4pKQ5wScg6LnE5FxK4R/j1+jX1GUqT0+qNb7uwF5RlM=
X-Received: by 2002:a05:6122:2224:b0:4ef:7292:4eb4 with SMTP id
 71dfb90a1353d-4ef72924fd2mr1178515e0c.12.1719212606035; Mon, 24 Jun 2024
 00:03:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240623220606.134718-2-thorsten.blum@toblux.com>
In-Reply-To: <20240623220606.134718-2-thorsten.blum@toblux.com>
From: Marco Elver <elver@google.com>
Date: Mon, 24 Jun 2024 09:02:47 +0200
Message-ID: <CANpmjNMHPt7UvcZBDf-rbxP=Jm4+Ews+oYeT4b2D_nxWoN9a+g@mail.gmail.com>
Subject: Re: [PATCH] kcsan: Use min() to fix Coccinelle warning
To: Thorsten Blum <thorsten.blum@toblux.com>
Cc: dvyukov@google.com, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 Jun 2024 at 00:08, Thorsten Blum <thorsten.blum@toblux.com> wrote:
>
> Fixes the following Coccinelle/coccicheck warning reported by
> minmax.cocci:
>
>         WARNING opportunity for min()
>
> Use size_t instead of int for the result of min().
>
> Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>

Reviewed-by: Marco Elver <elver@google.com>

Thanks for polishing (but see below). Please compile-test with
CONFIG_KCSAN=y if you haven't.

> ---
>  kernel/kcsan/debugfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/kernel/kcsan/debugfs.c b/kernel/kcsan/debugfs.c
> index 1d1d1b0e4248..11b891fe6f7a 100644
> --- a/kernel/kcsan/debugfs.c
> +++ b/kernel/kcsan/debugfs.c
> @@ -225,7 +225,7 @@ debugfs_write(struct file *file, const char __user *buf, size_t count, loff_t *o
>  {
>         char kbuf[KSYM_NAME_LEN];
>         char *arg;
> -       int read_len = count < (sizeof(kbuf) - 1) ? count : (sizeof(kbuf) - 1);
> +       size_t read_len = min(count, (sizeof(kbuf) - 1));

While we're here polishing things this could be:

const size_t read_len = min(count, sizeof(kbuf) - 1);

( +const, remove redundant () )

>         if (copy_from_user(kbuf, buf, read_len))
>                 return -EFAULT;
> --
> 2.45.2
