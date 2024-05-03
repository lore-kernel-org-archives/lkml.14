Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92AEC5B5D6
	for <linux-kernel@vger.kernel.org>; Fri,  3 May 2024 22:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714774400; cv=none; b=EY4HmOP1Up32vnPfHUQL9/nLTNewc5Xwswe8y04ShwpF2jOytjAXOrJjaDWtsLu9jaD4NiJekIx6KJOGi/bas1DszYAMSV7r6ght8B+A42xadNOA8xyWB/AAyEzdmszkVsknFZHfEguZHrklhak/uT/Div85GAO54CcejvYLMO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714774400; c=relaxed/simple;
	bh=tTu4T0YSToV5yW1ztczWGRMlzVAablQJ7IdHacuoYhE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RZWhnqjmeJE/WeQRAin3bsdi2fVWMo+SKEjMsQSuuiidoCFbG8fcECHSJ/HrKBA+1L8qeWP3t1Nrrv/Eb3Vk9rQEg9wmugz3Tel4kDNs5PY+LrfAUIMz4QHmw+HZIEB5qNEYEUxabM/O8gJ88ISu+F/deR2EeKe1kGqRgHYm8qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uTkfVglz; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uTkfVglz"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dc64f63d768so300497276.2
        for <linux-kernel@vger.kernel.org>; Fri, 03 May 2024 15:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714774398; x=1715379198; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lPuqnqlQf1TFbSeYbj5+H2+Mrg1R7W+s6tOfYqt9u3k=;
        b=uTkfVglzYHyJBMbyqCy/8X0psriDURjGmWZPaWZJNvJAY4BHiBAOxT9RgvAqq8+6ab
         ssUH7OVxVir8NFFMWpuuY973La2gOXDLHAslZ+K86ozSO0OU7xQWgwYHANmGoRL3ATgE
         1+VorM1+iD5cQ4R0NNQa1BjNt7Ozki/YTZjFcIAHMbboRT9xHe9K/A11MOf3sMWcSX9B
         LeC43k8tuwpzQ9v7mOMMBlGSr8NqtcrXVLT0QVO8NZJOQi4T3X/9hhDB9TaOMVho4sh1
         6CwPKsNKLcQx9BSsv9WWVt2CBS3ZSYNSyxKf8OOfeMyYnT9KAZrqL1+SCDxIqR36/t6b
         ynGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714774398; x=1715379198;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lPuqnqlQf1TFbSeYbj5+H2+Mrg1R7W+s6tOfYqt9u3k=;
        b=rYEEUJp/Y3OSE0A0gcsw1u15CmhLW3yvQJOjSQip85e3TFL5e3D95rVtIEc6f3UF6S
         eZ+6MJGulTqdiafNcqvIOsFQu2O9+eX8YQYumeitZur3l9BmpBUxsxngAKRqfbcoPzPy
         Y+H5Yj5/KH4szB8DJY2pJoqI0DAqiYR+EvsYLUS83P87v2Zj3uY/9FsDVpHRJS6YlJMQ
         Y/cD4OVtZHUPloen/HvyELS7GIX1ayApmR45MLjA1nhDch5u0sXRNt7Mu6eiIiPF/se4
         BnML8KwEOEy4m3c/AhgUJtkoVcvyqNbxiP0ZLkE90HAdRgOXvO6ZcTaCHIW3UTt4tWCc
         0fYg==
X-Forwarded-Encrypted: i=1; AJvYcCURMddAp2+RHAG6NJsk41Zuw7ObaO0muSOmN2aVqI6BTD/kqKDwE6fyYIjgFZoDwFiL3ukIqFYGVwmPyJ1EuotOA7tJ3+FidExpAYOZ
X-Gm-Message-State: AOJu0YzofHQc/uXsP1FSVtUnP5XgH82vgBv+GT95L/6xo/G9sUrPo68F
	oEWg3NQThUtvL7vJB3MqBF00PFTVM8F55MJKOtbSz7kmL9CNAObcOStULgm7HXKFzY0KntItfR0
	Kmg==
X-Google-Smtp-Source: AGHT+IFTEgkYDtwGLWZJdyovW4tTRZOEDccm5U4FAzOb/u3poMhryEcruOMiy7+Pl9xE3D52TIrnELvR2Fs=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1007:b0:dc6:d233:ffdd with SMTP id
 w7-20020a056902100700b00dc6d233ffddmr1277567ybt.0.1714774398707; Fri, 03 May
 2024 15:13:18 -0700 (PDT)
Date: Fri,  3 May 2024 15:13:12 -0700
In-Reply-To: <20240424103317.28522-1-clopez@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240424103317.28522-1-clopez@suse.de>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
Message-ID: <171477432131.1257597.4087115549657208837.b4-ty@google.com>
Subject: Re: [PATCH] KVM: fix documentation for KVM_CREATE_GUEST_MEMFD
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, "=?UTF-8?q?Carlos=20L=C3=B3pez?=" <clopez@suse.de>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 24 Apr 2024 12:33:16 +0200, Carlos L=C3=B3pez wrote:
> The KVM_CREATE_GUEST_MEMFD ioctl returns a file descriptor, and is
> documented as such in the description. However, the "Returns" field
> in the documentation states that the ioctl returns 0 on success.
> Update this to match the description.
>=20
>=20

Applied to kvm-x86 generic, thanks!

[1/1] KVM: fix documentation for KVM_CREATE_GUEST_MEMFD
      https://github.com/kvm-x86/linux/commit/2098acaf2445

--
https://github.com/kvm-x86/linux/tree/next
