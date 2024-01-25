Received: from out-175.mta1.migadu.com (out-175.mta1.migadu.com [95.215.58.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA6C79C1
	for <linux-kernel@vger.kernel.org>; Thu, 25 Jan 2024 03:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706154582; cv=none; b=pvV4Zzp8wI/q8DdnYWx8GQ4vg0Wc9MQmE4gdFK3vEwWWJ/FlkodFg8o0V2ucMlps+bZlBqtY1vkLq8PjLAA+r2Ruky/srj5c/TYCLErmKkaf8hybdDA/xy7zrgiIhNytalIpv/zS8q0SvoHGpvl1DS79AnuBnihcTBqSBivs3j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706154582; c=relaxed/simple;
	bh=pl8wYidjs3UBdnBNyRJi1/KfoDsGumPvUU8mC9VcZzA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ovlyRchcGtO7x07k+aZzM5aKoUm6d6J81Klt5muJ05HV3LTPI8z5FZsDHQUuydUXcxgdrw/t+crJrzjzLM2U7t0VJMbIjh81UlG3w1yUFNhh5avE5qxs73AWkTePgs+aAnlfUfq+g2DMsjBS61jztkqVGNXwM3AirVSCX8g9Djg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VYWh6VeQ; arc=none smtp.client-ip=95.215.58.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VYWh6VeQ"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1706154578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=17qKi75qGgjXysBew06HKVO12vWbye98Ka2AcoY+EoY=;
	b=VYWh6VeQ8MOZCclfJT0knJEbPmzHhZmHeCK7VnsMOH0fG28JKZR2pFfOEPiDCYmkj2fTwT
	mNSn+mZy59niJ9nFT4YJyyt2JEKzF6w2HdStpdD73ZpLSU1w7hh+P04UvxhGDSi5XCDMwI
	HgWWw0EtfR2odZWnnP6MTkdp00mZARU=
From: Yajun Deng <yajun.deng@linux.dev>
To: akpm@linux-foundation.org
Cc: Liam.Howlett@Oracle.com,
	lstoakes@gmail.com,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	vbabka@suse.cz,
	willy@infradead.org,
	surenb@google.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Yajun Deng <yajun.deng@linux.dev>
Subject: [PATCH v2 0/2] mm/mmap: simplify vma_merge()
Date: Thu, 25 Jan 2024 11:49:20 +0800
Message-Id: <20240125034922.1004671-1-yajun.deng@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The vma_merge() has too many parameters, we can pass vma to vma_merge(),
so that it can save two parameters.
Since the src vma was passed, find_vma_intersection() can be removed.

v2: split it into two patches.
v1: https://lore.kernel.org/all/20240118082312.2801992-1-yajun.deng@linux.dev/

Yajun Deng (2):
  mm/mmap: pass vma to vma_merge()
  mm/mmap: remove find_vma_intersection() in vma_merge()

 mm/mmap.c | 42 ++++++++++++++++++++++--------------------
 1 file changed, 22 insertions(+), 20 deletions(-)

-- 
2.25.1

