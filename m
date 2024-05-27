Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749E015EFA4;
	Mon, 27 May 2024 13:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716816854; cv=none; b=Qhl8hCkjgmPyMKXHUJlPLmrZczspkVH7SihX2Fv+MtneiriBNm1Jtgh/MfrPe6EpuapOrIDElmYpVtZjn7RpsYNhHsyCdQaoiNfeFAs1UdRXbs7XHEYV7d+OMY/SbqfNiyEAn7jsaR16+x91Au6ay9wuEzMu8XBbSuHmDXMK+f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716816854; c=relaxed/simple;
	bh=ddU/WjpLYSNu9yC0ityDhL9cCcbVhVVXt/UYu5p8wpg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O+ABdQ63S8Tw2W12XmfkFHM4dQeLOJRInjp0qoiDjIvEnrd1OsP8qS5QsnV6T3hmIb5ZGkf2TZD28KQI7DHY4VKjazC1qsckGeIwLXbS8aMNUmrrhK5Mxi5e0c8lozgCw2sBSxcB8pkNg0gr+PTkr/+xwWCyF3PDO9XwcevdHt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lP1gV0X4; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lP1gV0X4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716816853; x=1748352853;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ddU/WjpLYSNu9yC0ityDhL9cCcbVhVVXt/UYu5p8wpg=;
  b=lP1gV0X4/Sw2HQ4Cn0GWwVEjvdAi8TtH+l9rT3MGHhAFp8snuOMuv5ed
   3Cntgpow6lBhtx7meBHUryeOQLM0z57+ig+Pl2jpIC3Ch3aT2EVoVJXyS
   ZrDXPqLvuprlSl4OnFDEQU9uAAgMbjddhPZ9b81LlHHGXbIb4WTImZyGF
   1y66LHxjOqdniJSrUYYARFICWDV8GAOZYOdhvf4wMFx/29h6Hi0HVn9GV
   +27puPqB60Hhgmjk7FeFuuSbet46Tcl8ov67dQcuomNYWV3d9JGJNfR+M
   r+BsSvXBu0zAgmZarsvZ3T73CeLegCPhoNhoaKE8cANsHkMcWFIv+IQkG
   w==;
X-CSE-ConnectionGUID: oheMYDw9RD2ual8NKdC0Cw==
X-CSE-MsgGUID: EnibVMCdQiatA1OqClvIfQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="11714370"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; 
   d="scan'208";a="11714370"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 06:34:13 -0700
X-CSE-ConnectionGUID: jsPzRdT6TrWp9u9FG9Ni6g==
X-CSE-MsgGUID: HTTf0alzQJewrSfFswf9EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; 
   d="scan'208";a="34847966"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO tkristo-desk.intel.com) ([10.245.246.180])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 06:34:10 -0700
From: Tero Kristo <tero.kristo@linux.intel.com>
To: srinivas.pandruvada@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com
Cc: linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 0/6] Intel Performance Limit Reasons support
Date: Mon, 27 May 2024 16:29:32 +0300
Message-ID: <20240527133400.483634-1-tero.kristo@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This series adds support for the Intel PLR (Performance Limit Reasons).
PLR provides status information for Intel HW performance events,
exported via debugfs within the existing TPMI hierarchy. The status bits
are sticky, and they can be cleared by writing "0" to the corresponding
debugfs files.

-Tero

