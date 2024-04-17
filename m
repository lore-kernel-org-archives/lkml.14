Received: from mail.nfschina.com (unknown [42.101.60.195])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 4E36458ADE;
	Wed, 17 Apr 2024 08:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713342739; cv=none; b=nygRaRPxJe3RGvKbXlUneT5dI5RonQ3AOQ/hRgykw/T9WCDWU/Db+RhQKf9ht5lv9kiF0L4r4rubSV+TIeeDAR5Pijow1A/Hxx+W9OFAME5vuC4Q/R7BGuDW1CtsH2E+2rJEd0eKs2VkaYSyXU/KmLGP7Z6xzvpBzekpU4/fR4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713342739; c=relaxed/simple;
	bh=iD9NnLJfAZU8fCgqT+cPRna6Exsx7/eFsEB1T7DYLNw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gv3eQ7OZh2hgvsQz/GdShj0DIxkQnGAF7gEY24hZEKFL35KJlee2sa1JWejos8/uVWbQTN/MiH1AnZwGU1Z0D1R/aoVxOhQ6LOCips+XaxLXQAqW9YO+Fz16W5ImH3HudHKDil7tCZJFRqFnddwYQVBJ0zOnKqUYDEprsFrzBYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id 398FA6061BF44;
	Wed, 17 Apr 2024 16:32:11 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com
Cc: Su Hui <suhui@nfschina.com>,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	hch@tuxera.com,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] fs: hfsplus: fix an error code problem in hfsplus_sync_fs()
Date: Wed, 17 Apr 2024 16:31:36 +0800
Message-Id: <20240417083135.2245257-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang Static Checker (scan-build) Warning:
fs/hfsplus/super.c: line 236, column 3
Value stored to 'error2' is never read.

Fix this typo error by assigning 'error2' to 'error'.

Fixes: 52399b171dfa ("hfsplus: use raw bio access for the volume headers")
Signed-off-by: Su Hui <suhui@nfschina.com>
---
 fs/hfsplus/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/hfsplus/super.c b/fs/hfsplus/super.c
index 97920202790f..5ee9cbccdff9 100644
--- a/fs/hfsplus/super.c
+++ b/fs/hfsplus/super.c
@@ -233,7 +233,7 @@ static int hfsplus_sync_fs(struct super_block *sb, int wait)
 				  sbi->s_backup_vhdr_buf, NULL, REQ_OP_WRITE |
 				  REQ_SYNC);
 	if (!error)
-		error2 = error;
+		error = error2;
 out:
 	mutex_unlock(&sbi->alloc_mutex);
 	mutex_unlock(&sbi->vh_mutex);
-- 
2.30.2

