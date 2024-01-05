Received: from smtp.smtpout.orange.fr (smtp-26.smtpout.orange.fr [80.12.242.26])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE1F623755
	for <linux-kernel@vger.kernel.org>; Fri,  5 Jan 2024 09:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="OdasfErD"
Received: from pop-os.home ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id LgU0rtez5ELO0LgU0rh95i; Fri, 05 Jan 2024 10:27:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1704446838;
	bh=dMB8gUFnPkx15KoZlZNMHrYfHd6SUVDdalp91RepVRM=;
	h=From:To:Cc:Subject:Date;
	b=OdasfErD1G4Pz6M+uro+RT6DQXpIdxZ3j618DElt81mGeWgC2WRqO7+3V3s4rsBGf
	 uvpUiY05LEwPux0nwRFCsce0XdMn/gcZjiQvL+gEtalEHGAV+3AG82XZBrtIx8elnQ
	 uxiI+MGEBCZyNv4g8OafMl/ibTD9doPjoWYUeyZB5f1uxBkuMeEgjD6Hpc3TTJ8iCU
	 PjtiqyRH+ztLOQU5DMh3xS1M0/8wCV3R3I6fTEHGQj2X3BNOGcuT4T4PisWkw3E9Ej
	 SlwV/72Z9Qp3K6NnKKbT75ee85u0srJu4nXzKtU0gylEGj3OcYVDcAhtQfB8PejMDG
	 wPJr1HFgol0+w==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 05 Jan 2024 10:27:18 +0100
X-ME-IP: 92.140.202.140
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: alexis.lothore@bootlin.com,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	netdev@vger.kernel.org
Subject: [PATCH 1/2 net-next] ipvlan: Fix a typo in a comment
Date: Fri,  5 Jan 2024 10:27:08 +0100
Message-Id: <5adda8a3ce7af63bc980ba6b4b3fbfd6344e336b.1704446747.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

s/diffentiate/differentiate/

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/ipvlan/ipvlan_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ipvlan/ipvlan_main.c b/drivers/net/ipvlan/ipvlan_main.c
index f28fd7b6b708..e080e4fc41e4 100644
--- a/drivers/net/ipvlan/ipvlan_main.c
+++ b/drivers/net/ipvlan/ipvlan_main.c
@@ -601,7 +601,7 @@ int ipvlan_link_new(struct net *src_net, struct net_device *dev,
 		port->dev_id_start = 0x1;
 
 	/* Since L2 address is shared among all IPvlan slaves including
-	 * master, use unique 16 bit dev-ids to diffentiate among them.
+	 * master, use unique 16 bit dev-ids to differentiate among them.
 	 * Assign IDs between 0x1 and 0xFFFE (used by the master) to each
 	 * slave link [see addrconf_ifid_eui48()].
 	 */
-- 
2.34.1

