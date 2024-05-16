Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7796C15CD56
	for <linux-kernel@vger.kernel.org>; Thu, 16 May 2024 17:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715881517; cv=none; b=FVhWCLZqhmggbec/y0skOQ+u793srSN2uG7yVLf/7egN+bcmoEyBn5rw4AUJrRFWe1jJ1JvDRFRp+KmfoWtiK3My3ljLUuSHZbkgqs57bPbuaRlCmaNlzHv5uu6+6+4W7MWg4uU9tyNoCvuDIgpwHDDFYtSl1IRF7BSiF+ywb7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715881517; c=relaxed/simple;
	bh=dol2TAYNaHy3v5RXCjk5z/RHVtAbbNOuKkU0xUy+nzY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cMKQWLXyYUQqNl2PzzBkw3oZ77baCXffnWkSMsEdtBXrZ2IS4haZhQQWKIrYWAurCS7Rog1LnQOGsHcb1QIKoPZzyb7UyvKD0pyJzMAzkaMrKu6SZwPlBC0F5soXn4tqdqfp9VwDrvq089pFI3aoyUXivhFY1nS8Efr8z68oyoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QAZ6TclW; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QAZ6TclW"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-7e21742025aso56619139f.2
        for <linux-kernel@vger.kernel.org>; Thu, 16 May 2024 10:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715881514; x=1716486314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jl2/Ekkc0gIYxP3JBOEuP8Bqn0lwP5M2pjaV/0iFu70=;
        b=QAZ6TclWCokdpcW87i0Sy6OEuCTp0KKYO1huHTeIGQWPMLb4NdlzG8h4ffETlaVMmj
         SoWqZjlLiAbNbibGxtFNg1sxWiQ8qpJw1mRNAmI/fsVvwHxOwvb1UaqQypzATOH6RWyF
         JegB0x/AC/r41DaOHaDP+qW7swq5wqgu5McO/5cdmeesJO2mFumBzMBfHjuNVgeIx4eU
         uh/sWJcMydOSuADCcjG4szoIM6kRLo+kl9ZjYPoUjOUllwkeQ+zSmMVR45c763/DT2PO
         oNShJU9yp8CAZ4HlbZZupw2tLqpZNaJdEz1zXQQkcYukqx4/jl9xyTHslHjbGmlPUmpI
         Ilag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715881514; x=1716486314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jl2/Ekkc0gIYxP3JBOEuP8Bqn0lwP5M2pjaV/0iFu70=;
        b=aFU0r4efhmXLYNe29bXV/5Ya2DGFxLb5BKZiLv9RN6tKcb7a3gjpbppvzJjMjDc1op
         Vu+mzQQJbwHA9xCZx2bvzg5cfZa8mzWsrq2WaT/KBNHV4xx5Pk+RkviqHtxXrlfMcDK8
         bRlj3+ciN3p6tUAWJuJOB0NUbdJ3aDMZlf3A6RQUxEbEH6gDh2xPGSkJt8l2MEgeIvoH
         qGNRfdcPOQjGJFuV6GtfOa6VFLIJYluXPh2hxKks1b9hC+LITViYfUVgXsOZL829av9n
         Hc/GIRC8CMuXl/olwhcJxLs9DgKknQvCyoFlx6C4uaZku6c0oL4tKObJr+GCYM80lFWF
         MbIA==
X-Forwarded-Encrypted: i=1; AJvYcCXzhAkeG4hmxw6f+ofFW+UZcIIWBSRgX2EcnTbtuv37VOvL6CNkJRDPzOutwkUtlWBbTMyEx3yyEq+9VhRH3X7MbTgP1bxt71CTNWaT
X-Gm-Message-State: AOJu0YzS4GKC4MxsQ57fyI1RRl6umCLINIPI6KlKbIwNa/BecHRdiMVd
	Za50EdOLGCeOLL/y9L+Q072BMPIuMuWjuVaDjY2P585EE499vVDo
X-Google-Smtp-Source: AGHT+IHLWIMLTxaxiwrLGgTR5IbAiakpruN98t/nSP5zdmkwOFP7Mt62Ea/19Rla0vBDPeiZ3C9XfA==
X-Received: by 2002:a6b:7207:0:b0:7de:acfe:5b70 with SMTP id ca18e2360f4ac-7e1b51a5750mr2324516439f.2.1715881514628;
        Thu, 16 May 2024 10:45:14 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-4893715057csm4273595173.80.2024.05.16.10.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 10:45:14 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org
Cc: ukaszb@chromium.org,
	linux@rasmusvillemoes.dk,
	joe@perches.com,
	mcgrof@kernel.org,
	daniel.vetter@ffwll.ch,
	tvrtko.ursulin@linux.intel.com,
	jani.nikula@intel.com,
	ville.syrjala@linux.intel.com,
	seanpaul@chromium.org,
	robdclark@gmail.com,
	groeck@google.com,
	yanivt@google.com,
	bleung@google.com,
	Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v8-RESEND 30/33] drm: use correct ccflags-y spelling
Date: Thu, 16 May 2024 11:43:54 -0600
Message-ID: <20240516174357.26755-31-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240516174357.26755-1-jim.cromie@gmail.com>
References: <20240516174357.26755-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Incorrectly spelled CFLAGS- failed to add -DDYNAMIC_DEBUG_MODULE,
which broke builds with:

CONFIG_DRM_USE_DYNAMIC_DEBUG=y
CONFIG_DYNAMIC_DEBUG_CORE=y
CONFIG_DYNAMIC_DEBUG=n

Also add subdir-ccflags so that all drivers pick up the addition.

Fixes: 84ec67288c10 ("drm_print: wrap drm_*_dbg in dyndbg descriptor factory macro")
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 104b42df2e95..313516fc2ad5 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -3,7 +3,8 @@
 # Makefile for the drm device driver.  This driver provides support for the
 # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
 
-CFLAGS-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)	+= -DDYNAMIC_DEBUG_MODULE
+ccflags-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)		+= -DDYNAMIC_DEBUG_MODULE
+subdir-ccflags-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)	+= -DDYNAMIC_DEBUG_MODULE
 
 drm-y := \
 	drm_aperture.o \
-- 
2.45.0

