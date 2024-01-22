Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED7323D960
	for <linux-kernel@vger.kernel.org>; Mon, 22 Jan 2024 14:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705934513; cv=none; b=XCmRfGlQtvayxp9Sr/2sY+GSrHOQZKvd2fw6CdHtAnwTLKYf/jke9A+ZKtXfPn0D8ErblnVzuw591LL2IGgEtQl5vhBm/pLyfmY0D4Z3Nldvew8Clabe4kwyxblcu0LWyH+qsHdsCzH2SrCRox+a18C6zwfg/iwV14649FTsv6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705934513; c=relaxed/simple;
	bh=jxWZbtrQunXx6iCwHbY8+15OJVJthc2h6WzN4TPPimw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o07GW5kAuO9upcEgZR38D60qKk+YbdXlXqMTMEQSWpA4kLoV2BBfat9eZWux/dapy0+1MvcIShrj+v/cdEpMRV3eEsBHgmmltVw7Bstn5HUZ+yQ+vwI/ZnTVFVhlP4K1fwK0LfX33iI3QCJlECwlKXKxHhxf5x40YQW+ChDpCAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6872B1FB;
	Mon, 22 Jan 2024 06:42:36 -0800 (PST)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9FA5B3F73F;
	Mon, 22 Jan 2024 06:41:49 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 1/2] firmware: arm_scmi: Use xa_insert() to store opps
Date: Mon, 22 Jan 2024 14:41:44 +0000
Message-ID: <170592365212.3509770.14486227568408572896.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240108185050.1628687-1-cristian.marussi@arm.com>
References: <20240108185050.1628687-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 08 Jan 2024 18:50:49 +0000, Cristian Marussi wrote:
> When storing opps by level or index use xa_insert() instead of xa_store()
> and add error-checking to spot bad duplicates indexes possibly wrongly
> provided by the platform firmware.
>

Applied to sudeep.holla/linux (for-next/scmi/fixes), thanks!

[1/2] firmware: arm_scmi: Use xa_insert() to store opps
      https://git.kernel.org/sudeep.holla/c/e8ef4bbe39b9
[2/2] firmware: arm_scmi: Use xa_insert() when saving raw queues
      https://git.kernel.org/sudeep.holla/c/b5dc0ffd3656
--
Regards,
Sudeep

