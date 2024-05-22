Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02859146001
	for <linux-kernel@vger.kernel.org>; Wed, 22 May 2024 18:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716401120; cv=none; b=gTFvyFJntc6EB2+4GaSRyye9B5SCRNztp8Y75be4NHYAZS6YuvT+sPyGuRLxgk86SwXIvV5NVft+rfPmFmHEtuLnYf6/7Xv89EOcuTESzlHNDV8tByVPtk0R1F9uu7WTEaNmZKaQMu2Odex6x+bz+luuaTAGj4tvB97cFoAHA2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716401120; c=relaxed/simple;
	bh=s+rE9oZB7j+i0qizmmQzYoWhm/5IaI39Xax9F+yfQAU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=M+ek+AIUzkQczaXE8v3WMm/PZyWa0owKVJdtO0/RtseYdczadXOCNu9la3zlChB6gpSnbJKRm7754Dg/bn+N1PXRoDckUqYMJLl9/ML7N7RYB6LVd+VPHdJ/t0C918Oqfk80ko7zv6wjGJ4f6a36ZoKaDMAPbpN4mxTo/0P3SAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JTUB9WyF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JTUB9WyF"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96571C32782;
	Wed, 22 May 2024 18:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716401119;
	bh=s+rE9oZB7j+i0qizmmQzYoWhm/5IaI39Xax9F+yfQAU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=JTUB9WyFMy9/+A+cfqGcX+Tto06g32mJFALLU40EHlc5mZbJZrVGVayAiNIcMURnw
	 tCeeUVuAUcftYkZsZd83zIQYNd2lfGposJPZ0hPNRtiTB5RsaD7BFKWZ3354QCsXiK
	 Dm6vd3b0CoISMHX86wvodzfMuy7uW2u45EPnCGXap41eHIv5sWaJnYxjBis37jdkV4
	 f7+MvL/hq2JEbiQMn42bOQGXXJCoA9bXZ+xR/Wfc7KxKLPmnNlx41HvB5KUkDkUp3N
	 GKLBoxoqi4MyfW/pvgAEOwzjQsyh8ERFdtOoO/Dkxu9XT3J/UK7HusD7l1+x7QsFI4
	 zqA2J4cfCowNQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8B40FC43618;
	Wed, 22 May 2024 18:05:19 +0000 (UTC)
Subject: Re: [GIT PULL] Backlight for v6.10
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240522100423.GC6035@google.com>
References: <20240522100423.GC6035@google.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20240522100423.GC6035@google.com>
X-PR-Tracked-Remote: git@gitolite.kernel.org:pub/scm/linux/kernel/git/lee/backlight tags/backlight-next-6.10
X-PR-Tracked-Commit-Id: 1fd949f653ee1a3c1776ef8a5295ae072c9b67f2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7eae27cd12a2d305ffad41a8e10cff3bb8c0dcb0
Message-Id: <171640111956.25247.10661715366359239844.pr-tracker-bot@kernel.org>
Date: Wed, 22 May 2024 18:05:19 +0000
To: Lee Jones <lee@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 22 May 2024 11:04:23 +0100:

> git@gitolite.kernel.org:pub/scm/linux/kernel/git/lee/backlight tags/backlight-next-6.10

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7eae27cd12a2d305ffad41a8e10cff3bb8c0dcb0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
