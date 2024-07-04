Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586853B782
	for <linux-kernel@vger.kernel.org>; Thu,  4 Jul 2024 04:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720067517; cv=none; b=B9sZRkurmvs3fI2zmgNJtdOhL0N+n2bZFCo3PZrGwONpDU/t0H69arUC+AB6gH3J5REw3YxK2JYRLjElL9WG9aW9A3XAyJL0/q7MvFMsku/65tXg4JFYU7Bg8J11DLSMVoeu5Yiw0rJA8iH1YK8TRjfJz6oIXMKEv0CfBao5Lv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720067517; c=relaxed/simple;
	bh=vY33weUn+fFr/i0vts8InUHV8Fv/v1C7qSHT8gRsQDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s+susJ8D2+oFag6kfPSIFbXqida0n0gukmidit13V0CXsnKcIdwok0OIRsFNtGn6/tKEoqy5ZSGYSz0ZYIRl2JJVtc545EeHfiwFApJYJmSmTdW+4KR/61NetBTlS/sGpWlu8R0dVnZ/PprduAfT6APulvUxDOhJX7cengFgSxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8546721C10;
	Thu,  4 Jul 2024 04:31:54 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5593A13889;
	Thu,  4 Jul 2024 04:31:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SMuLELklhmbnDAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Thu, 04 Jul 2024 04:31:53 +0000
From: Oscar Salvador <osalvador@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Peter Xu <peterx@redhat.com>,
	Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@redhat.com>,
	SeongJae Park <sj@kernel.org>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Michal Hocko <mhocko@suse.com>,
	Matthew Wilcox <willy@infradead.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Oscar Salvador <osalvador@suse.de>
Subject: [PATCH 04/45] mm/pagewalk: Only call pud_entry when we have a pud leaf
Date: Thu,  4 Jul 2024 06:30:51 +0200
Message-ID: <20240704043132.28501-5-osalvador@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240704043132.28501-1-osalvador@suse.de>
References: <20240704043132.28501-1-osalvador@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Spam-Level: 
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Queue-Id: 8546721C10
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

Check first whether the pud is leaf one before trying to call pud_entry.

Signed-off-by: Oscar Salvador <osalvador@suse.de>
---
 mm/pagewalk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/pagewalk.c b/mm/pagewalk.c
index eba705def9a0..d93e77411482 100644
--- a/mm/pagewalk.c
+++ b/mm/pagewalk.c
@@ -155,7 +155,7 @@ static int walk_pud_range(p4d_t *p4d, unsigned long addr, unsigned long end,
 
 		walk->action = ACTION_SUBTREE;
 
-		if (ops->pud_entry)
+		if (ops->pud_entry && pud_leaf(*pud))
 			err = ops->pud_entry(pud, addr, next, walk);
 		if (err)
 			break;
-- 
2.26.2

