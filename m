Received: from out-185.mta1.migadu.com (out-185.mta1.migadu.com [95.215.58.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3137312E70
	for <linux-kernel@vger.kernel.org>; Tue,  2 Jan 2024 13:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="LLGCqrdb"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1704201216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uwJWRA1Ti2ov5Iev54G7xXAXLlg2CRbAiefTt3ZwHf4=;
	b=LLGCqrdbm54bgGR02vZyuR1VdBL4mcjuR/BGT/9+I895KeZ7fyx+zd7BxXb0RBDzZmE25q
	AMVfKXgVW6wXKRG7kBGALWtRZYvIMnFzhrilIzjsqIv/oXeOP1qJqaKxBRlTDA+uY6LEko
	g3MUn0pBdC3pivvQ/woTMSibZfbEMZQ=
From: Gang Li <gang.li@linux.dev>
To: David Hildenbrand <david@redhat.com>,
	David Rientjes <rientjes@google.com>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Tim Chen <tim.c.chen@linux.intel.com>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	ligang.bdlg@bytedance.com,
	Gang Li <gang.li@linux.dev>
Subject: [PATCH v3 5/7] hugetlb: have CONFIG_HUGETLBFS select CONFIG_PADATA
Date: Tue,  2 Jan 2024 21:12:47 +0800
Message-Id: <20240102131249.76622-6-gang.li@linux.dev>
In-Reply-To: <20240102131249.76622-1-gang.li@linux.dev>
References: <20240102131249.76622-1-gang.li@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Now hugetlb uses padata_do_multithreaded for parallel initialization,
so select CONFIG_PADATA.

Signed-off-by: Gang Li <gang.li@linux.dev>
---
 fs/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/Kconfig b/fs/Kconfig
index 89fdbefd1075f..a57d6e6c41e6f 100644
--- a/fs/Kconfig
+++ b/fs/Kconfig
@@ -262,6 +262,7 @@ menuconfig HUGETLBFS
 	depends on X86 || SPARC64 || ARCH_SUPPORTS_HUGETLBFS || BROKEN
 	depends on (SYSFS || SYSCTL)
 	select MEMFD_CREATE
+	select PADATA
 	help
 	  hugetlbfs is a filesystem backing for HugeTLB pages, based on
 	  ramfs. For architectures that support it, say Y here and read
-- 
2.20.1

