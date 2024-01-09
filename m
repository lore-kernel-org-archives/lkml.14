Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0E4612E;
	Tue,  9 Jan 2024 09:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WcXXsHyc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED03BC433C7;
	Tue,  9 Jan 2024 09:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704794020;
	bh=ZzK6Vp42TEIsfIyJQNP28NhtlMFkU94Dmq0D+Z7QDdY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WcXXsHycg7s8ZD808aEB0IuRC/Bag1Sc2v1jQ1iPEZTISo/tm2USeZdeUBa8t5M2T
	 KR0d4J4uyeFP46pmE8UD79VBJoFRzYRScKZ/BAgt+0ukv1CPzT+2ZtirRFupNTafW9
	 3xg0RMGDRU0b8/Ni3Ftj6CXsGn/jlyG+x6z3pVtf/V5lUC0Sfd0I1qi1vfTmuJyjPB
	 d+UKsA0AYpYGPUmpYC30JvsItCj+vccj4sFO7bTVWw/RdrRWAPpRlvXTHUte7IRFmq
	 wJBvfO2EfGZIkIt8AdooIFeMvU4GM3YFBmdw/XCwuirYcdqr+/NfCoFVeKhnPZkiFG
	 EtXgf/VEpHetg==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 kernel@collabora.com, Jaroslav Kysela <perex@perex.cz>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado_via_Alsa-devel?= <alsa-devel@alsa-project.org>, 
 Rob Herring <robh@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org
In-Reply-To: <20240108204508.691739-1-nfraprado@collabora.com>
References: <20240108204508.691739-1-nfraprado@collabora.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8192: Check existence of dai_name
 before dereferencing
Message-Id: <170479401767.23951.13089659929333674161.b4-ty@kernel.org>
Date: Tue, 09 Jan 2024 09:53:37 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-5c066

On Mon, 08 Jan 2024 17:44:58 -0300, Nícolas F. R. A. Prado wrote:
> Following commit 13f58267cda3 ("ASoC: soc.h: don't create dummy
> Component via COMP_DUMMY()"), the dai_name field is only populated for
> dummy components after the card is registered. This causes a null
> pointer dereference in the mt8192-mt6359 sound card driver's probe
> function when searching for a dai_name among all the card's dai links.
> 
> Verify that the dai_name is non-null before passing it to strcmp. While
> at it, also check that there's at least one codec.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8192: Check existence of dai_name before dereferencing
      commit: 4d4e1b6319e5c4425ea3faeaf9a10b8b4c16c1e1

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

