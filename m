Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FEB86651
	for <linux-kernel@vger.kernel.org>; Wed,  8 May 2024 15:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715183887; cv=none; b=HOfLurM8OskVvJMUpU9AAigNApTbCMA+wEoyC7ykc/PLpbv4cum1ERLtqYUX9rkx3RzfsA51/qDSa39nFxoXcmXoK/kkBvmLI3ZguHlTEKi5HzX/qk9lvBMojyYtovHQRikNvW3iH1YG7BEivOeJKN7qHGDwPOt7MHj8R4PzRjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715183887; c=relaxed/simple;
	bh=6izLnspEoWi407XJFRyj0TMHQcyQNDsYCuNvg2YZsww=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=j/0fZrj+TjuQ6Lu6RKl87HX8IBWlmmtRdDM74WqY6oXulMOs6VqRbLFLNh3D8os7+FOYY81JJo8GTcycqqGMWn3xdLih9PJje/A9hF6ZJenD4AyyZa+jvWGInJ0lLx4MaSrukakRXObVvtn6R72V3vlCNQ1WSfQH7oRr5n8/KeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KYinLjPK; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KYinLjPK"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-1ed057cc183so55435315ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 08 May 2024 08:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715183886; x=1715788686; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7zrXfdhQVZa7DTzCijd3YUUNo+sqV2sNEtTK3+8ITdI=;
        b=KYinLjPKz33Jnl/g38R8VtxyHX+w2AuldeA4HVAd9D1IHqp8CBHpPa2SHs0x1x5rz4
         KJPeIstO7LoZxJ7c3oHQCr/TzYIwfgPNDZVxyCfAhXiV0+6T019r3MKrDigUykbRtSn+
         Re3ZcfQl7jDqmgZq0WRfr32GivGbmjYaTEDQuUQYnjKsi58ZVQgJQAGFucd6U9jXofa7
         5JR+w9mojXc1lHIwKE2nCPbNmQtDLylyMu7cmG9lmUr9MuoPsKiqzF+6hJRso78Kr1g/
         mA8bzn7M2R0Tvest6H4gbP37BmqWlwwnfjvmS2ziYWq8Uje7t7IGe559SkFpOyu1FfHf
         XWxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715183886; x=1715788686;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7zrXfdhQVZa7DTzCijd3YUUNo+sqV2sNEtTK3+8ITdI=;
        b=Tg73hI6+wrJ7V5cpDqnDXpoDhc1mfgvWLBLHHLRcVgOuepJyVrn6BFgs+2IMZcpvG1
         14D8pypNm5NZg4sbUXmkmXA2C+wJO3/iHY3q1SIlCCDTCjctIwDiFzYl3dgUPBCzQ3tq
         FNgjSz/UEscXT4Y7T1KR0uVsKuKzqX5xMHo9eWI4M/xoYhWW5bzDRlth8mXkckre7lXa
         HaOkwgDYm8rq9/5nI0Gp3WN1FS6psrPlyxsTMxcN1kyBt1Nw4zp1/Q6BTvEaSW7Xbs+0
         tumqxEm0GEsUtaNAzbnaXrtUfYk/KHVMUAm/xK/D0YVYynuYqcnX4S0wyb39/i3nlYWM
         gn7g==
X-Forwarded-Encrypted: i=1; AJvYcCVtjShqiWYMPPUoepFBSz8avUrQuUaDXA4n8hEbnEgLOTtNg+rhQR6pqEa5fn9G4mtFkFjGsRPZ99gNgRoKLIzV6EtM0j6HDcErX8zU
X-Gm-Message-State: AOJu0Yycpqx1JtPkyTxGHIZq+hwdUr7JA4x96LWWwlT5RSoBjdSK49ap
	zwb64TvC99ylhPCzWgQqtDO8zmekKY8sOy7dqSNeGr3UfFqMaCaF53c63npMwwhdF1yH7s+k6XQ
	X0Q==
X-Google-Smtp-Source: AGHT+IFFApl/y5uiJncgorOHEu1jR3i+2v1awa9cG5JJCxjUi30iOSytJZZfPz3m0xt0S8aBg5vAHD4GeA4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:fa4d:b0:1eb:829:b6da with SMTP id
 d9443c01a7336-1eeb0197748mr505235ad.4.1715183885782; Wed, 08 May 2024
 08:58:05 -0700 (PDT)
Date: Wed, 8 May 2024 08:58:04 -0700
In-Reply-To: <20240508184743778PSWkv_r8dMoye7WmZ7enP@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240508184743778PSWkv_r8dMoye7WmZ7enP@zte.com.cn>
Message-ID: <ZjuhDH_i9QWL4vyz@google.com>
Subject: Re: [PATCH] KVM: introduce vm's max_halt_poll_ns to debugfs
From: Sean Christopherson <seanjc@google.com>
To: cheng.lin130@zte.com.cn
Cc: pbonzini@redhat.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	jiang.yong5@zte.com.cn, wang.liang82@zte.com.cn, jiang.xuexin@zte.com.cn
Content-Type: text/plain; charset="us-ascii"

On Wed, May 08, 2024, cheng.lin130@zte.com.cn wrote:
> From: Cheng Lin <cheng.lin130@zte.com.cn>
> 
> Introduce vm's max_halt_poll_ns and override_halt_poll_ns to
> debugfs. Provide a way to check and modify them.

Why?
