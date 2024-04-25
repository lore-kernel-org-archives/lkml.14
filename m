Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D10B7483
	for <linux-kernel@vger.kernel.org>; Thu, 25 Apr 2024 02:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714011334; cv=none; b=j6pn+CjvSqGPjNxHwzFgrmDsvChFyrBwnw9yvoIXPZOFEg7gglDKQx89tMcA/felMapeQZGrivTWAXxnG9vWjJfHZ84PFgAkxLnqpbM7OFXM8nRyVpmQTruPhpBo2mlu4V80Vxdf6qHM3MsEhJXdMU3XV41IB1zaW+85vub9dv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714011334; c=relaxed/simple;
	bh=dEDGmI/9kTTqq5sNWEW4/34w2kAbFrZ+3rJj3BEWKHg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=lpmbBRN/RJ6TJP9qjsbkz6eefmNZZ15wCjzEB7qUvNvLxL1j/JzZuwNl8Soyn6SfjP/SX+PYQ0oX1p5UELdq7lYEwagRZnKNS+No1PxHeeHxyYTs21sYb9hzchSTMx38R9zCBmdT5sr44+lDgPOYIhU+exAVnfA6kAdJG0byWYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E4fCy3NC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E4fCy3NC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DF19C113CD;
	Thu, 25 Apr 2024 02:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714011334;
	bh=dEDGmI/9kTTqq5sNWEW4/34w2kAbFrZ+3rJj3BEWKHg=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=E4fCy3NCInG1eXymw5IhWG4OgJULmwGOr84PjKdvLi+mlw7QwIhQfTQ8WCf01N+M8
	 cTw+kM6Bl9SMlCTjbi4jg6Rnb1mFCxbdVWH1QwMi2BVTzoM12RvsKDv2+FYgV41Jka
	 QqQjyylEP96hkj53b4m1j1A1k7W03DeJGL4l25SdVjWpm38UEGUCgR8YviB/1saK+k
	 CKe+e2LKS7CSn20Xc9TL5n+C4RUN/d9T+yvg42m1kuDe+qYdio9oQz7wmcTVtPtPRh
	 SXAjKfkpY3XiRNq1yW48SRwgXRKwqSmalKDkNHgL8HF7f7aERDV+MM93X26YhsJzGR
	 SyBjtenH0vOVA==
Message-ID: <30b26daf-86ae-415d-baf4-139e600ca747@kernel.org>
Date: Thu, 25 Apr 2024 10:15:30 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [f2fs-dev] [PATCH 2/3 v2] f2fs: clear writeback when compression
 failed
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20240409203411.1885121-1-jaegeuk@kernel.org>
 <20240409203411.1885121-2-jaegeuk@kernel.org> <Zh6r_yLKOnNkMedZ@google.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <Zh6r_yLKOnNkMedZ@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024/4/17 0:49, Jaegeuk Kim wrote:
> Let's stop issuing compressed writes and clear their writeback flags.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
