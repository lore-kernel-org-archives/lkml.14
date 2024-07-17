Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 727AA41C64
	for <linux-kernel@vger.kernel.org>; Wed, 17 Jul 2024 09:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721207788; cv=none; b=Vt2ywlMsSUtQINr4ikcgyvHr9d+2j/am7kfXJipZpbVYwRhByyIgLwhBV1dTWZg2d4f3PO+Mcn+kAyzdtXLKsKMCwQvlGYcQHG4x1fmrvbhWMRJB73/12m9jog25TmkwbnIOB6do+KoQ86u7rsaeL4BuhOdJI8fIFyR5wqMEhx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721207788; c=relaxed/simple;
	bh=AInlR4nzxS/yeWqj4jqxkf++qDavm7rJbzzj9Gxnvhk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EFlQYSaM0pfQzpsIIXJoIQubPcKc9Izphi4sOCc9IK+YxoBpXCBVmRWQLLxTvRxj6MfRojV3CHGgH9XJOR9Y0nXmbkEi6x0FReKocbhRoGnd9gFuJPebW+8Lnf5jiAiG2VcaJMrqXkcO9HQoGcG3SKW5sILjEFMGvsIByxniwzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=C3a28ldb; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="C3a28ldb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=I9KMg
	XDSa+o6Z19obGaZP5mWQ/PKM2XWhqeAlSDq9BY=; b=C3a28ldbbEu5ISH0YNPcs
	Z3aYA4Y0bhcFZSow9pqSuDPyjEFRn/FjR1PLFj5SGRZlZWPVha6fQv70kkLDvS6R
	E7Nlmw0vqhZObBt4FyfXCVAiLgjR28+twVKK5gjIE7Nn4+XgehF7jqtCjhQbEf3I
	0V5ARDMdRy2XDeM/IjUNSA=
Received: from localhost.localdomain (unknown [223.166.237.119])
	by gzga-smtp-mta-g2-1 (Coremail) with SMTP id _____wD3Py3Ki5dmGNFmDQ--.41698S2;
	Wed, 17 Jul 2024 17:15:55 +0800 (CST)
From: Ping Gan <jacky_gam_2001@163.com>
To: hare@suse.de,
	sagi@grimberg.me,
	hch@lst.de,
	kch@nvidia.com,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: ping.gan@dell.com,
	Ping Gan <jacky_gam_2001@163.com>
Subject: [PATCH v2 0/2] nvmet: support unbound_wq for RDMA and TCP
Date: Wed, 17 Jul 2024 17:14:49 +0800
Message-Id: <20240717091451.111158-1-jacky_gam_2001@163.com>
X-Mailer: git-send-email 2.26.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3Py3Ki5dmGNFmDQ--.41698S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xr4kCry8tw47Zw48Xw18Krg_yoWfWrb_C3
	93urykG3WxuF4UtFZ2gF1FyryfKFs8X34kta18tF1DKryrZr1UCrsYkr95u348ZF48Aw1D
	XwnxAw1Ik3sIvjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRi1xR7UUUUU==
X-CM-SenderInfo: 5mdfy55bjdzsisqqiqqrwthudrp/1tbiKA0fKWXAmTj8kQAAs6

When running nvmf on SMP platform, current nvme target's RDMA and
TCP use bounded workqueue to handle IO, but when there is other high
workload on the system(eg: kubernetes), the competition between the 
bounded kworker and other workload is very radical. To decrease the
resource race of OS among them, this patchset will enable unbounded
workqueue for nvmet-rdma and nvmet-tcp; besides that, it can also
get some performance improvement. And this patchset bases on previous
discussion from below session.

https://lore.kernel.org/lkml/20240717005318.109027-1-jacky_gam_2001@163.com/


Ping Gan (2):
  nvmet-tcp: add unbound_wq support for nvmet-tcp
  nvmet-rdma:  add unbound_wq support for nvmet-rdma

 drivers/nvme/target/rdma.c | 10 +++++++++-
 drivers/nvme/target/tcp.c  | 12 ++++++++++--
 2 files changed, 19 insertions(+), 3 deletions(-)

-- 
2.26.2

