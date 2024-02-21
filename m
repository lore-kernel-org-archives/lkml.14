Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FE31487E6
	for <linux-kernel@vger.kernel.org>; Wed, 21 Feb 2024 19:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708544504; cv=none; b=V5Ohj2JpXGF4lgjZ6coUU4Ap73bFpOrErKIMGMuTwI8mXMKjFe4A1B62Wg8Cn81sszc5zfOQ6gCRopSNVQYNqKzl2apKu8uxmdl+BOnp3mj+y2QqA83zsThZiHM6dOvOtkpvJzK81EgcVAylO2baMiOPYU/BHX6ROHCBH5FZkXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708544504; c=relaxed/simple;
	bh=tJ3w7T50tuSGE7zeIkRop76WTSZpdbl8TVHGhzHrDHo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RTKpxLXxTL49vLgkr/HpJqOBGA9120CqfBKeJVIPHGNr7jLBTkx5IYZgU1JafBJi9uhFRJUeNk9WMS9GZpCxu9zFTGpMVCKcqVUr7AQKMmaw6gzt485bLct9JhxpfL/0PUGbc8N2bAPTStRtuQkMittvmC/OgLzZurBYGUeCgk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I60tfXUB; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I60tfXUB"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dcc05887ee9so8540198276.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Feb 2024 11:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708544500; x=1709149300; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tPPJBer4xtwbKjpAS2Ohhk9ejLfkpDLeASf186TPNEc=;
        b=I60tfXUBQ7h4hK/1lnwmCB9svJL5J/Q95mhSU58YPOQhMpkiOy3JoeaU8LEs+wXIbx
         0i1ti2VW+V6uszIxTNSHuregujLmiTznjqIzc4INDeSN42c/JOrNDozj3zNtKXORqHnE
         Ak6j3n+QIsz2tx85cuFB2KUrLWBQaouw4f1pnuiMjaBvVSEXYOsc0jFtRatrZynt+cSd
         RAIosOEG/hqzTY/by4ODaFZB1Xi3DXC12q0gliEttJx4/rt771FuJ+OmPzRm8FceQIAx
         Fi0rTH8YwEJL+NuBBlC8Mc9yvwxX/7H0RiXjGg4h/xkpyHkkWc/mvnRlqz9JBPO0nEu8
         WBLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708544500; x=1709149300;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tPPJBer4xtwbKjpAS2Ohhk9ejLfkpDLeASf186TPNEc=;
        b=p5J4E4HMS7DAkP2BXalVHiKbDHPDrlFzVBgqom7gmy/xv5kAehzZ5KAn2gNbs0LXXQ
         gdqieGAFXB6kthgwbjH35UY3/kB8KS05muDn1Lvbxx5fJDinMAg3i/9Db4ju2xEO6NUI
         M3ol9AdMfdK3mL5cO5ZmqT1WKb/kvX76/yuLNcKaITSzwwNybhLg50kd+fabKYRdvT0F
         aWznJs4sXKTWejQA0Cb1CfB5gtYckUroJN7EfIpGY7EKbilr/BUiO95EUqOkld/utGIM
         0qev6MgOLSmMly5Mra1lgkEtrkNxI/FHxeMRWK7sBQddiPV+YugAx4SMnTChSElKNCWh
         mzXw==
X-Forwarded-Encrypted: i=1; AJvYcCWykjo8SBjbeClxmOiEGdFzeSvPlrA4fMnj/ROh1l05NUX7zW7sclljREmr61c/C5B2yzJeAvusI9H0Lev+8PbXdlK3ma87U9Axw0i4
X-Gm-Message-State: AOJu0YxdhMvp0d0gPlgQ8AvgzAqkUY6nsYpQeASTDHEYcBACHquFjexI
	HdIT4qFSmvK5w4Yj0X1dMvmR36SBAstCCfL9dh4QHTW+c1e6nLgOwsApAhb62S1uWBZIcVXt+eO
	HSg==
X-Google-Smtp-Source: AGHT+IFeU9fBllBbqeIlv/z5gUqfuWqisiGNNlq6CXUqUD/DUi+PbsZNeU43mHL5nXzTrIUoTAFCk30SjNk=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:201:953b:9a4e:1e10:3f07])
 (user=surenb job=sendgmr) by 2002:a05:6902:1008:b0:dbe:387d:a8ef with SMTP id
 w8-20020a056902100800b00dbe387da8efmr14985ybt.1.1708544500266; Wed, 21 Feb
 2024 11:41:40 -0800 (PST)
Date: Wed, 21 Feb 2024 11:40:33 -0800
In-Reply-To: <20240221194052.927623-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240221194052.927623-1-surenb@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240221194052.927623-21-surenb@google.com>
Subject: [PATCH v4 20/36] mm/page_ext: enable early_page_ext when CONFIG_MEM_ALLOC_PROFILING_DEBUG=y
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: kent.overstreet@linux.dev, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, roman.gushchin@linux.dev, mgorman@suse.de, 
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com, 
	penguin-kernel@i-love.sakura.ne.jp, corbet@lwn.net, void@manifault.com, 
	peterz@infradead.org, juri.lelli@redhat.com, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, tglx@linutronix.de, mingo@redhat.com, 
	dave.hansen@linux.intel.com, x86@kernel.org, peterx@redhat.com, 
	david@redhat.com, axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org, 
	nathan@kernel.org, dennis@kernel.org, tj@kernel.org, muchun.song@linux.dev, 
	rppt@kernel.org, paulmck@kernel.org, pasha.tatashin@soleen.com, 
	yosryahmed@google.com, yuzhao@google.com, dhowells@redhat.com, 
	hughd@google.com, andreyknvl@gmail.com, keescook@chromium.org, 
	ndesaulniers@google.com, vvvvvv@google.com, gregkh@linuxfoundation.org, 
	ebiggers@google.com, ytcoode@gmail.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	bristot@redhat.com, vschneid@redhat.com, cl@linux.com, penberg@kernel.org, 
	iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com, glider@google.com, 
	elver@google.com, dvyukov@google.com, shakeelb@google.com, 
	songmuchun@bytedance.com, jbaron@akamai.com, rientjes@google.com, 
	minchan@google.com, kaleshsingh@google.com, surenb@google.com, 
	kernel-team@android.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, kasan-dev@googlegroups.com, 
	cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For all page allocations to be tagged, page_ext has to be initialized
before the first page allocation. Early tasks allocate their stacks
using page allocator before alloc_node_page_ext() initializes page_ext
area, unless early_page_ext is enabled. Therefore these allocations will
generate a warning when CONFIG_MEM_ALLOC_PROFILING_DEBUG is enabled.
Enable early_page_ext whenever CONFIG_MEM_ALLOC_PROFILING_DEBUG=y to
ensure page_ext initialization prior to any page allocation. This will
have all the negative effects associated with early_page_ext, such as
possible longer boot time, therefore we enable it only when debugging
with CONFIG_MEM_ALLOC_PROFILING_DEBUG enabled and not universally for
CONFIG_MEM_ALLOC_PROFILING.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/page_ext.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/mm/page_ext.c b/mm/page_ext.c
index 3c58fe8a24df..e7d8f1a5589e 100644
--- a/mm/page_ext.c
+++ b/mm/page_ext.c
@@ -95,7 +95,16 @@ unsigned long page_ext_size;
 
 static unsigned long total_usage;
 
+#ifdef CONFIG_MEM_ALLOC_PROFILING_DEBUG
+/*
+ * To ensure correct allocation tagging for pages, page_ext should be available
+ * before the first page allocation. Otherwise early task stacks will be
+ * allocated before page_ext initialization and missing tags will be flagged.
+ */
+bool early_page_ext __meminitdata = true;
+#else
 bool early_page_ext __meminitdata;
+#endif
 static int __init setup_early_page_ext(char *str)
 {
 	early_page_ext = true;
-- 
2.44.0.rc0.258.g7320e95886-goog

