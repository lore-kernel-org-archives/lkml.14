Received: from njjs-sys-mailin01.njjs.baidu.com (mx310.baidu.com [180.101.52.44])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12EE22F43
	for <linux-kernel@vger.kernel.org>; Fri, 14 Jun 2024 05:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=180.101.52.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718342099; cv=none; b=dP3nUyAwr5MFlS2QoUIFEps9y/QjKgbLmuyF3MrydfOc7Jm8UU8enRwf0Wk4mYEVm1e4g4Ndy45sVP/Xkq4QRvVPtf/qpu9LXmT96vIj6ZglwlhfJTiUkMcjrzrKpuOI6e8E23Ok0oJpoGL3aNecKDvXDiI5oR9pU1SLHynIBEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718342099; c=relaxed/simple;
	bh=uiEvY12mTUmpxwij1oiWXlTlEpQzNEHXNSfhXCKrA48=;
	h=From:To:Cc:Subject:Date:Message-Id; b=LUP2YxT8CgWlj47VKoSTsGLOZQctmpsDpdUyyeVdqE9+wbKF/lE4kjjkLwiXFq5MPZ8+/cpKaH4oFaraLCjsrENdsGEMK8Nk2+7bD5z1f7WC/9cJG+NBgV/+ogkBs1U/3BPq9bihQvicUWm0Vdt5cgDpkciizrHAH+rdQS+vVZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com; spf=pass smtp.mailfrom=baidu.com; arc=none smtp.client-ip=180.101.52.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baidu.com
Received: from localhost (bjhw-sys-rpm015653cc5.bjhw.baidu.com [10.227.53.39])
	by njjs-sys-mailin01.njjs.baidu.com (Postfix) with ESMTP id A24277F0006A;
	Fri, 14 Jun 2024 13:14:53 +0800 (CST)
From: Li RongQing <lirongqing@baidu.com>
To: kirill.shutemov@linux.intel.com,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	rick.p.edgecombe@intel.com
Cc: Li RongQing <lirongqing@baidu.com>
Subject: [PATCH][v2] virt: tdx-guest: Don't free decrypted memory
Date: Fri, 14 Jun 2024 13:14:52 +0800
Message-Id: <20240614051452.14548-1-lirongqing@baidu.com>
X-Mailer: git-send-email 2.9.4
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

In CoCo VMs it is possible for the untrusted host to cause
set_memory_decrypted() to fail such that an error is returned
and the resulting memory is shared. Callers need to take care
to handle these errors to avoid returning decrypted (shared)
memory to the page allocator, which could lead to functional
or security issues.

So when set_memory_decrypted fails, leak decrypted memory, and
print an error message

Signed-off-by: Li RongQing <lirongqing@baidu.com>
---
diff with v1: leak the page, and print error

 drivers/virt/coco/tdx-guest/tdx-guest.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/virt/coco/tdx-guest/tdx-guest.c b/drivers/virt/coco/tdx-guest/tdx-guest.c
index 1253bf7..3a6e76c8 100644
--- a/drivers/virt/coco/tdx-guest/tdx-guest.c
+++ b/drivers/virt/coco/tdx-guest/tdx-guest.c
@@ -125,7 +125,7 @@ static void *alloc_quote_buf(void)
 		return NULL;
 
 	if (set_memory_decrypted((unsigned long)addr, count)) {
-		free_pages_exact(addr, len);
+		pr_err("Failed to set Quote buffer decrypted, leak the buffer\n");
 		return NULL;
 	}
 
-- 
2.9.4

