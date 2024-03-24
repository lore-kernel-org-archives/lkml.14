Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8FD1D2AB8;
	Sun, 24 Mar 2024 22:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711320540; cv=none; b=q5DTlo5gR5+fFp0CXQznvN4T1QWV/ZuCpxciTc2Q8E736f+75rxmbANBRck+ASlaJZlMpZuI0Bsret7a6CKImHQLD/x+k9f7sgv6KtjZSZAr+wADE+pvRuS4fZ/jrvHEkmPwdJxOagtNufDCecRTzWaj1ilVYc2VB/iCiUfMOqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711320540; c=relaxed/simple;
	bh=iuDJNO0DaCTOuSrMMwWIo+ZzkIKJPWt7rbgvtIBljgg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IvU55yW1RJLQOJxZ8RK8uNCXpHMqwL8ETLmk+j/ealrxCcy4U0gBYybB0hDDZVVQ9BdYJNv6ojov034j2cyrUhP96YYyBtqH4YG5kpfvQI1vRV5HGoO5c1DHGQPrMzgY7pnJ+LyxfKvjbB50QoTII9cKxhFYmMkJ+s+I4BOH2kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g+CaWMhy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g+CaWMhy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEEBEC433C7;
	Sun, 24 Mar 2024 22:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711320539;
	bh=iuDJNO0DaCTOuSrMMwWIo+ZzkIKJPWt7rbgvtIBljgg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g+CaWMhy12G5xHG1ib30kMmKrbN4X6bbEuyHUWaJLoDuVOdJ+Sx8mUE4lUjIGxzak
	 EvQbtoe3MtrykbaxqMTbJTPj9fl/4iXtXcUwaE6Wfcvtzt2yIQCwgAnrZa5axNA1sV
	 PfQ0WDH2aJtTdmDndxjd41RZNT9yPHYiyyhsZboDTmbz+yipc/jqbUu0jEW11tQTVM
	 ViQ7BBEA4VPXIQMGOW6F+xZcDioes/Dne8zefWxiSVFT4ZRNFVNdKHyUOZAvVF7LBA
	 gPF3zbRzm4Y38qPP7uSFvdHltRHZotQaxgQHN9hkdiHg6r1wS89PoyPNFpdlTVEQHL
	 tzveg/HShjWOw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Navid Emamdoost <navid.emamdoost@gmail.com>,
	Michal Kubecek <mkubecek@suse.cz>,
	Kees Cook <keescook@chromium.org>,
	Jens Axboe <axboe@kernel.dk>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 6.7 101/713] nbd: null check for nla_nest_start
Date: Sun, 24 Mar 2024 18:37:07 -0400
Message-ID: <20240324224720.1345309-102-sashal@kernel.org>
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

From: Navid Emamdoost <navid.emamdoost@gmail.com>

[ Upstream commit 31edf4bbe0ba27fd03ac7d87eb2ee3d2a231af6d ]

nla_nest_start() may fail and return NULL. Insert a check and set errno
based on other call sites within the same source code.

Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
Reviewed-by: Michal Kubecek <mkubecek@suse.cz>
Fixes: 47d902b90a32 ("nbd: add a status netlink command")
Signed-off-by: Kees Cook <keescook@chromium.org>
Link: https://lore.kernel.org/r/20240218042534.it.206-kees@kernel.org
Signed-off-by: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/block/nbd.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index aa65313aabb8d..df738eab02433 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -2437,6 +2437,12 @@ static int nbd_genl_status(struct sk_buff *skb, struct genl_info *info)
 	}
 
 	dev_list = nla_nest_start_noflag(reply, NBD_ATTR_DEVICE_LIST);
+	if (!dev_list) {
+		nlmsg_free(reply);
+		ret = -EMSGSIZE;
+		goto out;
+	}
+
 	if (index == -1) {
 		ret = idr_for_each(&nbd_index_idr, &status_cb, reply);
 		if (ret) {
-- 
2.43.0

