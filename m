Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FA669311
	for <linux-kernel@vger.kernel.org>; Wed, 21 Feb 2024 12:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708519168; cv=none; b=IlB9VJG/dHo7o+WyO0bvnyLMQMH8DB5f/HV4oTWP/R5fyIb3E2/V1ufLyW18I4Zr8XBDgG9wNUqSra27OSekR7ESK0SLfWLPZSh+Eg+rZ5bXDdxQWd/SkRz4Lf0zIW/FcgcN07lme6ErIqN07+9rmg0CfOu7UEJNxJxL7WczXfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708519168; c=relaxed/simple;
	bh=Lu9vnZh6Un3N+32ujmPjCZoYI/iNGYkpy/wvhMoT3ts=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=J7IcrbS+3mlZKKni9V/FAZuf3//3CiZWpWyHlRZ6Dvymjm39w0W9vTFA6cHacauX59OIdf8bT1CoRf5PtJ/eU4ynOhJeP0U2xkJdOfNjqWr2kmXHwBdp0L8ICSMoqA/ucnrxh1rVIgcsrcB/6jTcgkpFSlZnU/P6uwoh153S8y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FeUdpVnz; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FeUdpVnz"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2d094bc2244so90723901fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Feb 2024 04:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708519165; x=1709123965; darn=vger.kernel.org;
        h=content-language:thread-index:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Lu9vnZh6Un3N+32ujmPjCZoYI/iNGYkpy/wvhMoT3ts=;
        b=FeUdpVnzzqAn2JiZxJS2g+b+MMCt3tDAfRiPTInhIAk99LxYMM6O515EQ7LmncJCCR
         oFEQ+csZCZFTOXPIUq2Wo6R5Fc7TkSIrp5CwZdauOIGxKEBuMaveBtbW0cjNTnmIR683
         Qt7u0jm1PyV9K115xKGg4AOQwGKXuCwTmt9xpZCgulycDlyJ+WGPakoYEfo/0TEPoozi
         hUxdUfA7CO8lARu+hSXkIhqRSJN3yGkG7jnSNMfPQ8vNNDWLGgIs4Jy0tN2d4UCp0Pnf
         1Ac4SCMvVPy3jxHuY5Z7wEiDUbOvZcZgrqJT6qI6Ig2VPYLm/nCqsd7vmhXlUm6FXhi2
         pSow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708519165; x=1709123965;
        h=content-language:thread-index:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lu9vnZh6Un3N+32ujmPjCZoYI/iNGYkpy/wvhMoT3ts=;
        b=LjW3JZUkOa5uj1zuwppFLU0uDOc07ywjGuL4p7pWgEMRIDbCa+r+zPv9sjWOchxc/l
         +xk53Vv/8vzBiEorqSUabafDodOW4l/bbIp52wZtHoF5nGGRGmSNkfBWKk7ro4oG9wZw
         EDT/Iw9HXKwsGB65+bVczQfnbcjkvdHKsp+T3gQ5W+WYp9UO4DLTgfD/ajvcNT1K/w/x
         5N51pfzpOJYxWjzhyfLHKsBCpJBqPTV3EkOUy/tgP1CuVbT4t8rYILxdouXBwM5/i8iq
         Xy8kKxhV2nH3jXYuB1DZaNa0SaKinr6eRAcYMEO+HUYeLkVy0Zpe6VvX8QQLHPDTg3OV
         7bAw==
X-Gm-Message-State: AOJu0Yz1pqJIHEcgZS/ucA9ecEv+lqXUN7n6bb14RQjyQNd3Swth0wi2
	yMXdreQyW1wbGzScg+ZdhZ1QWmdlWj3F6RCoJVq//f+/7qEqbgWzh4jrNISA
X-Google-Smtp-Source: AGHT+IH9JjUILXXO8LB/roF+pvn4nPu+dvs3PtSJYKHYlyf45TTtHB10EjtIjq082ZqVswlkTsgEEQ==
X-Received: by 2002:a05:651c:1056:b0:2d2:39b5:6f6 with SMTP id x22-20020a05651c105600b002d239b506f6mr5528169ljm.28.1708519164770;
        Wed, 21 Feb 2024 04:39:24 -0800 (PST)
Received: from LAPTOPVHVOIDM6 (82-69-18-221.dsl.in-addr.zen.co.uk. [82.69.18.221])
        by smtp.gmail.com with ESMTPSA id bx14-20020a5d5b0e000000b0033d6bd4eab9sm5574038wrb.1.2024.02.21.04.39.24
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Feb 2024 04:39:24 -0800 (PST)
From: <tartanllama@gmail.com>
To: <linux-kernel@vger.kernel.org>
Subject: ptrace: Why does PTRACE_PEEKUSER not allow reading of FPU registers on x86?
Date: Wed, 21 Feb 2024 12:39:23 -0000
Message-ID: <01a401da64c3$0027ce60$00776b20$@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdpkwZkfG+dcZKICSg+ZwUobaTP6Ew==
Content-Language: en-gb

Hey folks,

Looking at arch/x86/kernel/ptrace.c, I can see that reading with
PTRACE_PEEKUSER is only supported within the user::regs and user::u_debugreg
fields. What's the reason that reading from user::i387 is disallowed?

Thanks,
Sy Brand

