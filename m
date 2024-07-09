Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF5E0158A37
	for <linux-kernel@vger.kernel.org>; Tue,  9 Jul 2024 14:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720534576; cv=none; b=CkF2qRwiIG6o5omauzJwbKL+RB65fTU2MndUIZpWQYVVPeyd1BnxaarFEB4aUb56Cr6C1oyiFGhpZVlR7mPQHdGzIJfwHHEb6AvNWUAU4r7mG24EiKPRWfhq9IXZw1NC9L2oBuIKTs/ZjWzRS/XDjLCySSqMW43ysb6Qi2H3m6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720534576; c=relaxed/simple;
	bh=dbBcfwwwdgQ7zkOucfXaOJCkal1ApeGnpEGKNnuv+14=;
	h=From:To:Cc:Subject:Date:Message-Id; b=rslemZawfsvrz5MJM5nIZ+u4tf7OXZ54jUU7/sqo91alRBkGh8CDT38s+3JOIV8GXxXRi7/rjueH5hlxJQgn6xaUnGSXB6q7swG+R2nrkr7qZRySOHpL8S4Zf49UN+8RkjeB9KcUK0vzKF41c7UJFl9wheXWO9zvr9LqjxM6kWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Guh0vdWz; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Guh0vdWz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=hr2Ht4qR/EZv1aaOL0
	fk3Bq9AmPno0JsNR0sSZsJcm8=; b=Guh0vdWzjsBL4dUp0jJ/RGqoYgMjMLFJll
	vD1Hs07lQ1zGb8RqiYRSwGgbdvfzrqce4KzqgGGIliUypZoZ3WlFlZc3GFhy8RDw
	rxKfpUBsGv0KoYY+9bV7ENGHWEBZWn1nOqhtTEUyCdAY2JjzHydBJzwo2xNQAUt+
	lktuPIviA=
Received: from localhost.localdomain (unknown [114.92.56.131])
	by gzga-smtp-mta-g1-2 (Coremail) with SMTP id _____wDnv+TKRY1mj_e7AQ--.43922S2;
	Tue, 09 Jul 2024 22:14:51 +0800 (CST)
From: Lizhe <sensor1010@163.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Lizhe <sensor1010@163.com>
Subject: [PATCH v3] driver:core: no need to invert the return value of the call_driver_probe()
Date: Tue,  9 Jul 2024 07:14:17 -0700
Message-Id: <20240709141417.3349-1-sensor1010@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:_____wDnv+TKRY1mj_e7AQ--.43922S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFWxtw18Kw1rGw43Ww4xCrg_yoW8Gw15pF
	s8AFWYvFs8u3yv9FWUGrW0yFyFy3WIkrW09r18G3yS9w17Ar1UC3y7KrWYqw18ZrWv9FWf
	tF43XrWrCFW7AF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piaFAdUUUUU=
X-CM-SenderInfo: 5vhq20jurqiii6rwjhhfrp/1tbiSBgWq2XAmKdd+gADsT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

In the probe function (either drv->bus->probe() or drv->probe()),
there is no return value of EPROBE_DEFER. the error return from probe
should be -EPROBE_DEFER, hence no negation of call_driver_probe()'s
return is needed, nor should there be an EPROBE_DEFER check in
driver_probe_device()

Signed-off-by: Lizhe <sensor1010@163.com>

v3:
	Modify commit message and versions go below the ---
v2:
	Delete the judgment with the return value of EPROBEDEFER
	from the _driver_probe.device()
v1:
	Add the judgment with the return value of EPROBEDEFER
	from the _driver_probe.device()
---
 drivers/base/dd.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 83d352394fdf..d047919d1f5e 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -664,11 +664,6 @@ static int really_probe(struct device *dev, struct device_driver *drv)
 		if (link_ret == -EAGAIN)
 			ret = -EPROBE_DEFER;
 
-		/*
-		 * Return probe errors as positive values so that the callers
-		 * can distinguish them from other errors.
-		 */
-		ret = -ret;
 		goto probe_failed;
 	}
 
@@ -826,7 +821,7 @@ static int driver_probe_device(struct device_driver *drv, struct device *dev)
 
 	atomic_inc(&probe_count);
 	ret = __driver_probe_device(drv, dev);
-	if (ret == -EPROBE_DEFER || ret == EPROBE_DEFER) {
+	if (ret == -EPROBE_DEFER) {
 		driver_deferred_probe_add(dev);
 
 		/*
-- 
2.17.1

