Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3842615E97;
	Sat, 23 Dec 2023 19:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="WA9pIvhm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=MZdAHr+wuYcdl9kCMiKRYkr3A+dIJpsdHYAKS3W+678=; b=WA9pIvhmqSXZI2JumNvIHfsnFb
	moGWQEnZfNTZnV5mu0LqvmgSw6/9ZREovdLk348k9+iU/cRe1/0rEmVfU9m36/cU1w9xhPoheAosC
	j2xNWuODzXCXykdmbLEA18aVqDIWW1DnFJ7oZZTmyF79qILcyZlfmVbpri13Th+Mxbir/iU3qY2m2
	hpIOeyO7u+zd4vNG+m5eDnIo1nkQ2CcvT6Na3ngLLr8zGHNZ6erpuXSKANabjpZ832lCI4PTTahS+
	RZ8AU2JdBPFyvSJV2TgSBMPkkKc9gTYLq1IY+rEGN9Y4ukkCBxJrHUR8oPnCeK6KWNXNgTuWOiiLU
	syBm7fyg==;
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rH7u5-008OuS-2a;
	Sat, 23 Dec 2023 19:43:21 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2] platform/x86: wmi: linux/wmi.h: fix Excess kernel-doc description warning
Date: Sat, 23 Dec 2023 11:43:19 -0800
Message-ID: <20231223194321.23084-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove the "private:" comment to prevent the kernel-doc warning:

include/linux/wmi.h:27: warning: Excess struct member 'setable' description in 'wmi_device'

Either a struct member is documented (via kernel-doc) or it's private,
but not both.

Fixes: b4cc979588ee ("platform/x86: wmi: Add kernel doc comments")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Armin Wolf <W_Armin@gmx.de>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org
Reviewed-by: Armin Wolf <W_Armin@gmx.de>
---
v2: add Fixes: tag and Rev-by: Armin

 include/linux/wmi.h |    2 --
 1 file changed, 2 deletions(-)

diff -- a/include/linux/wmi.h b/include/linux/wmi.h
--- a/include/linux/wmi.h
+++ b/include/linux/wmi.h
@@ -21,8 +21,6 @@
  */
 struct wmi_device {
 	struct device dev;
-
-	/* private: used by the WMI driver core */
 	bool setable;
 };
 
