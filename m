Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539311CA86
	for <linux-kernel@vger.kernel.org>; Fri, 22 Dec 2023 14:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c9STXqde"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703254289; x=1734790289;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FcsBhfvsXCWW2oeEyVzqx0V/6mlWT9H8O4xPInArI/E=;
  b=c9STXqderZyh/QPQDBQqCbdc9xyJ932eSAQe0UKmi2HD3e1xIT4Fp9ag
   lQJF+GsxCbT7ZYgvVS8E7d6l24xUaNU6Tnr3C4EMMunUhpGY6Wbpwm2oX
   yHJf43wFKnEYUqUh1kP8Pj8TxR6V83XHCe6bRjfTsSwnjyucU4wwLrqe5
   nQB6CNdSwVUi3Nxj9PWakfOtgecNSfX40NSFA2TWruTyIQfi0tg0DqXah
   MDv5bbbfDdNNKaAZjvY3cousNB4Hjn3RbznySLODzktLZWqMqW3pdj2cx
   fAvtMbxhpeJh9R7UURFa6lEs3//4kQ2EZ7bdEGAy1chtjSl1NytkQuLzo
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="482297023"
X-IronPort-AV: E=Sophos;i="6.04,296,1695711600"; 
   d="scan'208";a="482297023"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2023 06:11:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="805950109"
X-IronPort-AV: E=Sophos;i="6.04,296,1695711600"; 
   d="scan'208";a="805950109"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 22 Dec 2023 06:11:27 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id BD14E291; Fri, 22 Dec 2023 16:11:25 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] gpio: tangier: Add missing file to the MAINTAINERS
Date: Fri, 22 Dec 2023 16:11:17 +0200
Message-ID: <20231222141117.2887788-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When gpio-tangier was split the new born headers had been missed
in the MAINTAINERS. Add it there.

Fixes: d2c19e89e03c ("gpio: tangier: Introduce Intel Tangier GPIO driver")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2e0e74681511..da022945e184 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10750,6 +10750,7 @@ F:	drivers/gpio/gpio-pch.c
 F:	drivers/gpio/gpio-sch.c
 F:	drivers/gpio/gpio-sodaville.c
 F:	drivers/gpio/gpio-tangier.c
+F:	drivers/gpio/gpio-tangier.h
 
 INTEL GVT-g DRIVERS (Intel GPU Virtualization)
 M:	Zhenyu Wang <zhenyuw@linux.intel.com>
-- 
2.43.0.rc1.1.gbec44491f096

