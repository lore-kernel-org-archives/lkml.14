Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4089954BC5;
	Mon, 18 Mar 2024 17:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710781392; cv=none; b=B9c4LJznn6Gam0UsN9A7DSU/0IcgPSGYvyW+QGLvVfiGJmnkMdV6uOb9bY1f5n5cmuNse8evBB54wJhs1yIpfx2l19jJfP5nCLNmJ+ZXytkgnmAJ/cuumGOotl1WV+0DjAUwgeJT+sftew2CnBrmdclUTvKzFwAbyhjxwBbmL5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710781392; c=relaxed/simple;
	bh=ahv/nMASBvmUUedDJRMBuPb/ahJXPkedowOCrs8J8vI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U7xwQRTS4qtFKXvntNo3u1J/h+b0VAc0oaG30PBf+sovpgphccWfZpNgVKrfR1MF+Ik8x6O2Ua3nQAJ/zfjxdtBEwy9yKB3me/lhCXfhOSXMUHMb/jyHXGyUFlW0w/Wjle527z+GHtmTBVchutnH0AO4RiaYuP+I0nbklURXneM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LfPJ9EI5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LfPJ9EI5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9887EC433F1;
	Mon, 18 Mar 2024 17:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710781391;
	bh=ahv/nMASBvmUUedDJRMBuPb/ahJXPkedowOCrs8J8vI=;
	h=Date:From:To:Cc:Subject:From;
	b=LfPJ9EI5CvadGkFLFbpD0AaNr/WugMmtnF4/HiuraXXl0CUzG0SGAHKbvYVLbTJQt
	 6PjDgoTzUWYypGfhxgcheI0ZRJb4WtC3d3YzmcmtnOuaO2BSAakCD0SUnxS93uzgaZ
	 bb2yoENZVL+DZn8bsMGN0qbdAvcQtK0h9Wow0x+RbQBEthVqMAsMCBNYVajKUivFoV
	 /Ep98srzHxbziEEiJjM5Xz4SDkfD2hZed/dZWWU7bnf5z3hOiHY7wRrpgqo8w2x5fh
	 eGeKZrPMx1AD0hYmdb++t8PBCTn5+WDm4mXgMP2y/r1THQrMnPPleuGZuOMEDa8L3h
	 GM24vZ5XIH2vg==
Date: Mon, 18 Mar 2024 12:03:09 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: stable docs.kernel.org links?
Message-ID: <20240318170309.GA1187959@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

When providing a URL to a bit of code, it's nice if the URL remains
useful indefinitely, e.g., this should work "forever" because it
includes a git tag:

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/pci.c?id=v6.8#n1300

Is there a similar "id=" mechanism for https://docs.kernel.org?  I
could use https://docs.kernel.org/core-api/genalloc.html, but the link
may become stale as docs get reorganized.

I could link to the .rst file directly with the git tag, e.g.,

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/core-api/genalloc.rst?id=v6.8

but of course that's not as nicely formatted.

Bjorn
