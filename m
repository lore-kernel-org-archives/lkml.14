Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF8654677
	for <linux-kernel@vger.kernel.org>; Tue, 30 Jan 2024 08:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706602284; cv=none; b=W4+min3ghZ1dEb2DdNvFCEvrXkZVSsVuYcydxVTb4JoAbBGNyQEKduoT4nE0OwvX+9v+klPWX0yIyGlxmprrMJjTuLHY8DNI9GeJZ3Orl4VzVn7reEPzfK9hVlnkF2s7qfcMWZrQ5mBEMdOsHsVM907S8qpaIBjH+DIU6kVbRQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706602284; c=relaxed/simple;
	bh=+nZwyJuSIVRlsmuEasbJXvUFSTSDYBPXjZh5Yq332CU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tGe2M3HS9o9v48wT7hXFncIDqzj1AO+x6fAKgvA4nJa4/HoJ95o3Qu1+wj287+myNacMz9V805Gt2NUbOCvbixsDwGMzFncb8STxeH/G7LyFmRjOlJw700mz/RqAmKwC9ICOpAhD2+1SaNY7GO6IV80WxhtXGG/bzt3hoq3km9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--yosryahmed.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pw0OYxQN; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--yosryahmed.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pw0OYxQN"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dc3645a6790so7451032276.0
        for <linux-kernel@vger.kernel.org>; Tue, 30 Jan 2024 00:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706602282; x=1707207082; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+nZwyJuSIVRlsmuEasbJXvUFSTSDYBPXjZh5Yq332CU=;
        b=pw0OYxQNos1+Yn5+j1oZUDGMhecZ6tAK9hOTJKqKeId/5JDDcS2yP8sCPbq3w7VHIN
         utGO0elu5/n89+RWkYFMxwQ306X7RY2v82bDW4u5omAvnswYwdMyHFOp4UjUXBG4TFl/
         qcybiyfwyoaE4I1ascPQHwmDHRf1pLkhe8YzwlKitxssd6JFh8HLpOkKuFCy/bN09LV0
         J7OWr2bqkiQkJMJ9VYVDjRl4AZMvCi2GzKxaVSHgFBDqeoixFXF7lA64p6zVHH12YLFw
         rJElAPr1k6obMblrVERsjZuIOdHWJ7IXqLGQvc7mHz0Wpwd+v0ZmZxrrlFXSYv0/aFyh
         +0fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706602282; x=1707207082;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+nZwyJuSIVRlsmuEasbJXvUFSTSDYBPXjZh5Yq332CU=;
        b=FgFQR6uga/aac9S7HFpThnbwrx7Jzxo8Wa2RQXu6Nnji4pjoWnMzlMaE/Kb9kjcOcp
         wAQHYx9n1/OAIbs8kaYp9+wpVlP4zl9tBHQ77sxweX510jtoWo7+wyfM3Q/SG+rYw6Um
         yh4a7hCdZQsA91kLPs32qFzeMf1YBybUlxzZDmWOUCn6ED4ceb/rO+Z6FWtP/Ij9Ns41
         BbbBflcdX6oP9Njdl2JrWOqCnPbyw+KfiBxiFZRt9ncFa/Vm088lc26KutjrnSKe+UsR
         f871uOOq7XK+8qa0iya6//jtRQF2ngTXuVFFc4CVfsHQx0q9i7uGEm74fEpJoeDfgVSO
         5HnA==
X-Gm-Message-State: AOJu0YxjG7/qJgJtlZPsi7cqjgyZ/VGomHOW4ruHuYmz9dGOp7So5l+i
	PTBpYzQGVcjkOXB1YTU0/J1SyW58hwBHFPDKnFUu8jAQjNVOTn8NXYaULsZTWP5sYcVgvB/h71h
	Toz/H92eiW+dWmR8EIg==
X-Google-Smtp-Source: AGHT+IHFFhN+LJuuRhy3fFFf7/YTAMO/E6ezhn8v7yPxiMpafDrmhKQNbJWOYnU/zLyleNJFFABC8wpZkxdqgXZF
X-Received: from yosry.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:29b4])
 (user=yosryahmed job=sendgmr) by 2002:a05:6902:11c9:b0:dbe:a214:888c with
 SMTP id n9-20020a05690211c900b00dbea214888cmr2893749ybu.11.1706602282205;
 Tue, 30 Jan 2024 00:11:22 -0800 (PST)
Date: Tue, 30 Jan 2024 08:11:20 +0000
In-Reply-To: <20240130014208.565554-7-hannes@cmpxchg.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240130014208.565554-1-hannes@cmpxchg.org> <20240130014208.565554-7-hannes@cmpxchg.org>
Message-ID: <ZbivKDqC3CaOByaV@google.com>
Subject: Re: [PATCH 06/20] mm: zswap: rename __zswap_load() to zswap_decompress()
From: Yosry Ahmed <yosryahmed@google.com>
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Nhat Pham <nphamcs@gmail.com>, 
	Chengming Zhou <zhouchengming@bytedance.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Mon, Jan 29, 2024 at 08:36:42PM -0500, Johannes Weiner wrote:
> Signed-off-by: Johannes Weiner <hannes@cmpxchg.org>

Acked-by: Yosry Ahmed <yosryahmed@google.com>
