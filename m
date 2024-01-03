Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26371C688
	for <linux-kernel@vger.kernel.org>; Wed,  3 Jan 2024 17:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gFnvLmzd"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-5e763e03f4dso109994767b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 03 Jan 2024 09:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1704303827; x=1704908627; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ch7NvB2LWYlTvgGgKo2EIdYp2sGxx+1NC8FOV8MBa8=;
        b=gFnvLmzdI/s0DG37lEgq/rJbZiLYdRe5ELXdvUTfk22YE8/RHE+xwK02kVA5qokYbn
         SHQGUAyLf85+LxfNLqz8vXYUR+GJN+de2HhTfAah7bR5EHbmZbnxQyuaPI52l/5sr+dw
         4JK1CL7lXgdhjg36eELpI5uWwo35rjWaNLQ2JUSA2XJo1oGfE+sMytrd/3IPpgqbqnaM
         WPcJADzCHMO80YTwDuJg4LyElf8+agsFWl06VANnHkG1mLmQoI1lSwc/sL3Z9lJUkHEP
         KyQ9ay/QoSgvUepno006TOnY6H7PKyDA5ZWuzsZ/6MxS7UIPTAdOxfXI4cSMjtStdlyJ
         tNpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704303827; x=1704908627;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5ch7NvB2LWYlTvgGgKo2EIdYp2sGxx+1NC8FOV8MBa8=;
        b=BmtOhogfWYYKc5/99TF3CFZ9TUfsThZObLbDxlXXcuAYTrE17Iw0Pnfb99PNfuJpzO
         m3j47U9hwAAKxTO9wiJ6bD0C82P5NPw+gBDQoHeEh1b9yvj1CilUx05mndRi3DT1/6zi
         uFuTsswnOS7S6CXZ7afwBqGDPIxQBeSrwkstA0h9ggJwbuODne3U5K0JTcyxRM8wDh44
         gweKva/UShHTX8rvmSJZbTads9FziUkRHm3WvTf+h1DTu8VUhULErpNcdkSq2cte5nNs
         0SNu3Q5m7Z2ac3G5BKE0rOkYkihtjN4vA7fgkzuOLiTFl5FAb4FbaTYAzVI2KE7rGr/g
         Yw1g==
X-Gm-Message-State: AOJu0YzQyjGGV7UR+q9WkkmypJY5SbT+PC4CBNHS/BsffmRnpHYJek0i
	O1I4RAdfe1qtKvwMoVKRd8YY/CteLvnP4QLCcw==
X-Google-Smtp-Source: AGHT+IFVYbxeck6qY0stZ+gHuJMU9yrJ7fDaUy0TVY05Bz/4NTgmYhY/zjYlworFaWfsAuVE1XItsh0J6YQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:a9d:b0:5e8:f747:1cb3 with SMTP id
 ci29-20020a05690c0a9d00b005e8f7471cb3mr7073043ywb.1.1704303826874; Wed, 03
 Jan 2024 09:43:46 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  3 Jan 2024 09:43:43 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Message-ID: <20240103174343.3016720-1-seanjc@google.com>
Subject: [ANNOUNCE] PUCK Notes - 2024.01.03 - Post-copy for guest_memfd()
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, James Houghton <jthoughton@google.com>, 
	Peter Xu <peterx@redhat.com>, Axel Rasmussen <axelrasmussen@google.com>, 
	Oliver Upton <oliver.upton@linux.dev>, David Matlack <dmatlack@google.com>, 
	Aaron Lewis <aaronlewis@google.com>, Isaku Yamahata <isaku.yamahata@linux.intel.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Recording and slides of the post-copy for guest_memfd discussion:

  https://drive.google.com/corp/drive/folders/1_3bLYrR7oYZ06XvOPY_xZGUApGhq-j3W?resourcekey=0-0C1BYqhodcNvHFIqVwKMTg

Key takeaways:

 - There is no known use case for tying "data invalid" to the guest_memfd
   inode, i.e. letting each "view" (struct file / struct kvm / VM) control its
   own behavior is acceptable, and arguably desirable as it provides userspace
   more flexibility.

 - If the "data invalid" attribute is tied to a given view, then routing the
   ioctl() through KVM provides a superset of functionality compared to making
   a guest_memfd specific ioctl(), e.g. KVM can apply the attribute to any gfn
   regardless of backing store.

 - Pursuing a fully generic file-based solution is undesirable as there are a
   large number of questions that need answers, and there is no known use case
   beyond KVM to drive those discussions.

Feel free to chime in with anything important that I missed.
