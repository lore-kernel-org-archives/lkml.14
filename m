Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD4F170844;
	Mon,  1 Jul 2024 19:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719860721; cv=none; b=laeQ7nhnfAwkxelgIRkzD3I4sIhgCsxmKdijDjbJG41W66VCBSbsM97CMFBVyRkK/DoIOLmPtkvnJ12iBLFd5+/yN/tTvtADExKc+zwlCMhIk6ZJRuiQYCxhd7kAlRd4Omp4uo9XcR15JbtlagD+DY7Vw8MxAAEWAM1kN5Jum0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719860721; c=relaxed/simple;
	bh=xlyK5nyt0D8YbvjFhSK/g0n5XLd6zyA4v9JbXgmHEdU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Uez5tZ2PfOdN9OfwgrINMqGbpEjB1d5BSu4uQQMfabzuo80kVzeFcZVF520GOyd6iiG7zNpZL6iVdiaBmLyrJc0P/0VF4gZFsPXVjIArBt00PjH31G5kRuuP2YeWIuZ20Ao+Guh9NRflzmz//9rdEJbEC/uknspdSvQg80kThew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ond3pfOd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ond3pfOd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADD03C4AF0E;
	Mon,  1 Jul 2024 19:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719860721;
	bh=xlyK5nyt0D8YbvjFhSK/g0n5XLd6zyA4v9JbXgmHEdU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ond3pfOd0S/NWxlwQaITYvTuJeJ1nbQgUqoMr4Yc3wzIoIx36NGQCD4Ki0Dr+Im0S
	 TfRzRwWriVUgej8kH0bRpMFJPsVGxhdzsVtToiRbaEd7kZf38uQITYANoztKilSkJn
	 ajV2vx/oTHEVZhim+obQjVHd9KXfBrFmQg4f5vlGyrjgRgZFBgPnoSVwwsNNUROOgl
	 SOpHMTw05rYMwTnFImQEI/wTVgGCvJVvo8Qx1sVNeTEc8HQj25g1EEmNCgENdpaGlw
	 RxytOZStx3x6RSuBaJDV0fxmCyBKNLWC1YUoI0dQqdlFjkvmIqnqcP59paP9PJL2C/
	 ZMl3LdAJgsfPw==
From: SeongJae Park <sj@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: SeongJae Park <sj@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] Docs/mm/index: move allocation profiling document to unsorted documents chapter
Date: Mon,  1 Jul 2024 12:05:12 -0700
Message-Id: <20240701190512.49379-5-sj@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240701190512.49379-1-sj@kernel.org>
References: <20240701190512.49379-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The memory allocation profiling document was added to the bottom of the
new outline.  Apparently it was not decided by well-defined guidelines
or a thorough discussions.  Rather than that, it was added there just
because there was no place for such unsorted documents.  Now there is
the chapter.  Move the document to the new place.

Signed-off-by: SeongJae Park <sj@kernel.org>
---
 Documentation/mm/index.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/mm/index.rst b/Documentation/mm/index.rst
index 15614df2b989..0be1c7503a01 100644
--- a/Documentation/mm/index.rst
+++ b/Documentation/mm/index.rst
@@ -23,7 +23,6 @@ see the :doc:`admin guide <../admin-guide/mm/index>`.
    page_cache
    shmfs
    oom
-   allocation-profiling
 
 Unsorted Documentation
 ======================
@@ -38,6 +37,7 @@ documentation, or deleted if it has served its purpose.
    :maxdepth: 1
 
    active_mm
+   allocation-profiling
    arch_pgtable_helpers
    balance
    damon/index
-- 
2.39.2

