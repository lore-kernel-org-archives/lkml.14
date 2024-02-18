Received: from alerce.blitiri.com.ar (alerce.blitiri.com.ar [49.12.208.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7DD71B57
	for <linux-kernel@vger.kernel.org>; Sun, 18 Feb 2024 19:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.208.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708285897; cv=none; b=GlwdBe3qukoy7h3uSTauG8J4ujiECaP2B9JMnh94WZFg/HwLX6eJhsU50Sv2O8Zj2K3L0IUBQgf+kiBE5ZaDsLKzSmklikfmL3ufVx9Q1eVaThyRAbxe34jkCaLPjF6w60wRtIvVbiZkJi8Qq/HcESUcEyouPuzNbTYRkyulxuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708285897; c=relaxed/simple;
	bh=M6eSb0oeupi57UE5O2+bBR18+q2i2okEZ18XgE2QKuM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qW0UwJMoQFow3JLlC0O4jHZOjXFxngqO/docVF3hjhODOCEYBjFkZbH3DT8gtzMtXXCC/stIEYPZ168FA3K9Z77/iKWJRCgU05DGTjvOIwVU5+1xMvgcB5qU58I1aNuAlCU9YQNa83SV5PGLfEDOCgI6rNmCkHAnSJaOybveUb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdfg.com.ar; spf=pass smtp.mailfrom=sdfg.com.ar; arc=none smtp.client-ip=49.12.208.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdfg.com.ar
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sdfg.com.ar
Received: from lindsay.fibertel.com.ar
	by sdfg.com.ar (chasquid) with ESMTPSA
	tls TLS_AES_128_GCM_SHA256
	(over submission, TLS-1.3, envelope from "rodrigo@sdfg.com.ar")
	; Sun, 18 Feb 2024 19:51:33 +0000
From: Rodrigo Campos <rodrigo@sdfg.com.ar>
To: Willy Tarreau <w@1wt.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-kernel@vger.kernel.org,
	Rodrigo Campos <rodrigo@sdfg.com.ar>
Subject: [PATCH v3 2/4] tools/nolibc: Fix strlcat() return code and size usage
Date: Sun, 18 Feb 2024 16:51:04 -0300
Message-ID: <20240218195110.1386840-3-rodrigo@sdfg.com.ar>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240218195110.1386840-1-rodrigo@sdfg.com.ar>
References: <20240218195110.1386840-1-rodrigo@sdfg.com.ar>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The return code should always be strlen(src) + strnlen(dst, size).

Let's make sure to copy at most size-1 bytes from src and null-terminate
the dst buffer if we did copied something.

While we can use strnlen() and strncpy() to implement strlcat(), this is
simple enough and results in shorter code when compiled.

Signed-off-by: Rodrigo Campos <rodrigo@sdfg.com.ar>
---
 tools/include/nolibc/string.h | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/tools/include/nolibc/string.h b/tools/include/nolibc/string.h
index ed15c22b1b2a..cc51fd6b63d0 100644
--- a/tools/include/nolibc/string.h
+++ b/tools/include/nolibc/string.h
@@ -187,22 +187,31 @@ char *strndup(const char *str, size_t maxlen)
 static __attribute__((unused))
 size_t strlcat(char *dst, const char *src, size_t size)
 {
-	size_t len;
-	char c;
+	size_t len = 0;
 
-	for (len = 0; dst[len];	len++)
-		;
+	for (; len < size; len++) {
+		if (dst[len] == '\0')
+			break;
+	}
 
-	for (;;) {
-		c = *src;
-		if (len < size)
-			dst[len] = c;
-		if (!c)
+	/*
+	 * We want len < size-1. But as size is unsigned and can wrap
+	 * around, we use len + 1 instead.
+	 */
+	while (len + 1 < size) {
+		dst[len] = *src;
+		if (*src == '\0')
 			break;
 		len++;
 		src++;
 	}
 
+	if (len < size)
+		dst[len] = '\0';
+
+	while (*src++)
+		len++;
+
 	return len;
 }
 
-- 
2.43.0

