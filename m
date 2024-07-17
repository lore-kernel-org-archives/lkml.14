Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9368317F385
	for <linux-kernel@vger.kernel.org>; Wed, 17 Jul 2024 19:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721245757; cv=none; b=sj9Vi2nOa6p5YJ1bTuR+tBWGnVNVfSyIPQLqFh2aDRPY7O+GalN/7n+JFRxS7bPcnFYJkUjmK2iXWKAmXbtC9NwpLK2Yes2ZcVrxMDN6BLkaStoR1KFDyDONDckX1iUQ6XdfrshvGdDApHqyYcyqarHLCT+46lw4x9fPY8jSH+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721245757; c=relaxed/simple;
	bh=VYVH8+4tHwZfxc0s1qPNWAN9fP+e1O3MLEriEoiya40=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=mu4vwemAMUzqHj4rCRxYyF7fcwdgYDP5UKSnOn+6w5r8S8JTzTO64RV2U2LdW4eOA+JJTlZUaLBXWfLGVEzLl65IZvBRof5QVorJ8TojY1ZbWux94RbqfOGbf8soIqNgC9lfHfU4C4dObJavwGBSXtSUnjfC2Gccx8WS+nPFZnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=sm52eIXx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="sm52eIXx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5DA7C2BD10;
	Wed, 17 Jul 2024 19:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1721245757;
	bh=VYVH8+4tHwZfxc0s1qPNWAN9fP+e1O3MLEriEoiya40=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=sm52eIXxnAzFmAcmYj27/4OzafQtRJdgHcwEboO34IBJRP3y/Hf284VwDHEPIXWNn
	 hFn4/28xPj4bJcjMDKVsXQFLKJrEorVYGdmabqOijbM/DhEtPw9D3FwgR5YxGpJpyA
	 3Mxa4zYEbdMd8hpmfAgNNbDARgKdxszizaFFiPic=
Date: Wed, 17 Jul 2024 12:49:16 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Baoquan He <bhe@redhat.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, vgoyal@redhat.com,
 dyoung@redhat.com, kexec@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] crash: fix x86_32 memory reserve dead loop retry
 bug at "high"
Message-Id: <20240717124916.0535d675cadf2feeee9752fe@linux-foundation.org>
In-Reply-To: <ZpfJYcjZ0QmFUpPf@MiWiFi-R3L-srv>
References: <20240717070904.2671147-1-ruanjinjie@huawei.com>
	<ZpfJYcjZ0QmFUpPf@MiWiFi-R3L-srv>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 17 Jul 2024 21:38:41 +0800 Baoquan He <bhe@redhat.com> wrote:

> 1) revert commit 8f9dade5906a in Andrew's tree;

Thanks, dropped.
