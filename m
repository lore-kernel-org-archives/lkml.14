Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157A663CD;
	Thu, 28 Dec 2023 10:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="btPA8EHQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68C75C433C7;
	Thu, 28 Dec 2023 10:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703759767;
	bh=mvxOzryFUJYG+VAWBGem3xdZ4uAeuRSgHvJF8WeD0+o=;
	h=Date:From:To:Subject:From;
	b=btPA8EHQEbELEh5ovAVGEfREwJVJBl2uLuyb/zqh+90HKfuRICTLbBB6wos6eX70W
	 kE8clig5X0wTK/wCpasG3vgZZtM9q838S5RuHbpvC01wNgksrlK2ygdFRctjqqIWiG
	 N1y1Ql8XWpgSQL5VTmhMM0q5OX5AK3dEG3B3714n2VPvvVWUpT2XyfcgopYx5Aw2HY
	 NM15QoyqMwuH9T/YHZn9nLV4m1pjUeN95eGOC9jkPrUVqOo0JZM4IggZnXkfGJoiVr
	 cc/X2accfmdiyk8Altr3njBiCv6OGm47wdoI+hZLMHDAcPNVMHdfYD6o20jfOomQfL
	 HQj5RD7szEacQ==
Date: Thu, 28 Dec 2023 11:36:03 +0100
From: Helge Deller <deller@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org
Subject: [PATCH] linux/export: Ensure natural alignment of kcrctab array
Message-ID: <ZY1Pk61PP5HvLDag@p100>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The ___kcrctab section holds an array of 32-bit CRC values.
Add a .balign 4 to tell the linker the correct memory alignment.

Signed-off-by: Helge Deller <deller@gmx.de>
Fixes: f3304ecd7f06 ("linux/export: use inline assembler to populate symbol CRCs")
Link: https://lore.kernel.org/r/CAK7LNAT5gyn0C9EJhh1EeFT7gF0rOudWcdqAVN=+C4jR42W90w@mail.gmail.com/

diff --git a/include/linux/export-internal.h b/include/linux/export-internal.h
index 69501e0ec239..51b8cf3f60ef 100644
--- a/include/linux/export-internal.h
+++ b/include/linux/export-internal.h
@@ -61,6 +61,7 @@
 
 #define SYMBOL_CRC(sym, crc, sec)   \
 	asm(".section \"___kcrctab" sec "+" #sym "\",\"a\""	"\n" \
+	    ".balign 4"						"\n" \
 	    "__crc_" #sym ":"					"\n" \
 	    ".long " #crc					"\n" \
 	    ".previous"						"\n")
