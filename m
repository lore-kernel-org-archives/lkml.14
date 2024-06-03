Received: from fhigh2-smtp.messagingengine.com (fhigh2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BF382D8E;
	Mon,  3 Jun 2024 14:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717425804; cv=none; b=KRzvlavfvr5pu8xK8ALmj1vI6wnHijJLro16YZB7V/5wJu+Q5HNrPK3hvEa9VoOEe0vNJQLltqiyKnJ1UBkUQCMp03dzj30g2S9Q1u0mXAkUxYWaMXqsRILFRiHxPRGrVT1/heO60yknyuXeDr3Wg7fgL58OLeI6lw0SvEMA5eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717425804; c=relaxed/simple;
	bh=x/CF7EMgxMegQrau/qgJVCCmxuGZ9Rq54sjL7tyxb9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uJ8EGcAeNAhk2lprlo0r4ArgbbUux1Sg2Z5NZt2aeCSx9ckJJ00JEp3FAOVW2So6cl97DIXX8SpSCbLXbxgZskim0E409X6nuR5G7Go41xXx3HyLwF9tAiNM1rHMPpgm9IqX0CySYGJ8xXBsSsZTUI6EsEvsZXjLlPC6+mm3uT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.fm; spf=pass smtp.mailfrom=fastmail.fm; dkim=pass (2048-bit key) header.d=fastmail.fm header.i=@fastmail.fm header.b=BRhvmta0; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WF92i/Fn; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.fm
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.fm
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.fm header.i=@fastmail.fm header.b="BRhvmta0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WF92i/Fn"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 00D9911400CE;
	Mon,  3 Jun 2024 10:43:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 03 Jun 2024 10:43:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.fm; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1717425801;
	 x=1717512201; bh=Z2qo5O2k2PV/eacvQhlYA1E6BZbR+GCOSqbcm9k3pUE=; b=
	BRhvmta0Zr5xeYoSLdERexWYunCelEx4bLh5nDmWEqsv2A/kuVwBad965jHfwU/a
	lY7H4kzOfx5yoGYPd67cC0rw2E/CVHoeH6Qeagg72iMizFVaUMFm3swt7YCnKeSU
	JGeKAcxDbkNoeXZlUwjP8mkUxYgOIDD295DrE1tBusrw8kgjoWkptNnUiBxMa1HW
	mWg9Mk+cKyC0jMGr9zTcS81HXg/fzGW9xM8Ae3CsNFL96DcIkwAGk68ruMj2AABQ
	DYYz4JDuVgGreIqH8VFOZdRgAZKHz6j1A+JYHoUoN/JOTojmL827l2RPdFWE2vl1
	he1YJ5qNdNshXBMLvmJBtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1717425801; x=
	1717512201; bh=Z2qo5O2k2PV/eacvQhlYA1E6BZbR+GCOSqbcm9k3pUE=; b=W
	F92i/FnHa1dThyQGV3iOfgULSWtNWxdTZBaJGdkYsXWXZJto9E2WKyF3eq1FDsum
	wjXonE0e3QoK6LsP2W2fM2NKTASxNscxI/Ic8u0HP3oRVnArur3OhP/Sa3WPdzOG
	rAwl9hV11WZnG8d8WMCRj5j24dFCHVaOje1VgQIFY/YpGBhSiaLtTt2JzZ+YnLBA
	F+300Z71T/sVELAl5Cp2OSMCn/91MM7HJorNcX8txK2zJe9MzmDXZeZzy2/7CcnT
	ShWhNbalSb+PC0lfHxviHZjWQaAVLDV9ynIiK4nZ+oZTmTS37iXFKvDi6IoleySI
	LgXRTWm8kcQtilDUfBP7Q==
X-ME-Sender: <xms:h9ZdZtqtSsaVvbfuFjXwHpN72umyd1xJyFqtv3Elq5MVEFunQyXGYA>
    <xme:h9ZdZvr96x7QSjLi8DLt8x8JTBnIiOYavGy25HLUctHhDjwBYGRJV3ny32cTnOVEH
    bCMaahX2Cef8Z82>
X-ME-Received: <xmr:h9ZdZqMXghb73yNaZQtU5oj1UEW6RVJyLAq_zm2H-Lt6K1PcSdv7XaFYIMs6-fYzMR5g_UzhxpUD4IpJ9ESrTGiPCbvZAKEeU9FXZFZBIswpse-cKnwX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdelvddgjeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeeuvghr
    nhguucfutghhuhgsvghrthcuoegsvghrnhgurdhstghhuhgsvghrthesfhgrshhtmhgrih
    hlrdhfmheqnecuggftrfgrthhtvghrnhepvedvfffhleettddtleffheduieeuveeghfdv
    gfefudeiheduffehudetlefhgfeunecuffhomhgrihhnpehgihhthhhusgdrtghomhdpkh
    gvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepsggvrhhnugdrshgthhhusggvrhhtsehfrghsthhmrghilhdrfhhm
X-ME-Proxy: <xmx:iNZdZo7ux98_i0mJ4C-duUlMuKr012XttqXOIonFl4PAhsrBOzyxdA>
    <xmx:iNZdZs7qnzMuC322vRwc0VlD-Z_y9Suu2amjuOK_sfGWKV_mkHtkgw>
    <xmx:iNZdZgiq2kJYp1lWrPn0ASVYiMgrQIKB4yXGq0SWY47RQ3A0stBuqg>
    <xmx:iNZdZu4m2w2d1qzPEplIihjaCEy2X3uDmzNtxfzRInw5f7DGHvkIEQ>
    <xmx:idZdZmR6v393Jt-fr8g88Dg6Eg29_tnmMK3tUEET0hzYYWwRObooCDTd>
Feedback-ID: id8a24192:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 3 Jun 2024 10:43:19 -0400 (EDT)
Message-ID: <67771830-977f-4fca-9d0b-0126abf120a5@fastmail.fm>
Date: Mon, 3 Jun 2024 16:43:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [HELP] FUSE writeback performance bottleneck
To: Jingbo Xu <jefflexu@linux.alibaba.com>, Miklos Szeredi
 <miklos@szeredi.hu>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 lege.wang@jaguarmicro.com
References: <495d2400-1d96-4924-99d3-8b2952e05fc3@linux.alibaba.com>
From: Bernd Schubert <bernd.schubert@fastmail.fm>
Content-Language: en-US, de-DE, fr
In-Reply-To: <495d2400-1d96-4924-99d3-8b2952e05fc3@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/3/24 08:17, Jingbo Xu wrote:
> Hi, Miklos,
> 
> We spotted a performance bottleneck for FUSE writeback in which the
> writeback kworker has consumed nearly 100% CPU, among which 40% CPU is
> used for copy_page().
> 
> fuse_writepages_fill
>   alloc tmp_page
>   copy_highpage
> 
> This is because of FUSE writeback design (see commit 3be5a52b30aa
> ("fuse: support writable mmap")), which newly allocates a temp page for
> each dirty page to be written back, copy content of dirty page to temp
> page, and then write back the temp page instead.  This special design is
> intentional to avoid potential deadlocked due to buggy or even malicious
> fuse user daemon.

I also noticed that and I admin that I don't understand it yet. The commit says

<quote>
    The basic problem is that there can be no guarantee about the time in which
    the userspace filesystem will complete a write.  It may be buggy or even
    malicious, and fail to complete WRITE requests.  We don't want unrelated parts
    of the system to grind to a halt in such cases.
</quote>


Timing - NFS/cifs/etc have the same issue? Even a local file system has no guarantees
how fast storage is?

Buggy - hmm yeah, then it is splice related only? But I think splice feature was
not introduced yet when fuse got mmap and writeback in 2008? 
Without splice the pages are just copied into a userspace buffer? So what can
userspace do wrong with its copy?

Failure - why can't it do what nfs_mapping_set_error() does?

I guess I miss something, but so far I don't understand what that is.


> 
> There was a proposal of removing this constraint for virtiofs [1], which
> is reasonable as users of virtiofs and virtiofs daemon don't run on the
> same OS, and virtiofs daemon is usually offered by cloud vendors that
> shall not be malicious.  While for the normal /dev/fuse interface, I
> don't think removing the constraint is acceptable.
> 
> 
> Come back to the writeback performance bottleneck.  Another important
> factor is that, (IIUC) only one kworker at the same time is allowed for
> writeback for each filesystem instance (if cgroup writeback is not
> enabled).  The kworker is scheduled upon sb->s_bdi->wb.dwork, and the
> workqueue infrastructure guarantees that at most one *running* worker is
> allowed for one specific work (sb->s_bdi->wb.dwork) at any time.  Thus
> the writeback is constraint to one CPU for each filesystem instance.
> 
> I'm not sure if offloading the page copying and then FUSE requests
> sending to another worker (if a bunch of dirty pages have been
> collected) is a good idea or not, e.g.
> 
> ```
> fuse_writepages_fill
>   if fuse_writepage_need_send:
>     # schedule a work
> 
> # the worker
> for each dirty page in ap->pages[]:
>     copy_page
> fuse_writepages_send
> ```
> 
> Any suggestion?
> 
> 
> 
> This issue can be reproduced by:
> 
> 1 ./libfuse/build/example/passthrough_ll -o cache=always -o writeback -o
> source=/run/ /mnt
> ("/run/" is a tmpfs mount)
> 
> 2 fio --name=write_test --ioengine=psync --iodepth=1 --rw=write --bs=1M
> --direct=0 --size=1G --numjobs=2 --group_reporting --directory=/mnt
> (at least two threads are needed; fio shows ~1800MiB/s buffer write
> bandwidth)


That should quickly run out of tmpfs memory. I need to find time to improve
this a bit, but this should give you an easier test:

https://github.com/libfuse/libfuse/pull/807

> 
> 
> [1]
> https://lore.kernel.org/all/20231228123528.705-1-lege.wang@jaguarmicro.com/
> 
> 


Thanks,
Bernd
