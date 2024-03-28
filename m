Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B72912F59C
	for <linux-kernel@vger.kernel.org>; Thu, 28 Mar 2024 14:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711636305; cv=none; b=rvXYFvyFrtXftWn0xVpRkMnkCM0Dg1XhKdHnGI9ko7OJpnABRze2jdhDvAAK6P0IBjqMcnfVwg6lJZbpzzhB401x8op6fWStgdFD37HM5tEU+zpn4U/dwGPXSw1QrT7+f0SOEl9zDBvfm5KMIvZQrXYWCFgWQZ5KJvf4hqJiZCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711636305; c=relaxed/simple;
	bh=5O+TwBZvRG0k8j6e/UUWYU5Cujug21yG+d8/Er2szuY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NEzs13cCnaYDNo0TdnnTqZ/i8+5rBnSvh2JfvJUH5PjjDjN4MRtG5q7L+cVRk3OkiLy07SUAejWI02uAVAoPTBr9xJ/xiWt/bzaq7PIy0vYuP3zhZVVEd/XfkgPqnQbZgLzOsKKks8CBMol1IFDLO045ncZ7lhrmSJzb+F/8PE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=a6Nvosw3; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="a6Nvosw3"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-430dcd64e58so5738221cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 28 Mar 2024 07:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711636300; x=1712241100; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dYgQMPpl9MqgJ6pOUKLRybn6o9k2/c6Xhse3GpUhIos=;
        b=a6Nvosw3YoWjlnnQZymqabw+hTGlQWqw95PPII74pRtfWe73WjY7nqqpg71tvdTz6V
         xq571aprOiRjaaOGpgLPLUc50zUqPO1xGppQaLLLOVSLtQpl5d764SYrwdhqYY5ai1vx
         HSe8m6QXiVBIhrGpk+N3M6TP12ubk3UokQUSw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711636300; x=1712241100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dYgQMPpl9MqgJ6pOUKLRybn6o9k2/c6Xhse3GpUhIos=;
        b=GSC1r14bWzmsomYT9yokkt91rO0Xium2Dgk8KpwRzhnz2XZFSBHgeLni92LoMG+bRI
         29XKnnSMBZAnLFDY+z66u/Q+/LhnQJT6fkIfKGUh775TxhQsikHQzPNqWH+ECZp86Voe
         nfLuxBwHUSdrOWMUP9W++kmRGKW7s+F0Mno9XQiNhU0IerLDS5oewb0ZAcd0ZhURX+xX
         A6Wn4XcLZKSM9+mqn4LttLRyroOkJY39oa2ROaC9dMol3hYo9Y9rinhCx95rWX6SMqgV
         Dc5WYSkZheX+nFBsrybVLSFg5ZqqIsd4FuLc6aPHnYqfwrcb3Yit8w2XdonN4fIK8bBr
         siVA==
X-Forwarded-Encrypted: i=1; AJvYcCUTFsMQ+boTNZYkqi0QQCLh3ze8xcZxhfr1+BNhw9px3WYFBvY0BoyApu4m3nbxk82/fO7iHTg841iTgFZcLVUlhPi60Kfouv5pY7QF
X-Gm-Message-State: AOJu0YxOL+5+Njkxxjlc+Z0AH2c+/kAdQajS+SyekJN+LnyJSRrNtAUk
	3y0LNWKhDtgqbKATxaB3tWybSjPSTQkiCD1MqAuSaSdnBfKH0HsTh1uWfwrycygv/JuUE37Tvo0
	=
X-Google-Smtp-Source: AGHT+IGjNV6jGm1aSB88QCHwfCg7Yt8wn94LDKvrLLDZIYs0kfUo3gxGGZyvPWPtRSDHWzPFjo+CAQ==
X-Received: by 2002:a05:622a:c7:b0:431:1ed2:b246 with SMTP id p7-20020a05622a00c700b004311ed2b246mr3485965qtw.45.1711636299765;
        Thu, 28 Mar 2024 07:31:39 -0700 (PDT)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com. [209.85.160.179])
        by smtp.gmail.com with ESMTPSA id er7-20020a05622a5e8700b0043153615c82sm669372qtb.37.2024.03.28.07.31.38
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Mar 2024 07:31:38 -0700 (PDT)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-430d3fcc511so304851cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 28 Mar 2024 07:31:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVTjhPc+hekkx3ScNZ+MzUKc8/AI2VA3JaIBDq2jp/Rn8AqlqaNmWMpAgGD1BH2gWIoOiQH3gfOY5sN5TXJ+T5mdAaANrh67spFUuQJ
X-Received: by 2002:a05:622a:5b8c:b0:432:b4d0:ab2c with SMTP id
 ec12-20020a05622a5b8c00b00432b4d0ab2cmr192920qtb.1.1711636298118; Thu, 28 Mar
 2024 07:31:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240328140015.388654-3-thorsten.blum@toblux.com>
In-Reply-To: <20240328140015.388654-3-thorsten.blum@toblux.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 28 Mar 2024 07:31:24 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V3Cpo38ss1nFvPMbXadaXXpVuN5jdfUKZS4ngDLQX_wQ@mail.gmail.com>
Message-ID: <CAD=FV=V3Cpo38ss1nFvPMbXadaXXpVuN5jdfUKZS4ngDLQX_wQ@mail.gmail.com>
Subject: Re: [PATCH] kdb: Use str_plural() to fix Coccinelle warning
To: Thorsten Blum <thorsten.blum@toblux.com>
Cc: Jason Wessel <jason.wessel@windriver.com>, 
	Daniel Thompson <daniel.thompson@linaro.org>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Yuran Pereira <yuran.pereira@hotmail.com>, 
	kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Mar 28, 2024 at 7:03=E2=80=AFAM Thorsten Blum <thorsten.blum@toblux=
.com> wrote:
>
> Fixes the following Coccinelle/coccicheck warning reported by
> string_choices.cocci:
>
>         opportunity for str_plural(days)
>
> Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
> ---
>  kernel/debug/kdb/kdb_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
