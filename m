Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003A876046;
	Wed, 13 Mar 2024 16:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710347897; cv=none; b=WIw+YXLt4iwD5/8cz5Lub72eaLm6J5FmA+V+oUltaFsJ1LxfFCAEhGLg/nZv/ZBu+nMEaB3NFxfkEgYET6VgqVe1J1ySbepo2araFaPLMsk+3CRIOv+Icf28rhbDKpIwzWICbp35tLxmIdddDzUH/BDaqe8Vzbxf3obRmC+OkXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710347897; c=relaxed/simple;
	bh=jF/IvEEKsyPeFj7S+JTy2wNR+BHVPZyVTF4Bd9/eYCc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ETcNJaarEFhM7l0x1SYQSx/35yFr2w88ZsePPdSqmcdE66N2tLYg6DPd6Ac4dJu71DhggZG1dxlyYPOEhAYxgdlKq8BterHaXzS/rsq4CGkm+50SgzfFd+d93qjunyldWUWkmsT/PPJt1G9G8wSg87u5ZFg+yNB5TmASJ6glzqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R5/4Z7WX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R5/4Z7WX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2442AC43394;
	Wed, 13 Mar 2024 16:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710347896;
	bh=jF/IvEEKsyPeFj7S+JTy2wNR+BHVPZyVTF4Bd9/eYCc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R5/4Z7WX8RZ0WjKf8iuYlmGSHIZFJ5qcSGgknIySe3QpKUiFlM63pXcH7WqQP10lk
	 gLg2lZH2wRrRhtesKbwN7RDpm6pALIuBRWKf7aPEb/8QSiTzH5MEetG2X2dEr/Yv1Y
	 eB6X+NjhE9zMDP0C50oBJAPRV13/e+kv5Tp1omX+xT7/wxvEfb82JTf57spqFqp/iG
	 aWGrzutxUfO5VUdhkaN13jwye5qhF7Ll+ISgUligJdkwFRTYg+0jbTlTLLg80c2SZy
	 bBwVb85sQ5DcvCqC7dmilEwAojg7JdLuBrwjnBFyTv3hb3bWPLITitFakmZ0GqMBfP
	 SwDvYB7K27+6w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 6.6 56/60] x86/mmio: Disable KVM mitigation when X86_FEATURE_CLEAR_CPU_BUF is set
Date: Wed, 13 Mar 2024 12:37:03 -0400
Message-ID: <20240313163707.615000-57-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240313163707.615000-1-sashal@kernel.org>
References: <20240313163707.615000-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-KernelTest-Patch: http://kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.6.22-rc1.gz
X-KernelTest-Tree: git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
X-KernelTest-Branch: linux-6.6.y
X-KernelTest-Patches: git://git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue.git
X-KernelTest-Version: 6.6.22-rc1
X-KernelTest-Deadline: 2024-03-15T16:36+00:00
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>

commit e95df4ec0c0c9791941f112db699fae794b9862a upstream.

Currently MMIO Stale Data mitigation for CPUs not affected by MDS/TAA is
to only deploy VERW at VMentry by enabling mmio_stale_data_clear static
branch. No mitigation is needed for kernel->user transitions. If such
CPUs are also affected by RFDS, its mitigation may set
X86_FEATURE_CLEAR_CPU_BUF to deploy VERW at kernel->user and VMentry.
This could result in duplicate VERW at VMentry.

Fix this by disabling mmio_stale_data_clear static branch when
X86_FEATURE_CLEAR_CPU_BUF is enabled.

Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
Reviewed-by: Dave Hansen <dave.hansen@linux.intel.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/x86/kernel/cpu/bugs.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 17eb4d76e3a53..19256accc0784 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -422,6 +422,13 @@ static void __init mmio_select_mitigation(void)
 	if (boot_cpu_has_bug(X86_BUG_MDS) || (boot_cpu_has_bug(X86_BUG_TAA) &&
 					      boot_cpu_has(X86_FEATURE_RTM)))
 		setup_force_cpu_cap(X86_FEATURE_CLEAR_CPU_BUF);
+
+	/*
+	 * X86_FEATURE_CLEAR_CPU_BUF could be enabled by other VERW based
+	 * mitigations, disable KVM-only mitigation in that case.
+	 */
+	if (boot_cpu_has(X86_FEATURE_CLEAR_CPU_BUF))
+		static_branch_disable(&mmio_stale_data_clear);
 	else
 		static_branch_enable(&mmio_stale_data_clear);
 
@@ -498,8 +505,11 @@ static void __init md_clear_update_mitigation(void)
 		taa_mitigation = TAA_MITIGATION_VERW;
 		taa_select_mitigation();
 	}
-	if (mmio_mitigation == MMIO_MITIGATION_OFF &&
-	    boot_cpu_has_bug(X86_BUG_MMIO_STALE_DATA)) {
+	/*
+	 * MMIO_MITIGATION_OFF is not checked here so that mmio_stale_data_clear
+	 * gets updated correctly as per X86_FEATURE_CLEAR_CPU_BUF state.
+	 */
+	if (boot_cpu_has_bug(X86_BUG_MMIO_STALE_DATA)) {
 		mmio_mitigation = MMIO_MITIGATION_VERW;
 		mmio_select_mitigation();
 	}
-- 
2.43.0

