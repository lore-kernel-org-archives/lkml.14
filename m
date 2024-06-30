Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3B51552E7;
	Sun, 30 Jun 2024 16:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719764887; cv=none; b=pV1pc9LbE0NJYdY2MFUTCubu3YkPTpMyvudhMEhDj7YOUGFU7RuA5Q3ofLcHZFztmbZfX5x/sTuoEuRd1l67smGvatNSC9Tk6zIMsrJuHY3sK2KWjw1h4GuaoLpvBYOv7OY36CZLS2nJIDzE4jAKYggwugm/qEcfHLmgpAi19UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719764887; c=relaxed/simple;
	bh=q4G+DsBRqmeZukKGOvCZiLom4qITsHnT+V/7L9bWe3w=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=dDiTIxBBTemArlvhxSLeldC98/DxB6bmwsifiyzs3LaTSkjECPungfQpAoDSuCnwjgkGXjfYaG94gRJeozbZeyLdgU2z4jqPhDUodXqYut1DLsWptQI7UgGLMsNhKnMmREZGOmRf3n2hqRcBl1oNprLw7kezT2/cjy+m8XFkxI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JiwjfbJu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JiwjfbJu"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9AF72C4AF0C;
	Sun, 30 Jun 2024 16:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719764887;
	bh=q4G+DsBRqmeZukKGOvCZiLom4qITsHnT+V/7L9bWe3w=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=JiwjfbJuBvRacIVB8acDcx4xWAtZUwNO1a8740orbbAJ9M3jTpEIMMJ/pC7aHKjqZ
	 TAl/WLT4BB/1VHtKB8FJmMswC+NlWzt6QWiQvXcJCv5YdBRHb1beAGB28WfgloNzgB
	 IpxqdJjcGgFcr1KJFmhjO2G28gVIPZIwa1Ex9PgPc07yJ7WMFQQEmoGt80GmuM9BC4
	 eTpom1Qp40cLUfIOFFMRzHMtRDZl7YKcLCGKxwUSUg5scd9Ims0lHYCK6VpJxFP0m5
	 jl5arqXCun4yjqJ8LQTnolbNFXzM9DIbLYoSvpdr0cMnCQnZGyo+K2QOIGM64jSQsm
	 DxWlj9BGPCteA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 92842C433A2;
	Sun, 30 Jun 2024 16:28:07 +0000 (UTC)
Subject: Re: [GIT PULL] Staging driver fixes for 6.10-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZoFnxy7Wy7fI_iDL@kroah.com>
References: <ZoFnxy7Wy7fI_iDL@kroah.com>
X-PR-Tracked-List-Id: <linux-staging.lists.linux.dev>
X-PR-Tracked-Message-Id: <ZoFnxy7Wy7fI_iDL@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-6.10-rc6
X-PR-Tracked-Commit-Id: fcdd7b7bda3c21d1ba1247419e4a1eb8e2d0bfbb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 12529aa130276d622fe229f0c208ad3fb7e7138e
Message-Id: <171976488759.24413.10255274800180521625.pr-tracker-bot@kernel.org>
Date: Sun, 30 Jun 2024 16:28:07 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 30 Jun 2024 16:12:23 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-6.10-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/12529aa130276d622fe229f0c208ad3fb7e7138e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
