Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC86479D9;
	Sat,  6 Jan 2024 14:55:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52ABBC433C7;
	Sat,  6 Jan 2024 14:55:28 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] LoongArch: Change SHMLBA from SZ_64K to PAGE_SIZE
Date: Sat,  6 Jan 2024 22:55:01 +0800
Message-Id: <20240106145501.3370364-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LoongArch has hardware page coloring for L1 Cache, so we don't have
cache aliases. But SFB (Store Fill Buffer) still has aliases. So we
define SHMLBA to SZ_64K previously. But there are losts of applications
use PAGE_SIZE rather than SHMLBA to mmap() file pages and shared pages.
Of course we can fix them one by one, but not easy.

On the other hand, we can simply disable SFB for 4KB page size to fix
cache alias (there will be performance decrease, but acceptable), and
in future we will fix SFB in hardware. So we can safely define SHMLBA to
PAGE_SIZE (use the generic shmparam.h) to make life easier.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/include/asm/shmparam.h | 12 ------------
 arch/loongarch/kernel/head.S          | 10 ++++++++++
 2 files changed, 10 insertions(+), 12 deletions(-)
 delete mode 100644 arch/loongarch/include/asm/shmparam.h

diff --git a/arch/loongarch/include/asm/shmparam.h b/arch/loongarch/include/asm/shmparam.h
deleted file mode 100644
index c9554f48d2df..000000000000
--- a/arch/loongarch/include/asm/shmparam.h
+++ /dev/null
@@ -1,12 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (C) 2020-2022 Loongson Technology Corporation Limited
- */
-#ifndef _ASM_SHMPARAM_H
-#define _ASM_SHMPARAM_H
-
-#define __ARCH_FORCE_SHMLBA	1
-
-#define	SHMLBA	SZ_64K		 /* attach addr a multiple of this */
-
-#endif /* _ASM_SHMPARAM_H */
diff --git a/arch/loongarch/kernel/head.S b/arch/loongarch/kernel/head.S
index 53b883db0786..be187e99d358 100644
--- a/arch/loongarch/kernel/head.S
+++ b/arch/loongarch/kernel/head.S
@@ -75,6 +75,11 @@ SYM_CODE_START(kernel_entry)			# kernel entry point
 	la.pcrel	t0, fw_arg2
 	st.d		a2, t0, 0
 
+#ifdef CONFIG_PAGE_SIZE_4KB
+	li.d		t0, 0
+	li.d		t1, CSR_STFILL
+	csrxchg		t0, t1, LOONGARCH_CSR_IMPCTL1
+#endif
 	/* KSave3 used for percpu base, initialized as 0 */
 	csrwr		zero, PERCPU_BASE_KS
 	/* GPR21 used for percpu base (runtime), initialized as 0 */
@@ -127,6 +132,11 @@ SYM_CODE_START(smpboot_entry)
 
 	JUMP_VIRT_ADDR	t0, t1
 
+#ifdef CONFIG_PAGE_SIZE_4KB
+	li.d		t0, 0
+	li.d		t1, CSR_STFILL
+	csrxchg		t0, t1, LOONGARCH_CSR_IMPCTL1
+#endif
 	/* Enable PG */
 	li.w		t0, 0xb0		# PLV=0, IE=0, PG=1
 	csrwr		t0, LOONGARCH_CSR_CRMD
-- 
2.39.3

