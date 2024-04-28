Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF629EC3
	for <linux-kernel@vger.kernel.org>; Sun, 28 Apr 2024 01:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714267085; cv=none; b=JIoIMnwVInthzBGnmV9kzJDcO3WukPNzP9kfTwnU4KGWs7iFvg+pmB65E31Z1K7ANTbIjxKGSnPn3ghxvUkJNKOMKNMvOzsWGCgIYkryt5I9TRI42YnV8IhkOQjhrddEL9hc6bXBFAz+me98mfeRGlUqlKSFxO0bRCt5HVfkesA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714267085; c=relaxed/simple;
	bh=bsGjHWGiuQwbJMxlFQ/Kb90M+1DSE4UTR7NZyFeJ0n4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pBTY6ZI6HnVFYS6UIlvJ8K1sBT8e/HukCsAXiRyxCPFjHgFjCAOsBjuMHUBEt+NnyF0jjCZm9omAl92X3GHzUtnWgSAs9H6SipM9v2NDzCX1H0pF07U/R5JW+IuAK3PzDTUMPVsXenP33xPGQy3Yynj2KDhDaHR0KOm6Cg9f4ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bqeBx/6b; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bqeBx/6b"
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-7ec609bd752so1108438241.1
        for <linux-kernel@vger.kernel.org>; Sat, 27 Apr 2024 18:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714267083; x=1714871883; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BXxvAE4jb4NmLMDJCW8o/zRswMP75gqhLg59Zk222wk=;
        b=bqeBx/6bTfPGSBD0MfypC1XB88kKw3QG+kgxJbgAlZEAL62yjHPpeldKBx7OBbNqE7
         dB1eWaTkb6WOlkLx7KC7S6Nkc8BMGy/IwyFLVyvY2OQL2o4vdtvplerbyZaebsoA5/nj
         v0KJj/gU6Qs+eLyHP6paUJff0rWt3ef+DIsPhwg9EqkCT64PyTBcML1AIm8HbSKK0nBz
         1PJFhfjf/RRcHJx24odZWrs9HHtFjEPpGk1LsnIEQoIwvYHuLkCovUpfgGFuXPDG72/B
         d5MKk6uzQkuiasCkb0kCjvPG909Xv5xQEo9C5guSabZ9cgVQQvtrsoVVlRMhniamNW2/
         YvLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714267083; x=1714871883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BXxvAE4jb4NmLMDJCW8o/zRswMP75gqhLg59Zk222wk=;
        b=jXkOXuAvLRs4TOXxOKIc7xPZ/JtF6ZSUTbo+99WYZNJLR8n0s1h4XW3NAFENttckIa
         T2NFGjz4/jr2d4JR976brbSY3GrtgMGIL1xWXwl40w92zPbY3q6OkxR4QXujIIj1cLP+
         RxuU4VaroBVvOGPO5wQ/K0a0I47TcmvLuMWPlhaSlAaWeQsy6RJFeOVgvr1dqNgEc2lI
         40YgGG3F9ZxgdaEsdKAmMv/dd19LFV228Vt5vWNogRBA3hTA7jiNmj7N6e39BRN2e/5R
         3fXDrrHaC6/aw3mDytj+NNPQxd62ZduOtm+dUbIxFnSIeHJmnexXO/u3SLgtPWOlzAA/
         gikA==
X-Forwarded-Encrypted: i=1; AJvYcCWPbhENlWl8zvAQCX+PNZQr8Qr3mbEf83FskHSyTfyruLVNEwVyyQwbQAki9uZyWsrzRu8ndAHoJE7NugEmRhMMDp90aAR4BX4OOQeB
X-Gm-Message-State: AOJu0Yw5GaGIFJv/G2LGPMNHFX8jYqEHJkPDpZTpGhOKizqT0KNivD3/
	mtqoNQOyxoenf7aner1QJQty+VvPRP0f/0F5XIrj8mvitcuN/R0fbHmwesa0/ndsaE47IKSvAyk
	HNu5cZ3ODoGSe3wprQs2xiWz/wX/SNRh0
X-Google-Smtp-Source: AGHT+IHLLYNhELW9RrEUPbYDw5MUhQnnNGWG0z01OgzlPT+VWZzcw1VDRhtrI9kakICp237armhjrbq81XWhs1hUTec=
X-Received: by 2002:a05:6102:c8e:b0:47c:f0b:5347 with SMTP id
 f14-20020a0561020c8e00b0047c0f0b5347mr8739370vst.16.1714267082779; Sat, 27
 Apr 2024 18:18:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240428011236.1008917-1-chao@kernel.org>
In-Reply-To: <20240428011236.1008917-1-chao@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Sat, 27 Apr 2024 18:17:51 -0700
Message-ID: <CACOAw_yY7A6c99p+df9aKf5ZznndfE3wbSVa6w0_41NkmEWO0A@mail.gmail.com>
Subject: Re: [PATCH v2] f2fs: zone: fix to don't trigger OPU on pinfile for
 direct IO
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 27, 2024 at 6:12=E2=80=AFPM Chao Yu <chao@kernel.org> wrote:
>
> Otherwise, it breaks pinfile's sematics.
>
> Cc: Daeho Jeong <daeho43@gmail.com>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v2:
> - fix to disallow OPU on pinfile no matter what device type f2fs uses.
>  fs/f2fs/data.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index d8e4434e8801..56600dd43834 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -1595,8 +1595,9 @@ int f2fs_map_blocks(struct inode *inode, struct f2f=
s_map_blocks *map, int flag)
>         }
>
>         /* use out-place-update for direct IO under LFS mode */
> -       if (map->m_may_create &&
> -           (is_hole || (f2fs_lfs_mode(sbi) && flag =3D=3D F2FS_GET_BLOCK=
_DIO))) {
> +       if (map->m_may_create && (is_hole ||
> +               (flag =3D=3D F2FS_GET_BLOCK_DIO && f2fs_lfs_mode(sbi) &&
> +               !f2fs_is_pinned_file(inode)))) {
>                 if (unlikely(f2fs_cp_error(sbi))) {
>                         err =3D -EIO;
>                         goto sync_out;
> --
> 2.40.1
>

Reviewed-by: Daeho Jeong <daehojeong@google.com>

Thanks,
