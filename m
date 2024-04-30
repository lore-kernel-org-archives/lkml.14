Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217D913D29C
	for <linux-kernel@vger.kernel.org>; Tue, 30 Apr 2024 11:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714478085; cv=none; b=K8erRaBj8kKoei9Z2giwcYf+FFqzumyfcGSkZmtrK2W7/qNfQ303WBWr1/bRAx/DZp42Q81qvb1fdtk/gbgLUI5MAqe2BMa7b62FzKfXJcaSuh2An53wZZVspJJFvs8YdqkADNVxMqtGmhMY386I/7VBe1RmtczF7Yh8YViz/zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714478085; c=relaxed/simple;
	bh=a+ld2ZZvv7tLr1Bh9lNHFCONf/H70v3VGrtqOfYridg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sYx+QMqI7ae38GtUNYmb+lNztPa22FMVBYmAoWCfbALToCo1WkqWBIHsAuRoJ8VuRTkgO5TjMO/gotnTiklx2d3uNpGo1Pw2vxQmNliJ/Fr/08MNMUnrGOdAPrb3MR07PijqpqjTmyMCzFj0YTlXoHkuppJpW7/HtAi7XiJ009M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=DDY01gGn; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="DDY01gGn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=1NBwNIfTuCbQxkbHSRkHt/W+DlGXOXdraPP5tuRqp/M=; b=DDY01g
	GnhLWFUXavuTA87BFe2JQ2/EvQD2kgvTuQe4GQbFTiEyE/V2L7+o+ISIpvnOK8Ub
	B2enIIQxRPo8xZ9UdZbRRTLfAKpOUod5o/54v8zJitvaTNP71hVMUhzUJP9SnYhP
	+HNT2CPwCIQ/mo6JqwaoVOAhu0pu8T6So5A4E9kjCBhj1z5xmbJXWKhJWMVbOr7B
	bKitY6wV1yIo+BJQUcAqgmTNDtXux0a6O7yanJxKsfBRX46ihUEfx7hhf7R0YK9U
	gg1Ks7SHQ6FCrJamfNPH4b1u2+hksh4d3GOQVYfI518xTWRsAOS0Q5jUl20m6juB
	KEAA042pvMKbfZ1w==
Received: (qmail 2621585 invoked from network); 30 Apr 2024 13:54:41 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Apr 2024 13:54:41 +0200
X-UD-Smtp-Session: l3s3148p1@VbX6CE8X7I9ehhrb
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: alsa-devel@alsa-project.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] ASoC: codecs: wm8994: use 'time_left' variable with wait_for_completion_timeout()
Date: Tue, 30 Apr 2024 13:54:36 +0200
Message-ID: <20240430115438.29134-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240430115438.29134-1-wsa+renesas@sang-engineering.com>
References: <20240430115438.29134-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a confusing pattern in the kernel to use a variable named 'timeout' to
store the result of wait_for_completion_timeout() causing patterns like:

	timeout = wait_for_completion_timeout(...)
	if (!timeout) return -ETIMEDOUT;

with all kinds of permutations. Use 'time_left' as a variable to make the code
self explaining.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 sound/soc/codecs/wm8994.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index fc9894975a1d..a99908582a50 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -2210,7 +2210,7 @@ static int _wm8994_set_fll(struct snd_soc_component *component, int id, int src,
 	int reg_offset, ret;
 	struct fll_div fll;
 	u16 reg, clk1, aif_reg, aif_src;
-	unsigned long timeout;
+	unsigned long time_left;
 	bool was_enabled;
 	struct clk *mclk;
 
@@ -2403,9 +2403,9 @@ static int _wm8994_set_fll(struct snd_soc_component *component, int id, int src,
 				    WM8994_FLL1_FRAC, reg);
 
 		if (wm8994->fll_locked_irq) {
-			timeout = wait_for_completion_timeout(&wm8994->fll_locked[id],
-							      msecs_to_jiffies(10));
-			if (timeout == 0)
+			time_left = wait_for_completion_timeout(&wm8994->fll_locked[id],
+								msecs_to_jiffies(10));
+			if (time_left == 0)
 				dev_warn(component->dev,
 					 "Timed out waiting for FLL lock\n");
 		} else {
-- 
2.43.0

