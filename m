Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF8DC3FE5B
	for <linux-kernel@vger.kernel.org>; Mon,  8 Jan 2024 12:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B9A5C15;
	Mon,  8 Jan 2024 04:35:32 -0800 (PST)
Received: from [127.0.1.1] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7E7883F64C;
	Mon,  8 Jan 2024 04:34:45 -0800 (PST)
From: Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH 0/6] Misc FFA fixes around init.
Date: Mon, 08 Jan 2024 12:34:10 +0000
Message-Id: <20240108-ffa_fixes_6-8-v1-0-75bf7035bc50@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMLrm2UC/w3LSwqAIBAA0KvErBsw+1BdJiYdc0AMHIogunsu3
 +K9oFyEFdbmhcK3qJy5omsbcJHywSi+Gqyxg+nMjCHQFuRh3SackTz3wXlvx2WEenZSxr1QdrG
 ufKX0fT+NmXOEZAAAAA==
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.12.4

A smalls set of fixes arounds FFA initialization routines.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
Cristian Marussi (6):
      firmware: arm_ffa: Add missing rwlock_init()
      firmware: arm_ffa: Add missing host rwlock_init()
      firmware: arm_ffa: Check xa_load() return value
      firmware: arm_ffa: Simplify ffa_partitions_cleanup()
      firmware: arm_ffa: Use xa_insert() and check for result
      firmware: arm_ffa: Handle partitions setup failures

 drivers/firmware/arm_ffa/driver.c | 85 ++++++++++++++++++++++++++-------------
 1 file changed, 57 insertions(+), 28 deletions(-)
---
base-commit: dd6de5552d8d59db58952cc6ae34a15267d0b437
change-id: 20240108-ffa_fixes_6-8-ade3fcdd2595

Best regards,
-- 
Cristian Marussi <cristian.marussi@arm.com>

