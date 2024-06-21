Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2133E17B4FA
	for <linux-kernel@vger.kernel.org>; Fri, 21 Jun 2024 19:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718998846; cv=none; b=AMKMvzc/ckkh019rusLvCQF4cJvv8gdJYWYQKjL2GX1JDJqm5ZEMqv5z9HrCziFTuffd852IWyRs0m+uSi4IxD3UO8jH6aMYAhJXuBYUCXOVZajZ6XlCPngyw6Y737ITwl5LBkm3X6MLAaxtIh+CDr0Ji/6ULc8QRUTmID3Mn1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718998846; c=relaxed/simple;
	bh=Kdo+JJJdLPaxDW1BfMhu0cccnFRGw0N1bBlMZYjnkLA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lVXDxGbtCME7eFwN+PxDwc/tylykOzi/yFb1SK0Vu0m0tcqTVKxdOHP2LEPpMODzwHLs8xROyLTmq14B8FTWKCxp+2E3/nDTb6eWSSPFErqWPMOg+0d1UCc7km2yZ3DMCz7Z+ugnKszzdbApFaKV7k+IQh/NQUVlzhS8ee9qZDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TiTq3802; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TiTq3802"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A175EC2BBFC;
	Fri, 21 Jun 2024 19:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718998845;
	bh=Kdo+JJJdLPaxDW1BfMhu0cccnFRGw0N1bBlMZYjnkLA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TiTq3802Jo+QjlmuBKqR65mSD3mRsIfAd7Emv3tsVa6eDfCCBDuMyvFLMRdUN1ayV
	 QRtAox+ycJV8mZJR270I+kz6nu3DU7pFPgFOk+37vfNC4/+BVO1+StTcEVmnLOqw/6
	 6+oWfysX2i625Nz5fchbAd1uwzV+OtoYXRUMFcE5/Gflgnzqs+XauLLPwr7s+ROSwq
	 4auOR1WH4U6bNRRnP1QTfe21VpbMqb68y3lQx/9mp7pORiHmA8vnTrfRig8e7OBuHM
	 ouve8PVn62VKyybJB7xG1uO6jam9IIILSy/zQar3zTN5rJh5Mm/Pjl3HqNzb7Cs961
	 slwGQTK7n8Yfg==
From: Kees Cook <kees@kernel.org>
To: Eric Biederman <ebiederm@xmission.com>,
	Alexey Dobriyan <adobriyan@gmail.com>
Cc: Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	akpm@linux-foundation.org
Subject: Re: [PATCH] ELF: fix kernel.randomize_va_space double read
Date: Fri, 21 Jun 2024 12:40:39 -0700
Message-Id: <171899883660.3914852.8274555416549796593.b4-ty@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <3329905c-7eb8-400a-8f0a-d87cff979b5b@p183>
References: <3329905c-7eb8-400a-8f0a-d87cff979b5b@p183>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 21 Jun 2024 21:54:50 +0300, Alexey Dobriyan wrote:
> ELF loader uses "randomize_va_space" twice. It is sysctl and can change
> at any moment, so 2 loads could see 2 different values in theory with
> unpredictable consequences.
> 
> Issue exactly one load for consistent value across one exec.
> 
> 
> [...]

Applied to for-next/execve, thanks!

[1/1] ELF: fix kernel.randomize_va_space double read
      https://git.kernel.org/kees/c/2a97388a807b

Take care,

-- 
Kees Cook

