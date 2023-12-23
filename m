Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87AD12E63;
	Sat, 23 Dec 2023 18:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aagLGRuP"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5e7db780574so30282027b3.1;
        Sat, 23 Dec 2023 10:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703357928; x=1703962728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IUj8sWVqfVf7l8aOcrRWbZFkCpNTF4lfAPCLY3WuWLM=;
        b=aagLGRuPTTebgeQOY4NtEib7WDNcN1b3Rib41033vVPFir/L+/XKSVyoL8YfN45FKm
         /Yyh74S7wGybvXEwSnlcIDqhRVIX+nVPMY1bxxy2a6GCV9Z/2Of/7Bu3oa6KcCu970Zx
         tmpfOPjNHgvaRtd6kpLqnGyNOsAUwpRx8gdZGRqWjyJWPlw60/zpRPp2W9H2FftPobkX
         eyEQLdacvdhuRihLFUKI0xp7n02Cq+LeLJNd4WK2Ga8JR/SuT+yggdxgDz2GnhphfbDu
         nSK5z3gqUTm2gI0xfsxq2nqxcBasraJAhpq4+prvzX3ORRiU9r28NB2hkxI7GCnWOdI4
         wnWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703357928; x=1703962728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IUj8sWVqfVf7l8aOcrRWbZFkCpNTF4lfAPCLY3WuWLM=;
        b=Dt6/XdEN68gvmiBmTX6ls8MDbkvCN1SNK10UHOZd6yhvL0rygsbGBqqNb68TfMEDND
         pVSykZn7wOsiQsTyYfTGHExBbUnco5JTS1cYJ3/5/Zsra4Vq18kPnkLFrHG6TAOl4SMf
         UlIz1ETp3mmSR4ReJgEIat0hU46+lfepn1VAFqWYejCCEDxmyA+3CE8MA8ysa+zoeiA6
         u/OlzehYjYUpOr4DFUH0cPby7ehehfuX7NcuBxUSeXNV4pG9a77waijsTXOI6k0Uhycd
         GfW1hRJTPlIzkwCxPvj3GBBr4NQxDPo/MYYk5W2PxWOsjzxSYlnna5om+LNcEuE33LGB
         YdWA==
X-Gm-Message-State: AOJu0YzuExVcTbm6rgnVXCTB0j69pDxtDRgVwwMB4/BOefRv/plXLYA6
	bqXsH2miDTTXG2iNpntc5YN04rYzHsaZ8A==
X-Google-Smtp-Source: AGHT+IEknjk+9HKb0ljqXJeIycLHQGRcHLH8GJUKdaoHAMTN07Km/ZO7YkiPyetWBowghb3intHhEw==
X-Received: by 2002:a0d:dfd0:0:b0:5e8:5a63:f1e7 with SMTP id i199-20020a0ddfd0000000b005e85a63f1e7mr2362810ywe.27.1703357928593;
        Sat, 23 Dec 2023 10:58:48 -0800 (PST)
Received: from localhost.localdomain (024-171-058-032.res.spectrum.com. [24.171.58.32])
        by smtp.gmail.com with ESMTPSA id x10-20020a81b04a000000b005e96907ab19sm2571839ywk.64.2023.12.23.10.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Dec 2023 10:58:48 -0800 (PST)
From: Matthew Cassell <mcassell411@gmail.com>
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	trivial@kernel.org,
	linux-kernel@vger.kernel.org,
	mcassell411@gmail.com
Subject: [PATCH] Documentation/trace: Fixed typos in the ftrace FLAGS section
Date: Sat, 23 Dec 2023 18:58:45 +0000
Message-Id: <20231223185845.2326-1-mcassell411@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed typos in the FTRACE_OPS_FL_RECURSION flag description.

Signed-off-by: Matthew Cassell <mcassell411@gmail.com>
---
 Documentation/trace/ftrace-uses.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/trace/ftrace-uses.rst b/Documentation/trace/ftrace-uses.rst
index f7d98ae5b885..e198854ace79 100644
--- a/Documentation/trace/ftrace-uses.rst
+++ b/Documentation/trace/ftrace-uses.rst
@@ -182,7 +182,7 @@ FTRACE_OPS_FL_SAVE_REGS_IF_SUPPORTED
 
 FTRACE_OPS_FL_RECURSION
 	By default, it is expected that the callback can handle recursion.
-	But if the callback is not that worried about overehead, then
+	But if the callback is not that worried about overhead, then
 	setting this bit will add the recursion protection around the
 	callback by calling a helper function that will do the recursion
 	protection and only call the callback if it did not recurse.
@@ -190,7 +190,7 @@ FTRACE_OPS_FL_RECURSION
 	Note, if this flag is not set, and recursion does occur, it could
 	cause the system to crash, and possibly reboot via a triple fault.
 
-	Not, if this flag is set, then the callback will always be called
+	Note, if this flag is set, then the callback will always be called
 	with preemption disabled. If it is not set, then it is possible
 	(but not guaranteed) that the callback will be called in
 	preemptable context.
-- 
2.34.1

