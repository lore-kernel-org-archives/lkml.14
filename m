Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD3F810E3
	for <linux-kernel@vger.kernel.org>; Fri, 19 Apr 2024 02:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713492816; cv=none; b=echJ88VDs8Uryk4Bo1MTcWYKmHAJjuirF/4KuSYzaOq3KFuq+0gBpLOAlwD70kjPiITc8r931J7zzmrvZLU//glyLoWnYgTG3hz2epeIJov1fzRc1PG8qvN+yS6vfSJt5MypMV7CMHG4GQ0FgXA8IxiaHneQxTtFZdBTUJCZqDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713492816; c=relaxed/simple;
	bh=T3T88YHEhoiet9IkqHvWLQK3w4aPVfNH6KxJ1vUIw2E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UrRzpAHpRjJqyxe5MPvcTsnnXJSd/vhFRqJ2yxSs+LYeGnK+hZHtePqG5CXxzQznhwFUVPzUTInIIku5YI7X9nWg0sMkK8Bd1yHFLqZ5+fzq9mSkwP73iVwQzb90NQ9wMVzlyfNkRggY/hyrwZjLzINJwRtMkU97LY10wafgZJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC5352F;
	Thu, 18 Apr 2024 19:14:01 -0700 (PDT)
Received: from a077893.blr.arm.com (a077893.blr.arm.com [10.162.43.7])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 66F693F64C;
	Thu, 18 Apr 2024 19:13:31 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64/sysreg: Update ID_AA64MMFR2_EL1 register
Date: Fri, 19 Apr 2024 07:43:25 +0530
Message-Id: <20240419021325.2880384-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This updates ID_AA64MMFR2_EL1.VARange register fields as per the definition
based on DDI0601 2024-03.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
This applies on v6.9-rc4

 arch/arm64/tools/sysreg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index a4c1dd4741a4..6d7213dcbeb5 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1739,6 +1739,7 @@ EndEnum
 UnsignedEnum	19:16	VARange
 	0b0000	48
 	0b0001	52
+	0b0010	56
 EndEnum
 UnsignedEnum	15:12	IESB
 	0b0000	NI
-- 
2.25.1

