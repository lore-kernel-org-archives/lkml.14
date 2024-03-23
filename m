Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F27DD1A38C9
	for <linux-kernel@vger.kernel.org>; Sat, 23 Mar 2024 08:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711183565; cv=none; b=h7afgmOmIsrPSZjJL368XE5veoYQ08+OOwr1svkU0AfM6DomHWzaKJzhaWglJjPaxx0aLU36GWrgaL8MkohCntqvxKLdq1o/7I5K4s2vEVbz2sQsxN+WN4DYtXrXirc7qHDFQyw8pMQgvT6h5C5f6NubwS2ybgEH8ugeGxIqwLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711183565; c=relaxed/simple;
	bh=8JFeuP5E7/bsQSGIi75OXCMZWDUI9IjXTQSEpVHYYz4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cvsyiW1jHNgpnF0It/kNh2ZazvDmvu+YB66W6EplugT5NGZXm3UeeSdMRyPQ0+pkh8YmId4T4PaT/x2a+Z1+Fy42PZkiTmJM3+vaAwQ8zu5xrJa4MNgyLl9N7Gb1xida+ng1sZkDF+NrJ20PchcN2sC/Ujt2qAhwTPgoecnG+fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=lq084V98; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="lq084V98"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=3O4KM
	BVmf8/Rrtx/K3naP6zUXVCwgym1KJNZfrv3Q1c=; b=lq084V98FD+bKiry1UPQ4
	htLuGjTRZW/LilYWxczxAeVULDkoqIy2uegYPuji1gL3vVH9r7cLHtooTL8Zvm2p
	/0jSZyif5SBkfnq1saoRdeTFuFbO42ZYS32se1thL3Tcl+mogVotcXzDe1QW74xX
	wfdcbwgjrzDD8c0YjTCYjw=
Received: from localhost.localdomain (unknown [111.198.54.11])
	by gzga-smtp-mta-g1-2 (Coremail) with SMTP id _____wD3n7uolv5l1GeEBg--.7686S2;
	Sat, 23 Mar 2024 16:45:32 +0800 (CST)
From: LuMingYin <lumingyindetect@163.com>
To: linux-kernel@vger.kernel.org
Cc: jpoimboe@kernel.org,
	peterz@infradead.org,
	LuMingYin <lumingyindetect@163.com>
Subject: [PATCH] tools:Fix a memory leak related to variable name
Date: Sat, 23 Mar 2024 16:45:26 +0800
Message-Id: <20240323084526.662556-1-lumingyindetect@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3n7uolv5l1GeEBg--.7686S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WF1ftr4rKw4fKw4rZFW3trb_yoW8GFW8pr
	s5W34jka4DX34xtw1fAr45Ga43Can3XrW2kF1fZryDuFZxXFn3XrWayFyavFsavw4Fka48
	ZrW3tF4ayrWqvFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UoSoAUUUUU=
X-CM-SenderInfo: poxpx0hj1l0vphwhu3i6rwjhhfrp/1tbiKQKq92VOCHRXIQABsW

In the elf_create_prefix_symbol function defined in the /linux/tools/objtool/elf.c file, two pointer variables sym and name are defined. The program allocates dynamic memory for the pointer sym using the calloc function at line 822, and for the pointer name using the malloc function at line 824. When the if statement at line 826 returns true, the program returns at line 828. The content of the if statement at line 828 is if (sym==NULL || name==NULL), which checks if either sym or name is NULL. If this condition returns true, it indicates a situation where one of the pointers has successfully allocated memory but the other has not. Therefore, if the if statement returns true, directly returning may lead to memory leak issues. Hence, in the code, I have added checks separately for whether sym and name are NULL, and if they are not NULL, the corresponding dynamic memory spaces are freed.

Signed-off-by: LuMingYin <lumingyindetect@163.com>
---
 tools/objtool/elf.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/objtool/elf.c b/tools/objtool/elf.c
index 3d27983dc908..42d20cd08936 100644
--- a/tools/objtool/elf.c
+++ b/tools/objtool/elf.c
@@ -825,6 +825,12 @@ elf_create_prefix_symbol(struct elf *elf, struct symbol *orig, long size)
 
 	if (!sym || !name) {
 		perror("malloc");
+		if(sym){
+			free(sym);
+		}
+		if(name){
+			free(name);
+		}
 		return NULL;
 	}
 
-- 
2.25.1

