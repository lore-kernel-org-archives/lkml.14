Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4487BAE5
	for <linux-kernel@vger.kernel.org>; Tue,  2 Jul 2024 07:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719906864; cv=none; b=X4E2PD/JBenkWKo7a3c8dEbe/vgsJdol9WTTZJ3zSi1GU2u8u40Ni8oujMwCB9qHn+1r/aTSxpQeY/olq7mixWxKbfe9B+lDTD10UlRtpG1zbOtM21SE8t6vx9hcxkkRHusXqC0BdY8uugSCUMUMM39jsMYNFxaZr+BAwWGNnvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719906864; c=relaxed/simple;
	bh=AB+3tO4P+aNCXHvKy/l0tc+XRKWAnULlohanbrKw11E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=utEfjysuAEM3KTH7aVtAG17I3fn5IfkzmDSpmSvIL7Zyy1MRq3PZrZaKRHEvdiUkyYTqUJKUxmPnYD0tkB8RFsHXKPFcVWAGVE3yQ+90MxsVmxLpgdZGkueUFNnuBAjf88wuAOzDdAQinKqm8qNRb7JHt5Jr40pyhgQCjcEF5VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4WCw992zjlz1HDv9;
	Tue,  2 Jul 2024 15:51:57 +0800 (CST)
Received: from kwepemi100008.china.huawei.com (unknown [7.221.188.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 475EA180028;
	Tue,  2 Jul 2024 15:54:14 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi100008.china.huawei.com
 (7.221.188.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 2 Jul
 2024 15:54:13 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <linux@armlinux.org.uk>, <arnd@arndb.de>, <afd@ti.com>,
	<akpm@linux-foundation.org>, <linus.walleij@linaro.org>,
	<eric.devolder@oracle.com>, <ardb@kernel.org>, <gregkh@linuxfoundation.org>,
	<deller@gmx.de>, <javierm@redhat.com>, <bhe@redhat.com>, <robh@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH RESEND 1/2] ARM: Switch over to GENERIC_CPU_DEVICES using arch_register_cpu()
Date: Tue, 2 Jul 2024 15:57:41 +0800
Message-ID: <20240702075742.945768-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240702075742.945768-1-ruanjinjie@huawei.com>
References: <20240702075742.945768-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi100008.china.huawei.com (7.221.188.57)

Currently, almost all architectures have switched to GENERIC_CPU_DEVICES,
except for arm32. Also switch over to GENERIC_CPU_DEVICES, and provide an
arch_register_cpu() that populates the hotpluggable flag for arm32.

The struct cpu in struct cpuinfo_arm is never used directly, remove
it to use the one GENERIC_CPU_DEVICES provides.

This also has the effect of moving the registration of CPUs from subsys to
driver core initialisation, prior to any initcalls running.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm/Kconfig           |  1 +
 arch/arm/include/asm/cpu.h |  1 -
 arch/arm/kernel/setup.c    | 15 ++++-----------
 3 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index b211b7f5a138..68990e1645d5 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -63,6 +63,7 @@ config ARM
 	select GENERIC_CLOCKEVENTS_BROADCAST if SMP
 	select GENERIC_IRQ_IPI if SMP
 	select GENERIC_CPU_AUTOPROBE
+	select GENERIC_CPU_DEVICES
 	select GENERIC_EARLY_IOREMAP
 	select GENERIC_IDLE_POLL_SETUP
 	select GENERIC_IRQ_MULTI_HANDLER
diff --git a/arch/arm/include/asm/cpu.h b/arch/arm/include/asm/cpu.h
index bd6fdb4b922d..9d8863537aa5 100644
--- a/arch/arm/include/asm/cpu.h
+++ b/arch/arm/include/asm/cpu.h
@@ -11,7 +11,6 @@
 #include <linux/cpu.h>
 
 struct cpuinfo_arm {
-	struct cpu	cpu;
 	u32		cpuid;
 #ifdef CONFIG_SMP
 	unsigned int	loops_per_jiffy;
diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
index 7b33b157fca0..f91e2b5b8b20 100644
--- a/arch/arm/kernel/setup.c
+++ b/arch/arm/kernel/setup.c
@@ -1201,20 +1201,13 @@ void __init setup_arch(char **cmdline_p)
 		mdesc->init_early();
 }
 
-
-static int __init topology_init(void)
+int arch_register_cpu(int num)
 {
-	int cpu;
-
-	for_each_possible_cpu(cpu) {
-		struct cpuinfo_arm *cpuinfo = &per_cpu(cpu_data, cpu);
-		cpuinfo->cpu.hotpluggable = platform_can_hotplug_cpu(cpu);
-		register_cpu(&cpuinfo->cpu, cpu);
-	}
+	struct cpu *cpu = &per_cpu(cpu_devices, num);
 
-	return 0;
+	cpu->hotpluggable = platform_can_hotplug_cpu(num);
+	return register_cpu(cpu, num);
 }
-subsys_initcall(topology_init);
 
 #ifdef CONFIG_HAVE_PROC_CPU
 static int __init proc_cpu_init(void)
-- 
2.34.1

