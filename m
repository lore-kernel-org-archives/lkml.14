Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54703BBE3;
	Wed, 20 Mar 2024 10:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710929702; cv=none; b=BrNTmdNiHdy2Gy07MsuLrR+73y15zve7EScQB8s2WDfOWC7em4/pLzNOUPChk6koZZs9dsfYArtN8VOk+Cb9IYdnPxgyHwVMvtqiC1GIP6R3VOXTqqwnyP0Cz75ocMbKgPi6K1DmpXaC13grCL1TE3MXpDoQLoFKrLadbe32X5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710929702; c=relaxed/simple;
	bh=X659WHw+/PTuk7wbU0u91cxdHTavRAC5UQ91xrIRVfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hm3axyLi4P8yJB0KwrMbcC+tRJWQJowaFE8aM7odAfA33q6R8uSmu8dFFJL3ooYAYuK5GlczGtsYYcImmtPtnHhCbrcRITC64Jr49WoOeXf36GeJEe+zbBQ2yo4/xRZpEKKFswkSIdidmpkIJVDdJ7n5mCLlqV7819wWqKvYhho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=CsEKX2i2; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="CsEKX2i2"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 908A745E37
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1710929692; bh=OIC7b0T11EbEO2T46r+W8OeUwemPrjyx9q3L2NhrofM=;
	h=From:To:Cc:Subject:Date:From;
	b=CsEKX2i2wK0thUrVhIi+imWdWPxczpLBCNUGdmQVYByBfO6gBkQMpmvPJhNqYyuYR
	 mFWa+lelbWv9chEY41pUFGPzgu1yyyZTUcce2LwlkNTaMjGQ/1FKaOGLteOGPh1Wai
	 MWofoSaHlOADxaa/Xigl3QBdTKVojHWcvNWIacIa0r9GNd+X0Z/8jYBod+das/Z0RQ
	 Km+ul0hK6cYV8tcxk4uyV+skHRGOayBIFXgsNd5jPn+gwSFyme7zZSJKqqwR/mqrGr
	 jqLGiEhXKk31H77qwKYXhZ2jHOTZ5if14QgC4YxP4gWysPVWvBbEvEqoCSKzNgvjXP
	 rbKQvXRqFwr8Q==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 908A745E37;
	Wed, 20 Mar 2024 10:14:51 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] Documentation fixes for 6.9
Date: Wed, 20 Mar 2024 04:14:47 -0600
Message-ID: <87v85h5hwo.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The following changes since commit 0c8e9b538ed7ecf4159b080ab0dafca3941c69db:

  docs: verify/bisect: fixes, finetuning, and support for Arch (2024-03-07 =
04:19:43 -0700)

are available in the Git repository at:

  git://git.lwn.net/linux.git tags/docs-6.9-2

for you to fetch changes up to b8cfda5c9065cd619a97c17da081cbfab3b1e756:

  docs: verify/bisect: remove a level of indenting (2024-03-18 03:43:31 -06=
00)

----------------------------------------------------------------
A handful of late-arriving documentation fixes and enhancements.

----------------------------------------------------------------
Kendra Moore (1):
      doc: Fix typo in admin-guide/cifs/introduction.rst

Maki Hatano (1):
      README: Fix spelling

N=C3=ADcolas F. R. A. Prado (2):
      docs: *-regressions.rst: Add colon to regzbot commands
      docs: handling-regressions.rst: Update regzbot command fixed-by to fix

Thorsten Leemhuis (4):
      docs: verify/bisect: improve install instructions
      docs: verify/bisect: check taint flag
      docs: verify/bisect: drop 'v' prefix, EOL aspect, and assorted fixes
      docs: verify/bisect: remove a level of indenting

 Documentation/admin-guide/cifs/introduction.rst    |   2 +-
 .../admin-guide/reporting-regressions.rst          |   2 +-
 .../verify-bugs-and-bisect-regressions.rst         | 389 +++++++++++------=
----
 Documentation/process/handling-regressions.rst     |  12 +-
 README                                             |   2 +-
 5 files changed, 220 insertions(+), 187 deletions(-)
