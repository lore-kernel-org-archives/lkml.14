Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB07D6FB1
	for <linux-kernel@vger.kernel.org>; Sat, 23 Dec 2023 05:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="nXVc4lpZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=OZOlUsxrrXNdqAMZKTaQepb6DY2WWkW6Umtrr7fI2VM=; b=nXVc4lpZbsXXpqvimX2TKybLPv
	6tp/leHzdn6LWCqrP3eSsXZY1nmUSb09wKdf5O8FCUPe8+yj82E9DajCBD5BOL530lNURBBmNB6IA
	x17tMBoW4Wp9mo+5SiUdUQJnXj8ibwW8qRswtivqo/2U2cqE28osNMNlPqTIm6IHTEgLyrWVtfILq
	0k+gnQqO/dT6BhPWIcGR6H1Ybw1o+4hwK9vULGPCM07WD9nHAE0EH17Z7hRAQA8S3vv8ZEUZnekbm
	cNhAKfW8zal4uZz4JB96rG27nPCTTr1x+ZGzl931HaPHqqO/ihbeqoFF1fpxpnoT/wbTc04hwZibO
	wbSCR6nw==;
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rGuD8-007Ofm-0W;
	Sat, 23 Dec 2023 05:06:06 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Iwona Winiarska <iwona.winiarska@intel.com>,
	openbmc@lists.ozlabs.org
Subject: [PATCH] peci: linux/peci.h: fix Excess kernel-doc description warning
Date: Fri, 22 Dec 2023 21:06:05 -0800
Message-ID: <20231223050605.13961-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the @controller: line to prevent the kernel-doc warning:

include/linux/peci.h:84: warning: Excess struct member 'controller' description in 'peci_device'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Iwona Winiarska <iwona.winiarska@intel.com>
Cc: openbmc@lists.ozlabs.org
---
 include/linux/peci.h |    1 -
 1 file changed, 1 deletion(-)

diff -- a/include/linux/peci.h b/include/linux/peci.h
--- a/include/linux/peci.h
+++ b/include/linux/peci.h
@@ -58,7 +58,6 @@ static inline struct peci_controller *to
 /**
  * struct peci_device - PECI device
  * @dev: device object to register PECI device to the device model
- * @controller: manages the bus segment hosting this PECI device
  * @info: PECI device characteristics
  * @info.family: device family
  * @info.model: device model
