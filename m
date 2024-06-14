Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6421D13A863;
	Fri, 14 Jun 2024 08:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718354754; cv=none; b=WJ9OiAnYKJ4KIvtkn+6dSHqHEW2ExQ+IIex6dj6fvEXtHyJ46q5QU1bZFDn7QM4E2HgSrWEQuDgOL8ywxlSGo5U7h2aoH7TaW38uIJYQX0GktM8QDZvAZXch10gPgo/+mGTe/0T4uGoaDSoI35UT+a9dnIo/lmWEtlzdmYyb7U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718354754; c=relaxed/simple;
	bh=807YOq4tajP/QaejQUpVZv6My8i6kNbj4EYdDJ6ROlg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RxE+9fY1lONyhgZO2FgDVEsGVwS3NTyKgX6UY2xwgmZF8q0fFx6B70lXULArWkBq4sh/VUMlTUuwpJUUKpkiRDmXBSLy61FyceufXEtueLz77yO3J3qgWT3OAi2ZKU3mQ9ZtzX+Y7zbXFwuZou65H751u9EmQkzKjeVmeYjbYkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 19DCBFEC;
	Fri, 14 Jun 2024 01:46:16 -0700 (PDT)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 231D03F64C;
	Fri, 14 Jun 2024 01:45:50 -0700 (PDT)
Date: Fri, 14 Jun 2024 09:45:47 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] clk: vexpress-osc: add missing MODULE_DESCRIPTION() macro
Message-ID: <ZmwDO_tf5rS4xzJs@bogus>
References: <20240613-md-arm64-drivers-clk-versatile-v1-1-6b8a5e5e00ef@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240613-md-arm64-drivers-clk-versatile-v1-1-6b8a5e5e00ef@quicinc.com>

On Thu, Jun 13, 2024 at 02:55:17PM -0700, Jeff Johnson wrote:
> With ARCH=arm64, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/versatile/clk-vexpress-osc.o
> 
> Add the missing invocation of the MODULE_DESCRIPTION() macro.
>

Acked-by: Sudeep Holla <sudeep.holla@arm.com>

Stephen,

I assume you will pick this up.

-- 
Regards,
Sudeep
