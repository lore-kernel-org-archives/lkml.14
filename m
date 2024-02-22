Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EA91586EE;
	Thu, 22 Feb 2024 18:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.181.215.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708625940; cv=none; b=u0GJnsuUNLSW3YjT/w0QR/161Y9wSJF62BMpQzHNn4QopxfiyZ1akCMmavKhVU91vbZk8cXW+cNPBoFqkwFQ1wdk5qjixbEUzfXN3Zj7oRa+IWb+uQ46yJYFJc00fagKj+dG9HLDayVz7VfdPmtW21NIGQ/5xl1QNQfMP70LqVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708625940; c=relaxed/simple;
	bh=tVlCmtfnoRWyJBq9HUe/Vjtl8lpr2sLtXU1tQdi2rsg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jv3ou7BNTQlIGzPWSz++nelsFQtdjgDrWmwfwkpxHnneW/SdMSNNaSw+8m2z0pKPquXOYKnRVxy2B5ZtoVjykDLqEAJ+KbMZ0P4Sn9X6Y+QyJNf2Zax3373A4ZRwcLPNL7OAFy3iED8HrXI7jsCm9FisKdsu1TtAkScXDLYNZSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xff.cz; spf=pass smtp.mailfrom=xff.cz; dkim=pass (1024-bit key) header.d=xff.cz header.i=@xff.cz header.b=NYF280GF; arc=none smtp.client-ip=195.181.215.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xff.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xff.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xff.cz header.i=@xff.cz header.b="NYF280GF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
	t=1708625933; bh=tVlCmtfnoRWyJBq9HUe/Vjtl8lpr2sLtXU1tQdi2rsg=;
	h=From:To:Cc:Subject:Date:From;
	b=NYF280GFCZvSQ/yfp5TVqU9IGDB+6wYDZaUUvQBZn11o9TKa/JuS2Mnvzx107Opgm
	 xHYjTSCcZ0gXK/l/l5WyLOFKhMOt4R7lczgsfRKLIHA6CHo+FCfq6mh1waTr/Vhfhi
	 bkiT5KtmTnt6ca6gQYyRV6BWeZPLqHpYf0s4VXxs=
From: =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megi@xff.cz>
To: linux-kernel@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Ondrej Jirman <megi@xff.cz>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Arnaud Ferraris <arnaud.ferraris@collabora.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 0/4] Add support for jack detection to codec present in A64 SoC
Date: Thu, 22 Feb 2024 19:18:43 +0100
Message-ID: <20240222181851.3398254-1-megi@xff.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ondrej Jirman <megi@xff.cz>

This series adds support for jack detection to this codec. I used
and tested this on Pinephone. It works quite nicely. I tested it
against Android headset mic button resistor specification.

The patches are improved and debugged version of the original
ones from Arnaud Ferraris and Samuel Holland, imrpoved to better
handle headset button presses and with more robust plug-in/out
event debouncing.

Please take a look. :)

Thank you very much,
	Ondřej Jirman

Arnaud Ferraris (2):
  ASoC: sun50i-codec-analog: Enable jack detection on startup
  ASoC: sun8i-codec: Implement jack and accessory detection

Samuel Holland (2):
  ASoC: sun50i-codec-analog: Move suspend/resume to set_bias_level
  ASoC: sun8i-codec: Enable bus clock at STANDBY and higher bias

 sound/soc/sunxi/sun50i-codec-analog.c |  73 ++++-
 sound/soc/sunxi/sun8i-codec.c         | 388 +++++++++++++++++++++++++-
 2 files changed, 443 insertions(+), 18 deletions(-)

-- 
2.43.0

