Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D351140E2F
	for <linux-kernel@vger.kernel.org>; Wed, 22 May 2024 13:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716384558; cv=none; b=tC+1n6UbI6FAImyEqQDT1SGqf6DiKTAh6jeU4i9AkWyU2gq46CfdkuNNSpp6LM7zqS2dK8ly41EcWSQLgpLW9lewbUIlOzH56y/45TV5LAixmnHtl1A0fo+yZz+Dfe1jFy5bbnptGp/d1DEVBownpzGmSBMd04cs0hdomsbtzh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716384558; c=relaxed/simple;
	bh=61mO5+snMGsz2ee+TFdxLBoONuQxJeAcSO8S6crnAK8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=YaUm6LTRdodekJd7C2C6RHeL3hYRtkC1osMbaQwpCeitEkHhn2wOUOFIbVh6bjzbYWqTg4/8UOGM6fPa3NjVbjraGgdDJ1PD89w+yL9hNjFggC7FoM3Q+Q+xwQ+AHcKiG5a9HUzrYJvvK8+z365tQf+mquOdyQ9CIjrLFWPw2Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=eNfUi+JD; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="eNfUi+JD"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a5a5c930cf6so1009195766b.0
        for <linux-kernel@vger.kernel.org>; Wed, 22 May 2024 06:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1716384554; x=1716989354; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fcAnLjMIMbITY++kSDoM1eUoNeGeLxhIN5O6O+u3md8=;
        b=eNfUi+JD5hCg56yJHaoYPZ74COFIf6NnI0qH9nL6BI8IxXaugOw9AW3WDE/g7eQcPq
         RTx94BQ/2OyeqmBZKoYXaGYV3g5OCVoTPNNg3hzW4oFWz36j3evrjcYaF7mINHHgHdPo
         0/kzMaf4396YboZdIHbbKGcEAJW0lSVIbfk00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716384554; x=1716989354;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fcAnLjMIMbITY++kSDoM1eUoNeGeLxhIN5O6O+u3md8=;
        b=wyQo9BAFEyDuCUZP/wkADOlGVaccOnmv/o0+ygS1/up0uN3xol4hUTaC1y95JCL146
         qprywpmpL3pS8GL0SGuW2sPO4ujjTVvzSK3XV/eTP9Pju0JrqH7zGY4BLARS81Zww7bk
         5DBlXziriK8gujE661rcC0rTxPBJ/YbrDwpOdJwsacdW7S3JS+8WmX7Nk1PJpW4yAOhe
         jfkPbVGfs5HQrig9lz65FmZASIOiVJhx31dFkkqNUzX54iCz4wbDrlzurwOOFApWrhJ+
         jHy/rL5uWJOvyA8OW/puezjM1sDIwZGZzcV9SBQuZfjdmER/YhdoCPWKCBQAU6toEr7b
         WGhA==
X-Forwarded-Encrypted: i=1; AJvYcCWKir0dknH6Z0zIgoyn/K4VJ0HFCjBfHNk+yqlIPS9mWufwQJbMFWaVq0MBCb+yyF3Aee4T6mpj3GTuMptv252fASuvO8X9gyEnmWSe
X-Gm-Message-State: AOJu0YzE8pWLYqrKl4jki8I+lZuHeIy2oPKUwju14fqoZo4rBF74VTxK
	gnGS2CDw4del3TZfha5R7gEK7Ey8km2zlSLGFGG0k5ksprT8ZrgZiOyVl2Cc7h3VuXhHkRp4XqM
	kV2QNLr7mFhmVgDoLsid1DtZNF86T9T0DH7GeAw==
X-Google-Smtp-Source: AGHT+IEkcTSyEUkeYpXWY+h3epaoj2bcPKEEthTvq9ZR3Kgjf4O9kooRyINxL3rDCrzwmh3KjLFlaI17FCigLPEni+M=
X-Received: by 2002:a17:906:6884:b0:a59:9e01:e787 with SMTP id
 a640c23a62f3a-a62280a0e9emr136501566b.34.1716384554522; Wed, 22 May 2024
 06:29:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 22 May 2024 15:29:02 +0200
Message-ID: <CAJfpegu93nZEeEJhepnDhzHO7khEmXkP1UssKNErqXFFUw-8uA@mail.gmail.com>
Subject: [GIT PULL] overlayfs update for 6.10
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: overlayfs <linux-unionfs@vger.kernel.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

Please pull from:

git://git.kernel.org/pub/scm/linux/kernel/git/overlayfs/vfs.git
tags/ovl-update-6.10

- Add tmpfile support

- Clean up include

Thanks,
Miklos

---
Miklos Szeredi (2):
      ovl: implement tmpfile
      ovl: remove upper umask handling from ovl_create_upper()

Thorsten Blum (1):
      ovl: remove duplicate included header

---
 fs/backing-file.c            |  23 +++++++
 fs/internal.h                |   3 +
 fs/namei.c                   |   6 +-
 fs/overlayfs/dir.c           | 152 ++++++++++++++++++++++++++++++++++++-------
 fs/overlayfs/file.c          |   3 -
 fs/overlayfs/inode.c         |   1 -
 fs/overlayfs/overlayfs.h     |   3 +
 include/linux/backing-file.h |   3 +
 8 files changed, 165 insertions(+), 29 deletions(-)
