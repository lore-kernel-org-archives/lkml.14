Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8D81BC3F
	for <linux-kernel@vger.kernel.org>; Thu,  2 May 2024 22:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714690077; cv=none; b=mWK6GnEkIW2MY+ZGrCiUReVT/DWe9LLxN5im4RiJSqu8ZAPJk81Wa7//5xhSGmKg3V/0i8LC1GiERH4OB7k4+Neehj2VcV+vUr6S/6e9Bj0N9HB/w+er2S8BCenGneM7lCSgjFn3f3JVc0aqjKCExT3LqmUOqGAmNUOLJR9xzy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714690077; c=relaxed/simple;
	bh=ExG1KgVjgCOl88UQQAFgXZUsw2+ya82EI/LQrOPIBOQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cj4ge1KO8N9UKgq4yQFaBJGlStBHMqMqN9JRAFICzIJ4wAGlBuVqwJjVnsQCTHnxbY3Hlszm9MwvRpCp2j41nfQHi9Q8sIBNgYgmespmcljQVBgMKmH+X416J84/EMJiO+gd1mfGhtIPwNV1T0aqhHlFa+9uhzi5kBeWdfq3Wb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Nlqh8cwj; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Nlqh8cwj"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-572a1b3d6baso2453a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 02 May 2024 15:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714690074; x=1715294874; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ExG1KgVjgCOl88UQQAFgXZUsw2+ya82EI/LQrOPIBOQ=;
        b=Nlqh8cwj0jvXh8T1Dr3ar7pvlruAslj8PcTJ6SZGfI++ThcAYVOPLG22hYsvkF+9bD
         HFcoVULzVKCbjhFOTPdXJwUEjSV7XL31kg7lRB1wMuP92J0r/rWuqNVRzymw5Z07lzbQ
         QdIahAc/IZS5PRH/5zoflXB8JxfxiIN4OtVLtRbfcVGx5lndTnSYeS8zRWXBmimbPpnD
         f2caYbgDLdSiB2UWKd+Omdzp6NvRHr+fH4QDRO1GdLVWBx3Jfw1EFocX2jsQpyZnIZ+Q
         CyNwjwdwWdH2rjOOtHgFp/fVxFABHX68I4a36th5coPQaGiPPdSLWJIzyKCRfREEsQph
         4nvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714690074; x=1715294874;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ExG1KgVjgCOl88UQQAFgXZUsw2+ya82EI/LQrOPIBOQ=;
        b=o76YGqaaXtJ4uImoXu9DPqeaGuA9ceTnzrkuyVeK3K22evtFiM4zdTcJ9As3U0kp2/
         MX4gix0Z8USjTx2k/g9xh2YLHQP5OP/GKHkzuaWOwtd7A0v/zJhqPHc3nC4a3p5hTFwo
         5EYMbaAa7jVnFnZwOUrAwdMQ/S/Ixc65uM3TPcIIQLHneS1RaaX8G4joRJMs9U0y8qUM
         l3wpyLNRpKNQI1jk/HdCsfI215zUvNcd1znStZlck3BXvKNDlB7KPu/vk3UGfBmjdEKD
         Yfjgkx7oEYg8hTcymKzvCOpZDu8wpOQPoQdxTgP1xEQnXsFqZ6wYxp5rIhnGwwM/v9B3
         pjlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTRRMWyXZ+ATGxFlQwa7uzfpwdVL+beLhRh35ru41kB+IDGxooHgCPXKEz+5QRpkMVSQvmbxegUFJJFfYqzbGJ95p3ts+gvdIr+Zca
X-Gm-Message-State: AOJu0YyG+7R131gpZZWBCSBBktrwtPn4O5qghyw2dxOWocpykc0D59W1
	Pl0Lmwdd0ZGEwjyKIZJWkAfnIl1d79jyxPNMyNeof3c/zg5/8Vb+24GA/TSoub1k2Bnnf5zD0/w
	P+/w7TCu1dlajlXpdnykJabsZ+E0i+fpWtUWe
X-Google-Smtp-Source: AGHT+IH0mH0uuFK4eo9VqCSk6dbse6pHTLPv0svOXhiAHh6fPUqDd2nzdBnpLjnGCKpRjVOyTQkOdSMLT3gSxWvi9ys=
X-Received: by 2002:aa7:c44e:0:b0:572:9eec:774f with SMTP id
 4fb4d7f45d1cf-572ce31e083mr67905a12.0.1714690073746; Thu, 02 May 2024
 15:47:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240424014821.4154159-1-jthies@google.com> <20240424014821.4154159-2-jthies@google.com>
 <32855f4c-f219-4396-81c3-42cbea9fe4da@moroto.mountain>
In-Reply-To: <32855f4c-f219-4396-81c3-42cbea9fe4da@moroto.mountain>
From: Jameson Thies <jthies@google.com>
Date: Thu, 2 May 2024 15:47:41 -0700
Message-ID: <CAMFSARc7GPZuvX1wbyvz2uPUeORObuw3=JQ1QwKYRenaofXvBQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] usb: typec: ucsi: Fix null deref in trace
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	pmalani@chromium.org, bleung@google.com, abhishekpandit@chromium.org, 
	andersson@kernel.org, dmitry.baryshkov@linaro.org, 
	fabrice.gasnier@foss.st.com, gregkh@linuxfoundation.org, hdegoede@redhat.com, 
	neil.armstrong@linaro.org, rajaram.regupathy@intel.com, 
	saranya.gopal@intel.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dan,
thank you for the reference. In this case I think returning NULL from
ucsi_register_displayport stub and using a NULL check to prevent a
NULL pointer dereference won't give us the desired behavior. When
CONFIG_TYPEC_DP_ALTMODE is not enabled, the function would return NULL
and the UCSI driver will never end up registering DisplayPort
alternate mode. I'll update the commit message to note that this patch
adds a fallback registration for DisplayPort alternate mode in
addition to simply fixing the NULL pointer dereference caused by
returning it in the ucsi_register_displayport stub. Separately we
could add a NULL check, but I don't think it's necessary. Neither the
non-stub ucsi_register_displayport or typec_port_register_altmode look
like they will return NULL.

Thanks,
Jameson
