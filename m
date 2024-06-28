Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04921BE852
	for <linux-kernel@vger.kernel.org>; Fri, 28 Jun 2024 15:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719586916; cv=none; b=OXgsD+m3w6drdjeJ/cWUTp/GcpoVUDFi8X7wwaWs2fiOfZspemTkcAwmBCejOYzrXehbw24c7DKhrbhIvyEcbmgZkNIIW9OBYjhOjxrxqzzPucd2iBQv6dMcxji9wMpGIB9u9PdAVaG2VcoBofjl/6Kw+lbbvzf3bFgFZnwSoys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719586916; c=relaxed/simple;
	bh=5AM+ks3kbuAODFXCbuJgrzHkfUbhDJpA2xaseF4KDew=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b/sQ5tUbVAcGsEpD1NZ9Obo50vu5HxgNk9tq1l5wla30JlCso2FJj+4k4EG4ZdFo7MvhCJ+tLyrbsqbtHP4wjCrnYvqUKCjf6HsBwMZYUIP6g6xJmUlor9gDdJ31eX26GLMhuIIGvd9dx02opsaYERYdAVZ+L3WtT0klsM3adlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wK1GDIo5; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wK1GDIo5"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-444fe7e9f11so273671cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Jun 2024 08:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719586914; x=1720191714; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pV4F7RdKKxqX+CEk9cel20GI2s9HbIhc31hrc3gEuKM=;
        b=wK1GDIo5+rV1ElkTMa3g/cXHF9rdL0NHTKrsWu7T+0HbKqEoU0BHhGiIc/OHdQAZPE
         C0CugS7G76cv+qRFiCTQT7yQafzdurKme7RNZKw9IL/UPTfI2lmjJkc2J/QtnlVcky3z
         vNJGUF8X95ZfXoaBuqBgr0geQpFmgFLN3WQHEra9uSqEEX6KKIvpUp23RyM4UPkDKHtC
         M2QiwVkz2wsAKnys789voUWJTCla1EW21bmEH18vdXAwfbq0+PO1DEQMO+zw2swFhWuQ
         f94PCz9RO8njPOqCFsSLIfaCXvOibL2T6NvhEZse8EOWjJ08J6z5gCyhFdunw+CkujkK
         4Cfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719586914; x=1720191714;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pV4F7RdKKxqX+CEk9cel20GI2s9HbIhc31hrc3gEuKM=;
        b=v7J/BXQyiChSC9WeR4tT7j/zxgd4pgdS1oLBc9+lJGYZGxDVS8/BFRO3wliGawIsdq
         4WRWyn+hEMpFsp9piQABZkeOC803LUxeEW4zJCz3RQ51AI4oZ076EZEwgqx19ZLxcQAh
         rmuql4QajO6QiYwzhZnVgXDx7i432Hz/mYGfLP/U1w219ykX3srSYxRYjSUvWobdqHVJ
         9OBMJep74H57DMtOT8KPcVU6eLS7fzaeayK5/9sHlu0Ojc75m0uTB9ZG8DukAprMyf8h
         I0c9tXEePTdBpIky0Rk6TvwztpW91TvEyFPJL7em/vqew7DBG5L+Avobf3I4/BNgs3mA
         e6Yg==
X-Forwarded-Encrypted: i=1; AJvYcCV0rPoRhEpaKtq7wnKklSlRQyyN34KFz3MUnGhedTJ94eNc7XtmV6sA7vjZkrr4g3SiR/R5Lvja15ixW7EzxzXTz20ftOelyRP1TJNk
X-Gm-Message-State: AOJu0YxxWZYIzNDhG1eSFI8WFDRR34iV35fJ1sV4nPFYhTlUTZQgH9Uy
	jTk0KSCXyok5imrE2tVEcmew1mXPrUcTkG7XSAOhCLgDqctI+a6sj3vag2b0ERoouZpwq5kTUd6
	B1myaOIg2XNYE93VUdKgOpUyCHeJGQD9klYvb
X-Google-Smtp-Source: AGHT+IFSa8ePRVVy+0pw+2BgpZBsYhEdqdOqUKgO/gqHs/9djL6GlfhMWqhA6kA1DlyLbQRpSh8UWRI6Jz7YD4+eot8=
X-Received: by 2002:ac8:45d4:0:b0:444:aba7:8c07 with SMTP id
 d75a77b69052e-44651b1dac0mr3382951cf.18.1719586913372; Fri, 28 Jun 2024
 08:01:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240611171600.1105124-1-aniketmaurya@google.com>
 <20240624052851.1030799-1-aniketmaurya@google.com> <20240627221225e3517e4e@mail.local>
In-Reply-To: <20240627221225e3517e4e@mail.local>
From: "Aniket ." <aniketmaurya@google.com>
Date: Fri, 28 Jun 2024 20:31:42 +0530
Message-ID: <CAMmmMt0GKHaTbPbY_qubw09TGnAkVO+M_EAZB1bLZBQ3Ev3iJw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] i3c: dw: Add apb clk
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Jeremy Kerr <jk@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-i3c@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> >   dt-bindings: i3c: dw: Add apb clock binding
> >   i3c: dw: Add optional apb clock
> >   i3c: dw: Use new *_enabled clk APIs
>
> You should reorder your patches to have 3/3 before 2/3, else you
> introduce code that you immediately remove.

Ahh! Sorry, let me fix this.

Thanks,
Aniket.
