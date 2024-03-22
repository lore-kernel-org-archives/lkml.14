Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 427EF44C84;
	Fri, 22 Mar 2024 14:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.14.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711116632; cv=none; b=DCIIvmoCpoVnrtmsvCK97Qvy8zVANN8HcW1XLlusBA1j1ufb7ObS3d5UWiUjvEbwX7T2okbGTqHZPaD2RPkMwLivSpRUcQvgxwEt+kLFaHWEtcUsCRmcEhQaO6tKuah/i2BSpEym6Q7Ve8+XOmgMfRc5/m74Eskwac1RAO1KoEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711116632; c=relaxed/simple;
	bh=hzN37LrXUnNaqZM3O6Ud4Y3v21xt+dXsLN5PkrXZaw0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cIOV3ul7hEMw3x8bISicKj9nJTCMFaznYj2ObKyDWh+QROuZOKcHPzECY31MLzKSi6IbQS3wV78KIWmQMq2OWB2IWPHM4z4cFUrvVgyxBIsc6M0mN0leFojYaII3WLueRG1Sg4XZ0fHMfH9RdsuFInwoF55ntGZB2LEaDye/goE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org; spf=pass smtp.mailfrom=gpxsee.org; arc=none smtp.client-ip=37.205.14.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from mgb4.. (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id 4FFCD65F7D;
	Fri, 22 Mar 2024 15:10:22 +0100 (CET)
From: tumic@gpxsee.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
Subject: [PATCH v4 0/3] media: mgb4: YUV and variable framerate support
Date: Fri, 22 Mar 2024 16:10:02 +0100
Message-ID: <20240322151005.3499-1-tumic@gpxsee.org>
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

Changes in V4:
- Splitted the output frame_rate handling fix from the variable frame rate
  addition patch.

Changes in V3:
- Use div_u64() for 64b division (fixes build error on ARM32)

Changes in V2:
- Added missing stride limit

Martin Tůma (3):
  media: mgb4: Add support for YUV image formats
  media: mgb4: Add support for V4L2_CAP_TIMEPERFRAME
  media: mgb4: Fixed signal frame rate limit handling

 Documentation/admin-guide/media/mgb4.rst |   8 +-
 drivers/media/pci/mgb4/mgb4_core.c       |   2 +-
 drivers/media/pci/mgb4/mgb4_core.h       |   2 +
 drivers/media/pci/mgb4/mgb4_io.h         |  29 +-
 drivers/media/pci/mgb4/mgb4_sysfs_out.c  |   9 +-
 drivers/media/pci/mgb4/mgb4_vin.c        | 205 ++++++++++++---
 drivers/media/pci/mgb4/mgb4_vin.h        |   3 +-
 drivers/media/pci/mgb4/mgb4_vout.c       | 322 ++++++++++++++++++++---
 drivers/media/pci/mgb4/mgb4_vout.h       |   5 +-
 9 files changed, 504 insertions(+), 81 deletions(-)


base-commit: b14257abe7057def6127f6fb2f14f9adc8acabdb
-- 
2.44.0

