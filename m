Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13A924A18
	for <linux-kernel@vger.kernel.org>; Sun, 28 Jan 2024 13:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706448546; cv=none; b=h4botxpZEo38V++HBCgg5j8HC5esK+BV5XsXZel4uhe6Kk0gAXW5rjBd9wxYzbUyWEcxKwQp5gjNZUA4uldJqTyPllwsJ8hPDJCOL0SbrGGD9st+gl8m2jdVq889wY8fqU2MeDEehM8/yDAR4wZ8FCG4LxQdo9vHtjwSLmUBaoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706448546; c=relaxed/simple;
	bh=admpNbYjTz+dut1bdbcw/R4a48e8lO0By9yrDqDY5Gc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jka9EOdvog0cwNZEyrr14gQ4nuOGMEOmvpPujXIvX6CkX2Ydr9zI3YbNwzfEaO4kSPAdc/aa8M3h/k15/TdPopYrXPxwuL9yfwtyouSL+RRuE5c63JHNAa1rE06hmuwfM1HOskzYbRs7EtmVHxC/AJNwoA95j54HRuhQJAbWKWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Chengming Zhou <zhouchengming@bytedance.com>
Date: Sun, 28 Jan 2024 13:28:49 +0000
Subject: [PATCH v2 1/3] mm/zswap: don't return LRU_SKIP if we have dropped lru lock
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240126-zswap-writeback-race-v2-1-b10479847099@bytedance.com>
References: <20240126-zswap-writeback-race-v2-0-b10479847099@bytedance.com>
In-Reply-To: <20240126-zswap-writeback-race-v2-0-b10479847099@bytedance.com>
To: Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosryahmed@google.com>, Nhat Pham <nphamcs@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, Chris Li <chriscli@google.com>
Cc: Chengming Zhou <zhouchengming@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>, Nhat Pham <nphamcs@gmail.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
X-Migadu-Flow: FLOW_OUT

LRU_SKIP can only be returned if we don't ever dropped lru lock, or
we need to return LRU_RETRY to restart from the head of lru list.

Otherwise, the iteration might continue from a cursor position that
was freed while the locks were dropped.

Actually we may need to introduce another LRU_STOP to really terminate
the ongoing shrinking scan process, when we encounter a warm page
already in the swap cache. The current list_lru implementation
doesn't have this function to early break from __list_lru_walk_one.

Fixes: b5ba474f3f51 ("zswap: shrink zswap pool based on memory pressure")
Acked-by: Johannes Weiner <hannes@cmpxchg.org>
Reviewed-by: Nhat Pham <nphamcs@gmail.com>
Signed-off-by: Chengming Zhou <zhouchengming@bytedance.com>
---
 mm/zswap.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/mm/zswap.c b/mm/zswap.c
index 00e90b9b5417..81cb3790e0dd 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -901,10 +901,8 @@ static enum lru_status shrink_memcg_cb(struct list_head *item, struct list_lru_o
 		 * into the warmer region. We should terminate shrinking (if we're in the dynamic
 		 * shrinker context).
 		 */
-		if (writeback_result == -EEXIST && encountered_page_in_swapcache) {
-			ret = LRU_SKIP;
+		if (writeback_result == -EEXIST && encountered_page_in_swapcache)
 			*encountered_page_in_swapcache = true;
-		}
 
 		goto put_unlock;
 	}

-- 
b4 0.10.1
