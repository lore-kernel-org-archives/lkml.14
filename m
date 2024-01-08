Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689055CB0;
	Mon,  8 Jan 2024 00:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="nPGrkrNr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=3bMaMkziS0/N+UDamXhqPcO/Lypj3kmw4TlMaIlfB4o=; b=nPGrkrNrjpUqicje19YYn42kvj
	FsVR3ie557JMeoyvi4Yf0DSjANmIfuzFpoyVxtmF983FclU487u/M1KnNUud/NHizdWEOM0nFJfnu
	V40DGhVtCsvbq5bxBqm6sHsPyelbvJqtwrIlatpWN11tEIx6fKfw3gn/dKVXsgda/eNSivLbTIDLZ
	suG5LzhiYIu+b9jNHXz5i2Fr6eSuKGZRpkhPGYGEofjVNgK6i/r4qyC1F0glh7c5XzURf9zH35dGf
	K5NyigXzVJWEJOQePXq3Znb3yKWoI8+WdiQxnumfo3wz2KD8tzxZ3lYGgpZGCmH1c8UiGu5dxhuz1
	NNh2Mi1w==;
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rMddV-003lj6-08;
	Mon, 08 Jan 2024 00:37:01 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Subject: [PATCH] kernel-doc: drop looking for "MACDOC"
Date: Sun,  7 Jan 2024 16:37:00 -0800
Message-ID: <20240108003700.13418-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linux kernel does not use "MACDOC" in any documenation or any
source files, so stop searching for it.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
---
 scripts/kernel-doc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -- a/scripts/kernel-doc b/scripts/kernel-doc
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1907,7 +1907,7 @@ sub process_proto_function($$) {
 
     $x =~ s@\/\/.*$@@gos; # strip C99-style comments to end of line
 
-    if ($x =~ m#\s*/\*\s+MACDOC\s*#io || ($x =~ /^#/ && $x !~ /^#\s*define/)) {
+    if ($x =~ /^#/ && $x !~ /^#\s*define/) {
 	# do nothing
     }
     elsif ($x =~ /([^\{]*)/) {
