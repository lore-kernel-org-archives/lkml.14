Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0BD757F8;
	Fri, 21 Jun 2024 15:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718985372; cv=none; b=cK3fN5JSZvShLEW1AO4xxhrPXu/Fh1BbneRkOCedvuUGBoc7TQ5L0RBm64v62Vd8HkHxDfR4mrP/tX2MmOIAID0qwHHtQmnuwo2ip8U44XIgwYnHp4A+U6lm+k3QlDMti3oZx2gzGxeQrRwYk9x0NaCVAx3MKss4FFFF5PUdFSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718985372; c=relaxed/simple;
	bh=Lsb6XnDjnDcs4PGWOh7vD114VfqORyUzb2UtIyXQgTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VoA8yR27eM0RhAdtCUSvDSAW4D6zMfVvUAfZET0I61UK6QxL7MTBqpE+qNoAarLb53S5MuThh7zqF7ovq4RscOcpF70SOSm1Y0K+d6HgOi/316dDW5Cb/9Eu8i86rMRRrNTpi+UZ2MAOyEwmIwyQ8lztg4gSlPXg7EbVJYIsW2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hI77V0d1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hI77V0d1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC108C2BBFC;
	Fri, 21 Jun 2024 15:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718985372;
	bh=Lsb6XnDjnDcs4PGWOh7vD114VfqORyUzb2UtIyXQgTQ=;
	h=Date:From:To:Cc:Subject:From;
	b=hI77V0d1qf8Kx2TqCpvZwX/4zzBKYGHA9XZboBkH0nuK538DhJee445vh8AyeSgVa
	 YkPpFKfLqE1ftJsEf0RpI/5iLyJGclLL0J/I7eVqdPDb8aUS15EFnSrIe9zwQkNPw/
	 z3ZEC8shYPVyCSxdsjpnZJVavtTKlN09GOXpQhULr/j5xDIhGRhLA4U4UycqjvGxYE
	 Za0Z5Ri5cGxiD9aih5uwjIZ127PS/upY2eH0A5kssQt8fxCXniwX0dcz5vqE6YcuKb
	 RSXaCDvZ6VNRrMrtoxHkpto2FyQLY5foHV++H0wJvFOSHl/6vr3hneLNi05ay+euHK
	 qN1t1EFO3efEQ==
Date: Fri, 21 Jun 2024 08:56:10 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: conor@kernel.org, ojeda@kernel.org
Subject: Prebuilt LLVM 18.1.8 uploaded
Message-ID: <20240621155610.GA3794848@thelio-3990X>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I have built and uploaded LLVM 18.1.8 to
https://mirrors.edge.kernel.org/pub/tools/llvm/.

A bug in libc++ was found and fixed in this release, which should have
no real impact on the kernel for somewhat obvious reasons :)

https://discourse.llvm.org/t/18-1-8-released/79725

If there are any issues found, please let us know via email or
https://github.com/ClangBuiltLinux/linux/issues/new.

Cheers,
Nathan
