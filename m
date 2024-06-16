Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25A64E1D1
	for <linux-kernel@vger.kernel.org>; Sun, 16 Jun 2024 18:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718562272; cv=none; b=jXcVgK/zhVE4e6vjhQrvWc8L4TZdq3iKn+M3mvNqH673PGbEZ6D87xGNpnDsFROVT0JnTJX9hgfvFv0S4PatN00EwIgiCQ34zqvDQwkAukhwj5zGp0ox77hc17/hu1cLwE/VPNQ/KG37mv0dqrbVm6R9jtUTR0Exuh1MQnTXQoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718562272; c=relaxed/simple;
	bh=b171ents5BD6qzdyaHR/mRGSZBrmemwKjPG1Y2+yu/c=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Ey4eV18pr5ybXfC4BqVEfFH2KdQ1w5NI9K4ppmVL4SxPvyElLpAyxcElf2pgHuHB8IdQ3ZSEwirRj3SlmWu9Z9pgR8/HRf4OqC0vWvBRtilDHnfFcUBxVznVyxsFBTtLhHSWvs6Cg19YRNS1iX9n9ryBczpNaxcANbJjaumhtlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JEruyS3V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JEruyS3V"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AA9E4C4AF1C;
	Sun, 16 Jun 2024 18:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718562272;
	bh=b171ents5BD6qzdyaHR/mRGSZBrmemwKjPG1Y2+yu/c=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=JEruyS3V7o7AK/mohr49MR6CABPtBrQ7zeqYX6LYsLPCZF5Kc/scohnfwYsPutQ9u
	 CztoqOei2uoj4KBsnykRMdXy4DVjeCscgJAjWFM22Hz/yoyhil52D3KhRrUdtcPNfR
	 OdtIld0JngerK/4QmCgMo5ZAWT2kzuk15wgAjcxbMK0kHOryVoalGSLEeaIe19RlVZ
	 gnfOZA6SJj9xF/vWSUk06/YN0lbaDYoIND7BuaGp5M73jjZHM4rYpBjJP8CNTSGIQ5
	 c8ZaLTJJwy0M95OCm5ycb6kSA70q/Af27SHWi2q6yF4VPXh3PT4fkkrcszcuIT1K0u
	 j8BXS1yqSNuug==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A32F6C43612;
	Sun, 16 Jun 2024 18:24:32 +0000 (UTC)
Subject: Re: [GIT PULL] firewire fixes for v6.10-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240616011450.GA516847@workstation.local>
References: <20240616011450.GA516847@workstation.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20240616011450.GA516847@workstation.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/ieee1394/linux1394.git tags/firewire-fixes-6.10-rc4
X-PR-Tracked-Commit-Id: 893098b2af3ea12bab2f505aa825662b379df67d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: be2fa8865cbc86625b8843eea7e2f25bcd40e26a
Message-Id: <171856227266.1143.16540272668119363501.pr-tracker-bot@kernel.org>
Date: Sun, 16 Jun 2024 18:24:32 +0000
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, linux1394-devel@lists.sourceforge.net
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 16 Jun 2024 10:14:50 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/ieee1394/linux1394.git tags/firewire-fixes-6.10-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/be2fa8865cbc86625b8843eea7e2f25bcd40e26a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
