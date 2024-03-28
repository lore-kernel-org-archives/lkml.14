Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA7E1DDD5;
	Thu, 28 Mar 2024 22:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711663297; cv=none; b=ikZlFofLIfc1Jmm0UvfpLHgjeLYXmQZig8DysS8A9CuJqFJ+XmYZzD1zXGjZyP89IgVkfR/7rNZ0YlBnkrPGOYlJS3Bc0Ry/iKZaOhAxtaq8VmQZUBJxMDGKXGUaLoplrtltNhMjfdflwzAYw7LIp+LhXESZM508V19qxBsChpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711663297; c=relaxed/simple;
	bh=c6tBfXAorSFrCAwy+dAcRla3vtX3ePerZfaK2+3P1Os=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=E4AqTEVPdm3MOZpyZY9CU0LmYfqWx6B5P0ItLeNcAqmQYsl38qmLftWPZAdusIni/Zl5pMxalrESdeiIrGbEnGiFsGieHlqd9NyIalHugYcFM97B8AA9QFZ56ji2dvzxsKxbrTpRvlNIXuyiJkgHc8YoEhHRo8MrrmR7wPxL1fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eTmGNy4x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eTmGNy4x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 935F0C433F1;
	Thu, 28 Mar 2024 22:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711663297;
	bh=c6tBfXAorSFrCAwy+dAcRla3vtX3ePerZfaK2+3P1Os=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eTmGNy4xAJbgQ3Iuf5oISoOo6PcIVzpw/Wz77nZBmeW5yWWKxw/s6IuVXhDWa9Q5W
	 azi4rjqcTixylT6tEWqtgLMyKAV8A6AG3LKM7yOmfruJXqYrDx1hEtqmWb/M8dIgz7
	 qzByJotMu2EZ5kkfBz93CFCkb28ZDZGzdm8Ix2xW32lAQPIqFP3y3MFkrejW9yDuJZ
	 bfkYKfuzdC1ydkgEYmwE5Tm7zDSJqBUemm1f/T/tuNqWN5rZnqWZ0dk18BaxIafvGd
	 h2OLzacNUWAs4Wa9KkTrMLwTNpjNxWwRD5zwQ/uPRNA7e/ZaXt0D0F6PlCsxi/R3Vj
	 uM7+E5G0j/WIw==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, venkataprasad.potturu@amd.com, 
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Syed Saba Kareem <Syed.SabaKareem@amd.com>, 
 Jarkko Nikula <jarkko.nikula@bitmer.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, 
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20240327104657.3537664-1-Vijendar.Mukunda@amd.com>
References: <20240327104657.3537664-1-Vijendar.Mukunda@amd.com>
Subject: Re: (subset) [PATCH 1/2] ASoC: amd: acp: fix for acp_init function
 error handling
Message-Id: <171166329431.152246.4663516656562563292.b4-ty@kernel.org>
Date: Thu, 28 Mar 2024 22:01:34 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev

On Wed, 27 Mar 2024 16:16:52 +0530, Vijendar Mukunda wrote:
> If acp_init() fails, acp pci driver probe should return error.
> Add acp_init() function return value check logic.
> 
> Fixes: e61b415515d3 ("ASoC: amd: acp: refactor the acp init and de-init sequence")
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/2] ASoC: amd: acp: fix for acp pdm configuration check
      commit: 4af565de9f8c74b9f6035924ce0d40adec211246

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

