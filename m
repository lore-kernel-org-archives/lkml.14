Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3357B4E1A1
	for <linux-kernel@vger.kernel.org>; Tue, 26 Dec 2023 11:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="emB6NxkW"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-28c7c9b19f1so143224a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 26 Dec 2023 03:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703588741; x=1704193541; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IkCD6iZZ1N4nQk3q0fBJ3HOIS6lxjMi9Q2hMg5m+uNs=;
        b=emB6NxkWvp/x/hB0do9Sbj7MCjzglpptodlVsQPTlh73HEWvbYLTpSdpU0NfYAanM1
         G9ADjjRdixLO/x7k4FpsCd9xYwYFw5TJR3GBCXsOe6m96wH5dvTpEDl8fNCtSKBb/s/4
         ofSdvG4CA0ns1h1KoVVyCidKBGno71FSo2zfxKshEFS138ORMKmFfqdovu2krs887Gyy
         KuSfhFA3w/0VY0aHHIXvr7HG2sgBJ/Oq+4C4oHQgQNsZr9veh1lDPEo3vFJSWYdaOB3d
         hMOzCqnmcbD7VtbNsgOZU0oyxdeQYNb8yf8LAz341MdJGi54xotk7b96GMzbvBvB/y9M
         kwMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703588741; x=1704193541;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IkCD6iZZ1N4nQk3q0fBJ3HOIS6lxjMi9Q2hMg5m+uNs=;
        b=X327HmA8Zty8S4nZ0LTxqjA4ABVKOWG+DN9kn/Q74GCgxDCv1aSCfaoa8wnfzuhdry
         8rtcZU33EmjtmOGxclgZG2o4mw5xRhQKsUpYAY7/GtvEuDe31QjN4j7aCZFVKhVJgEy6
         2ZrzsDxbIBfaCTBZqey3s1hkLFmqBXshn/A55MDOfXbSqkb7DH7iG8X0ACc8cTfZsQ2t
         KXonI25p+yOlkjw6z7FZQuzQSLnZSszH5Vfnsn+Teewsu0LgQ5HrmXrDQQObNQKbETQY
         Da3Z1SvBcgklcB+OtIaHxbpAssVyx5KPM5y9Rx5S9s+2Bilw85YzPKpoSS49Eetdn9ER
         xykw==
X-Gm-Message-State: AOJu0YwS95oH4EdxqJfLJJFGZdwgUHAIu/fktWFeaeOch02/q1NVrZl7
	IMcMd7ywOk8ZpXD2ABC0RtaY/qiOybRjbw==
X-Google-Smtp-Source: AGHT+IHVs+p9J2TGobuvwbqzA1aOiLzDcrj+DAbNxfbMdxAee9+tVZ2yY8dAoBKOJssVHWwtG7afQQ==
X-Received: by 2002:a17:90a:f187:b0:28c:3d74:5b28 with SMTP id bv7-20020a17090af18700b0028c3d745b28mr729936pjb.86.1703588741382;
        Tue, 26 Dec 2023 03:05:41 -0800 (PST)
Received: from devopsvmp.mshome.net ([152.58.196.235])
        by smtp.googlemail.com with ESMTPSA id 17-20020a17090a195100b0028b1fce7c01sm15262186pjh.37.2023.12.26.03.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Dec 2023 03:05:41 -0800 (PST)
From: phanirajkiran <phanirajkiran.a@gmail.com>
To: 
Cc: phanirajkiran.a@gmail.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Prathu Baronia <prathubaronia2011@gmail.com>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Yangtao Li <frank.li@vivo.com>,
	Khadija Kamran <kamrankhadijadj@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: axis-fifo: fixes alignment should match open parenthesis
Date: Tue, 26 Dec 2023 16:34:58 +0530
Message-Id: <20231226110459.6816-1-phanirajkiran.a@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

This patch fixes the checks reported by checkpatch.pl
for alignment should match open parenthesis

Signed-off-by: phanirajkiran <phanirajkiran.a@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 727b956aa231..ab758a527261 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -381,8 +381,8 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
 		 */
 		mutex_lock(&fifo->read_lock);
 		ret = wait_event_interruptible_timeout(fifo->read_queue,
-			ioread32(fifo->base_addr + XLLF_RDFO_OFFSET),
-			read_timeout);
+						       ioread32(fifo->base_addr + XLLF_RDFO_OFFSET),
+						       read_timeout);
 
 		if (ret <= 0) {
 			if (ret == 0) {
@@ -522,9 +522,9 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 		 */
 		mutex_lock(&fifo->write_lock);
 		ret = wait_event_interruptible_timeout(fifo->write_queue,
-			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET)
-				 >= words_to_write,
-			write_timeout);
+						       ioread32(fifo->base_addr + XLLF_TDFV_OFFSET)
+								>= words_to_write,
+						       write_timeout);
 
 		if (ret <= 0) {
 			if (ret == 0) {
-- 
2.17.1

