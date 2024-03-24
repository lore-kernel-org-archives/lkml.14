Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8B62251F3;
	Sun, 24 Mar 2024 23:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711321941; cv=none; b=HaVZuPse1jAf88oQwf9xlS1QOoG5F/MI+GiV9LEcNbzZJTlBF476epY62xMCbkRP9ILJVzbhr97IjuNimOOvlK5aMeXtTNLCm+wkv7hRqMsHSHjdry/gqBaWTQxjbHdAq4XJOjNBx03rbwxaJq6ccwSmQKKsBhBlcYBYmfG1QCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711321941; c=relaxed/simple;
	bh=5Z5U0pAw/7zQacgJCSeiw1RFy6/bQLMKwZHPHOQAhKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TVB8x2Mg8zLyrQeSh1qyOdNYL9CnQG0vtbqlUPmc6t9o9R6d1iAbNgTfSBdiZ+niAjgJhBhAw5mrmZJ0k7NyafuYxMmvloaWRQ5b27K1np2qPDv6rxxHthKbAl5+n30Di1Dc71OhcS8kT8T0WYYlezTI06IRjp+M7Y/W5TtvyvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UjvauvGT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UjvauvGT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C9AEC43394;
	Sun, 24 Mar 2024 23:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711321940;
	bh=5Z5U0pAw/7zQacgJCSeiw1RFy6/bQLMKwZHPHOQAhKQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UjvauvGTgq+RSTI5e+9XraPD9QXELQFYDchAOnueJrr0GwrVl8KDzIikuxJ8G8NWx
	 R3k64lAWJwZEgODeiy9SnMdiT7VebxaA/Y8rTwIKOqx9jWPMgpZGQGfJP63mrBjd2/
	 BLqj29J+i2Q/LamxWIkz1QerKWc19W5cJZMmBQJ8Wjypi+QhzqzE9rNoba095ZEAZA
	 igKE1CY/tL+gQEHtQrN7GTgTFCaWVV6r2oaIbYP9Y1ST8VNFqQLuUz1Ki/9vmwh+tm
	 eGp1vn1ucyYWMEwfS/0fH3DW4mklh6b+apP5faq3ogMKGTzAW+zzOPFEfaXAUx1DYy
	 56w+dLNVwqhdA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jeff Layton <jlayton@kernel.org>,
	Chuck Lever <chuck.lever@oracle.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 6.1 012/451] nfsd: update comment over __nfsd_file_cache_purge
Date: Sun, 24 Mar 2024 19:04:48 -0400
Message-ID: <20240324231207.1351418-13-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240324231207.1351418-1-sashal@kernel.org>
References: <20240324231207.1351418-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Jeff Layton <jlayton@kernel.org>

[ Upstream commit 972cc0e0924598cb293b919d39c848dc038b2c28 ]

Signed-off-by: Jeff Layton <jlayton@kernel.org>
Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/nfsd/filecache.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/nfsd/filecache.c b/fs/nfsd/filecache.c
index 51e2947c21a7d..9b7082fdd2115 100644
--- a/fs/nfsd/filecache.c
+++ b/fs/nfsd/filecache.c
@@ -907,7 +907,8 @@ nfsd_file_cache_init(void)
  * @net: net-namespace to shut down the cache (may be NULL)
  *
  * Walk the nfsd_file cache and close out any that match @net. If @net is NULL,
- * then close out everything. Called when an nfsd instance is being shut down.
+ * then close out everything. Called when an nfsd instance is being shut down,
+ * and when the exports table is flushed.
  */
 static void
 __nfsd_file_cache_purge(struct net *net)
-- 
2.43.0

