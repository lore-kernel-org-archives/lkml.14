Received: from mail.nfschina.com (unknown [42.101.60.195])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 2C63920F4;
	Mon, 15 Jan 2024 03:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from localhost.localdomain (unknown [219.141.250.2])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id 161F46019B694;
	Mon, 15 Jan 2024 11:56:18 +0800 (CST)
X-MD-Sfrom: zeming@nfschina.com
X-MD-SrcIP: 219.141.250.2
From: Li zeming <zeming@nfschina.com>
To: mcgrof@kernel.org,
	keescook@chromium.org,
	yzaikin@google.com
Cc: linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	Li zeming <zeming@nfschina.com>
Subject: [PATCH] proc: proc_sysctl: Optimize proc_sys_fill_cache() variable
Date: Mon, 15 Jan 2024 11:56:14 +0800
Message-Id: <20240115035614.26187-1-zeming@nfschina.com>
X-Mailer: git-send-email 2.18.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The ino and type variables are assigned values before use, and they do
not need to be assigned values when defined.

Signed-off-by: Li zeming <zeming@nfschina.com>
---
 fs/proc/proc_sysctl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/proc/proc_sysctl.c b/fs/proc/proc_sysctl.c
index c88854df0b624..cdda684551599 100644
--- a/fs/proc/proc_sysctl.c
+++ b/fs/proc/proc_sysctl.c
@@ -683,8 +683,8 @@ static bool proc_sys_fill_cache(struct file *file,
 	struct dentry *child, *dir = file->f_path.dentry;
 	struct inode *inode;
 	struct qstr qname;
-	ino_t ino = 0;
-	unsigned type = DT_UNKNOWN;
+	ino_t ino;
+	unsigned type;
 
 	qname.name = table->procname;
 	qname.len  = strlen(table->procname);
-- 
2.18.2

