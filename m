Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69E8D38DF7
	for <linux-kernel@vger.kernel.org>; Mon, 12 Feb 2024 11:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707737239; cv=none; b=mh0/AIjlRCXlYce9mAp9dxuNu6xRzoIicDD0jcAZKPlb3VOVm+6WUhf37NmYLP2FPaC0a5ns/Yj5nIe0uDel+01IKaYoEz+0lsEdw1u8zgxqJG4n8+5uCdRCR12MOtRMvUczmMBUo54NwVi6g14v3ZHCIiJBrqWVHPkC/pvRnG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707737239; c=relaxed/simple;
	bh=eV3O+ZhDoO6XcBQ43zADgwCJTKeXChRtZOKz1bOA0Rs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O/wtb/e+BjWzqivtUH2463wCbC7/GhcVGIdJQbzzwfdYc6nUSi4UJav381mYGJucqmWoMoLGtoPjpBnGKniUrbMH7S6JfsrYhdchXOjWuhsB69jOxzdJxuaOoCPES1YYrN/iHftGBFS1kO90K+TrW6CKDkFTk1+G6zSAyAxZqqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6320FDA7;
	Mon, 12 Feb 2024 03:27:59 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6C2663F762;
	Mon, 12 Feb 2024 03:27:16 -0800 (PST)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: coresight@lists.linaro.org,
	James Clark <james.clark@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-kernel@vger.kernel.org,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mike Leach <mike.leach@linaro.org>
Subject: Re: [PATCH v3 0/4] coresight: Make current W=1 warnings default
Date: Mon, 12 Feb 2024 11:27:11 +0000
Message-Id: <170773625002.2157180.1032311578975893182.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231123120459.287578-1-james.clark@arm.com>
References: <20231123120459.287578-1-james.clark@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 23 Nov 2023 12:04:55 +0000, James Clark wrote:
> Changes since v2:
> 
>   * Split code and Makefile changes
>   * Add a fix for a comment warning in etm3x
>   * Add some sparse checker fixes in coresight-cfg-afdo.c
>   * Fix the 0 instead of NULL warnings reported by kernel test robot
> 
> [...]

Now moved to coresight next branch, thanks!

[1/4] coresight: Fix uninitialized struct warnings
      https://git.kernel.org/coresight/c/8a519235c3c3
[2/4] coresight: etm3x: Fix build warning
      https://git.kernel.org/coresight/c/54daf07e6332
[3/4] coresight: Fix undeclared variable warnings from sparse checker
      https://git.kernel.org/coresight/c/a7195f3f9383
[4/4] coresight: Make current W=1 warnings default
      https://git.kernel.org/coresight/c/d999c7dd5279

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>
