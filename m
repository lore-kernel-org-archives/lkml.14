Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A7DA929
	for <linux-kernel@vger.kernel.org>; Mon, 20 May 2024 22:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716244420; cv=none; b=Eo7PMVp+Q+mHiqIoGVY1Ch9IX4uJC1UeHPPzswn/wWZZkSiJDZfoPidgzShkd914gCPsBQvNL9Xzz9qixl1JhtoIbv56gCn/4HbZbEmSf8SAJw6xbAorZcO+0pURnguzgp0t1YCWXWarmg7L6rO8ZKzC15yrBkHYffBZXlAynEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716244420; c=relaxed/simple;
	bh=NYo/N7BXec44ICtyrYVBTW0BcviRclt5lLRqjmbMHMU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=aduHxmNSUTyV0FGwghEwcsKkHyMqZZs7WtHmEFTXkMxZNJQWRaxRtlihpXlhtBpje7B0tq+Ue2K9yAxO1I3HmDhi8ustGCtPAJNkxjkOsHKEymaoKIbUkrrgw1tTae3wFNdI1T06pZoznHWiwUcyRKDfs5LjvPLa1RMwSiCnLEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=ovrTD+qs; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="ovrTD+qs"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-51f1bf83f06so5823446e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 20 May 2024 15:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1716244415; x=1716849215; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NYo/N7BXec44ICtyrYVBTW0BcviRclt5lLRqjmbMHMU=;
        b=ovrTD+qsR0lGdcz+G3ErYepuxL2hTGkmQzRYqM2VF1B3N4r2cJfX7UNcA1epsx9Q0T
         ycDTFzUrsI/y6nhwhKJlqc5nQa78z1yiKIeLFPk76PcCXuklch1bPnHSps0UIBVvpnAR
         yitXmcH7pbCuOBMhBmBsHFf14x7ji7B28EMXT7oqqwAN23LUHgOgqJ9gihuhgYDKdyC8
         sz+lmJVwKD2khWkY16mT2vuTgrQyLMNLgIKDZqdFziPmcayS6hwG1fneIfHrhqVx2ZCk
         F1BwtqUXjJTcSa90LR/a5dxhgiW+FsxL+DFxb3wut2dB4BfwqXr9KN7TrjvXbVc+oMR5
         rrZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716244416; x=1716849216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NYo/N7BXec44ICtyrYVBTW0BcviRclt5lLRqjmbMHMU=;
        b=afKJv3w2NfBTrVuo9C5rR1U/buWp1q5Y427A6mWzc6d09Ug+Cosw9C1RLmReRKk7b7
         /CV/cw9RcZ466J/+o2JsgNyaI1mUVtQeyjtFhTBxcQR3YYAmNXQXgyIAfzQJshyc12HR
         qrliNi36VyOUFhqJts1fEm0vX0bQTE75I+JQP9zMgpPyLTadkxFZfszBotXBWx/sOHgQ
         TtBdU3r5RW8o7EWUqBWCUECxx8elUTh4amk6iHRz4rogU74CluZk1fWqHSTLFQj8xtwB
         8/1zE54+VKJrUFPuBkSrvlcxj3Ke4vYw/nCdivqEwNxUQ7OipElkUEOA+wwIOZ2h3bch
         YW8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWgjA7E6PdPhJ8Z8ccCFN2bm8Lmc8SO5IbUQ+IbibZCwIpEf5AQUSMoUR7VDOBY01k8rAKvNO0wCLjwBuE+pfLGwqt8UwBbsFLpWdUX
X-Gm-Message-State: AOJu0YwHliOOJ2bYoaiZC0cIvD9x6mqQLUjRUI/MWCG95U4TkE4ztvjQ
	wg9ssrfwx3LRjboVMGQFFbzJcgSpF6WkctUwXmWyY+DzYSWyiVYjpIe3RkIqTPofrL2+HDPs8Bt
	gSGXb6mYoGV2FbfVXf2Om55KZ4/N8+CxIR2l80A==
X-Google-Smtp-Source: AGHT+IEmg9128M+eN0m3kGRQymnVHm1GcalzmPl2RQ72iRv7vCX4Uq/ZuSz/Y8IItLGvMwP7hPMh6SKsdg4hlDqGOnc=
X-Received: by 2002:ac2:5979:0:b0:519:8963:c678 with SMTP id
 2adb3069b0e04-5220fc794b5mr17825488e87.23.1716244415690; Mon, 20 May 2024
 15:33:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Mon, 20 May 2024 15:33:25 -0700
Message-ID: <CAHBxVyEaCFt+bC=bwO54n30urANy+DaffOBk2odpqjpbBgOPKQ@mail.gmail.com>
Subject: RISC - V Microconference CFP 2024 CFP
To: linux-riscv <linux-riscv@lists.infradead.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The Call for Proposals (CFP) for the RISC-V Microconference 2024 is
now open. Don=E2=80=99t miss your chance to submit a topic proposal!

The deadline for topic submissions is July 15, 2024. Proposals can be
submitted at: https://lpc.events/event/18/abstracts/

Be sure to select the RISC-V MC track during submission.

Due to an unprecedented number of submissions this year, the RISC-V
Microconference may be shortened to 1.5 hours (nano conference)
instead of the usual 3-hour format. Topics will be accepted on a
rolling basis due to the limited number of slots.

LPC 2024 will take place in Vienna, Austria, on September 18-20.
For more details, visit: https://lpc.events/event/18/.

Update on the microconference situation:
https://lpc.events/blog/current/index.php/2024/05/13/update-on-the-microcon=
ference-situation/

Best regards,
Atish & Palmer
