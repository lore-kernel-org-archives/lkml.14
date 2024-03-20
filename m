Received: from mailscanner05.zoner.fi (mailscanner05.zoner.fi [5.44.246.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726EC85620
	for <linux-kernel@vger.kernel.org>; Wed, 20 Mar 2024 18:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.44.246.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710960532; cv=none; b=kMeq2qeekBlF7mSD2B81RGg14OAjWrRE5spMoquinY19gLjhXrAjmnVxp2qoyJhZAX64A0tzC/A8uL5cWoANfRi8m7BQX/2scV/saPVSGX/w+vuJ+9BI5s8BdQLF2NYQ4bSMvWzW2KmNkR7kTqZxHpvQxgoz5BhGqX/Yi6ZL+gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710960532; c=relaxed/simple;
	bh=/SCw4biXcQwxbS8rB0xZT7OMJzC9utywPDK96DZ5Xao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SN0HllpqZ3Uil7pSXaN0U4oAhKpJ0pc0wiI4+fX0S7VMssRp/w4KU6dhHKKSVCN5JXr5OA5YajZhnWjlwS7UjNRaOgbYXOhigBlo8qiYD1JI0/lMdipfMHRSDC2hDTuI82igatBDKg+1cp4eBKK1HspiigvHwu4z0d3iiUduE7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tukaani.org; spf=pass smtp.mailfrom=tukaani.org; arc=none smtp.client-ip=5.44.246.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tukaani.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tukaani.org
Received: from www25.zoner.fi (www25.zoner.fi [84.34.147.45])
	by mailscanner05.zoner.fi (Postfix) with ESMTPS id F269E21235;
	Wed, 20 Mar 2024 20:39:25 +0200 (EET)
Received: from mail.zoner.fi ([84.34.147.244])
	by www25.zoner.fi with esmtp (Exim 4.96.1-7-g79877b70e)
	(envelope-from <lasse.collin@tukaani.org>)
	id 1rn0qT-0001dW-2Y;
	Wed, 20 Mar 2024 20:39:25 +0200
From: Lasse Collin <lasse.collin@tukaani.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Lasse Collin <lasse.collin@tukaani.org>,
	Jia Tan <jiat0218@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/11] MAINTAINERS: Add XZ Embedded maintainers
Date: Wed, 20 Mar 2024 20:38:34 +0200
Message-ID: <20240320183846.19475-2-lasse.collin@tukaani.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240320183846.19475-1-lasse.collin@tukaani.org>
References: <20240320183846.19475-1-lasse.collin@tukaani.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I have been the maintainer of the upstream project since I submitted
the code to Linux in 2010 but I forgot to add myself to MAINTAINERS.
Nowadays Jia Tan is the other maintainer.

Reviewed-by: Jia Tan <jiat0218@gmail.com>
Signed-off-by: Lasse Collin <lasse.collin@tukaani.org>
---
 MAINTAINERS | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 43b39956694a..35f4ee968626 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24371,6 +24371,20 @@ S:	Maintained
 F:	drivers/spi/spi-xtensa-xtfpga.c
 F:	sound/soc/xtensa/xtfpga-i2s.c
 
+XZ EMBEDDED
+M:	Lasse Collin <lasse.collin@tukaani.org>
+M:	Jia Tan <jiat0218@gmail.com>
+S:	Maintained
+W:	https://xz.tukaani.org/xz-embedded/
+B:	https://github.com/tukaani-project/xz-embedded/issues
+C:	irc://irc.libera.chat/tukaani
+F:	Documentation/staging/xz.rst
+F:	include/linux/decompress/unxz.h
+F:	include/linux/xz.h
+F:	lib/decompress_unxz.c
+F:	lib/xz/
+F:	scripts/xz_wrap.sh
+
 YAM DRIVER FOR AX.25
 M:	Jean-Paul Roubelat <jpr@f6fbb.org>
 L:	linux-hams@vger.kernel.org
-- 
2.44.0

