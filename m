Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DA91ED0F5;
	Sun, 24 Mar 2024 23:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711321700; cv=none; b=n8f7hdYU5auASGv2o9FaFJtvhIvOlE/NPCG6tSS3JnRIp7mHzoKHNfJxNRfbt5Ep0mLe7qWas2FzwR5fq73Fiejt/PbA7r4Zs7IpSxXj/nNGsCM3xJTH3rMvtKdq2ObR/GlQph8Ngf4BwlMKWps2G4MjNGAzE1X/ihNEMqmTyiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711321700; c=relaxed/simple;
	bh=V06scgS1OL5j87Bb4ImsfPEdg8hpSPF5wgYAKzHQyXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aJztWYKjqd4Nqu0z/dB2u/WG+IR/a4a4bQVKw4ruaftnLgscX1tKbPpsreJSY7dSKvNyW07BNvbUXVfznEZx/9Y3C+atnwiBilWhlvqJdEU53f5HnJes9RMnJftc8zBeBSZxhqYDNDFYHtXFFdxhu3K5RzhpbXrHmOH+EAEuku4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JPeyujI4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JPeyujI4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29EE3C433C7;
	Sun, 24 Mar 2024 23:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711321698;
	bh=V06scgS1OL5j87Bb4ImsfPEdg8hpSPF5wgYAKzHQyXc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JPeyujI4AqNEqOiXDG+UCoUSvH7xd8xX4QouN0g7TcjuQ2tFO8SXG8VC9CMBT52Ng
	 28cLlTTRDhH8NlLSs8Kgd0tr2+RyizxB0xKatfQ06i0FkC/5xFLI5Ie1hMJ/t3HRke
	 wrGAzvagFWVBkSlG28MSuZKe8/yM+Bi4prmR0038gAU6SHlNccZLftWy0nTXRawC8E
	 /QP2nV/A7lREmeeWu1PSg1kF2yJN+TCB7d8D2dail+V6gGxIJGYrXqCzpkGXaQTL2C
	 IdPmI0e9SxDv9dYbFu6UlnMPSzmcggDc5eS9JdVwHdTwQoP/c7y6RcOIlTZcD+NM4j
	 pYR8JbF5WaJww==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Douglas Anderson <dianders@chromium.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 6.6 427/638] drm/panel: boe-tv101wum-nl6: make use of prepare_prev_first
Date: Sun, 24 Mar 2024 18:57:44 -0400
Message-ID: <20240324230116.1348576-428-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240324230116.1348576-1-sashal@kernel.org>
References: <20240324230116.1348576-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Douglas Anderson <dianders@chromium.org>

[ Upstream commit 42a7a16bedc991190310a02dd202e29cfac52525 ]

The panel on sc7180-trogdor-wormdingler and
sc7180-trogdor-quackingstick hasn't been coming up since commit
9e15123eca79 ("drm/msm/dsi: Stop unconditionally powering up DSI hosts
at modeset"). Let's add "prepare_prev_first" as has been done for many
other DSI panels.

Fixes: 9e15123eca79 ("drm/msm/dsi: Stop unconditionally powering up DSI hosts at modeset")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Link: https://lore.kernel.org/r/20240216123111.1.I71c103720909790e1ec5a3f5bd96b18ab7b596fa@changeid
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20240216123111.1.I71c103720909790e1ec5a3f5bd96b18ab7b596fa@changeid
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index 29e63cdfb8954..7990c519a56b1 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -2239,6 +2239,8 @@ static int boe_panel_add(struct boe_panel *boe)
 
 	gpiod_set_value(boe->enable_gpio, 0);
 
+	boe->base.prepare_prev_first = true;
+
 	drm_panel_init(&boe->base, dev, &boe_panel_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
 	err = of_drm_get_panel_orientation(dev->of_node, &boe->orientation);
-- 
2.43.0

