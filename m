Received: from mail115-79.sinamail.sina.com.cn (mail115-79.sinamail.sina.com.cn [218.30.115.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F572152166
	for <linux-kernel@vger.kernel.org>; Fri, 21 Jun 2024 12:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.30.115.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718973121; cv=none; b=hXXwOR73l8vKWQ/v0DqUB7UNJNOS4aSZfuN1YdeweOzg4+SOsTMdfMP3XeXVGFIAZkPYDM35SBn0cUznNkqr+enaWswzIYZrav8cwieZA/rTbBIYhUKs3WZXuk/jRktDek4tEjvl+QT+wtKgD/SJc0anFtgL1cavUkLPxXBqblI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718973121; c=relaxed/simple;
	bh=tt6n2BYY+vdbX/G8DsE1mgn+9DsnI7S23PniKFS0mOk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V020epqHzqadzSVM/yomjjWggl6Nrl1us4MO4kwB7Um247bRNy/VrhgM80FFeDK3j8o5vs6mRE+NW5FlVZtkdb2oOsrgdUSGJFttgm6RqnycFRs+KN9wzPP6CF7LPn5mv9Ba4woGj/Kjt6CIYpdAEH9pADdjq0HVpFMd3UBy5+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; arc=none smtp.client-ip=218.30.115.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([113.88.50.176])
	by sina.com (10.185.250.22) with ESMTP
	id 6675728A00004476; Fri, 21 Jun 2024 20:31:09 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 4689167602991
X-SMAIL-UIID: 0E5E2CCC37E84ED7B45E7DA9597B1DC5-20240621-203109-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+e6b87f5edf5469e359e9@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [net?] INFO: task hung in addrconf_verify_work (8)
Date: Fri, 21 Jun 2024 20:30:56 +0800
Message-Id: <20240621123056.1783-1-hdanton@sina.com>
In-Reply-To: <0000000000006bb5b5060cc9c999@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 18 Dec 2023 06:44:27 -0800
> syzbot found the following issue on:
> 
> HEAD commit:    b1dfc0f76231 net: phy: skip LED triggers on PHYs on SFP mo..
> git tree:       net
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1629b876e80000

#syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git  master
