Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509AD28E1D;
	Fri, 22 Dec 2023 18:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EcRI8muE"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1d410fce119so3726385ad.1;
        Fri, 22 Dec 2023 10:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703269566; x=1703874366; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TQCbbwN+IZ5AZDdDw8ibn0GB1x1uSwPGN8scwOmeiUI=;
        b=EcRI8muER8E+wOIvNDRYAejsY0u+yRZRX1r1FQMJN4f4ALGS4/u6uWaDXcbTvJ+j6Z
         P/XVFsw2K5DsNzJxt9VznSKEAqKICp2l6nSWID8Q09Xxe2TK8SoBeZzFrzCS9rlLZ9Us
         8dslm++GVFZcvTars7+Hk5asp8in3mP+MjqQEFJRopm68xn5DhRRqp8zWAEeBVYwd4Qb
         tLndHDPvrQLNvTjJv67PAThiHRHB/N6Co2Q2xV9HV1Ns5BD5P196Sn0VDIDZ00G7ciex
         yBexNZmCBL+JISUwfSdxs4qgIoYjP1Uaa2j5XonyaMWWSgfj2AbSjJtLQvmfxlvNK586
         cGVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703269566; x=1703874366;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TQCbbwN+IZ5AZDdDw8ibn0GB1x1uSwPGN8scwOmeiUI=;
        b=rii4/jPa8VIcQwHn0hE8Ba1mpatNG+F6zpJ8HPucijVdu7Su4ROy5Cxpuz9gVALC69
         Rl2CmSZBoxP9KnTrnltXSn2I6DPmm3raCb0Pmf0WYLzRgMCNZJgZIcrFTgOuvpnLFY7Z
         mYJRQAV7llNwv27XlbnsWAJNLkGerDui5US7fglTqdwspdsnjoDPn5gLoFNL/gVKQrgG
         XH1rirn4j/ocIi528bVclr+I7h5CdBNZyA2yXS6Tj4OScEHQtw0cWUeq3bLuN+/LdR0T
         aGbbH33OfkMjVJF17IwsqL5Vhm43GmSHornPIQEfqbyWje77ATWnIZVQd39N0fOEdJbI
         cs4A==
X-Gm-Message-State: AOJu0Yz8tWXhlGdxmhHCQhk5RKIHQ/YlMUBJzm05qzN6B6twvanpyDua
	zL7DPsrIpjOZu6ZcS41JcuI17iRR24FIPNBjUOo=
X-Google-Smtp-Source: AGHT+IH5cXRrWZNDyUoWIRpwVuNnU+yNXTGgQDkhlNaQbX4AQ1uo+xOVVl4p+hpKuc4WJ5eJ/3Y8WCkWXh62pdtDPCM=
X-Received: by 2002:a05:6a20:a2a5:b0:18d:4821:f75d with SMTP id
 a37-20020a056a20a2a500b0018d4821f75dmr2871144pzl.4.1703269566543; Fri, 22 Dec
 2023 10:26:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231222-pinetab2-v1-0-e148a7f61bd1@mecka.net> <20231222-pinetab2-v1-2-e148a7f61bd1@mecka.net>
In-Reply-To: <20231222-pinetab2-v1-2-e148a7f61bd1@mecka.net>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 22 Dec 2023 15:25:53 -0300
Message-ID: <CAOMZO5DV9Kev8njR5ORhUM+mxSa9WxewB3xNKjEWP4zcuTZtiQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] drm/panel: Add driver for BOE TH101MB31IG002-28A panel
To: Manuel Traut <manut@mecka.net>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Sam Ravnborg <sam@ravnborg.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>, Mark Yao <markyao0591@gmail.com>, 
	Diederik de Haas <didi.debian@cknow.org>, Segfault <awarnecke002@hotmail.com>, 
	Arnaud Ferraris <aferraris@debian.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 22, 2023 at 2:32=E2=80=AFPM Manuel Traut <manut@mecka.net> wrot=
e:
>
> From: Segfault <awarnecke002@hotmail.com>
>
> The BOE TH101MB31IG002-28A panel is a WXGA panel.
> It is used in Pine64 Pinetab2 and PinetabV.
>
> Signed-off-by: Segfault <awarnecke002@hotmail.com>

Please use a real name instead...

> +MODULE_AUTHOR("Alexander Warnecke <awarnecke002@hotmail.com>");

like here.
