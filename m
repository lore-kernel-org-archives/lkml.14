Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B078012E73
	for <linux-kernel@vger.kernel.org>; Wed, 10 Apr 2024 06:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712731183; cv=none; b=XPVhOJXfdKtkRTfBLEb1HYx/Uk2l4KqFGMVM+80q88cDj8KW2+eYzkc6JI1byXwjUo1MZhLK9mTxebM5x6eMrFUcegCxQu+Ls97f8zoKzfrY6ChIlPpU88AHIc4IIoLjaiFf/m6BXcfbZdHf6A7HfdIu26Y+SUXHESPKADfvIrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712731183; c=relaxed/simple;
	bh=VtsoA8qcOroNxlO1AUFUjZ7rSJfWSRsdeMnoPl8cN6U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aKPpvHthkeOWDv9p8k9cbNSgJN745kh3hUnX73s912SPlaNNU/CuPJOh6fZM6boQ5+ipOX3OVljMmygLDJMkbjqbIXB/OhE8GbNYGhjxICvJ98ExQ83k7Gx4vnebGLvmpfLG+Tvr35/Ede+NzkYWezSt0uGTlhy45AFuIlPBs8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-217.elisa-laajakaista.fi [88.113.26.217])
	by fgw22.mail.saunalahti.fi (Halon) with ESMTP
	id 16f419d1-f705-11ee-a9de-005056bdf889;
	Wed, 10 Apr 2024 09:39:33 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Michael Walle <mwalle@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v1 1/1] gpio: regmap: Use -ENOTSUPP consistently
Date: Wed, 10 Apr 2024 09:39:30 +0300
Message-ID: <20240410063930.1199355-1-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GPIO library expects the drivers to return -ENOTSUPP in some cases
and not using analogue POSIX code. Make the driver to follow this.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/gpio/gpio-regmap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index c08c8e528867e..71684dee2ca5d 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -129,7 +129,7 @@ static int gpio_regmap_get_direction(struct gpio_chip *chip,
 		base = gpio_regmap_addr(gpio->reg_dir_in_base);
 		invert = 1;
 	} else {
-		return -EOPNOTSUPP;
+		return -ENOTSUPP;
 	}
 
 	ret = gpio->reg_mask_xlate(gpio, base, offset, &reg, &mask);
@@ -160,7 +160,7 @@ static int gpio_regmap_set_direction(struct gpio_chip *chip,
 		base = gpio_regmap_addr(gpio->reg_dir_in_base);
 		invert = 1;
 	} else {
-		return -EOPNOTSUPP;
+		return -ENOTSUPP;
 	}
 
 	ret = gpio->reg_mask_xlate(gpio, base, offset, &reg, &mask);
-- 
2.44.0

