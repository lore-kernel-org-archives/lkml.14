Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37A23BBD5
	for <linux-kernel@vger.kernel.org>; Tue, 19 Mar 2024 21:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710884255; cv=none; b=LVvzf+RM3hfP1JkVTzlMx5UtQe/ujZS0l9Nhqmm0t6vbTMv0HRrI6qKPCJ3IKQrvGHKgwENNq44EGBY2iQIzXxrxw9CgyoCec1MvNBdqVskkdYB2lvb0eN1EN5iF+bdCpL8pBZsOnGlvVglJrDbxQiC/6uP1z9aVkQSx/4g80+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710884255; c=relaxed/simple;
	bh=EQNBBZNAi+EPw/k7ZGuyndOfN1k4bUnqMoZafl2wmfw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jMkKRSBkF8zQJefpR/9/+jIyghAavlYagzX6qRL8Ba/XaNS31THJMYUDGB/mkht5hXygGRK0L+FDHrOebkNhgGwAnjc4QOhIP7M/xGyY5lyGXBaUfU3pFZjv5oW7EhV6g87EP55lBerL89gaExwzdPOi52T+MZvGjItov3UDed8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RSYa3Wyp; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RSYa3Wyp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710884254; x=1742420254;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=EQNBBZNAi+EPw/k7ZGuyndOfN1k4bUnqMoZafl2wmfw=;
  b=RSYa3Wypp+hptX4BvpsDLqV3g7Lh+qaHc+hFw1eW4wjVTnu4uTm48tC2
   l4yXqUEzxqfjQ/rGbA4evI52yxPd/4CYWaaUOoQdbR11pZnAqDSUVWQru
   hNN7fmeCXJCeNt1lMuZj1fCHM0epSbE3WULKaBNcS8ESjyWjM30kRSrp6
   NwNyBo92DNazOqKTmO/HLXna67iVi3LBakWxnK6qCQHTTYfKOiSdGPR04
   cjpp+aFYiNuv95PP9EC82l+umwiNYFD3/kEXFNlo8n+x9GL5xCFXUNtgZ
   YsZbdBcQnaLOMD6Qx95iY/ofnT0DF3++/58KqVHRDIshwxIrNGK2YyN0V
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="8728899"
X-IronPort-AV: E=Sophos;i="6.07,138,1708416000"; 
   d="scan'208";a="8728899"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 14:37:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,138,1708416000"; 
   d="scan'208";a="51394833"
Received: from server.sh.intel.com ([10.239.53.117])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 14:37:30 -0700
From: Kai Huang <kai.huang@intel.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org,
	dave.hansen@intel.com,
	kirill.shutemov@linux.intel.com,
	bp@alien8.de,
	tglx@linutronix.de,
	mingo@redhat.com,
	hpa@zytor.com,
	peterz@infradead.org,
	thomas.lendacky@amd.com
Subject: [PATCH] x86/coco: Update comment of CC_ATTR_GUEST_MEM_ENCRYPT to include TDX guest
Date: Tue, 19 Mar 2024 21:37:29 +0000
Message-Id: <20240319213729.81708-1-kai.huang@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TDX guest also reports CC_ATTR_GUEST_STATE_ENCRYPT as true, but the
comment of this attribute does not reflect this.

Update the comment to reflect the fact.

Signed-off-by: Kai Huang <kai.huang@intel.com>
---
 include/linux/cc_platform.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/cc_platform.h b/include/linux/cc_platform.h
index cb0d6cd1c12f..958630592088 100644
--- a/include/linux/cc_platform.h
+++ b/include/linux/cc_platform.h
@@ -48,7 +48,7 @@ enum cc_attr {
 	 * The platform/OS is running as a guest/virtual machine and actively
 	 * using memory encryption.
 	 *
-	 * Examples include SEV and SEV-ES.
+	 * Examples include SEV, SEV-ES and TDX guests.
 	 */
 	CC_ATTR_GUEST_MEM_ENCRYPT,
 

base-commit: eb8ed5b0e9d988a75b10ea811eeb1cffc6aa95c0
-- 
2.34.1

