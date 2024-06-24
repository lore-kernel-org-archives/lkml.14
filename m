Received: from mail115-79.sinamail.sina.com.cn (mail115-79.sinamail.sina.com.cn [218.30.115.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E948130485
	for <linux-kernel@vger.kernel.org>; Mon, 24 Jun 2024 10:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.30.115.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719225630; cv=none; b=arC5sUJ+AgFdkTTTwFRjKzFlNSPbs5RcaUNjQzIIdkUXFsnEE5BWVaPMiv3ippxGCKQWuajIKGPrE9CZUCAW3+HPKrhbLaLFYM68heH8XIiP1Ac8V1dmkhTJgTS07iz63YH6L1yvN2orPpiWnbOufG0sHKarlYXba0zSi0d/YCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719225630; c=relaxed/simple;
	bh=PupXlYcl1e9FcsZOyUZfl2w5mDCJEARuLkKdlYJMqYc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Yt1t1TSuIe2wxQHwGCPORygmzQZqHu0R+RMvrak+2sl1UM3aeE6DVz62g48v70OHSmQ84Nm2DpVuEU+kCg1+9rf1sm+dQ/TMbRzfUvZR9jJytT8BGVukY9FJ25NNAi/ZQ/9qkra/606AsQG4TOoS+R5qWoEjA6VdW71Se3X0V7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; arc=none smtp.client-ip=218.30.115.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([113.118.66.200])
	by sina.com (10.185.250.22) with ESMTP
	id 66794D0C00004F8B; Mon, 24 Jun 2024 18:40:14 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 7561897602818
X-SMAIL-UIID: AA5052FFE63743FF862FFD1337B9C5F5-20240624-184014-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+35ebc808442df6420eae@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [bluetooth?] KASAN: invalid-free in hci_req_sync_complete
Date: Mon, 24 Jun 2024 18:40:01 +0800
Message-Id: <20240624104001.2004-1-hdanton@sina.com>
In-Reply-To: <00000000000033a6e8061b3c6d4a@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 19 Jun 2024 04:23:24 -0700
> syzbot has found a reproducer for the following issue on:
> 
> HEAD commit:    2ccbdf43d5e7 Merge tag 'for-linus' of git://git.kernel.org..
> git tree:       upstream
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=125874ea980000

#syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git  2ccbdf43d5e7

--- x/net/bluetooth/hci_request.c
+++ h/net/bluetooth/hci_request.c
@@ -160,6 +160,8 @@ int __hci_req_sync(struct hci_dev *hdev,
 
 	if (err == -ERESTARTSYS)
 		return -EINTR;
+	if (!err)
+		return -ETIMEDOUT;
 
 	switch (hdev->req_status) {
 	case HCI_REQ_DONE:
--
