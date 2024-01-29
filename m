Received: from alerce.blitiri.com.ar (alerce.blitiri.com.ar [49.12.208.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A819965BA4
	for <linux-kernel@vger.kernel.org>; Mon, 29 Jan 2024 14:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.208.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706537747; cv=none; b=sP6oWoAtIgGVBQveYJuTRiIQq4y/l9d5M71CLVcBYtBiOJfNB8/B1EG93UAUUsxMtaCXTzhSueemVNvzFBbys4M3ZfSkUr4aotKDYd+/nBf2EIvY5OLz7U/e3vIXXHuEA7hvb7UbrMEdT4H+tnEyhNnzNIoHzNx5fWxulto5444=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706537747; c=relaxed/simple;
	bh=jJmfIz4w556Ptcd31JHp/E5FbsAW+xG8mxPMPAJNtj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u2/7FTuF6kEBELnYLRb+cmnwQY/vNEh2uMOqd4U+1QpYyAgSvaDZIodx+/zobhe+IZA9alRz9SFtBA6AoRkbIyF3Wstms/pPOpEqVsLus7PX7r3Wb6dpCcUqLo6zj3b5b9iu44/LdTdmqyHDFcr3cqFlr8ou2badJr+hKe6zUy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdfg.com.ar; spf=pass smtp.mailfrom=sdfg.com.ar; arc=none smtp.client-ip=49.12.208.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdfg.com.ar
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sdfg.com.ar
Received: from localhost.localdomain
	by sdfg.com.ar (chasquid) with ESMTPSA
	tls TLS_AES_128_GCM_SHA256
	(over submission, TLS-1.3, envelope from "rodrigo@sdfg.com.ar")
	; Mon, 29 Jan 2024 14:15:36 +0000
From: Rodrigo Campos <rodrigo@sdfg.com.ar>
To: Willy Tarreau <w@1wt.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-kernel@vger.kernel.org,
	Rodrigo Campos <rodrigo@sdfg.com.ar>
Subject: [PATCH 3/4] tools/nolibc: Fix strlcpy() return code and size usage
Date: Mon, 29 Jan 2024 15:15:15 +0100
Message-ID: <20240129141516.198636-4-rodrigo@sdfg.com.ar>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240129141516.198636-1-rodrigo@sdfg.com.ar>
References: <20240129141516.198636-1-rodrigo@sdfg.com.ar>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The return code should always be strlen(src), and we should copy at most
size-1 bytes.

While we are there, make sure to null-terminate the dst buffer.

Signed-off-by: Rodrigo Campos <rodrigo@sdfg.com.ar>
---
 tools/include/nolibc/string.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tools/include/nolibc/string.h b/tools/include/nolibc/string.h
index b2149e1342a8..e4bc0302967d 100644
--- a/tools/include/nolibc/string.h
+++ b/tools/include/nolibc/string.h
@@ -212,15 +212,16 @@ size_t strlcpy(char *dst, const char *src, size_t size)
 	size_t len;
 	char c;
 
-	for (len = 0;;) {
+	for (len = 0; len < size; len++) {
 		c = src[len];
-		if (len < size)
+		if (len < size - 1)
 			dst[len] = c;
+		if (len == size - 1)
+			dst[len] = '\0';
 		if (!c)
 			break;
-		len++;
 	}
-	return len;
+	return strlen(src);
 }
 
 static __attribute__((unused))
-- 
2.43.0

