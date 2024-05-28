Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D95516DEB2
	for <linux-kernel@vger.kernel.org>; Tue, 28 May 2024 11:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716895842; cv=none; b=NzMVrO7LabgRjMh6IRmdLLhUbIDalyaA7AXwFmhgvqtPu2eKKJqICfNMPjBMWYNsaJbh2DsgdpFwy4iZPqsyXjOjCEMCqZxsZWLZCTfGSYw/y+FQmiOvDpa57iUUufGyxTVJSrQQcTUKEcNiwQH/6e73fXG/NIodrvxDM+z0C1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716895842; c=relaxed/simple;
	bh=FQ6F4fqrwNmUU0r3k7M2vAGNVs/druX0mE/06+nXt4s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rbMxAr8t7i3Ldb7EFtpdUJ4Jucs6GKwkrqWPTF876piwQi03g81gjjgxNSvXlVLCy4//Ke40wfstArm0nGkr6H+KV1PH5JcSNh4UpbRaDCdZdKGn4iuiyYfKsykjuiGugfp59MK+9sXbWqLSjdr4ytaq16/KsFm9coGx6bljPjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lmWifDXG; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lmWifDXG"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1f47784a2adso5282285ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 28 May 2024 04:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716895840; x=1717500640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FQ6F4fqrwNmUU0r3k7M2vAGNVs/druX0mE/06+nXt4s=;
        b=lmWifDXGZ1DfYCIQPFWPW64sn79154cuGPH/2OTJ8+VVQyDjUi83xW5vb0H/wR6JBu
         nqeCtoPLsBUNUXqIdpc7l8GK+OIuZWPZgPpq4n1YNGVqEQEKj0qTdD6VXVjpR/ikA8Yj
         RY5s0PxfroNrNUzlVtwfUMypXTDBOtqqLdK1YMeGvk1QbcmYjjSGd6xn2zrdxkDna3On
         e0qn6QOG1gtgelhhb0OZeybB7kiStlKgSwhP/I1WnGhlpEQRfauJLFfNjyNsktAXGJPf
         sjSDjd8vkjzN+n40MmaVc+MR6BIbezyF3hmV0SVmnQ2zyO56m8e+29qpL3eBfxAmMufs
         r0+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716895840; x=1717500640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FQ6F4fqrwNmUU0r3k7M2vAGNVs/druX0mE/06+nXt4s=;
        b=lkKXG3p9iKCOvgRaK0C2JZ1SHx+s1FAArDwi/OaxyPlKWhdB6RwcGn2QrGdDfhxAPl
         X5feXpxAa38o6JUJZTfahiF3XlTtr9MGC5NzaOZqYuiaya8t0pxNSd84EQH3M5D4STv/
         AewMidzeUeJUc/qEvVN9PwxbTL6F2kxtrnWQP7vkS0l+dsVZfZPk7Jcpq/mBvBargfHP
         3cUxv4apJd2BtmqB+Nu2b9LpsjCcyIJ/7fvkP23hupk1VxVcQVGdrJ9L+lEPSdHHQtE+
         IUkAZUSWYdcHOwkDlqUVZcFA5JpMVco1E5uocGOzFoGgHYhmRNnicaTcVKuE6OYwaLnO
         G9dQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2ZeP7i3+iNvrZgVTBjZVEKxuzwLDdcEyk9beQTmh74f4dTSDfiDg/mxcavA60SZbgZ9linWEnrUXJ7hbf43Vv7eU2JB4iGEiSBYpU
X-Gm-Message-State: AOJu0YypefJwnHckfbkFpbCpgnT0akOYA5nrWXVh8+hEcblbCyWDk57D
	QCatqmcyTNamJg0rYA8BFrITv8Ivp5JpymWj2GcMemc8kmsTLsycta54nuoIO+4BEA==
X-Google-Smtp-Source: AGHT+IHXps3nZ90T8WGg063fYN8QVMVV3g6nA7o5SquGS/z6Qy9jDzJGBr2bfLxeOECbLQ9CIXVaAg==
X-Received: by 2002:a17:903:2b05:b0:1f4:6252:dbb3 with SMTP id d9443c01a7336-1f46252defdmr108101395ad.26.1716895840365;
        Tue, 28 May 2024 04:30:40 -0700 (PDT)
Received: from localhost.localdomain ([47.238.252.167])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c9711bdsm80298395ad.145.2024.05.28.04.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 04:30:40 -0700 (PDT)
From: lei lu <llfamsec@gmail.com>
To: joseph.qi@linux.alibaba.com
Cc: akpm@linux-foundation.org,
	jlbec@evilplan.org,
	linux-kernel@vger.kernel.org,
	llfamsec@gmail.com,
	mark@fasheh.com,
	mengferry@linux.alibaba.com,
	ocfs2-devel@lists.linux.dev
Subject: Re: [PATCH v2 2/2] ocfs2: strict bound check before memcmp in ocfs2_xattr_find_entry()
Date: Tue, 28 May 2024 19:30:14 +0800
Message-Id: <20240528113014.15257-1-llfamsec@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <784b6bcc-067a-4a27-93e9-60e96da2befb@linux.alibaba.com>
References: <784b6bcc-067a-4a27-93e9-60e96da2befb@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Maybe we should add the same check for ocfs2_xattr_list_entries.
