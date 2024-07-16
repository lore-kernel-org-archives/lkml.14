Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C050A1A01C1
	for <linux-kernel@vger.kernel.org>; Tue, 16 Jul 2024 18:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721154619; cv=none; b=FpTUOGWMRTGBrMDXzVUofXZZ6SpbPF3RWtPw3Cm8mA1CpDmHoDNAZ/SIgHj0yXOPQOgcgtNj9nkg51wQGi3hdMWBfufHjkzWldgtgHKRMQ6rPzvDIP6dII3OvqRd1+CmKeEW6L9iGOEb/olz7aeCWDiOIcvWAYq9ZYMbU9tvIas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721154619; c=relaxed/simple;
	bh=Av9AH3F7BapTjkMmx9ha0+LIQLi2cH/cr1figXxgmCc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ELa10AS+QSWrQlMQmHuOfxzKv1ONcMhs0EOZgg9CR5FLE0+RZKPzMnKrro2sNdsHZDFZGsjUEm3/66t5vIUz0czNkbO8l60W9nmrDWUY5LAY3Tplqg7F7KJZm/GYHAcR3CcRrVGTMe7n1yoSmFjngwhzPkl0JJyNO59lB9pKsZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oP1K4lBh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oP1K4lBh"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 97C81C4AF0B;
	Tue, 16 Jul 2024 18:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721154619;
	bh=Av9AH3F7BapTjkMmx9ha0+LIQLi2cH/cr1figXxgmCc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=oP1K4lBhmVxI8iUp1JR4K0kMklDIti+v6kVo+xPnjQk4woARKZCU2q1rOd87KRyY+
	 rw0E+ojO7hPF+3MxcFzIlGxhJBggexJLfl1Pz9N+YM0+zpXbmK2+VKPkYNJIcIKX7w
	 5dxOE6/fqHQSmwnZun2wV/r2q3dtaUfeolVAsLKgNUVEij3QE3wBmGpGC2OqFXBjWi
	 Cjqo8cH0mitHIuCryaH7shBlzOmFjbUmVkn+97KQPtCs5KAL5ZcnWQle20PqpUEYt+
	 wOZ/YCDx3LqTWzwg8XAj5aAWwPzj5oICqW1v0KWiQbyuQOpu/uSnhF0lHliqymk+ov
	 Z0eJcODfugjFA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8AD8CC43443;
	Tue, 16 Jul 2024 18:30:19 +0000 (UTC)
Subject: Re: [GIT PULL] x86/cache for v6.11-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240716065458.GAZpYZQhh0PBItpD1k@fat_crate.local>
References: <20240716065458.GAZpYZQhh0PBItpD1k@fat_crate.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20240716065458.GAZpYZQhh0PBItpD1k@fat_crate.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip tags/x86_cache_for_v6.11_rc1
X-PR-Tracked-Commit-Id: ea34999f41873c96ac89e861e5fdfc7d0403f9e3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b84b3381907a3c5c6f1d524185eddc55547068b7
Message-Id: <172115461952.31841.10125168907990344269.pr-tracker-bot@kernel.org>
Date: Tue, 16 Jul 2024 18:30:19 +0000
To: Borislav Petkov <bp@alien8.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, x86-ml <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 16 Jul 2024 08:54:58 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip tags/x86_cache_for_v6.11_rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b84b3381907a3c5c6f1d524185eddc55547068b7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
