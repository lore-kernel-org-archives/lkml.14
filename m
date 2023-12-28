Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E5A10950
	for <linux-kernel@vger.kernel.org>; Thu, 28 Dec 2023 14:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fu+2B5Sq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE7F4C433CB;
	Thu, 28 Dec 2023 14:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703773932;
	bh=gbX4YWfRwjVnF49sDXj1O3cCSmmOzMm5S1M/X7oiEXI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fu+2B5Sq02Xg1h4uTwh2tBRcfPL99jE72HLiZkQA49ZS7hwV6im12C6h5G2Ztxyy6
	 /AXp5YbuBLvEPyB7GOrM47fnIZlPSkhMDvC5DJDl6G9a08tlDRY3q5tNWfS2WSp2FH
	 vhP+0obirrQqsexCUkyd7/cNLNKzH636PdPyjQuklPqa9kvQobqAgrCKViaUXAiz3l
	 LW9Y1qbs2ns/qqTz2KJCZD2WuUq+C035C7jB/6hRLyZb8z7ynQFSONQSXZXpGFWXqN
	 qzI155cPbVZHwPcwKVmpPvPH+R8Lhd56vrQKUzrrfm+Yrn1LBWhyUVwLmIoqWTTrm0
	 pPxC0ghvG1XxA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>
Subject: [PATCH v3 5/6] f2fs: fix to remove unnecessary f2fs_bug_on() to avoid panic
Date: Thu, 28 Dec 2023 22:31:51 +0800
Message-Id: <20231228143152.1543509-5-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231228143152.1543509-1-chao@kernel.org>
References: <20231228143152.1543509-1-chao@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

verify_blkaddr() will trigger panic once we inject fault into
f2fs_is_valid_blkaddr(), fix to remove this unnecessary f2fs_bug_on().

Fixes: 18792e64c86d ("f2fs: support fault injection for f2fs_is_valid_blkaddr()")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/f2fs.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 69e71460a950..ab710bb6d8b3 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3470,11 +3470,9 @@ bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
 static inline void verify_blkaddr(struct f2fs_sb_info *sbi,
 					block_t blkaddr, int type)
 {
-	if (!f2fs_is_valid_blkaddr(sbi, blkaddr, type)) {
+	if (!f2fs_is_valid_blkaddr(sbi, blkaddr, type))
 		f2fs_err(sbi, "invalid blkaddr: %u, type: %d, run fsck to fix.",
 			 blkaddr, type);
-		f2fs_bug_on(sbi, 1);
-	}
 }
 
 static inline bool __is_valid_data_blkaddr(block_t blkaddr)
-- 
2.40.1

