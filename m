Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40913D8E
	for <linux-kernel@vger.kernel.org>; Sat,  1 Jun 2024 06:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717224722; cv=none; b=GfmUNAlEVap0cjB6axDv/JuEV6sEgezUbvXbVY0igD6zgcpqlAI7cgvBZEyqguOVA5lD1W+Nc0HWtFDzZz9d+czPfqVCkpPqoz5Zum1wkvDdeewo9qBjaUWQfSEsGkuz/HxSvY5bpw+1NEvUO/ixvalqKvGz3eZ1UIgFtrctrlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717224722; c=relaxed/simple;
	bh=z+NVkSF9/h++oNTKg3hPYtqpKqf4qsyHlrFT3WOqluM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bJg7gR0UIAIISpyVPpAGN7N12/Vl+0Tb0TtCO2uM84RlgpOIpH5w+5zaK54o9qSI8MdUg8q0FMvsdEVKdd7d1s65qykNZCSyPr5u79Cyyk0kn2JNM9NtkIXuMuS9z7Vux4b5YeSo1t/xASsvj/degPBPV8SJGRg4ev3YN6t5aF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=AOCafK+u; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="AOCafK+u"
X-Envelope-To: roman.gushchin@linux.dev
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1717224719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=36nPljF0mtO/WeP9Ads+GsMlYOhzpHvpBAZMAFqLFVk=;
	b=AOCafK+uQ/lGv4NvvRH/KxdbxT5mSypYbjl3K9qtZe30PhRixB9L4TZ0cd+9KnZ/sQNZ5s
	egRnqURUAjCEka+MjUBcutcerM1aZWjJtd7Ks3v/YoMruwqoGOCGj+bN0l/4vvQ3qfHi+9
	LnDbmTPSOXsQScLJE7X6wqQ1lgzs6Tc=
X-Envelope-To: akpm@linux-foundation.org
X-Envelope-To: muchun.song@linux.dev
X-Envelope-To: hannes@cmpxchg.org
X-Envelope-To: mhocko@kernel.org
X-Envelope-To: willy@infradead.org
X-Envelope-To: linux-mm@kvack.org
X-Envelope-To: linux-kernel@vger.kernel.org
Date: Fri, 31 May 2024 23:51:55 -0700
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Muchun Song <muchun.song@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal Hocko <mhocko@kernel.org>, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 13/14] mm: memcg: put cgroup v1-related members of
 task_struct under config option
Message-ID: <o2oiwy5rcrqrtrnhcyuajcpdoyu45njcibuexjxecvjtjtgadd@j6alu4rkdaii>
References: <20240528202101.3099300-1-roman.gushchin@linux.dev>
 <20240528214435.3125304-1-roman.gushchin@linux.dev>
 <20240528214435.3125304-4-roman.gushchin@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240528214435.3125304-4-roman.gushchin@linux.dev>
X-Migadu-Flow: FLOW_OUT

On Tue, May 28, 2024 at 02:44:34PM GMT, Roman Gushchin wrote:
> Guard cgroup v1-related members of task_struct under the CONFIG_MEMCG_V1
> config option, so that users who adopted cgroup v2 don't have to waste
> the memory for fields which are never accessed.
> 
> Signed-off-by: Roman Gushchin <roman.gushchin@linux.dev>

Acked-by: Shakeel Butt <shakeel.butt@linux.dev>
