Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D7E5154457
	for <linux-kernel@vger.kernel.org>; Tue, 25 Jun 2024 12:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.50.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719317778; cv=none; b=ILmRwowDgkStaL83AcawDy93FDTURIGCd09ZAfXzA3F3EIQyRKuVNweWO8b6JZV/2AynwiF9PvEYjp6HbOJCONbxBMS7tXhp77pWW6ml7PB58SS+XLd+ZwuxU/59JPmmE6QNxJIN/QTnjDndw2l7MBAzcxuv7xitPaxEedD69eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719317778; c=relaxed/simple;
	bh=rqU0JnrkA2PxmOMtg8EY7zPtZ+6K4IQ/py9YVTmJrf4=;
	h=From:To:Cc:Subject:Date:Message-Id; b=eVe0mSoV58ihAHsSwDZlPhHHKY/JhyFJnwDz89bGSqjYS//aYnbDKoTMeOPcorQ7PE0dgxJqJZdnwgIMfcBIN8pQEJ1WAqXUNgjXkOTnPEzk710qxcyeeEnSEPQK57h0LWDhsfkwNOrdfcYT2Syk78UVvCKxn5wuThaTjZKhqZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=cussvILI; arc=none smtp.client-ip=45.254.50.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="cussvILI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=dtFb+RElWjmSMz3lQ9
	EUTC4/2x3gzy4Tx1TLPXdoBk0=; b=cussvILIDI/hq+oIHS8Mu3/9+n+QE4mgsm
	DcLuCukv5pRHqMo75VA1p6EWPyHlADm6LKcNgj2RzpF1mFzZtNxOkpKr9yL0W+y0
	GkhVccjnu5iSS7uysI9k7c+G3T3jI27eYBT2SfxwmVJrNGD6LnirTt87g6v9SM7l
	u2cgX+CKI=
Received: from localhost.localdomain (unknown [120.229.10.157])
	by gzga-smtp-mta-g0-4 (Coremail) with SMTP id _____wC3H3T9tHpmFDe5AQ--.6623S2;
	Tue, 25 Jun 2024 20:15:58 +0800 (CST)
From: "yongfa.hu" <hushange@163.com>
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	hushange@163.com
Subject: [PATCH] mm: remove partial comments of kswapd_shrink_node head
Date: Tue, 25 Jun 2024 20:15:47 +0800
Message-Id: <20240625121547.23613-1-hushange@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:_____wC3H3T9tHpmFDe5AQ--.6623S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gw4kKF4kWr17Zw17ZF43ZFb_yoWftrcE93
	W0krn7tryUJF97tFW3CF4rXFW3Ga4kZFyjyr1F9FW7tFyUCr43Wrn7KryxZry7Xa17CF9x
	KFZrZrWfK34UujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sR_dgA5UUUUU==
X-CM-SenderInfo: xkxvxtxqjhqiywtou0bp/1tbiYAMJnmV4Ha0KwwAAsQ
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

when function kswapd_shrink_node return, it will not check the condition
mentioned in the removed comments: "if the lack of progress was
due to pages under writeback", so remove it.

Signed-off-by: yongfa.hu <hushange@163.com>
---
 mm/vmscan.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 900bad16e..a2369a3b1 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -6747,8 +6747,7 @@ static bool prepare_kswapd_sleep(pg_data_t *pgdat, int order,
  * zone that is currently unbalanced.
  *
  * Returns true if kswapd scanned at least the requested number of pages to
- * reclaim or if the lack of progress was due to pages under writeback.
- * This is used to determine if the scanning priority needs to be raised.
+ * reclaim. This is used to determine if the scanning priority needs to be raised.
  */
 static bool kswapd_shrink_node(pg_data_t *pgdat,
 			       struct scan_control *sc)
-- 
2.17.1

