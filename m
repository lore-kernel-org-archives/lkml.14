Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC52B16D305;
	Wed, 12 Jun 2024 08:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718180265; cv=none; b=ssOMa4hh/sBmq4w6v0fXImLhkOqujnfIloFHzuQMN2G51Jw35uaraVbtn2s9H8YXH85Ta89TeoUk04GR7b/a0SOZwc/7OpweQVuhkUxWPiFkhdtxRXzancoL7g0Jh7YR1uRAOcGpLnIdKMhDl2j1VVeJpyxTzNLpAyanRu8wQ/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718180265; c=relaxed/simple;
	bh=QcEF0sKXV5ZBAmtYMHhZHVLLMVcw7FqLHJp1lyXLpYU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fYiQxNN9BxmkhSg1hUz5fsDutN3lfMd9nIhW/fbY4Qjp3n2Z6sp5GFkWh8wKNRKGNEk7w7rwXhT/Xtzo3w1l/O8nFSH1Z4QpVJwgAG0LRG0JfkfbOMdLP0pj617Uxe1Ctm5Jtm6k56+ij9NTAqo4GxhC35j3pa+b3NTkky03z/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GVXVRZJi; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GVXVRZJi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718180264; x=1749716264;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=QcEF0sKXV5ZBAmtYMHhZHVLLMVcw7FqLHJp1lyXLpYU=;
  b=GVXVRZJitGHNM1YKbMyEHjNRGq9BmhDY/So6ZzrZwIjxRDkEIWIQypTQ
   uu49ooE+VzE1TFjzYkhgC6o3HHVwvsn1OjYwonLBzu9Rw1ZTvQcgEapdP
   YKIAdNhZSES40WszjWH2O8Qb6t0SVBdD8GHhB9l2Yc+3lwpmtRNwBcuzs
   9xVxYNvJ8G3+DAgbkSNXBsN6NED46ZZV9xy6Cd1AOvefa3itztJ955awi
   QKn7JJoo8h+UBQUxUAAtKJuAeE6HnBB2hngLYcgwPWzmRLns9gOGRiJiv
   7Qh1kEy/piba6hOGprKcz6/QSlC5vllJ3JTnNyQXM5BdzdYbcuYxWdNk3
   Q==;
X-CSE-ConnectionGUID: 6m8Y3mZ1QaONDQ+WXfVgMQ==
X-CSE-MsgGUID: pHJ2QoMfTHu6mYZNGf5RhA==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="40337111"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; 
   d="scan'208";a="40337111"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 01:17:43 -0700
X-CSE-ConnectionGUID: WyntrCBfRuKPHpdPJp1Kdg==
X-CSE-MsgGUID: ApWrOod5RFCqLD/zMVAtzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; 
   d="scan'208";a="40180479"
Received: from unknown (HELO localhost) ([10.245.247.204])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 01:17:40 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Tony Luck <tony.luck@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, 
 platform-driver-x86@vger.kernel.org, x86@kernel.org, 
 linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
 Jithu Joseph <jithu.joseph@intel.com>, 
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20240611171455.352536-1-tony.luck@intel.com>
References: <20240611171455.352536-1-tony.luck@intel.com>
Subject: Re: [PATCH v6 04/49 RESEND] platform/x86/intel/ifs: Switch to new
 Intel CPU model defines
Message-Id: <171818025089.1855.17784413167917645490.b4-ty@linux.intel.com>
Date: Wed, 12 Jun 2024 11:17:30 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Tue, 11 Jun 2024 10:14:55 -0700, Tony Luck wrote:

> New CPU #defines encode vendor and family as well as model.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo branch. Note it will show up in the public
platform-drivers-x86/review-ilpo branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[04/49] platform/x86/intel/ifs: Switch to new Intel CPU model defines
        commit: 490d573b5a8579178beb648a69a2cbab91495a7b

--
 i.

