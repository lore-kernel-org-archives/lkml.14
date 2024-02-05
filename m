Received: from gentwo.org (gentwo.org [62.72.0.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CED481A7
	for <linux-kernel@vger.kernel.org>; Mon,  5 Feb 2024 18:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.72.0.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707156005; cv=none; b=W1M1FZb1/OIQEIGaupwabwwRI7ttuXpYtP3qYjT6i91Z/Nz/IPLFAwO2RNPJ/+fClATCDDCrRCCDMkocpWtBq5jcKBI7wfjKxdqWd72fX6J+VVrqXxiehDeU7Gc/kNV4Sh7Ft/a4zRzywOlgtcxdw3jvyloJxGXmQ6XbmY9w61A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707156005; c=relaxed/simple;
	bh=c4mVxk55BQ/uLi0E3D3HjxTX92PPDTaT2ghleINhPyE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=iMUKB7t/GuA2yN9As3C6OfZwq7823nIVIu3p+Ssn9+o5KVnFsUnqe9BREyMYZizzGFsPgM+VNUyl4FYxYmXogRbFcudDe1Gds60CKtPBhPVuWK5Vnl/odjZmMNxdBxw/FFu2Z9MoSD4NEdRpx3oKkinORpgV/szgZtHXmbnRrK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=fail smtp.mailfrom=linux.com; arc=none smtp.client-ip=62.72.0.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=linux.com
Received: by gentwo.org (Postfix, from userid 1003)
	id 9CEE540A90; Mon,  5 Feb 2024 09:50:15 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 9C45240789;
	Mon,  5 Feb 2024 09:50:15 -0800 (PST)
Date: Mon, 5 Feb 2024 09:50:15 -0800 (PST)
From: "Christoph Lameter (Ampere)" <cl@linux.com>
To: "Song, Xiongwei" <Xiongwei.Song@windriver.com>
cc: Chengming Zhou <chengming.zhou@linux.dev>, 
    Vlastimil Babka <vbabka@suse.cz>, Yosry Ahmed <yosryahmed@google.com>, 
    Steven Rostedt <rostedt@goodmis.org>, LKML <linux-kernel@vger.kernel.org>, 
    "linux-mm@kvack.org" <linux-mm@kvack.org>, 
    Andrew Morton <akpm@linux-foundation.org>, 
    Linus Torvalds <torvalds@linux-foundation.org>, 
    Kees Cook <keescook@chromium.org>, David Rientjes <rientjes@google.com>, 
    Hyeonggon Yoo <42.hyeyoo@gmail.com>, 
    Chengming Zhou <zhouchengming@bytedance.com>, 
    Zheng Yejian <zhengyejian1@huawei.com>
Subject: RE: Do we still need SLAB_MEM_SPREAD (and possibly others)?
In-Reply-To: <PH0PR11MB519280092AA66FAE6BB3FACEEC402@PH0PR11MB5192.namprd11.prod.outlook.com>
Message-ID: <fb8161d9-16c0-da8c-09ee-905e39ae199b@linux.com>
References: <20240131172027.10f64405@gandalf.local.home> <CAJD7tkYCrFAXLey-WK8k1Nkt4SoUQ00GWNjU43HJgaLqycBm7Q@mail.gmail.com> <61af19ca-5f9a-40da-a04d-b04ed27b8754@suse.cz> <698633db-b066-4f75-b201-7b785819277b@linux.dev>
 <PH0PR11MB519280092AA66FAE6BB3FACEEC402@PH0PR11MB5192.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed

On Sun, 4 Feb 2024, Song, Xiongwei wrote:

> Once SLAB_MEM_SPREAD is removed, IMO, cpuset.memory_spread_slab is useless.

SLAB_MEM_SPREAD does not do anything anymore. SLUB relies on the 
"spreading" via the page allocator memory policies instead of doing its 
own like SLAB used to do.

What does FILE_SPREAD_SLAB do? Dont see anything there either.



