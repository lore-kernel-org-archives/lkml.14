Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AB2179BA;
	Sat, 13 Jan 2024 01:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BGrHwdqI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 364BEC433F1;
	Sat, 13 Jan 2024 01:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705111139;
	bh=1/fdUFMqvCxYDq6WTz8LAoln0m8+QIMdTbrKg4fXz0k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BGrHwdqICUa1aUkXIXbHZrGXDxnIciOlTSCg25rwulpjFpjGIp2WpjW6ucyEhov9l
	 kDYAmjZc3aKmkQvlU5avD0sB8+8R0cloI+vnMuvpptXEjyE1En/eRcCDb3hGyQ9Rsi
	 81WH/EaFkgJMOhRc4UJs6uOKMEFEJSgDbUPeP1yCABEbnCvRWcJZdXSjqklCJgF+43
	 nMrp7u/mJQeCFIz1ThIn1IE7ttk6kkV/ah/9dNWST9+PSwqZRL+PhWSSMRw6px3qpN
	 sZMeprh84xPchDbxge8/HyJLKqOF9ZiJtyTBwy3Wg6tBx0PcExdpxdP/kUcsRRDnCP
	 zPbS6UUQ3rFKQ==
Date: Fri, 12 Jan 2024 19:58:57 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Mark Brown <broonie@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] docs: dt: submitting-patches: drop outdated points
 to TXT format
Message-ID: <170511113559.3834612.12879682896505999178.robh@kernel.org>
References: <20240108083750.16350-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240108083750.16350-1-krzysztof.kozlowski@linaro.org>


On Mon, 08 Jan 2024 09:37:49 +0100, Krzysztof Kozlowski wrote:
> New bindings in TXT format are not accepted and DT schema format expects
> all compatibles to be explicitly defined, thus guidance about "wildcard
> <chip>" is not correct anymore.  Drop that paragraph and update one more
> place which still mentions TXT files.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  .../devicetree/bindings/submitting-patches.rst | 18 ++++--------------
>  1 file changed, 4 insertions(+), 14 deletions(-)
> 

Applied, thanks!

