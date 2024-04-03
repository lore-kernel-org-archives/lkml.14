Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DAE3611A;
	Wed,  3 Apr 2024 14:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.85.9.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712154896; cv=none; b=LY8u9AWGSMQDDgiLBsnP/n1PNoHhGB6OgAhmL9nomF5nLdwZ6OhR7YwhBXOPnu3QoC+TTMprhx/jniOWNq08xcnw58SHzSlqtNi8jTzd0cTgnGU9f0nnqXDo3vqmStbS6k+e85Vbvx/XUbOlBoYCiu56uNLWRR8Z8bjbTlq2VA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712154896; c=relaxed/simple;
	bh=G2HvTA7QQh281vXLzFT87hogTKZ0vI3ojifngZlw0qA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VT0+8tAaJ5snMrPJ/VGjPhnduNlRSnUGvWQ0I9n9SGQ04hAODOzHcMKhDQYT2XLl50OHV9IHMxXAekYW+KSkpkNlkZiCoG49EtfvtCUy2RzTlK7k6kak6xThZToQ740EKGZx72TqQo0MdurhmGHEE94tSHOUOjFRKOGdrn3saDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu; spf=pass smtp.mailfrom=irl.hu; arc=none smtp.client-ip=95.85.9.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irl.hu
Received: from fedori.lan (51b69867.dsl.pool.telekom.hu [::ffff:81.182.152.103])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 000000000006D414.00000000660D6906.00256086; Wed, 03 Apr 2024 16:34:45 +0200
From: Gergo Koteles <soyer@irl.hu>
To: Matan Ziv-Av <matan@svgalib.org>,
  Hans de Goede <hdegoede@redhat.com>,
  =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
  linux-kernel@vger.kernel.org, Gergo Koteles <soyer@irl.hu>
Subject: [PATCH] platform/x86: lg-laptop: fix %s null argument warning
Date: Wed,  3 Apr 2024 16:34:27 +0200
Message-ID: <33d40e976f08f82b9227d0ecae38c787fcc0c0b2.1712154684.git.soyer@irl.hu>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

W=1 warns about null argument to kprintf:
warning: ‘%s’ directive argument is null [-Wformat-overflow=]
pr_info("product: %s  year: %d\n", product, year);

Use "unknown" instead of NULL.

Signed-off-by: Gergo Koteles <soyer@irl.hu>
---
 drivers/platform/x86/lg-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/lg-laptop.c b/drivers/platform/x86/lg-laptop.c
index ad3c39e9e9f5..e714ee6298dd 100644
--- a/drivers/platform/x86/lg-laptop.c
+++ b/drivers/platform/x86/lg-laptop.c
@@ -736,7 +736,7 @@ static int acpi_add(struct acpi_device *device)
 		default:
 			year = 2019;
 		}
-	pr_info("product: %s  year: %d\n", product, year);
+	pr_info("product: %s  year: %d\n", product ?: "unknown", year);
 
 	if (year >= 2019)
 		battery_limit_use_wmbb = 1;

base-commit: 39cd87c4eb2b893354f3b850f916353f2658ae6f
-- 
2.44.0

