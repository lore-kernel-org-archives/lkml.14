Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B0CAD4E
	for <linux-kernel@vger.kernel.org>; Thu, 16 May 2024 02:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715827485; cv=none; b=sJkd29OIlJOa/KLypeatf7czB+Ldx7lYPJ2DuziWhL/CV/edfkxnf1wC4mGt3h8pb6j6DQlIYKUvR9tsJffbcagzyD7jwqDFOVL18cpNaEIkhfwtv/GZ1RWi2OHcoy4/PJTVvhPAFkj7Nhw+C68/cn8tDAsxXW8/PwrP4DjpFvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715827485; c=relaxed/simple;
	bh=kGxOV3wnS+g16tgOJzMj1a3n3g/6Jdh9v3a/SW6PknE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pn/kuSbO2RPbJmnTW8hCArBZagLkTl4O5Dv4N/fiYWCwbF0Zt9AW8Cx5a6W8FnVa0kcxjQ+k/Ros6fJ+fNl1PJLSvaXL67n6yp+GiEsAokUcM51T7MhxjVBDuGW8iwMN2kOOFJyzbF8jdE54MtFRpCwzPQkf6ZGhfVJNITgY1IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=E3ylK4wl; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="E3ylK4wl"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5b296194ac1so3306786eaf.2
        for <linux-kernel@vger.kernel.org>; Wed, 15 May 2024 19:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1715827483; x=1716432283; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGxOV3wnS+g16tgOJzMj1a3n3g/6Jdh9v3a/SW6PknE=;
        b=E3ylK4wlMkAJDRK7xCoI1Av6x/shba8g7TrWaNGkNKy6wThCQstM4FMvIa71aheVnI
         yFULiv2hJ9xJun6Laj9Xa5kKNAt7+k3OJDnR3Xk9UL4i4Bd+iMcdQ/1JrqAAjqtvYyJt
         bWyogpCt8J3IO2nVOeN4dUSUMSdsnE8JEnjS+s9Nru7Ilxqk6Ry3878N9TodUevRlUjl
         OvGC0eHCWaIJu5RmA8waJsCir7dBUVZ5eQOXlI1DCGduQ/nWTLRe8wB0wnsXMj4OHeA5
         kGfLQ9abG/ncy6+dINvJjJNEez2Yh6BW2pgKyApyY9AAwQsXGTWnv/QN7v7QYAuqHmCV
         hhSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715827483; x=1716432283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kGxOV3wnS+g16tgOJzMj1a3n3g/6Jdh9v3a/SW6PknE=;
        b=Kro9LyqP1tErAJrtOU+r/QOVuSoGQzZ8BQAoEymd6pd4AUPIdV1ba97TW8AFcU2ILp
         ZrddKE5paSUObEhPogkiHr703RyZag0V1UZM5HHI471rs0DtfeN1Di5rZzsrSmwGYGH7
         uOO3hmFG7bS8UErMEaHdUQNYpwvEgitLK2voym29szVa9VuCgU6KYvENDIFPa1ftl4Zf
         9ZkHJzDEt2ErjPKv/ghTwpeMK55ntlxPd6/aYjwszOtY8AVy6RMFvqED4jGFeZgVm08b
         UP/JEwz8SlVTObonNooBAfY0LBXx/ZFxowjQTsHg+WjrvismnHaD69rQ4p/Y5XKVdo71
         u7zQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNw/tlckCbGlfE5P4noos1tLVaJA6fr4SkUz/QNINFj9M3TYHyb2OP+9Wxzi7lHEFkIldLHcUuphmEv3/xsiUH43bHJR8i/HttpTf2
X-Gm-Message-State: AOJu0YzL3x/IR+W3B+M0sqLRKDwaf+dLtTXfsX9VOmOi02DnQdkTf7iw
	25W/WERb5oYbjK9PV/i82uHvbJHMX3DifJ8bN1VzX+4fNril04dbEOjgpaB+mUjecXw+Pv48qqx
	P2FA7l63uZMXfLUbKoukfm7151Dzr9souKY3clg==
X-Google-Smtp-Source: AGHT+IE+AorXjKiDhK6gFlMN5F8GI0I/gxP966lZSFfLKOiXPDnBZKxKMe4kgkVyKv3bdhlJJbDGdmSOXBhj6AdnN88=
X-Received: by 2002:a05:6871:1ce:b0:233:60e7:52bf with SMTP id
 586e51a60fabf-24172fca296mr22838572fac.50.1715827483168; Wed, 15 May 2024
 19:44:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240509073300.4968-1-cuiyunhui@bytedance.com>
 <20240509073300.4968-2-cuiyunhui@bytedance.com> <ZjzrXnOc5AAost4O@bogus> <CAEEQ3wkHc-EaRPKLivZoxO6jKXv9bigbYhacWouL7+KbgbwWpQ@mail.gmail.com>
In-Reply-To: <CAEEQ3wkHc-EaRPKLivZoxO6jKXv9bigbYhacWouL7+KbgbwWpQ@mail.gmail.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Thu, 16 May 2024 10:44:31 +0800
Message-ID: <CAEEQ3wkpKHryCcNXpDXCi5tsfz2ryc9y_7JbvREg3D2MMic2ng@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v5 2/3] riscv: cacheinfo: initialize
 cacheinfo's level and type from ACPI PPTT
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: rafael@kernel.org, lenb@kernel.org, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com, 
	sunilvl@ventanamicro.com, aou@eecs.berkeley.edu, 
	linux-riscv@lists.infradead.org, bhelgaas@google.com, james.morse@arm.com, 
	jhugo@codeaurora.org, jeremy.linton@arm.com, john.garry@huawei.com, 
	Jonathan.Cameron@huawei.com, pierre.gondois@arm.com, tiantao6@huawei.com, 
	Conor Dooley <conor.dooley@microchip.com>, Sudeep Holla <sudeep.holla@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Palmer,

Gentle ping ...

On Fri, May 10, 2024 at 5:09=E2=80=AFPM yunhui cui <cuiyunhui@bytedance.com=
> wrote:
>
> Hi Palmer,
>
> There are already related Reviewed-by, Gentle ping...
>
> On Thu, May 9, 2024 at 11:27=E2=80=AFPM Sudeep Holla <sudeep.holla@arm.co=
m> wrote:
> >
> > On Thu, May 09, 2024 at 03:32:59PM +0800, Yunhui Cui wrote:
> > > Before cacheinfo can be built correctly, we need to initialize level
> > > and type. Since RISC-V currently does not have a register group that
> > > describes cache-related attributes like ARM64, we cannot obtain them
> > > directly, so now we obtain cache leaves from the ACPI PPTT table
> > > (acpi_get_cache_info()) and set the cache type through split_levels.
> > >
> > > Suggested-by: Jeremy Linton <jeremy.linton@arm.com>
> > > Suggested-by: Sudeep Holla <sudeep.holla@arm.com>
> >
> > I am not sure why you have not added my reviewed-by as I was happy with
> > v3 onwards IIRC. Anyways, I will give it again =F0=9F=98=84
> >
> > Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> >
> > --
> > Regards,
> > Sudeep
>
> Thanks=EF=BC=8C
> Yunhui

Thanks,
Yunhui
