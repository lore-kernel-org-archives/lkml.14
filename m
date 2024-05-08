Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEA3130A44
	for <linux-kernel@vger.kernel.org>; Wed,  8 May 2024 17:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715190383; cv=none; b=jkFUEUpwb8kBiOgb6icodmlNYtJyGoN6wZfaKp89FsTj9dLykEwa5I6qQEZ8wiwfHKZWN/Vr8KWM6QYW0zIAoLAz1gi6wVSS86P+Hz7fQB8x+YRZR5yhTfyYruCLtSNh0CSHbhQJg1aYqM4OGGC1L7TLEfGAZ5dg3bXNHadJAgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715190383; c=relaxed/simple;
	bh=1/JHkF/kdC2Tr/R89EFku4VaVDwHAGrjQyjrQYZhD6U=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=HZnV9NFSTUIUqe8LzZYlpBiIEEGNOYkBgXT8uW4mamMiCGDoq1abwamfnSon3n3hKSwU41uQMmcGxbTkHJ6mpsy1kqODv2rAFiKghF7x4DR0iQeQSf0yi3W+BtDEdLjP11O7kTXl+drzs1qo0+HqqfDtV8PlpTyyEGSrVqwgpk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FTiWZvg4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FTiWZvg4"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5EAE8C2BD11;
	Wed,  8 May 2024 17:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715190383;
	bh=1/JHkF/kdC2Tr/R89EFku4VaVDwHAGrjQyjrQYZhD6U=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=FTiWZvg4Ga4BCf8E0bFr0HaxBtI2z+DHkta2JjnIlL8hztxfg+PkPXBCS7cnmIIoE
	 fK5U04qOOaELgQVzZNaAynOe6IPrMP6ohjY3MlnSdqwCJC7Az1rXZWoEaJzpwvBwwM
	 5wgokX7qsZLL6z3evV4BZGK8SrXbs4ZOTChCROrjNtnQ2zDh+M6aobHU3RzEiwnGAI
	 svR0ZWNBxK5G5Grezu4n+P4PKm4yfCplhC6nnvQDHQQWWz0gVy+9rE5BqnnAnd7NZZ
	 5bzJ+1CkqfSuAU1ZojiM/kgZl2RTcysDH3vA1ykZ8Q9OtemCxhR+XLFesw6FX/xzFc
	 Dc7zO/SOcwCEg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 48B31C43331;
	Wed,  8 May 2024 17:46:23 +0000 (UTC)
Subject: Re: [GIT PULL] exfat fixes for 6.9-rc8
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAKYAXd8ot33DfFt4394TSAVhK4zSY2J5RPxM2sMm8xBujaXrxQ@mail.gmail.com>
References: <CAKYAXd8ot33DfFt4394TSAVhK4zSY2J5RPxM2sMm8xBujaXrxQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAKYAXd8ot33DfFt4394TSAVhK4zSY2J5RPxM2sMm8xBujaXrxQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/exfat.git tags/exfat-for-6.9-rc8
X-PR-Tracked-Commit-Id: f19257997d9c31864b4cf3fcef6e2d2b9ede148d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fe35bf27a14ded5997d8ceee7f7b10a0982e41e4
Message-Id: <171519038329.20720.6506928093594914901.pr-tracker-bot@kernel.org>
Date: Wed, 08 May 2024 17:46:23 +0000
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, "Yuezhang.Mo" <Yuezhang.Mo@sony.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 8 May 2024 20:30:46 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/exfat.git tags/exfat-for-6.9-rc8

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fe35bf27a14ded5997d8ceee7f7b10a0982e41e4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
