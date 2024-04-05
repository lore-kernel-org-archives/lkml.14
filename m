Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CDE16C858
	for <linux-kernel@vger.kernel.org>; Fri,  5 Apr 2024 17:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712337149; cv=none; b=UFt21q64xej/qJz3IF2HaklXLhGEPEVCjpxQYYe3eLf6CuxecjUa7EB5WzYpwmL3UAYFi2jEp3dYDCC9T6/ZUE0hvnPAp13WNGZIEEt6QFhttIRatgo+3BuKxQoXl+A0lZFUecY5CMPhZgYmTPqDLOGbnx8G+TBwt/d/XAcMg9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712337149; c=relaxed/simple;
	bh=3z/qCjdop9Fwcqr8n8ZoRrhGKLrScjJDNfw8sY1F+YE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U2Jroov/Yms/o9JdSmFtHKbt3/VzVBDTOl+mZBB5hbmxdZytAXlkfzkPWNFD6oszbe4NMJPU340rDY+pY/qhyhNSh8/IrGnEpGTqODhYqWqMLmGmLHEAb0VUcadIbj6iyq7nusHOUK8Xno91uA11Vf19C4V1J8BbC+R+JISohfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB751C433F1;
	Fri,  5 Apr 2024 17:12:24 +0000 (UTC)
Date: Fri, 5 Apr 2024 18:12:22 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Gavin Shan <gshan@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	will@kernel.org, akpm@linux-foundation.org, maz@kernel.org,
	oliver.upton@linux.dev, ryan.roberts@arm.com, apopple@nvidia.com,
	rananta@google.com, mark.rutland@arm.com, v-songbaohua@oppo.com,
	yangyicong@hisilicon.com, shahuang@redhat.com, yihyu@redhat.com,
	shan.gavin@gmail.com
Subject: Re: [PATCH v3 3/3] arm64: tlb: Allow range operation for
 MAX_TLBI_RANGE_PAGES
Message-ID: <ZhAw9srTzZItAlp1@arm.com>
References: <20240405035852.1532010-1-gshan@redhat.com>
 <20240405035852.1532010-4-gshan@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240405035852.1532010-4-gshan@redhat.com>

On Fri, Apr 05, 2024 at 01:58:52PM +1000, Gavin Shan wrote:
> MAX_TLBI_RANGE_PAGES pages is covered by SCALE#3 and NUM#31 and it's
> supported now. Allow TLBI RANGE operation when the number of pages is
> equal to MAX_TLBI_RANGE_PAGES in __flush_tlb_range_nosync().
> 
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Gavin Shan <gshan@redhat.com>

Verified this case as well, so:

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
