Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FC7865BAD
	for <linux-kernel@vger.kernel.org>; Mon,  8 Apr 2024 12:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712577908; cv=none; b=frMXTlpgCWPxjis+CIakROauBGPKXDwBGITq6vG+IwPROcqDZVoDl+8JUKBSbhCvQTZBj+kzHUlep3iq6heLo1xraqN4ltWc9UnJXngmHO92dBNJoeYWAp+XSdcQtUYWkHufB/M11st0iEDcq9jkh1zrIEL5PEl2B24odx9xTiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712577908; c=relaxed/simple;
	bh=IocEc+QZqFm1b51Pb5J+sPrL+9qHXLHkSneiea7zWtk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UibIJmVfB6NRqvWOXGRJgyaoE6yJ300NydaYhlYIUBHwnsz39jDfKypeb2pj/D3WZPyx8Cqz/g99VmJOdyncsDW0hwoc/wkmjluelyZOpR0k+ctwZn3J3Qr+lg21avNe1MuB1SZZ7qSXnZaPAhVNPBHryTurVmAfcgnajyAg1yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF31EDA7;
	Mon,  8 Apr 2024 05:05:36 -0700 (PDT)
Received: from [10.57.54.16] (unknown [10.57.54.16])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E6CDB3F7B4;
	Mon,  8 Apr 2024 05:05:04 -0700 (PDT)
Message-ID: <c2e3e77c-ba50-4228-9eb8-c8fbcc84edfb@arm.com>
Date: Mon, 8 Apr 2024 13:05:04 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf: arm_cspmu: Don't touch interrupt registers if no
 interrupt was assigned
Content-Language: en-GB
To: Ilkka Koskinen <ilkka@os.amperecomputing.com>
Cc: Besar Wicaksono <bwicaksono@nvidia.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Raag Jadav <raag.jadav@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240307193104.58302-1-ilkka@os.amperecomputing.com>
 <042bbb32-481e-40d8-a46a-472b724ec33f@arm.com>
 <89d7ff41-ce2a-fd95-ebfc-4df914efd4c8@os.amperecomputing.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <89d7ff41-ce2a-fd95-ebfc-4df914efd4c8@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024-04-05 11:33 pm, Ilkka Koskinen wrote:
> 
> On Fri, 5 Apr 2024, Robin Murphy wrote:
>> On 2024-03-07 7:31 pm, Ilkka Koskinen wrote:
>>> The driver enabled and disabled interrupts even if no interrupt was
>>> assigned to the device.
>>
>> Why's that a concern - if the interrupt isn't routed anywhere, surely 
>> it makes no difference what happens at the source end?
> 
> The issue is that we have two PMUs attached to the same interrupt line.
> Unfortunately, I just don't seem to find time to add support for shared 
> interrupts to the cspmu driver. Meanwhile, I assigned the interrupt to 
> one of the PMUs while the other one has zero in the APMT table.

I suspected something like that ;)

> Without 
> the patch, I can trigger "ghost interrupt" in the latter PMU.

An occasional spurious interrupt should be no big deal. If it ends up as 
a screaming spurious interrupt because we never handle the overflow 
condition on the "other" PMU, then what matters most is that we never 
handle the overflow, thus the "other" PMU is still useless since you 
can't assume the user is going to read it frequently enough to avoid 
losing information and getting nonsense counts back. So this hack really 
isn't a viable solution for anything.

Thanks,
Robin.
