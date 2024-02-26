Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB45E12AADD
	for <linux-kernel@vger.kernel.org>; Mon, 26 Feb 2024 14:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708956821; cv=none; b=Z+dRmyULmdvqx0pktkhhUweIN06Jo7MsO6gTQDWkgjlo8n3jsMI6XHgXNL2ZY9/gV2PZ85ouJKnqeZiZKUiztbA4/XKsXT7CS1PPanpGw65YCQIIwQur0rXKZAfD5BHHC/OH98DV84eXO6bj0Gaekxz/ZfyMroS1TMDoJt2qZt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708956821; c=relaxed/simple;
	bh=GWrvOCNTQBiOgQYlCK+1fhIT/QiAP3OOhXVDcNrF+mM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zlf23dnJH/pN934tCdFjZSX3aBJ70aaHw3gZcZ3tjt8EQXeuQ1htTAM4lODo7RVuM8ODWiO5dNbGE+S3gO80h/TzT+/Dgk5idPZATpmF88DU/KRGU/m/ek7EX2yR4epexHfyJCdiAMN5iyrUSyua9lf7seNpOHYjrxarDtD/oYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UOgXB6WA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UOgXB6WA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708956817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fzz4oIdsJNeqF+PoyUnhajnBU3sMK99bnWW/MxMH7Ys=;
	b=UOgXB6WAZ5Ub1kroDzD+Ic5+8MtBQ6RF6asrspqHxU3NqGsJRFaPScxdL/0W0+qseU5EEO
	DhvjJjC8myyzfmMhVqjt3IFIjZzsJVzVdZP13CTo1YqnaGLt2Pp0N0nj+8ml12dvr6KTyP
	t31s+S+IQHI8MneXsXWLShmsL7BBHMs=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-531-a1B9APTNPEOyuSsYVlQSgg-1; Mon,
 26 Feb 2024 09:13:32 -0500
X-MC-Unique: a1B9APTNPEOyuSsYVlQSgg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 864803C28642;
	Mon, 26 Feb 2024 14:13:32 +0000 (UTC)
Received: from t14s.redhat.com (unknown [10.39.192.224])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EEC821C06710;
	Mon, 26 Feb 2024 14:13:29 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v2 2/2] mm: remove total_mapcount()
Date: Mon, 26 Feb 2024 15:13:24 +0100
Message-ID: <20240226141324.278526-3-david@redhat.com>
In-Reply-To: <20240226141324.278526-1-david@redhat.com>
References: <20240226141324.278526-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7

All users of total_mapcount() are gone, let's remove it.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/mm.h | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 6f4825d829656..49e22a2f6cccc 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1183,7 +1183,7 @@ static inline int is_vmalloc_or_module_addr(const void *x)
  * How many times the entire folio is mapped as a single unit (eg by a
  * PMD or PUD entry).  This is probably not what you want, except for
  * debugging purposes - it does not include PTE-mapped sub-pages; look
- * at folio_mapcount() or page_mapcount() or total_mapcount() instead.
+ * at folio_mapcount() or page_mapcount() instead.
  */
 static inline int folio_entire_mapcount(struct folio *folio)
 {
@@ -1243,13 +1243,6 @@ static inline int folio_mapcount(struct folio *folio)
 	return folio_total_mapcount(folio);
 }
 
-static inline int total_mapcount(struct page *page)
-{
-	if (likely(!PageCompound(page)))
-		return atomic_read(&page->_mapcount) + 1;
-	return folio_total_mapcount(page_folio(page));
-}
-
 static inline bool folio_large_is_mapped(struct folio *folio)
 {
 	/*
-- 
2.43.2

