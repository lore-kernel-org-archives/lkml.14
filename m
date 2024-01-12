Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 694506A039
	for <linux-kernel@vger.kernel.org>; Fri, 12 Jan 2024 12:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF68E1FB;
	Fri, 12 Jan 2024 04:16:24 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5B4DC3F73F;
	Fri, 12 Jan 2024 04:15:37 -0800 (PST)
Message-ID: <9856921b-40c4-4989-b7b6-134559564203@arm.com>
Date: Fri, 12 Jan 2024 12:15:34 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] coresight: Make current W=1 warnings default
Content-Language: en-US
To: James Clark <james.clark@arm.com>, coresight@lists.linaro.org
Cc: Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20231123120459.287578-1-james.clark@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20231123120459.287578-1-james.clark@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/11/2023 12:04, James Clark wrote:
> Changes since v2:
> 
>    * Split code and Makefile changes
>    * Add a fix for a comment warning in etm3x
>    * Add some sparse checker fixes in coresight-cfg-afdo.c
>    * Fix the 0 instead of NULL warnings reported by kernel test robot
> 
> James Clark (4):
>    coresight: Fix uninitialized struct warnings
>    coresight: etm3x: Fix build warning
>    coresight: Fix undeclared variable warnings from sparse checker
>    coresight: Make current W=1 warnings default

Apologies for the delay, this is now in my queue for next.

git://git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git 
for-next/queue

Suzuki

