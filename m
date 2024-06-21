Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE7AF7E799
	for <linux-kernel@vger.kernel.org>; Fri, 21 Jun 2024 02:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718937697; cv=none; b=R+cEmBH1pYhTXbldtQk4y7TIrgCDX4pi7rky6inFk1k7miWONQTAMGKo0/4HE1AeNpqlDkL/EWBfKeye7yB7pAE++hl8s4+RMon52bmVRJXQsiN/X0CL1hXF0nUWQG+n0/82jrM1RvwoAmJs9uEZkTinCOomyxQJaRQAc2CPjW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718937697; c=relaxed/simple;
	bh=Omnit98zDPQ8zEbhRt6NcSzwKNhOVJPP8EA7TahPI48=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=U+Rhk8df+19oqnsoaFAQR9bNKBguPAl+ROnCuE1+DKsI4HWT4Di8j+LFIpqX4fJyxwRw13uBN0U3WM3iKQTuk52XYrFmZU3VEs6Z4etikJGjT6cUZbyE3WOvSrncL01RaEk6aiwnKU/1LPPbo/CsbGuNAfDhFY0K2/M6YYISuNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=f/Hr90Bi; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="f/Hr90Bi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:From:Subject:
	Content-Type; bh=EXZH6Y00n0A5f9mRlS4gzqQT4Ccb/lcVaPVwyfNtmJU=;
	b=f/Hr90Bib8fx437arN+PxbeU0S1eXxk+styBTDJvad4hCjYufR/uFkk1uwb7N/
	jBNN8xuBISdEKTd90fDJeNXtn/Ll03bIPqwV8xUEu4q9ahyRv4El8C1W8nnJ/tEs
	pvWvUqgcfUXNG1Md8q7QJVYbAtCnCRR+dfKIYEnIeyx6o=
Received: from [172.22.5.12] (unknown [27.148.194.72])
	by gzga-smtp-mta-g3-5 (Coremail) with SMTP id _____wD3X9hI6HRm+RWIBQ--.14621S2;
	Fri, 21 Jun 2024 10:41:12 +0800 (CST)
Message-ID: <24ac3144-c6bc-4fd9-b592-d1a88505e65a@163.com>
Date: Fri, 21 Jun 2024 10:41:13 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: LKML <linux-kernel@vger.kernel.org>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>
From: Jianguo Wu <wujianguo106@163.com>
Subject: [PATCH] netfilter: fix undefined reference to 'netfilter_lwtunnel_*'
 when CONFIG_SYSCTL=n
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_____wD3X9hI6HRm+RWIBQ--.14621S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw43KFykJry5Kr13AFWDJwb_yoW8WrWDpa
	n8uw1UJr1jgFWrKrWvg348ZF1Ygay5ta48urZ0k34kXF1q9w4DGwsa9FW7Xa1UWw4kKFW5
	WF10qw43J34DJrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UDxhJUUUUU=
X-CM-SenderInfo: 5zxmxt5qjx0iiqw6il2tof0z/1tbiNw4FkGXAlz3dhQAAs7

From: Jianguo Wu <wujianguo@chinatelecom.cn>

if CONFIG_SYSFS is not enabled in config, we get the below compile error,

All errors (new ones prefixed by >>):

   csky-linux-ld: net/netfilter/core.o: in function `netfilter_init':
   core.c:(.init.text+0x42): undefined reference to `netfilter_lwtunnel_init'
>> csky-linux-ld: core.c:(.init.text+0x56): undefined reference to `netfilter_lwtunnel_fini'
>> csky-linux-ld: core.c:(.init.text+0x70): undefined reference to `netfilter_lwtunnel_init'
   csky-linux-ld: core.c:(.init.text+0x78): undefined reference to `netfilter_lwtunnel_fini'

Fixes: a2225e0250c5 ("netfilter: move the sysctl nf_hooks_lwtunnel into the netfilter core")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202406210511.8vbByYj3-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202406210520.6HmrUaA2-lkp@intel.com/
Signed-off-by: Jianguo Wu <wujianguo@chinatelecom.cn>
---
 net/netfilter/nf_hooks_lwtunnel.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/netfilter/nf_hooks_lwtunnel.c b/net/netfilter/nf_hooks_lwtunnel.c
index 7cdb59bb4459..d8ebebc9775d 100644
--- a/net/netfilter/nf_hooks_lwtunnel.c
+++ b/net/netfilter/nf_hooks_lwtunnel.c
@@ -117,4 +117,7 @@ void netfilter_lwtunnel_fini(void)
 {
 	unregister_pernet_subsys(&nf_lwtunnel_net_ops);
 }
+#else
+int __init netfilter_lwtunnel_init(void) { return 0; }
+void netfilter_lwtunnel_fini(void) {}
 #endif /* CONFIG_SYSCTL */
-- 
1.8.3.1

