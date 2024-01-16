Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543EA13540D;
	Tue, 16 Jan 2024 19:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705434769; cv=none; b=Rvm3jGini79EU7Ky9HsK9DkD0pubz05+HTxgm8xzIK64rvaWqMD/g1lURGtq/rc7yGcgSfS3r4kIm2ztZapURXe4B5K+KmB5r2egGDbEXKjluwQQmfSYxq1D/ZfTEWyKHGmQhRwrT9Wl4GDguda+rwJDCZphc8MwTTaiuCzt4Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705434769; c=relaxed/simple;
	bh=igwQ8TV2mQvIAUVH8VnNjV0M7RH3HutkarYq2gKU5qo=;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To; b=sHdIO0UYJSsxzhbGXWANwaMMlBCeM4uHLFgGpqEw8z73ih5ICaMPYZOl7/CEFrL+WXcSo4RxJ0SYvj6zO5obu6lqYZ8MNYN1SC2KBmYPn8eJq/TlYcbQtCeXJoKFRVnPzUF+prlXw+xvOWXE8ZrkRXosEDYvUoGg+qho+q0/rNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MPrQ4RJ5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MPrQ4RJ5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B710BC433F1;
	Tue, 16 Jan 2024 19:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705434768;
	bh=igwQ8TV2mQvIAUVH8VnNjV0M7RH3HutkarYq2gKU5qo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MPrQ4RJ5J3UtRJ48Jr1q16AF0yP925Y0IOjaQDX7IC1z6m7nXyVK+1Bncqfb6PKgY
	 RVvuGVlSqX5qGdSEebmpT9GSaVLmLxJuigP6LKThPGulhMtrtQ9oYGgvUZ4kz/IhiH
	 PETQ8FViaMkNgAr3SzPSICSgX+EPqNJPgoQ7ilMDn+wQxJZ9hdBhJE4YY5Den9R+y7
	 D/EJFq9NyxzcoI7GVRVk9McUaBBgxuo3aDK9yVufb8TigJuzwWtm4TS8gHeWvoXE/h
	 /6o/WlCV6nE7pzb4wFMRANxe2qApDud+AX0DYFj7HJ7iRtEeDS8TRKRGJ9XpMwsH8Y
	 rzduDhxOwNJIg==
Date: Tue, 16 Jan 2024 13:52:46 -0600
From: Rob Herring <robh@kernel.org>
To: Tim Lunn <tim@feathertop.org>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Chris Zhong <zyw@rock-chips.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Lee Jones <lee@kernel.org>, Zhang Qing <zhangqing@rock-chips.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] dt-bindings: rockchip: Add support for rk809
 audio codec
Message-ID: <20240116195246.GA306579-robh@kernel.org>
References: <20240116132102.3272682-1-tim@feathertop.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240116132102.3272682-1-tim@feathertop.org>

On Wed, Jan 17, 2024 at 12:20:59AM +1100, Tim Lunn wrote:
> Rockchip RK809 shares the same audio codec as the rk817 mfd, it is also
> using the same rk817_codec driver. However it is missing from the
> bindings.
> 
> This series documents the audio codec properties in rockchip,rk809.yaml
> bindings and updates example.
> 
> Changes in v2:
> - Fix vcc-supply warning detected by dt_binding bot
> - Fix missing include and pinctrl for codec example

I just reviewed v1. Please apply those comments. And wait a bit between 
sending new versions.

Rob
