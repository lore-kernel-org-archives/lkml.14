Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44D6145C0B
	for <linux-kernel@vger.kernel.org>; Mon, 11 Mar 2024 15:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710169283; cv=none; b=RoFGck0VVU05NhlSqbptikJPED17lrffY74r/ArLuMYi5gGyk0eeE6J1sXaRckbRZs7hGLXbjpx0IHIjkwwQJzogh30Pa57gPlBd/UhO+x4rA6wi4ZPt3OWdcjOU2F4mhgAxzLjQ+wj5hV0IerQAgJuNrHubFPrFJozuDOjdHTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710169283; c=relaxed/simple;
	bh=r3szxxcJy6Mog/D+s2eYuesLonZdIzg75Pwy4/lQ7bk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g2mOBDVHPR6klL+RwT0J8p96RNTBKr+b9ZvOntTw4WmBXqIjumTiCwwIOEzAoKh8kMVcvqKHemVBiVJzR9sz6UAfcLl+9Tbxw2eCS/aa9wM+EYd+g/FLFx/Zf0RFJLc1nzpD9zG+8yH0GrtlNxdfGeuJdCcueoDj8H68tOOeB48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4CFEFEC;
	Mon, 11 Mar 2024 08:01:58 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CCDCB3F64C;
	Mon, 11 Mar 2024 08:01:19 -0700 (PDT)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Huang Ying <ying.huang@intel.com>,
	Gao Xiang <xiang@kernel.org>,
	Yu Zhao <yuzhao@google.com>,
	Yang Shi <shy828301@gmail.com>,
	Michal Hocko <mhocko@suse.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Barry Song <21cnbao@gmail.com>,
	Chris Li <chrisl@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/6] mm: vmscan: Avoid split during shrink_folio_list()
Date: Mon, 11 Mar 2024 15:00:57 +0000
Message-Id: <20240311150058.1122862-6-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240311150058.1122862-1-ryan.roberts@arm.com>
References: <20240311150058.1122862-1-ryan.roberts@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that swap supports storing all mTHP sizes, avoid splitting large
folios before swap-out. This benefits performance of the swap-out path
by eliding split_folio_to_list(), which is expensive, and also sets us
up for swapping in large folios in a future series.

If the folio is partially mapped, we continue to split it since we want
to avoid the extra IO overhead and storage of writing out pages
uneccessarily.

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 mm/vmscan.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index cf7d4cf47f1a..0ebec99e04c6 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -1222,11 +1222,12 @@ static unsigned int shrink_folio_list(struct list_head *folio_list,
 					if (!can_split_folio(folio, NULL))
 						goto activate_locked;
 					/*
-					 * Split folios without a PMD map right
-					 * away. Chances are some or all of the
-					 * tail pages can be freed without IO.
+					 * Split partially mapped folios map
+					 * right away. Chances are some or all
+					 * of the tail pages can be freed
+					 * without IO.
 					 */
-					if (!folio_entire_mapcount(folio) &&
+					if (!list_empty(&folio->_deferred_list) &&
 					    split_folio_to_list(folio,
 								folio_list))
 						goto activate_locked;
-- 
2.25.1

