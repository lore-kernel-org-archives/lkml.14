Received: from aposti.net (aposti.net [89.234.176.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BFC61691;
	Tue,  2 Apr 2024 11:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.234.176.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712056216; cv=none; b=RrNJHnJUBJKB3kd8icpJioRwp+y/zQI0U0kRF8Qrl7vzoehwVYniefo1RGdKhTh7euSC819pI1Df1l18P9TQ9bkQUNIrhlM6PJVh3KJtbtAsXx20QDOc2q3eQxe/AFEAlOxjZqggcc9USrobm0XNeLJ1pY9fdFQGW0E9i+CKNRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712056216; c=relaxed/simple;
	bh=fBTA8zMJl2WQBKgJqrEBQVJgbaPzDh69waHmvvtjuQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JTPvYSTDXBcOSTGS0nI44sH8hepYDNCTiIXfcp2k0pW9IVbrpzqCyVMY6dpHMw9YNfDT+ebfNExlP9ZW6IuhffihxWv4+V7S98X4RYpPHhBafGqz74bhqwZpKpp6qRvY2IKQu8f5GXjlPjn/atrJPBH655IYMhfh0BTb0fMCnZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net; spf=pass smtp.mailfrom=crapouillou.net; dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b=KrIKQob8; arc=none smtp.client-ip=89.234.176.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="KrIKQob8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1712056198;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OiOC7/jI7nyQDrQG5FxISTh1jru6sM8Zhjq9KWvgL/0=;
	b=KrIKQob8dxamqWB3MJ/bkESgmOypnrXE8IJQ0r5of1Cr8y9Tj2fN7O0qfxX44iv1eiRM5J
	UYP794m8VoRi2Bf8T0i/0f/6ncwi1rWEK9dOrh26Uz9uiSF5vW/4SBAy0aESELyT4/L2dh
	a2gt4xo8AQbjd3L2ENtWHM5POVeA0bg=
From: Paul Cercueil <paul@crapouillou.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 1/2] usb: gadget: functionfs: Fix inverted DMA fence direction
Date: Tue,  2 Apr 2024 13:09:50 +0200
Message-ID: <20240402110951.16376-2-paul@crapouillou.net>
In-Reply-To: <20240402110951.16376-1-paul@crapouillou.net>
References: <20240402110951.16376-1-paul@crapouillou.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A "read" fence was installed when the DMABUF was to be written to,
and a "write" fence was installed when the DMABUF was to be read from.

Besides, dma_resv_usage_rw() should only be used when waiting for
fences.

Fixes: 7b07a2a7ca02 ("usb: gadget: functionfs: Add DMABUF import interface")
Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/usb/gadget/function/f_fs.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index bffbc1dc651f..70e8532127ad 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -1578,6 +1578,7 @@ static int ffs_dmabuf_transfer(struct file *file,
 	struct ffs_dmabuf_priv *priv;
 	struct ffs_dma_fence *fence;
 	struct usb_request *usb_req;
+	enum dma_resv_usage resv_dir;
 	struct dma_buf *dmabuf;
 	struct ffs_ep *ep;
 	bool cookie;
@@ -1665,8 +1666,9 @@ static int ffs_dmabuf_transfer(struct file *file,
 	dma_fence_init(&fence->base, &ffs_dmabuf_fence_ops,
 		       &priv->lock, priv->context, seqno);
 
-	dma_resv_add_fence(dmabuf->resv, &fence->base,
-			   dma_resv_usage_rw(epfile->in));
+	resv_dir = epfile->in ? DMA_RESV_USAGE_WRITE : DMA_RESV_USAGE_READ;
+
+	dma_resv_add_fence(dmabuf->resv, &fence->base, resv_dir);
 	dma_resv_unlock(dmabuf->resv);
 
 	/* Now that the dma_fence is in place, queue the transfer. */
-- 
2.43.0

