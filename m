Received: from mail.nfschina.com (unknown [42.101.60.195])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 6FFEE56B7F;
	Tue, 20 Feb 2024 06:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708410076; cv=none; b=uLvmb0JXKNjN9hEB2n54PsbTPMhir9Z2w8omsOoiKVxyx6oeY3PC6s0NDbBJ1N6a4RXnp/b7uCqVRReNmgfXXm5C0sFPZDisq7417Rbsgkuk7dfV89P1OaOuQH1SB/wPrUwrV59wWg1hAByXFBmhUEXb7p84GJS/VgwWNJV+UJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708410076; c=relaxed/simple;
	bh=UxozkFqYq+6YuffM6H+3Z55846NPBPLLV9n15Cq2Fi4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=KajT7MYY/7DRwX+9nj2CYurFSvJAR5eB7zUlBX/nsdvDnWGLJB13uUjywFET6YSDk7EfvFSjTlIDSlDKIxr/LhU73SlwswGxx51SkoUDNJ+b8tt7vLcyxR6V4SDslT+ZdmQd4vZ3G9qRHAXK3ARuWAKD7/uGQ5loEReetZCrq3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from localhost.localdomain (unknown [219.141.250.2])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id B0A9F6026522A;
	Tue, 20 Feb 2024 14:20:37 +0800 (CST)
X-MD-Sfrom: zeming@nfschina.com
X-MD-SrcIP: 219.141.250.2
From: Li zeming <zeming@nfschina.com>
To: viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	jack@suse.cz
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Li zeming <zeming@nfschina.com>
Subject: [PATCH] =?UTF-8?q?libfs:=20Remove=20unnecessary=20=E2=80=980?= =?UTF-8?q?=E2=80=99=20values=20from=20ret?=
Date: Tue, 20 Feb 2024 14:20:30 +0800
Message-Id: <20240220062030.114203-1-zeming@nfschina.com>
X-Mailer: git-send-email 2.18.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

ret is assigned first, so it does not need to initialize the assignment.

Signed-off-by: Li zeming <zeming@nfschina.com>
---
 fs/libfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/libfs.c b/fs/libfs.c
index eec6031b01554..6fb8244b259e8 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -1752,7 +1752,7 @@ static int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str)
 	const struct inode *dir = READ_ONCE(dentry->d_inode);
 	struct super_block *sb = dentry->d_sb;
 	const struct unicode_map *um = sb->s_encoding;
-	int ret = 0;
+	int ret;
 
 	if (!dir || !IS_CASEFOLDED(dir))
 		return 0;
-- 
2.18.2

