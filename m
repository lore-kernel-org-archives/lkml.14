Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FF5A126F39;
	Thu,  7 Mar 2024 11:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.14.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709810313; cv=none; b=k2L0jKCiUWHqQBgcx/0gON3WB+PPlVpVatM5xRRMQgf/FAzIfRQ8pHylYQQ9KfuyeV28lflPCMalyvGhENxreqGBv321XFui/W+pm9/O7bQmXb/nr/5z1Mtquy0YJ9LcXijWWa6sCha1hSfpPe2tBJvv7iLg65A6l38BpAgFDCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709810313; c=relaxed/simple;
	bh=aEMdaw+FdJ5XiHb4gvJSi2VE3ixTC3PMFF5KDiB8Vsc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=P6AKjXD630DkTbvyTXH/dlj47upZ9+Y3R2oc1ay9zjWMUBQKgppZhqRBSTn7mEmYfShjYhC8j93Md2MaymrgxEhvKgQEQ8Ii21AbaxfcjwS6eXNl3k4XDFbmmUuN9kyq6qLzNMwjoZyYMpWzNMEkAXtkp1YFLCo1XEjR/2lF+WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org; spf=pass smtp.mailfrom=gpxsee.org; arc=none smtp.client-ip=37.205.14.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from mgb4.digiteq.red (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id B56594BC55;
	Thu,  7 Mar 2024 12:18:23 +0100 (CET)
From: tumic@gpxsee.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
Subject: [PATCH v2 0/2] media: mgb4: YUV and variable framerate support
Date: Thu,  7 Mar 2024 13:18:20 +0100
Message-ID: <20240307121822.1852-1-tumic@gpxsee.org>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Martin Tůma <martin.tuma@digiteqautomotive.com>

Recent mgb4 FW update added support for the YUV image format and variable
framerates independent of the signal framerate. The following patches extend
the mgb4 driver with support for both features.

Changes in V2:
- Added missing stride limit

Martin Tůma (2):
  media: mgb4: Add support for YUV image formats
  media: mgb4: Add support for V4L2_CAP_TIMEPERFRAME

 Documentation/admin-guide/media/mgb4.rst |   8 +-
 drivers/media/pci/mgb4/mgb4_core.c       |   2 +-
 drivers/media/pci/mgb4/mgb4_core.h       |   2 +
 drivers/media/pci/mgb4/mgb4_io.h         |  28 +-
 drivers/media/pci/mgb4/mgb4_sysfs_out.c  |   9 +-
 drivers/media/pci/mgb4/mgb4_vin.c        | 205 ++++++++++++---
 drivers/media/pci/mgb4/mgb4_vin.h        |   3 +-
 drivers/media/pci/mgb4/mgb4_vout.c       | 322 ++++++++++++++++++++---
 drivers/media/pci/mgb4/mgb4_vout.h       |   5 +-
 9 files changed, 504 insertions(+), 80 deletions(-)


base-commit: 65e6a2773d655172143cc0b927cdc89549842895
-- 
2.44.0

