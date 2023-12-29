Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FAA12E4D;
	Fri, 29 Dec 2023 19:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="prhzLEOp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4C53C433C7;
	Fri, 29 Dec 2023 19:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703877466;
	bh=7/isT/CdiiogTJpXSS1PN6AQNvMWmv+tZOqra//YCK4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=prhzLEOpIcASzb5PbttKFwhUYoq2jYXm1Y9y8eifFzvYzN1PX4z0aCdoavfKcqblY
	 AX6NuFFgdLdlINZqWm/bnA1sCEBtDcIGvoUEpnqoNtZ3cZxi5hYlhyIDEeSC2oUyuK
	 NzJocdf6RtthWJyWMurv2vyPCn2VE1mIlJv+40Tv6tefOfe74cSRqM0OBiVhVFRE4S
	 AiPhMUlXt7Tft9ZOlgZV8xy/Ugm0QGIAHcsQr/oidt7RiGFexbIS+7GZ05srXr4RJo
	 TEYnIFKM5+KZ1G7pfa2WXkKcATqPs/mbX0VEkQbRuqzpr74aag922l6cEBXS9YQbow
	 FYalAiJfmkLkQ==
From: Mark Brown <broonie@kernel.org>
To: Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: kernel test robot <lkp@intel.com>, linux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20231226200025.30870-1-duje.mihanovic@skole.hr>
References: <20231226200025.30870-1-duje.mihanovic@skole.hr>
Subject: Re: [PATCH RFC] ASoC: pxa: sspa: Don't select SND_ARM
Message-Id: <170387746330.3014555.13529710502553873994.b4-ty@kernel.org>
Date: Fri, 29 Dec 2023 19:17:43 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-0438c

On Tue, 26 Dec 2023 21:00:24 +0100, Duje Mihanović wrote:
> On ARM64 platforms, SND_ARM shouldn't be selectable, but enabling
> SND_SOC_MMP_SSPA will enable SND_ARM and cause build errors if
> SND_ARMAACI is enabled (which it is by default). Since the SSPA driver
> doesn't depend on AACI nor PXA2XX_LIB, remove this false dependency.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: pxa: sspa: Don't select SND_ARM
      commit: 67508b874844b80ac49f70b78d67036c28b9fe7e

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

