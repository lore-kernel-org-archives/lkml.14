Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13DFD1AED36
	for <linux-kernel@vger.kernel.org>; Fri, 14 Jun 2024 15:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718377384; cv=none; b=LxWn6epNMj/FcUkRFd08U6KbB4mBQa5PCtQiRjs7FnWHKIovZQg9m0kd02GdtjJJMd2KGHAh3gBUmIV2p5CIJN2UHygKTgJTKcdy078son1xeda2xx5CfrHJEpidQU9FRgouaf6BWCZkcgj+ddPAF2SXEeR2O2PDZUnBKgty4PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718377384; c=relaxed/simple;
	bh=nemEl8gWSj/NvzHh5CdfG1I1++iD+LHZ4tAgmQ+RBgk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gPaD/r0dz9JZ9OgfX4mJwnDSABE3aXsM4VL/CO50SDWMbo90VjE6vHcVA+960b+J3mIFb9dVoqsZKGiCR6ZEsXA1Lu08CzadKJQ1DV76tZBkZO5fMUtRLMhYNidoucYQpoGEMfjn3vZaSCTGTlyg1AR+OYoTMstHLXEKjchhz4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 227F21C00;
	Fri, 14 Jun 2024 08:03:27 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A18A3F5A1;
	Fri, 14 Jun 2024 08:02:59 -0700 (PDT)
From: James Morse <james.morse@arm.com>
To: x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Fenghua Yu <fenghua.yu@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	H Peter Anvin <hpa@zytor.com>,
	Babu Moger <Babu.Moger@amd.com>,
	James Morse <james.morse@arm.com>,
	shameerali.kolothum.thodi@huawei.com,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	carl@os.amperecomputing.com,
	lcherian@marvell.com,
	bobo.shaobowang@huawei.com,
	tan.shaopeng@fujitsu.com,
	baolin.wang@linux.alibaba.com,
	Jamie Iles <quic_jiles@quicinc.com>,
	Xin Hao <xhao@linux.alibaba.com>,
	peternewman@google.com,
	dfustini@baylibre.com,
	amitsinght@marvell.com,
	David Hildenbrand <david@redhat.com>,
	Rex Nie <rex.nie@jaguarmicro.com>,
	Dave Martin <dave.martin@arm.com>
Subject: [PATCH v3 34/38] x86/resctrl: Add end-marker to the resctrl_event_id enum
Date: Fri, 14 Jun 2024 15:00:29 +0000
Message-Id: <20240614150033.10454-35-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20240614150033.10454-1-james.morse@arm.com>
References: <20240614150033.10454-1-james.morse@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The resctrl_event_id enum gives names to the counter event numbers on x86.
These are used directly by resctrl.

To allow the MPAM driver to keep an array of these the size of the enum
needs to be known.

Add a 'num_events' define which can be used to size an array. This isn't
a member of the enum to avoid updating switch statements that would
otherwise be missing a case.

Signed-off-by: James Morse <james.morse@arm.com>
---
Changes since v2:
 * This patch is new.
---
 include/linux/resctrl_types.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/resctrl_types.h b/include/linux/resctrl_types.h
index 51c51a1aabfb..70226f5ab3e3 100644
--- a/include/linux/resctrl_types.h
+++ b/include/linux/resctrl_types.h
@@ -51,4 +51,6 @@ enum resctrl_event_id {
 	QOS_L3_MBM_LOCAL_EVENT_ID	= 0x03,
 };
 
+#define QOS_NUM_EVENTS		(QOS_L3_MBM_LOCAL_EVENT_ID + 1)
+
 #endif /* __LINUX_RESCTRL_TYPES_H */
-- 
2.39.2

