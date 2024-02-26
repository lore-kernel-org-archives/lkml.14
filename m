Received: from akranes.kaiser.cx (akranes.kaiser.cx [152.53.16.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2591E4A0
	for <linux-kernel@vger.kernel.org>; Mon, 26 Feb 2024 19:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=152.53.16.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708974806; cv=none; b=XA0aSAE7f1ylhI/QFsNhUuz1n8XAwzgHCKe6Hwxhk7vrny1U2rubN9xyyyAA1CMqN37eaaWK/2B6aJu2HSa/54Vo+ui2jUMTpUt3E3llJwwyAai3qNsDvsoabDpozer97DJrr4Jq1DpPSdXO1wrulDB8UMjzc1/fgunqFE6rj2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708974806; c=relaxed/simple;
	bh=MKnO63dvLeyl4CKXz8OOw3NOYlquvj333ZsDtazeWlI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AVCAlUxrZQCstzwSCWNAVChVsw9syQB9JT+XJOaKlTkYMcnJ9uG42ekDgZGtJvrk9iD1YSJzLjsZc80+k4MgjGPZGgwkGmEHV+mrb7eFMVk8nDmZTpSQnuP/x3PtXWeFXgZ4U1dILtuLz3JNwxXPwYOO2dpvuo+VLUxR3AX2Y3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kaiser.cx; spf=pass smtp.mailfrom=kaiser.cx; arc=none smtp.client-ip=152.53.16.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kaiser.cx
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kaiser.cx
Received: from dslb-188-097-209-155.188.097.pools.vodafone-ip.de ([188.97.209.155] helo=martin-debian-2.paytec.ch)
	by akranes.kaiser.cx with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <martin@kaiser.cx>)
	id 1regPL-001h9S-2x;
	Mon, 26 Feb 2024 20:12:59 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Uladzislau Rezki <urezki@gmail.com>,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/3] lib/test_vmalloc.c: three trivial fixes
Date: Mon, 26 Feb 2024 20:11:56 +0100
Message-Id: <20240226191159.39509-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here's three trivial changes to fix a typo, address a checkpatch warning and
remove an unused function.

Martin Kaiser (3):
  lib/test_vmalloc.c: fix typo in function name
  lib/test_vmalloc.c: drop empty exit function
  lib/test_vmalloc.c: use unsigned long constant

 lib/test_vmalloc.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

-- 
2.39.2

