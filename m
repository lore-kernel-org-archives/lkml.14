Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E66199A3
	for <linux-kernel@vger.kernel.org>; Wed,  3 Jan 2024 13:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BUjYrPXs"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-5f0c0ca5ef1so31051377b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 03 Jan 2024 05:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704288282; x=1704893082; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zVYUrMR5l/gQK0rOqJU00ejAD4fok0wMm8sVpiWZgDQ=;
        b=BUjYrPXsPsflyCW1O3B9DRu9vczdwZyJPD8RpAWsIg6ORiDbrNr9HiyqqexZrpoQGA
         4HTxnjBM+L9tMq6KEfG5sERpu1/g4eaaCkKBkHSxZ4DUvfr2bxUB51BJBznr/A+UqUyB
         uXEQkqCsgYgo/N6mCGN8OU9hIuuXue5jvP69P8W/UrVZEP101c83yxxCxpHLLuZH0o7c
         Z+RASD3MnfwGaFBztmb/2ztNhNKY9VjSR/ssfx49AR6ZGc8Sg9RwDNtCTPCJIn3ePXHy
         x5eS4D82c+U4/BgY9TDvrMOXhpptpLwya+FCXr4xi0P7fcdLm20s4BYkHY0BwJ9G/JE7
         ctQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704288282; x=1704893082;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zVYUrMR5l/gQK0rOqJU00ejAD4fok0wMm8sVpiWZgDQ=;
        b=vOF6bjiLJj7JH5l7LXBA4h5arbYIzHVVnPDsqI08kLakjP09Lad2M/E2sxCKbqJzZ9
         MDxQROojgWfOddQ7skG4sI0hqSCnJXw1OzVoOTU+Sl6lPIAlb8r7JHwuZLLe4SRc57BJ
         NEpSHp9iizAOYrIhP6RwNi9dD5BuFOkNEx3jtIFB0Nk7veLLVtzKr01b7iAm3vFqUE45
         7YBuYecNgj8JJQmg9nscFqjrwgvMkCi5Ib9rvDHTTynUGLfN6xptXgrzixuCOcPqsB8e
         WEN7oXjkicaglh4w+yoTufYSmsx1nRFnSY+NPFojArYT5WWYPMP4X8FrlvDXlmwBnwDt
         hpug==
X-Gm-Message-State: AOJu0YzLFQmXynhIhYyey7G4wVmIBUxxLnNXPZ3CzTV3OKBZLehjXOqk
	q6+DBgfdLwa291cE9FO+5VC4uoYrxlsgwIlVbDGQiW7X5iPQLA==
X-Google-Smtp-Source: AGHT+IH48s4qbFOMvGW7ZaZyzwNXReWdcqu1Of9Oxv/EzIm+OJ1AdaiABMfYAVCsCDzQg6vavN5JKOcCel7OjLcVHrQ=
X-Received: by 2002:a81:be15:0:b0:5f0:c7f8:35df with SMTP id
 i21-20020a81be15000000b005f0c7f835dfmr3745787ywn.70.1704288281833; Wed, 03
 Jan 2024 05:24:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2023121908-paver-follow-cc21@gregkh>
In-Reply-To: <2023121908-paver-follow-cc21@gregkh>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 3 Jan 2024 14:24:05 +0100
Message-ID: <CAPDyKFq0_1LPX8KUkB_qKZXfm0yXKy5xusRjMK9kJdQULcf+eA@mail.gmail.com>
Subject: Re: [PATCH] driver core: mark remaining local bus_type variables as const
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: rafael@kernel.org, linux-kernel@vger.kernel.org, 
	Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	William Breathitt Gray <william.gray@linaro.org>, David Hildenbrand <david@redhat.com>, 
	Oscar Salvador <osalvador@suse.de>, Kevin Hilman <khilman@kernel.org>, Len Brown <len.brown@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Dec 2023 at 16:35, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> Now that the driver core can properly handle constant struct bus_type,
> change the local driver core bus_type variables to be a constant
> structure as well, placing them into read-only memory which can not be
> modified at runtime.
>
> Cc: Dave Ertman <david.m.ertman@intel.com>
> Cc: Ira Weiny <ira.weiny@intel.com>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: William Breathitt Gray <william.gray@linaro.org>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Kevin Hilman <khilman@kernel.org>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Len Brown <len.brown@intel.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  drivers/base/auxiliary.c    | 2 +-
>  drivers/base/isa.c          | 2 +-
>  drivers/base/memory.c       | 2 +-
>  drivers/base/node.c         | 2 +-
>  drivers/base/power/domain.c | 2 +-

This above file has moved to drivers/pmdomain/core.c and I am carrying
that patch in my pmdomain tree. If you have the time to send a
separate patch for it, I can pick it up.

Kind regards
Uffe
