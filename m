Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778EF6DD13;
	Tue, 30 Jan 2024 15:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706628950; cv=none; b=b39mpu2pUNeYZNlh+/SRS2FrdimjrwLBsy2AnXnrzij4PC8z5C0Uf93rpuNs0utzsYmYUksOdW3R0Bkp9ekWkQMDSG26G34I3wKImdUJhmkwobHJmPTmMKVi6OtFLA683wwkyyNbegSohIm+sjU4WN+kL2kLSZXyYfclimpKSGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706628950; c=relaxed/simple;
	bh=i/gOiEzQMpG9nyDnUPfqoV+1c+gEbN2MOXoa3MzHpWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ccstxwC6qSJ+TB5kFt126AJuWYGTkN/hFfvh8PVfT8bXPS3gIWA5/6agVP/ZmZybIcN+eyfB2o6VVsISmUUmBBVvs7iy7Jx5JjFJdw64u4aaYzGiP2wCSZVcEADBx8uWIlNdLYU1q9f3I7Pm1RVHz/Qxe+tRkIan/heaMka47QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CwA0oG1e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CwA0oG1e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8D26C433C7;
	Tue, 30 Jan 2024 15:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706628949;
	bh=i/gOiEzQMpG9nyDnUPfqoV+1c+gEbN2MOXoa3MzHpWw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CwA0oG1ezBKXcVKP5hB4Ezu/h8VqMQxyqZXxgaXfazRMz084ozgS7FcRHAWauygh5
	 ETucmXpJopkQedX4wZIjVNymzGczPrGPbXTCh3nprA3Q8sAp78T7WzQXFe4rMkJ4ph
	 vTA04sClKN8olT9YSE25odGbHiPcpM17mVmKtuKr8K+LyoWqkTk1ACglmr6vnWJy52
	 XlVhQzqXR4LWkpa+3ACw+vjaVi5birVS9nbZ3cqdhjil+5PB2QyObxLSrloMX6iYl2
	 n9OZle9KhvsCojhXYz5A4AHqUA7rF0dMs+bzkzyRINVuo4e9FTJmnB4HzJxnLrJd1Q
	 Xe3cRjrOpb1jA==
Date: Tue, 30 Jan 2024 09:35:47 -0600
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	linux-arm-kernel@lists.infradead.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-mediatek@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: interrupt-controller: convert MediaTek
 sysirq to the json-schema
Message-ID: <170662894593.1670058.1923590557072552204.robh@kernel.org>
References: <20240123060804.32254-1-zajec5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240123060804.32254-1-zajec5@gmail.com>


On Tue, 23 Jan 2024 07:08:04 +0100, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This helps validating DTS files.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  .../mediatek,mt6577-sysirq.yaml               | 85 +++++++++++++++++++
>  .../interrupt-controller/mediatek,sysirq.txt  | 44 ----------
>  2 files changed, 85 insertions(+), 44 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/mediatek,mt6577-sysirq.yaml
>  delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
> 

Applied, thanks!

