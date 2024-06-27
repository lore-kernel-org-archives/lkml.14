Received: from mail-40138.protonmail.ch (mail-40138.protonmail.ch [185.70.40.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71FA33C9
	for <linux-kernel@vger.kernel.org>; Thu, 27 Jun 2024 19:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719516645; cv=none; b=Oyg4ZoPVpfwbyH/J9NubgLvI7rdQxeWrgPthqo2E8MqoOSwMFcWlQsrinauoFpMxUXE/ChjbHA+7J4RJi9ptcLtQEVSLPvJ38/QA0N+yUkZFnhWnzBgAZRn0LEJDe3tv4jyq1BtkkPp1FsOOeebPpSxFYulcyZ71Zr0psgOyju4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719516645; c=relaxed/simple;
	bh=jdGZZuUjU6IKdN0QMbYKEeaNSzN3j5RR+CNHFENctXg=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ff1PZOKCwpjS5TlhdbcA9WHDGgoD/FMbBwFX93W8hG3kJkclsThGy+G9XOL6rI6Zq2ZreJiGT9sHbGVtykWwey+oXgVqw9YiqF1kboQSoIIRyfgkr+t0cRfGNvZ4xr9Q94PdLfQtjmzXEFIxqjm6Mndx6CxlAahCyHmkgn0rANo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=Ir1xUpDt; arc=none smtp.client-ip=185.70.40.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="Ir1xUpDt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1719516636; x=1719775836;
	bh=RU8R7UnTgn6eP1AZKbglvITXdxEQ2SMjUq+6xyiXaQs=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Ir1xUpDtQL7CxvRvCG1Owj2g79oEAUR18FcZ6bqaPgB2n7M8VxgekDU2xl/mmkAy5
	 44aaauqztYdNqQXJ357N0sPd+AomUWvljKmKhJ60nmlAyly4cSjK4AH1DUy91QAcrC
	 9SOdGYpkTdilQMMZ5hiphJg7HtqxtZx7czy3Db0ZNbCxx5icUv/AYCLI3xfFSTn1xV
	 rp97KmWW9fE8vGpoap6pY4vX3QWXSZKECWqEeuK4xLjukQAWPNTS7bxrhuQpoo4YPt
	 plGjcNZBYerNsYjr9yw4SSlGxZvpNQpMaQAOQBCqCbv8Ww9H6pQ/r19oTfxLR9lqQn
	 TCBUb++pzOx7A==
Date: Thu, 27 Jun 2024 19:30:30 +0000
To: linux-kernel@vger.kernel.org
From: Raymond Hackley <raymondhackley@protonmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH v2 0/2] ARM: dts: qcom-msm8226-samsung-ms013g: Add initial device tree
Message-ID: <20240627193013.1800-1-raymondhackley@protonmail.com>
Feedback-ID: 49437091:user:proton
X-Pm-Message-ID: bb4aba257863566582ee4be550506691c60cfa84
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Samsung Galaxy Grand 2 is a phone based on MSM8226. It's similar to the
other Samsung devices based on MSM8226 with only a few minor differences.

The device trees contain initial support with:
 - GPIO keys
 - Regulator haptic
 - SDHCI (internal and external storage)
 - UART (on USB connector via the TI TSU6721 MUIC)
 - Regulators
 - Touchscreen
 - Accelerometer

---
v2: Adjust l3, l15, l22 and l27 regulator voltages. Sort nodes.
    Set regulator-allow-set-load for vqmmc supplies.


