Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 781C26E2AD
	for <linux-kernel@vger.kernel.org>; Tue,  6 Feb 2024 04:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707192931; cv=none; b=JZGZ0kZFAr4j4bVPxJ49wW3jW4k0yoaEJZin1HZqQ7Nvj2CZUbUOxqtDWoZoWPtYy5dbYoRGn4ecCFVCGTuCJYfe7sdQuAhHlf6GB2cyuTKmQATcF1emC+jDEKzrip6pXdZMgcNmt8aZIbgygdbbCtvIzc4ylZbeekTCeFHu3+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707192931; c=relaxed/simple;
	bh=kIavR/BFjazMLlOAuCnn8Q2ySkLNfpme59v/QVt+OMY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=d5ZEgC8724ObmRcCEEdu73fCGkBA5s4ROCCsqYy6EzSNoGE2O+kBT82TnLhg5yCoBP8++wk9vUoqXLB0amihNvXDy5kDpgPng9Gm7eXP4uD3ChhuxHZcJvmE7HyrkfoOxaKUgplNRw0549DGZT4akubpJpf/m6Nm+TOIN6+CBVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3CB3612FC;
	Mon,  5 Feb 2024 20:16:10 -0800 (PST)
Received: from a077893.arm.com (unknown [10.163.42.38])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E71473F762;
	Mon,  5 Feb 2024 20:15:24 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mm/cma: Drop cma_get_name()
Date: Tue,  6 Feb 2024 09:45:18 +0530
Message-Id: <20240206041518.438801-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cma_get_name() just returns cma->name without any additional transformation
unlike other helpers such as cma_get_base() and cma_get_size(). This helper
is not worth the additional indirection, and can be dropped after replacing
directly with cma->name in the sole caller __add_cma_heap().

Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 drivers/dma-buf/heaps/cma_heap.c | 2 +-
 include/linux/cma.h              | 1 -
 mm/cma.c                         | 5 -----
 3 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 4a63567e93ba..6ceb15060b02 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -376,7 +376,7 @@ static int __add_cma_heap(struct cma *cma, void *data)
 		return -ENOMEM;
 	cma_heap->cma = cma;
 
-	exp_info.name = cma_get_name(cma);
+	exp_info.name = cma->name;
 	exp_info.ops = &cma_heap_ops;
 	exp_info.priv = cma_heap;
 
diff --git a/include/linux/cma.h b/include/linux/cma.h
index 9db877506ea8..12ab7cd1d529 100644
--- a/include/linux/cma.h
+++ b/include/linux/cma.h
@@ -25,7 +25,6 @@ struct cma;
 extern unsigned long totalcma_pages;
 extern phys_addr_t cma_get_base(const struct cma *cma);
 extern unsigned long cma_get_size(const struct cma *cma);
-extern const char *cma_get_name(const struct cma *cma);
 
 extern int __init cma_declare_contiguous_nid(phys_addr_t base,
 			phys_addr_t size, phys_addr_t limit,
diff --git a/mm/cma.c b/mm/cma.c
index ed6581ef50c1..2627f4ba481f 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -45,11 +45,6 @@ unsigned long cma_get_size(const struct cma *cma)
 	return cma->count << PAGE_SHIFT;
 }
 
-const char *cma_get_name(const struct cma *cma)
-{
-	return cma->name;
-}
-
 static unsigned long cma_bitmap_aligned_mask(const struct cma *cma,
 					     unsigned int align_order)
 {
-- 
2.25.1

