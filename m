Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A803D56D
	for <linux-kernel@vger.kernel.org>; Mon, 22 Jan 2024 14:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705935051; cv=none; b=WwchidrqZ6Noj5nxB42MIN9FfmE49qS+4C7uHkkZtS9sTOoaWPG8haDH0Rqg4fOmoJiPWzZxbEIvNXHNZ0jWao+P2bWTkc/q0VtCKBusKbBqAhOtOfvSiLYDtwOvrTANhMj5P/f64aJsG5pbll8IEzDXeUyyyO1SrjqPLt19eU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705935051; c=relaxed/simple;
	bh=G3sszZquVnd060FqVtCYQu5A+l3gwRuUVqyVxfx6PVE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pbOqc/BqykHt+ZhBNWaGkX9noPhb8oFdZV5OD1RcNJGEVlxczcuhs24w4wuRxQn5DnSlXlSH9s6vQnbrVVPzQZwCg+o5BeohM1JMWHasPjo4xG2pg4x0QO7hFLu3MmAZpsaXwIKVdEQ+xYUqVfecAhT7J9l4QDE6eChLd67yVew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:955e:bba5:7ff4:cfb6])
	by xavier.telenet-ops.be with bizsmtp
	id dqqn2B00Q0ZxL6o01qqndy; Mon, 22 Jan 2024 15:50:48 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rRvcc-00GGyl-PI;
	Mon, 22 Jan 2024 15:50:47 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rRvdP-00CFhw-Pn;
	Mon, 22 Jan 2024 15:50:47 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/3] lib: dhry: remove unneeded <linux/mutex.h>
Date: Mon, 22 Jan 2024 15:50:43 +0100
Message-Id: <cf8fafaedccf96143f1513745c43a457480bfc24.1705934853.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1705934853.git.geert+renesas@glider.be>
References: <cover.1705934853.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Dhrystone benchmark test does not use mutexes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 lib/dhry_run.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/lib/dhry_run.c b/lib/dhry_run.c
index f15ac666e9d38bd2..e6a279dabf848eb3 100644
--- a/lib/dhry_run.c
+++ b/lib/dhry_run.c
@@ -10,7 +10,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
-#include <linux/mutex.h>
 #include <linux/smp.h>
 
 #define DHRY_VAX	1757
-- 
2.34.1

