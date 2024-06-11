Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BA4155C9B;
	Tue, 11 Jun 2024 18:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718130507; cv=none; b=bjipZY1rwjBUXy3XG8x3UKIAe1hLLs7qbLXyyNfgXmxZPJqc4qPM64D/ZEamkTRLYnW01BhhQqo+oDIfkGfemHZOEgO4a7hNgWGBOX9aF5bxbwkIHzEX+tW+CC7jMl1aZ51kGse/ZbRmtvayYEP6HdOf2o9See1kUXKL/UFS3pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718130507; c=relaxed/simple;
	bh=pFaRxvBa1rx+go6y96e7lZS9Tc5FWfTPysEvklsbBTA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FAR3pjWEzLNfPYTOflXP9BHwZ3WaAwMCNZgSAJfx6pubxxhi98borjs7UXltxazCVJya0fMiKijeEqW/9zEdzPSWuDlmM/zMxwa9IR5jusveObEzf6ZApNo64sbsmWoz8+Z9cI/gGF8t3nQIxzpMHbzWCRZz5N5TXf8v8KLI3x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hFmXCG0G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hFmXCG0G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6B88C32786;
	Tue, 11 Jun 2024 18:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718130507;
	bh=pFaRxvBa1rx+go6y96e7lZS9Tc5FWfTPysEvklsbBTA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hFmXCG0GhuDjLri9HOYoN9aflew9Boz7kBHpbXQAhKZGH0RaPXTwEGS3+KbgbVWVp
	 jSpWUvhDFQXuBY93RzgYeR1XEsFiHu7xz8cGlLeeo6V63OUoiQAhbxwk01EPK6Y2he
	 Rwjaly+G9trxmyFU/+5SkQO+mP8hgFNE6VuMQXZFqyhHt6jneJDWf6PmN93MwIX5U2
	 0i1Py0IOtBaiiXwqgDvWQBMOp/s/rloMm5WPBBWsIT1iO1Eark22/K7pidL/Ck+Uvr
	 1s6ZLz6chrM3XgaOT5z55pAK53YFv7CaGulT1i5vlxExUOFdgOfZ08FLqUMSGqEAsU
	 zmA3ibXbPr+Jg==
From: Vinod Koul <vkoul@kernel.org>
To: Frank.li@nxp.com, linux@treblig.org
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240516152825.262578-1-linux@treblig.org>
References: <20240516152825.262578-1-linux@treblig.org>
Subject: Re: [PATCH v2] dmaengine: moxart-dma: remove unused struct
 'moxart_filter_data'
Message-Id: <171813050536.475662.6409306451204375031.b4-ty@kernel.org>
Date: Tue, 11 Jun 2024 23:58:25 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Thu, 16 May 2024 16:28:25 +0100, linux@treblig.org wrote:
> Remove unused struct 'moxart_filter_data'
> 
> 

Applied, thanks!

[1/1] dmaengine: moxart-dma: remove unused struct 'moxart_filter_data'
      commit: d1c6524e3ebe6bc1d0110e9dd85c84006f2c3289

Best regards,
-- 
Vinod Koul <vkoul@kernel.org>

