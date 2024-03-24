Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892DF146D57;
	Sun, 24 Mar 2024 22:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711320818; cv=none; b=m/3NMZ6AUbkQLeTY/LI5O6bsqb+oOgAeNVwMZ6fLpfi8VNOZeA+pfcDl50aTiXqye6oxgRaPkWxuCOKYYERlWNduR/VWB5daJuflQ/X+8fjSWmgstuXzs3Y28jtDsHng0sf1+CtL1NP0wYA95ZPW1ywGJ8sDToYlfRL75p5yR/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711320818; c=relaxed/simple;
	bh=KEnJYE7iFGmp2/B2QX8PVoBww/lPOvrAXRR2IkS82Ls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GkEwEbLGzOzzWSSH1USGJEZ7ZiRxXBPURt1QPWfN4awuYQbQId+q4PDTyKm7aInI/3hW2l9U6f7yorAgC28Bgr9kbVwqnMEllj0CaPy6T8C1SJkycb3vOqPG4TjMsi6W//0wTYo4XW63BUYmsryJUH9OG69NUnN80eS/yfGP7pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UnB4fX+F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UnB4fX+F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA5A4C43390;
	Sun, 24 Mar 2024 22:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711320817;
	bh=KEnJYE7iFGmp2/B2QX8PVoBww/lPOvrAXRR2IkS82Ls=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UnB4fX+FcBoGOL/FFc7cnPx7qgzEHh4uoRgsYaSVVQuU3/8bbu1Mo6vhy2yxgZjV+
	 j8h8l9pMIID7b8w4PtPDjcoMpeT34sHw/aXPUKtVYESdizzLW3EG/fHtSlveXQxw6v
	 qEp1XgxEkX70nyc/mK5G3zgPaCaohL+uQMveux14NRc7UnHdPV+3FunAsPgC0YK2Rb
	 T/GsCOyt5IH1WRa58g2JO+vcoW5M8sJ9yqIQvatVFsQ6/GeYsTqXjG9haWcVd1qORN
	 /WOkxlm53LNMeHC2qdOu48jyUQ2eBxUMO0oa9yzLHw7j8JOVKHePpX4xWnGiJ0w469
	 cQHmAZ0fjeBoQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Gavrilov Ilia <Ilia.Gavrilov@infotecs.ru>,
	"David S . Miller" <davem@davemloft.net>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 6.7 382/713] net: kcm: fix incorrect parameter validation in the kcm_getsockopt) function
Date: Sun, 24 Mar 2024 18:41:48 -0400
Message-ID: <20240324224720.1345309-383-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240324224720.1345309-1-sashal@kernel.org>
References: <20240324224720.1345309-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Gavrilov Ilia <Ilia.Gavrilov@infotecs.ru>

[ Upstream commit 3ed5f415133f9b7518fbe55ba9ae9a3f5e700929 ]

The 'len' variable can't be negative when assigned the result of
'min_t' because all 'min_t' parameters are cast to unsigned int,
and then the minimum one is chosen.

To fix the logic, check 'len' as read from 'optlen',
where the types of relevant variables are (signed) int.

Fixes: ab7ac4eb9832 ("kcm: Kernel Connection Multiplexor module")
Signed-off-by: Gavrilov Ilia <Ilia.Gavrilov@infotecs.ru>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 net/kcm/kcmsock.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/kcm/kcmsock.c b/net/kcm/kcmsock.c
index 1184d40167b86..eda933c097926 100644
--- a/net/kcm/kcmsock.c
+++ b/net/kcm/kcmsock.c
@@ -1152,10 +1152,11 @@ static int kcm_getsockopt(struct socket *sock, int level, int optname,
 	if (get_user(len, optlen))
 		return -EFAULT;
 
-	len = min_t(unsigned int, len, sizeof(int));
 	if (len < 0)
 		return -EINVAL;
 
+	len = min_t(unsigned int, len, sizeof(int));
+
 	switch (optname) {
 	case KCM_RECV_DISABLE:
 		val = kcm->rx_disabled;
-- 
2.43.0

