Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D17185A
	for <linux-kernel@vger.kernel.org>; Wed,  3 Jan 2024 02:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046056;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=13;SR=0;TI=SMTPD_---0VzsDo3j_1704248945;
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0VzsDo3j_1704248945)
          by smtp.aliyun-inc.com;
          Wed, 03 Jan 2024 10:29:14 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: lucas.demarchi@intel.com
Cc: ogabbay@kernel.org,
	thomas.hellstrom@linux.intel.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH] drm/xe/vm: Simplify the calculation of variables
Date: Wed,  3 Jan 2024 10:29:04 +0800
Message-Id: <20240103022904.106092-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

./drivers/gpu/drm/xe/xe_vm.c:187:25-27: WARNING !A || A && B is equivalent to !A || B.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=7818
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 9180f2d2d71d..dd304a92d0bb 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -184,8 +184,8 @@ static bool preempt_fences_waiting(struct xe_vm *vm)
 
 	list_for_each_entry(q, &vm->preempt.exec_queues, compute.link) {
 		if (!q->compute.pfence ||
-		    (q->compute.pfence && test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
-						   &q->compute.pfence->flags))) {
+		    test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
+			     &q->compute.pfence->flags)) {
 			return true;
 		}
 	}
-- 
2.20.1.7.g153144c

