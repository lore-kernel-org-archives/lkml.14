Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.8])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4444A17C6
	for <linux-kernel@vger.kernel.org>; Thu, 11 Jan 2024 03:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="pzst5lYl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=JakblxmWyy+zHXn5+u
	HJsxOT+5Y0ss6Ei99IbnkKdCI=; b=pzst5lYlPbG3QubNR8fEvTTH97wRt+RGGb
	c0tXxM0Hkk60+mNYH8yDIkhePCIcTuiIAzCauu0aBMSwA0EQVAXCBilBWCCyDJOy
	W7RkE29ZSEy21NsuRIkJGZSWmYBTfBGJozUP/VXx2z63Xf4MxAuiaKLdU1kDoSx7
	0oyVTKXfA=
Received: from localhost.localdomain (unknown [182.148.14.173])
	by gzga-smtp-mta-g1-4 (Coremail) with SMTP id _____wD3P8BnYJ9lb+ouAA--.13966S2;
	Thu, 11 Jan 2024 11:28:39 +0800 (CST)
From: chenxuebing <chenxb_99091@126.com>
To: daniel@ffwll.ch,
	alexander.deucher@amd.com,
	airlied@gmail.com,
	Xinhui.Pan@amd.com,
	christian.koenig@amd.com
Cc: amd-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	chenxuebing <chenxb_99091@126.com>
Subject: [PATCH] drm/amdgpu: Clean up errors in cgs_common.h
Date: Thu, 11 Jan 2024 03:28:37 +0000
Message-Id: <20240111032837.7666-1-chenxb_99091@126.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:_____wD3P8BnYJ9lb+ouAA--.13966S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uw1fCF4rJry8GFW8ur47CFg_yoW8trWfpa
	98Aa45tr4Ut3y7u3y7XF15Wa43K3WjgFWxuFy8Cwn2gryqkr97tFZ0qw4Fkr17XFW8CFyU
	tF1UX3yj9w4UAFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRijjPUUUUU=
X-CM-SenderInfo: hfkh05lebzmiizr6ij2wof0z/1tbiHARixWV2zz-RcgAAs-
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Fix the following errors reported by checkpatch:

ERROR: open brace '{' following struct go on the same line
ERROR: space required after that ',' (ctx:VxV)

Signed-off-by: chenxuebing <chenxb_99091@126.com>
---
 drivers/gpu/drm/amd/include/cgs_common.h | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/include/cgs_common.h b/drivers/gpu/drm/amd/include/cgs_common.h
index 60a6536ff656..f40b6a03fe63 100644
--- a/drivers/gpu/drm/amd/include/cgs_common.h
+++ b/drivers/gpu/drm/amd/include/cgs_common.h
@@ -149,27 +149,26 @@ struct cgs_ops {
 
 struct cgs_os_ops; /* To be define in OS-specific CGS header */
 
-struct cgs_device
-{
+struct cgs_device {
 	const struct cgs_ops *ops;
 	/* to be embedded at the start of driver private structure */
 };
 
 /* Convenience macros that make CGS indirect function calls look like
  * normal function calls */
-#define CGS_CALL(func,dev,...) \
+#define CGS_CALL(func, dev, ...) \
 	(((struct cgs_device *)dev)->ops->func(dev, ##__VA_ARGS__))
-#define CGS_OS_CALL(func,dev,...) \
+#define CGS_OS_CALL(func, dev, ...) \
 	(((struct cgs_device *)dev)->os_ops->func(dev, ##__VA_ARGS__))
 
-#define cgs_read_register(dev,offset)		\
-	CGS_CALL(read_register,dev,offset)
-#define cgs_write_register(dev,offset,value)		\
-	CGS_CALL(write_register,dev,offset,value)
-#define cgs_read_ind_register(dev,space,index)		\
-	CGS_CALL(read_ind_register,dev,space,index)
-#define cgs_write_ind_register(dev,space,index,value)		\
-	CGS_CALL(write_ind_register,dev,space,index,value)
+#define cgs_read_register(dev, offset)		\
+	CGS_CALL(read_register, dev, offset)
+#define cgs_write_register(dev, offset, value)		\
+	CGS_CALL(write_register, dev, offset, value)
+#define cgs_read_ind_register(dev, space, index)		\
+	CGS_CALL(read_ind_register, dev, space, index)
+#define cgs_write_ind_register(dev, space, index, value)		\
+	CGS_CALL(write_ind_register, dev, space, index, value)
 
 #define cgs_get_firmware_info(dev, type, info)	\
 	CGS_CALL(get_firmware_info, dev, type, info)
-- 
2.17.1

