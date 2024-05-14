Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D896D1DFFB
	for <linux-kernel@vger.kernel.org>; Tue, 14 May 2024 22:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715725038; cv=none; b=dagczPLscW5H0rGcyxRS54GLjYVnx/D2V0y/kck4OYraKZapzezexEgnniYXA4TGye/jAQut+FzSRcoGKylO859r1afwUHsZlrTOtNqtJizb0ki6wkWGYyzYwCvEKkUT7X43W6fHfkyZXRa327doGJO7VbCdn+SIWnIIk60bHKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715725038; c=relaxed/simple;
	bh=f6LiZPaKgXlJxx1X6yf1Nj0hWhgNgn2cACwSkrDQ0Aw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=al4NYhjyWpch6JR5n7qdKqusu9791pnwV8DsCPKB7r9Geke7JyQlqhoFjQVVUTG7vctKY58ebyX/0QhzU8tr9bkYjfTRkO5TztnTmwuHaoM2JMwUvg5IWrf5174m2bjKTkERSryjtk8MSNTlWJ59WWFfWhu5aL9zzRaOiOvJS9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c4I/S4iX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c4I/S4iX"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6AB5C2BD10;
	Tue, 14 May 2024 22:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715725038;
	bh=f6LiZPaKgXlJxx1X6yf1Nj0hWhgNgn2cACwSkrDQ0Aw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=c4I/S4iXDib7DaIZwEsQhFFi6n43sg7hZf+cZkhDsUKWsgw4QRRBiS3Ey6hbYPHVh
	 QwJMNQF6g4x+BGij6S/Qk4gYqiJXwvK7h0q4Hf5ywdyi7O6pao8tzSxjh67GvzaJGv
	 vjXD63lzJ4sWINOnckYuHvd9LOSp294D01rHwzH58Kq4JJMM94rlghaciN4fc4E2Qp
	 jbYnMNLT6leiOt+gIQtexLTRXB9l6Gd04Zf5uEcT/oxetAIXeAecq7mI03/Drh8Dvb
	 u+qM9u/0fLEdNCJ09OShKYN7X+Jlg0FsiY0raK2ys/wXwTuqTtjFdgCIvgDEbjPCaR
	 UzyAJbIuerzEQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A91EAC433A2;
	Tue, 14 May 2024 22:17:18 +0000 (UTC)
Subject: Re: [GIT PULL] HID for 6.10
From: pr-tracker-bot@kernel.org
In-Reply-To: <nycvar.YFH.7.76.2405141414420.16865@cbobk.fhfr.pm>
References: <nycvar.YFH.7.76.2405141414420.16865@cbobk.fhfr.pm>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <nycvar.YFH.7.76.2405141414420.16865@cbobk.fhfr.pm>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git tags/hid-for-linus-2024051401
X-PR-Tracked-Commit-Id: c9c92fc4c2ef4e2f11af0ba19cb18d9b5e3e6f08
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 614da38e2f7afe9e01c6e359dfa09285f26fa381
Message-Id: <171572503868.5061.14289619850564051226.pr-tracker-bot@kernel.org>
Date: Tue, 14 May 2024 22:17:18 +0000
To: Jiri Kosina <jikos@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Benjamin Tissoires <bentiss@kernel.org>, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 14 May 2024 14:14:48 +0200 (CEST):

> git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git tags/hid-for-linus-2024051401

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/614da38e2f7afe9e01c6e359dfa09285f26fa381

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
