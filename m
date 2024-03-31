Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C02145B0D
	for <linux-kernel@vger.kernel.org>; Sun, 31 Mar 2024 18:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711909251; cv=none; b=lPRdr6uKEl+JjDBDjheoQFjCgIovSZg+duwjIUUcjL1mmWp3OBB9X17rW8/0Zdeax85olrF4wiEgAUCeEt7Rf+Ref+9dt1MOT28EPihH6nGsVwhf6ijWOBlApsvR8Lp4jlWdHLwOo/AL6ES/BNOflGG1hox08pt9HT15GIe70ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711909251; c=relaxed/simple;
	bh=kRgA2azDvP8pRCgsuGIqYljFzxcQQ5COkwMgGyXMOQw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=YBJusN35NvRfQqBmWQcbZ+4pR5c3NdmnG1jrfUHAYOSs9BrMMfnEbLdjf03iTIsZKTDSIOn1kHrEUVazan+efihMPlQvaZzZF0WUaIU3CxAJK8UyyvkPvw1sQPMx2ifsWWtCmGoKAnugU6w19/eo7nnNaxGQ+x8uNZjqiTIMKyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jBNWsGCc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jBNWsGCc"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C47DEC433C7;
	Sun, 31 Mar 2024 18:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711909250;
	bh=kRgA2azDvP8pRCgsuGIqYljFzxcQQ5COkwMgGyXMOQw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=jBNWsGCcbBCTokmmhqjlJM2wOwM160ep+Tpx8ZLZaYl2HwRggfiy8nLD5en4RIZ+q
	 czBLC+TA5kxkzM5pMTf2ZSoYVLzAF7sA7RMJwANr3iVHMwQP+5P6hU9GQfv9M887jB
	 EwiSagMWELyP04ZMFrKkxxhQy612mH1T9GTOPgF0jiuTXJOK+lpnUaHvjyckRrER+3
	 ozcSsW53qXu85mEDIQ7tWwYtYJ6Im7lAv9xnTNWFuLo1s16vXgeoGgzry40AN6PXhp
	 K+ROL8aK15nOVjnxBR78aTYzeddlZos9dTF+MDrXDU4ZtK/XJ2vJ+pKA2Nj+Er71zr
	 UQTa/i+1NHaXQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B6FDFD84BAA;
	Sun, 31 Mar 2024 18:20:50 +0000 (UTC)
Subject: Re: [GIT PULL] objtool/urgent for v6.9-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240331102711.GAZgk6f8mOWJiFN8pR@fat_crate.local>
References: <20240331102711.GAZgk6f8mOWJiFN8pR@fat_crate.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20240331102711.GAZgk6f8mOWJiFN8pR@fat_crate.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tags/objtool_urgent_for_v6.9_rc2
X-PR-Tracked-Commit-Id: 6205125bd326ed0153e5f9da3c4689fe60ae885a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8d7e76846521440255a15180c6a7a170654fbb5a
Message-Id: <171190925074.27603.14364331161035117421.pr-tracker-bot@kernel.org>
Date: Sun, 31 Mar 2024 18:20:50 +0000
To: Borislav Petkov <bp@alien8.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, x86-ml <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 31 Mar 2024 12:27:11 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tags/objtool_urgent_for_v6.9_rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8d7e76846521440255a15180c6a7a170654fbb5a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
