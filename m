Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.9])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AD9E1FD6
	for <linux-kernel@vger.kernel.org>; Thu, 11 Jan 2024 05:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="E8vbJjjq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=tvJdUgy4whsG2DS43i
	WPd56hnP6TT26Uha6LZDyTmWs=; b=E8vbJjjqHoh8M2U6PhYwbY6zP4RjNy0eK0
	uYBGxXoQ/w5W3CtQP2vX4C/3HQfsPqQJe+RDR/ryFuz93eDvO8XZVa4ON/QpP1xN
	/BmS1J7eq56XXd+z8owFrCUaPEp+EVPabfSvEmnziAg8gb8NlFwfelmVX4ns3dfu
	JrK6Jlepk=
Received: from localhost.localdomain (unknown [182.148.14.173])
	by gzga-smtp-mta-g0-5 (Coremail) with SMTP id _____wD3n2bUfp9lTHWgAA--.29535S2;
	Thu, 11 Jan 2024 13:38:28 +0800 (CST)
From: chenxuebing <chenxb_99091@126.com>
To: alexander.deucher@amd.com,
	daniel@ffwll.ch,
	airlied@gmail.com,
	Xinhui.Pan@amd.com,
	christian.koenig@amd.com
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	chenxuebing <chenxb_99091@126.com>
Subject: [PATCH] drm/amdgpu: Clean up errors in atomfirmwareid.h
Date: Thu, 11 Jan 2024 05:38:27 +0000
Message-Id: <20240111053827.8169-1-chenxb_99091@126.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:_____wD3n2bUfp9lTHWgAA--.29535S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtr1kGF1xAF4UGFWkKr47XFb_yoWkAwc_ur
	W8Xws7W345ZFWqvF129rs5Ary5Kw18ua1kWF1ftanaqFnrZr4UZw1DGF47A395uanxWF98
	ta95ur1rAwnrtjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUnqXJUUUUU==
X-CM-SenderInfo: hfkh05lebzmiizr6ij2wof0z/1tbiGBdixWVLZWYonAAAsx
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Fix the following errors reported by checkpatch:

ERROR: open brace '{' following enum go on the same line

Signed-off-by: chenxuebing <chenxb_99091@126.com>
---
 drivers/gpu/drm/amd/include/atomfirmwareid.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/include/atomfirmwareid.h b/drivers/gpu/drm/amd/include/atomfirmwareid.h
index e6256efd03ae..1ca5fe7b131b 100644
--- a/drivers/gpu/drm/amd/include/atomfirmwareid.h
+++ b/drivers/gpu/drm/amd/include/atomfirmwareid.h
@@ -28,8 +28,7 @@
 #ifndef _ATOMFIRMWAREID_H_
 #define _ATOMFIRMWAREID_H_
 
-enum atom_master_data_table_id
-{
+enum atom_master_data_table_id {
     VBIOS_DATA_TBL_ID__UTILITY_PIPELINE,
     VBIOS_DATA_TBL_ID__MULTIMEDIA_INF,
     VBIOS_DATA_TBL_ID__FIRMWARE_INF,
@@ -51,8 +50,7 @@ enum atom_master_data_table_id
     VBIOS_DATA_TBL_ID__UNDEFINED,
 };
 
-enum atom_master_command_table_id
-{
+enum atom_master_command_table_id {
     VBIOS_CMD_TBL_ID__ASIC_INIT,
     VBIOS_CMD_TBL_ID__DIGX_ENCODER_CONTROL,
     VBIOS_CMD_TBL_ID__SET_ENGINE_CLOCK,
-- 
2.17.1

