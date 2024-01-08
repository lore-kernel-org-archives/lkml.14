Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFD455E77;
	Mon,  8 Jan 2024 21:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irl.hu
Received: from fedori.lan (51b681dd.dsl.pool.telekom.hu [::ffff:81.182.129.221])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 0000000000072D22.00000000659C666B.00161D8E; Mon, 08 Jan 2024 22:17:30 +0100
From: Gergo Koteles <soyer@irl.hu>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
  linux-sound@vger.kernel.org, Gergo Koteles <soyer@irl.hu>,
  kernel test robot <lkp@intel.com>
Subject: [PATCH] ALSA: hda/tas2781: annotate calibration data endianness
Date: Mon,  8 Jan 2024 22:16:46 +0100
Message-ID: <3852ff28ea7d5d8f2086d8dd78aeff8d1d984991.1704748435.git.soyer@irl.hu>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0

Sparse reports an endian mismatch.
The amplifier expects the calibration data as big-endian.
Use the __be32 type to express endianness better.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202401072137.Oc7pQgRW-lkp@intel.com/

Signed-off-by: Gergo Koteles <soyer@irl.hu>
---
 sound/pci/hda/tas2781_hda_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index 4805cf0b6480..2dd809de62e5 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -424,8 +424,8 @@ static const struct snd_kcontrol_new tas2781_dsp_conf_ctrl = {
 
 static void tas2563_apply_calib(struct tasdevice_priv *tas_priv)
 {
-	unsigned int data;
 	int offset = 0;
+	__be32 data;
 	int ret;
 
 	for (int i = 0; i < tas_priv->ndev; i++) {

base-commit: 736c40609d31481b3b2fffe8c239f2c86fb2b54c
-- 
2.43.0

