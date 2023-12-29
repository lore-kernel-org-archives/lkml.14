Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com [61.152.239.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FFE747E
	for <linux-kernel@vger.kernel.org>; Fri, 29 Dec 2023 06:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 2EBAE80B2;
	Fri, 29 Dec 2023 14:54:17 +0800 (CST)
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 29 Dec
 2023 14:54:16 +0800
Received: from jsia-virtual-machine.localdomain (175.136.135.142) by
 EXMBX066.cuchost.com (172.16.6.66) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Fri, 29 Dec 2023 14:54:13 +0800
From: Sia Jee Heng <jeeheng.sia@starfivetech.com>
To: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: <rafael.j.wysocki@intel.com>, <ajones@ventanamicro.com>,
	<conor.dooley@microchip.com>, <sunilvl@ventanamicro.com>,
	<jeeheng.sia@starfivetech.com>, <aou@eecs.berkeley.edu>,
	<palmer@dabbelt.com>, <paul.walmsley@sifive.com>
Subject: [RFC v1 0/1] Enable SPCR table for console output on RISC-V
Date: Fri, 29 Dec 2023 14:54:04 +0800
Message-ID: <20231229065405.235625-1-jeeheng.sia@starfivetech.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX066.cuchost.com
 (172.16.6.66)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: quoted-printable

This patch will enable the SPCR table for RISC-V.

Vendor will enable/disable the SPCR table in the firmware based on the
platform design. However, in cases where the SPCR table is not usable,
a kernel parameter could be used to specify the preferred console.

This patch depends on Sunil's patch series, as indicated in [1] and
the corresponding Qemu patch can be found at [2].

[1] https://lore.kernel.org/lkml/20231219174526.2235150-1-sunilvl@ventana=
micro.com/
[2] https://lore.kernel.org/qemu-devel/20231228080616.158822-1-jeeheng.si=
a@starfivetech.com/

Sia Jee Heng (1):
  RISC-V: ACPI: Enable SPCR table for console output on RISC-V

 arch/riscv/kernel/acpi.c | 4 ++++
 1 file changed, 4 insertions(+)

--=20
2.34.1

