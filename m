Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E25024A09
	for <linux-kernel@vger.kernel.org>; Fri, 22 Dec 2023 16:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="Ibm0y4rV"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1703262659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YFHH50hCCyLNIdU/YT5+WZzO0ybiRxLRVhJ6sMUejcE=;
	b=Ibm0y4rVXPlNtN8Sr0N3hgBvaIUKOeikwqIn2f6Z0qNc6GnBl4PMOViFTGk55d3AG60s7G
	fjpjUQ9SvH3F1was7QAUuxnO2RBndQTpE0pNKVS/5kGz2KGSi9XGuizRQJtWtKJMdA469d
	HpX0nlfNdd1mPH7lpEpfMiytS/nblr4ogIneVrlblWWmfUDEmk6B1qThobBrnoH3H6+tJT
	8BT00+Og8/uFhcMCexYA42tQm5fZXoxkq8JJAc5KPJdimQz2lPGy9xsGOzOs2n+06ENqgA
	aMQ41nmU6vdeJkm9ilXoGQ9V5PbsmGRamL+Cu0SuXN02GILeUZYk+b19XmzCqQ==
From: Diederik de Haas <didi.debian@cknow.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Sandy Huang <hjc@rock-chips.com>, Mark Yao <markyao0591@gmail.com>,
 Segfault <awarnecke002@hotmail.com>, Arnaud Ferraris <aferraris@debian.org>,
 Manuel Traut <manut@mecka.net>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Manuel Traut <manut@mecka.net>
Subject:
 Re: [PATCH 1/6] dt-bindings: display: panel: Add BOE TH101MB31IG002-28A panel
Date: Fri, 22 Dec 2023 17:30:45 +0100
Message-ID: <2093114.Y6Bb1VsB30@bagend>
Organization: Connecting Knowledge
In-Reply-To: <20231222-pinetab2-v1-1-e148a7f61bd1@mecka.net>
References:
 <20231222-pinetab2-v1-0-e148a7f61bd1@mecka.net>
 <20231222-pinetab2-v1-1-e148a7f61bd1@mecka.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2385407.UgvIaav1Zi";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-Migadu-Flow: FLOW_OUT

--nextPart2385407.UgvIaav1Zi
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Diederik de Haas <didi.debian@cknow.org>
Date: Fri, 22 Dec 2023 17:30:45 +0100
Message-ID: <2093114.Y6Bb1VsB30@bagend>
Organization: Connecting Knowledge
In-Reply-To: <20231222-pinetab2-v1-1-e148a7f61bd1@mecka.net>
MIME-Version: 1.0

On Friday, 22 December 2023 12:05:41 CET Manuel Traut wrote:
> +title: BOE TH101MB31IG002-28A Pine64 Pinetab2 DSI Display Panel

s/Pine64 Pinetab2 // ?

It is used by the PT2 but I assume it's a 'standalone' panel?
--nextPart2385407.UgvIaav1Zi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZYW5tQAKCRDXblvOeH7b
bpSBAP9kwBO9FNQcfUOEoOnOmZkf72v8PYZgnmH11XJJpo3BMwD8CYhreYnW4Qbx
cjIf48g7u1jSU1RBntQ2ZLGWwocsLAk=
=0mEu
-----END PGP SIGNATURE-----

--nextPart2385407.UgvIaav1Zi--



