Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D1F2E82B;
	Fri, 22 Dec 2023 20:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aT95kgm5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703277614; x=1734813614;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fEg5cKMOZSm2asfB3R+VUwmJw7TuMxUbOGYVfUqxYKM=;
  b=aT95kgm5A1hWe1ONC4Rus+Xo1UdoujiPlnYLmqjsCESgA4NgasWtk3RN
   ob93eDENYAmpcvJIjJp9cWs6RMned0Z7XQKfSXgwRkXhPz9miHbELG3hP
   LB5R9FEGUS1vpT6SMGrAkt+5KEUtlsXvEIQlt7uBgSs5KblsT77FyZ6aE
   Qiuechi1la5v3hZ2pbVSRjRGy3ccAJsc44226Vj7UU6wI4KLIbZMoXu5x
   BuiHhciIOpmdOsFUG75hKUt7ae6x4IVSKmzw1k8bVxhlNxWc+utXATD0J
   RwUUf2SEiztj6B54CtJ1Bt4wtrJiVASOt72hBUnLy1Pzw9UA3xyzDvTAg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="2978266"
X-IronPort-AV: E=Sophos;i="6.04,297,1695711600"; 
   d="scan'208";a="2978266"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2023 12:40:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,297,1695711600"; 
   d="scan'208";a="19128631"
Received: from spandruv-desk.jf.intel.com ([10.54.75.14])
  by fmviesa001.fm.intel.com with ESMTP; 22 Dec 2023 12:40:05 -0800
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: hdegoede@redhat.com,
	markgross@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	andriy.shevchenko@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH] platform/x86: intel-uncore-freq: Add additional client processors
Date: Fri, 22 Dec 2023 12:39:57 -0800
Message-Id: <20231222203957.1348043-1-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for client processors starting from Kaby Lake.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
Rebased on top of review-hans branch. The processors are ordered based
on their release similiar to intel-family.h.

 .../x86/intel/uncore-frequency/uncore-frequency.c   | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
index a3b25253b6fd..a5e0f5c22179 100644
--- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
+++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
@@ -205,6 +205,16 @@ static const struct x86_cpu_id intel_uncore_cpu_ids[] = {
 	X86_MATCH_INTEL_FAM6_MODEL(ICELAKE_D,	NULL),
 	X86_MATCH_INTEL_FAM6_MODEL(SAPPHIRERAPIDS_X, NULL),
 	X86_MATCH_INTEL_FAM6_MODEL(EMERALDRAPIDS_X, NULL),
+	X86_MATCH_INTEL_FAM6_MODEL(KABYLAKE, NULL),
+	X86_MATCH_INTEL_FAM6_MODEL(KABYLAKE_L, NULL),
+	X86_MATCH_INTEL_FAM6_MODEL(COMETLAKE, NULL),
+	X86_MATCH_INTEL_FAM6_MODEL(COMETLAKE_L, NULL),
+	X86_MATCH_INTEL_FAM6_MODEL(CANNONLAKE_L, NULL),
+	X86_MATCH_INTEL_FAM6_MODEL(ICELAKE, NULL),
+	X86_MATCH_INTEL_FAM6_MODEL(ICELAKE_L, NULL),
+	X86_MATCH_INTEL_FAM6_MODEL(ROCKETLAKE, NULL),
+	X86_MATCH_INTEL_FAM6_MODEL(TIGERLAKE, NULL),
+	X86_MATCH_INTEL_FAM6_MODEL(TIGERLAKE_L, NULL),
 	X86_MATCH_INTEL_FAM6_MODEL(ALDERLAKE, NULL),
 	X86_MATCH_INTEL_FAM6_MODEL(ALDERLAKE_L, NULL),
 	X86_MATCH_INTEL_FAM6_MODEL(RAPTORLAKE, NULL),
@@ -212,6 +222,9 @@ static const struct x86_cpu_id intel_uncore_cpu_ids[] = {
 	X86_MATCH_INTEL_FAM6_MODEL(RAPTORLAKE_S, NULL),
 	X86_MATCH_INTEL_FAM6_MODEL(METEORLAKE, NULL),
 	X86_MATCH_INTEL_FAM6_MODEL(METEORLAKE_L, NULL),
+	X86_MATCH_INTEL_FAM6_MODEL(ARROWLAKE, NULL),
+	X86_MATCH_INTEL_FAM6_MODEL(ARROWLAKE_H, NULL),
+	X86_MATCH_INTEL_FAM6_MODEL(LUNARLAKE_M, NULL),
 	{}
 };
 MODULE_DEVICE_TABLE(x86cpu, intel_uncore_cpu_ids);
-- 
2.40.1

