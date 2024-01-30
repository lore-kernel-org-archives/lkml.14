Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0537EEFE;
	Tue, 30 Jan 2024 23:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706655620; cv=none; b=nIJ87WCfiKOiyLUVFUqq33IQmQjLeTk3XfxC8bOVqKpra0tPchGaOHqNlLQim4+VqQq1dfJgjBXcoI9TZw6fcf1S9RKlelU2KfAqiJU/hk9JWdsLLtaa6AuxbAdteE1VVxtS7RYpZ66XijGP74r7Ay7Qc8DagoxW6Ru5SpS3R+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706655620; c=relaxed/simple;
	bh=SRp2QhaE8on2XaoCyowQ38M3H5KYB1hkQPVd3UamK+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sFGkQnaTSeudo5mqERpLqEKrG76Raz4BUPl3hZMgcDSotoSLI1RIG7HX/pJ4+3N9HyThWEDkwGZNF4TTXpDnEv6HxWKPKPTym6IEMTcHHjyJ2k9/SCa7WH13gTdOufMK5AVXEguy07KvadS4a1crp8f//f3jHPd3/qycjmbP/hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qMXR+ZX0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qMXR+ZX0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00FD6C433F1;
	Tue, 30 Jan 2024 23:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706655620;
	bh=SRp2QhaE8on2XaoCyowQ38M3H5KYB1hkQPVd3UamK+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qMXR+ZX0tD5ef1wxtXFwrUJAurXEDgYXnZ83TqywafSRnoPNXRygiPEXziixp1Lht
	 lpdyAgumsDb9mQZc3Y8AohdddD++6V+JPobFmYKYgFJDVqcIyqtLATx40K6nFOX4QE
	 heW9WceZsILUAtYrswnl0fOCNC8rc+ddPJ4OcqzdqazoJECJkMOQzE9pzKcot1WCIY
	 7+jLnAvx76bJp5GvIt6pHCGJzDs8vIziYkpL4SnClMVUh/UN/FJ6e7jCZpVjbyPhT8
	 xouIcgVJjdY1wtXrlrpg2dnPCsBSwZ/dGbVvbY3Mji6hPcII9Fk+JfSnx685Fs7BbG
	 h9mT+IhNUI6HA==
Date: Tue, 30 Jan 2024 18:00:18 -0500
From: Sasha Levin <sashal@kernel.org>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
	Jani Nikula <jani.nikula@intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
	airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH AUTOSEL 6.1 04/53] drm: Fix color LUT rounding
Message-ID: <Zbl_gq9FhTICi4FS@sashalap>
References: <20240122150949.994249-1-sashal@kernel.org>
 <20240122150949.994249-4-sashal@kernel.org>
 <Za6ano6dg0Mau7OI@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Za6ano6dg0Mau7OI@intel.com>

On Mon, Jan 22, 2024 at 06:50:00PM +0200, Ville Syrjälä wrote:
>On Mon, Jan 22, 2024 at 10:08:05AM -0500, Sasha Levin wrote:
>> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>>
>> [ Upstream commit c6fbb6bca10838485b820e8a26c23996f77ce580 ]
>
>Why is this being backported?

Is this not a fix for an issue?

-- 
Thanks,
Sasha
