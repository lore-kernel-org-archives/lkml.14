Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6400112B72
	for <linux-kernel@vger.kernel.org>; Tue, 16 Jan 2024 09:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="XnaijWnm"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1705397224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QFQl9fBFkKO1mjcvm2wLZxgvyHg7v6jLoqOBytvyuaA=;
	b=XnaijWnmIqAjE0gINh+vFBIvwMhu9eR8WsLdRoUuOtJZVNwu1wr2tn+pwjaNc8Jq1BF6os
	OOzP+8ODsvUUx48bK5EB9ztCrfzPa4F3UfxuKmmC4nS1/jdRkfhxfIPwCnqXqlxymZ7jY6
	luKL+iYk/2XqatKu+ATBEnKhstsDj80=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Subject: Re: [PATCH v3 5/7] hugetlb: have CONFIG_HUGETLBFS select
 CONFIG_PADATA
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20240102131249.76622-6-gang.li@linux.dev>
Date: Tue, 16 Jan 2024 17:26:19 +0800
Cc: David Hildenbrand <david@redhat.com>,
 David Rientjes <rientjes@google.com>,
 Mike Kravetz <mike.kravetz@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Tim Chen <tim.c.chen@linux.intel.com>,
 Linux-MM <linux-mm@kvack.org>,
 LKML <linux-kernel@vger.kernel.org>,
 ligang.bdlg@bytedance.com
Content-Transfer-Encoding: 7bit
Message-Id: <B2A7832F-E575-4B1D-95AB-AA6A50753385@linux.dev>
References: <20240102131249.76622-1-gang.li@linux.dev>
 <20240102131249.76622-6-gang.li@linux.dev>
To: Gang Li <gang.li@linux.dev>
X-Migadu-Flow: FLOW_OUT



> On Jan 2, 2024, at 21:12, Gang Li <gang.li@linux.dev> wrote:
> 
> Now hugetlb uses padata_do_multithreaded for parallel initialization,
> so select CONFIG_PADATA.
> 
> Signed-off-by: Gang Li <gang.li@linux.dev>

Reviewed-by: Muchun Song <muchun.song@linux.dev>


