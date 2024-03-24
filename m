Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2BC1FD5A3;
	Sun, 24 Mar 2024 23:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711324369; cv=none; b=kt3UBAZ/zCy9LVfgtCnLEyowfpAqCEO+8pF46FrcfpRH6LWILXe0wHbZVtkIdqomXQajOVqyA4M7MPMzN4Mw1SfuoGTY+1koaE1TFsXiTcUPhP6PDAcSdQXoUU8S/lzviPvvuVzOuw/wTGZunkKcAIOzwOvjifdokd/I4PgoY4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711324369; c=relaxed/simple;
	bh=VFG8uoOm1/L9ANDqRLELcegRMZpFjjikqvQRLkeqTg8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ArURvk+7El4BOFRm2YUYpNwuHsN7QL1hwFIYStQe2X3jZjKWj3YY5S07he8pPuQ/n3DEk2tDb3R15qdxGD7phzMY3YAsAXKW+f3vv4VNU1qUSLHDAtMgXMz+slRZHr2RGxTQl9btC3BTBF5SMztijwbI/wrNy7BWX6v21x4M8XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LyZNPJET; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LyZNPJET"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF2E3C43394;
	Sun, 24 Mar 2024 23:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711324368;
	bh=VFG8uoOm1/L9ANDqRLELcegRMZpFjjikqvQRLkeqTg8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LyZNPJETD/nxXVi/uyprZYVdJqoXt7gWxiVIOUaS+VIhhg/qf3yjozBpuM6Q6Y1G3
	 n2EiaQU4v5iWEjJMV7peIuQbyunvmvHJW17vwKlyFukPnWpZQ9Mvk+jcW/y7Mbwiv5
	 GQuDwSZnBogUy6xU8D77t5QdFuVVfDOlQTfALd9vBUbpaCYktxZscu4Xv5SnCiVzr2
	 ysCqpymSAA8/tCUi/rB48XsyY+lpqYkCH0pO/bWzOnvBiCLhUtgJ6I0tOcVu8zCRoQ
	 pZwDowVwwCoYN5gjjsSNvmu8lQGNBm+neP6u0rSTkM3aWU+tISHLDPnpdRKpmnejAM
	 imBETBmYxoJXQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 4.19 135/148] serial: max310x: fix syntax error in IRQ error message
Date: Sun, 24 Mar 2024 19:49:59 -0400
Message-ID: <20240324235012.1356413-136-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240324235012.1356413-1-sashal@kernel.org>
References: <20240324235012.1356413-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Hugo Villeneuve <hvilleneuve@dimonoff.com>

[ Upstream commit 8ede8c6f474255b2213cccd7997b993272a8e2f9 ]

Replace g with q.

Helpful when grepping thru source code or logs for
"request" keyword.

Fixes: f65444187a66 ("serial: New serial driver MAX310X")
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
Link: https://lore.kernel.org/r/20240118152213.2644269-6-hugo@hugovil.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/tty/serial/max310x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/max310x.c b/drivers/tty/serial/max310x.c
index e68dbd13110ba..1c8fd06befec4 100644
--- a/drivers/tty/serial/max310x.c
+++ b/drivers/tty/serial/max310x.c
@@ -1363,7 +1363,7 @@ static int max310x_probe(struct device *dev, struct max310x_devtype *devtype,
 	if (!ret)
 		return 0;
 
-	dev_err(dev, "Unable to reguest IRQ %i\n", irq);
+	dev_err(dev, "Unable to request IRQ %i\n", irq);
 
 out_uart:
 	for (i = 0; i < devtype->nr; i++) {
-- 
2.43.0

