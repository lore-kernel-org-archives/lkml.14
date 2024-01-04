Received: from mail.valinux.co.jp (mail.valinux.co.jp [210.128.90.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3046208A5
	for <linux-kernel@vger.kernel.org>; Thu,  4 Jan 2024 09:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Received: from localhost (localhost [127.0.0.1])
	by mail.valinux.co.jp (Postfix) with ESMTP id D92A1A9646;
	Thu,  4 Jan 2024 18:30:06 +0900 (JST)
X-Virus-Scanned: Debian amavisd-new at valinux.co.jp
Received: from mail.valinux.co.jp ([127.0.0.1])
	by localhost (mail.valinux.co.jp [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6-ZTAfep-mIB; Thu,  4 Jan 2024 18:30:06 +0900 (JST)
Received: from localhost.localdomain (vagw.valinux.co.jp [210.128.90.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.valinux.co.jp (Postfix) with ESMTPSA id BE162A8F34;
	Thu,  4 Jan 2024 18:30:06 +0900 (JST)
From: takakura@valinux.co.jp
To: luto@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ryo Takakura <takakura@valinux.co.jp>
Subject: [PATCH] x86/entry: correct spelling in ret_from_fork_asm()
Date: Thu,  4 Jan 2024 18:29:29 +0900
Message-Id: <20240104092929.4748-1-takakura@valinux.co.jp>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ryo Takakura <takakura@valinux.co.jp>

Correct the word "through" to "though" in the comment.

Signed-off-by: Ryo Takakura <takakura@valinux.co.jp>
---
 arch/x86/entry/entry_64.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/entry/entry_64.S b/arch/x86/entry/entry_64.S
index 567d973eed03..4841e6cc6cfa 100644
--- a/arch/x86/entry/entry_64.S
+++ b/arch/x86/entry/entry_64.S
@@ -224,7 +224,7 @@ SYM_FUNC_END(__switch_to_asm)
 .pushsection .text, "ax"
 SYM_CODE_START(ret_from_fork_asm)
 	/*
-	 * This is the start of the kernel stack; even through there's a
+	 * This is the start of the kernel stack; even though there's a
 	 * register set at the top, the regset isn't necessarily coherent
 	 * (consider kthreads) and one cannot unwind further.
 	 *
-- 
2.34.1

