Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B206E15ECC1;
	Wed, 10 Apr 2024 13:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712755115; cv=none; b=n744b2/HnlpO5YeCtU4T7MB+Sxe7CCLgsac6j82kfRhrPD394SgkXsMhdxAGYEikP/UckQSacqvqO8jyHxiQ2A22F1S7fKIG7yFqGdrcDr+sv5YRkYIzM0V8CKTs3Z69ofBGxowOcCDAQ/IlHagm93C0qUmU0erTj0HRdWey36c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712755115; c=relaxed/simple;
	bh=d2C74Cy6etUUb3iJ2rSC4wgdWbGqwnv0Be7HD5hsGuc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KPdK7tvKV2Omd/hWCVKAdLd0uqzoDA42NlogXtCaf6oXEbM03+8qEz0FJnh78EgLAJL2QRgK8UD41f63fdkxpolKkng+4Q3bmSd1xaIwXJGyR93rRqvI6O7OXiSDJ8iuukmrzpVD+Rlx8V7SI3Ca0JxIlY8zUWHmoQlxSImU6uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3437C433F1;
	Wed, 10 Apr 2024 13:18:32 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH 0/4] LoongArch: Update dts for Loongson-2K to make devices work
Date: Wed, 10 Apr 2024 21:18:00 +0800
Message-ID: <20240410131804.2165848-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When we enable Super-IO and GMAC/GNET on Loongson-2K we find they can
not work, there are several problems in the dts files, so fix them.

Huacai Chen(4):
 LoongArch: Update dts for Loongson-2K1000 to support ISA/LPC.
 LoongArch: Update dts for Loongson-2K2000 to support ISA/LPC.
 LoongArch: Update dts for Loongson-2K2000 to support PCI-MSI.
 LoongArch: Update dts for Loongson-2K2000 to support GMAC/GNET.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
2.27.0

