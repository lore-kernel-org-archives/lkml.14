Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C5315E5D3;
	Tue,  7 May 2024 13:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715087996; cv=none; b=PAIQty1dNro5i6VNR1vE+9xeGZuF+UJOwTLoPq9sEO1yQTEWn0Pl2EbYRj+Qf46gtVtm2PXOIFHvdd9aoP2t3uW9VWwepDz7j5ElhHAxSRIMY5T1TOHm05LxxnKl7ZIoPj/ZvRCZI81qkys7veCGPi4tyTMRG7QeziC4shNMZS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715087996; c=relaxed/simple;
	bh=1BoYOg1D0katMBYBO3j8/HTTrzFKSMZIdyb3qfrvQS0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KVXFP1Nw/3TEb6kxf+HNYMPJDKut8GGHSqUb/C9rYp8/Qhkb+tXPseIgENJHXdAQeCyQU96Xr3Zlk4USWn0eszNhG5fHyf4m2UGIGMMNCSti+JHlPmE+epVrUObgnG9T1u6Y/tA2t/DvxH7cdLQbLLXhSDpLJpsQbT0QfhlNE74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=shelob.surriel.com; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shelob.surriel.com
Received: from [2601:18c:9101:a8b6:6e0b:84ff:fee2:98bb] (helo=imladris.surriel.com)
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@shelob.surriel.com>)
	id 1s4Kil-000000004Aa-0RLc;
	Tue, 07 May 2024 09:19:03 -0400
Date: Tue, 7 May 2024 09:18:58 -0400
From: Rik van Riel <riel@surriel.com>
To: Baoquan He <bhe@redhat.com>
Cc: Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, kernel-team@meta.com
Subject: [PATCH] fs/proc: fix softlockup in __read_vmcore
Message-ID: <20240507091858.36ff767f@imladris.surriel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: riel@surriel.com

While taking a kernel core dump with makedumpfile on a larger system,
softlockup messages often appear.

While softlockup warnings can be harmless, they can also interfere
with things like RCU freeing memory, which can be problematic when
the kdump kexec image is configured with as little memory as possible.

Avoid the softlockup, and give things like work items and RCU a
chance to do their thing during __read_vmcore by adding a cond_resched.

Signed-off-by: Rik van Riel <riel@surriel.com>
---
 fs/proc/vmcore.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/proc/vmcore.c b/fs/proc/vmcore.c
index 1fb213f379a5..d06607a1f137 100644
--- a/fs/proc/vmcore.c
+++ b/fs/proc/vmcore.c
@@ -383,6 +383,8 @@ static ssize_t __read_vmcore(struct iov_iter *iter, loff_t *fpos)
 		/* leave now if filled buffer already */
 		if (!iov_iter_count(iter))
 			return acc;
+
+		cond_resched();
 	}
 
 	list_for_each_entry(m, &vmcore_list, list) {
-- 
2.42.0


