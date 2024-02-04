Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B0625567
	for <linux-kernel@vger.kernel.org>; Sun,  4 Feb 2024 20:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707079191; cv=none; b=qIj6eyCPGLSDwoudRNUkjo2an6GquAlqP0BDvcH9izzpQ1aYS7j+Yshxn2ciwoQshzpilWefUwxAtjArb1I6iXWW/4y4PJBoKuNWwshnj7LWbKwaI+zNqomuhc77FS7xXdKRK8BNtOywX94J/s16CuZ+r/aCq6gtWl6FK/qxbZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707079191; c=relaxed/simple;
	bh=bZUe2GOxF3aw0+BuWiU25T7bnpBwA1o3kT8FhuMZkmM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=c7uaMMvnIwJRWlPpPTsvibLf0jNzCEie8Rhco2w87bw7ZaF3B9Ka+KKa7sjiZcpMhZr8JY7/cKaDrFOLBIM3p+Oe51E5641pDG0XISLFE2r5T5xJ/SnXVqw5TIRiHdMwLfxU+34tEe85E36qtq90GXOFWA8A9lA5+jZNPNdCjFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:603c:67a9:634f:3025])
	by xavier.telenet-ops.be with bizsmtp
	id j8fn2B0091jQqGJ018fndR; Sun, 04 Feb 2024 21:39:47 +0100
Received: from geert (helo=localhost)
	by ramsan.of.borg with local-esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rWjHH-00HFOC-GI;
	Sun, 04 Feb 2024 21:39:47 +0100
Date: Sun, 4 Feb 2024 21:39:47 +0100 (CET)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: linux-kernel@vger.kernel.org
cc: Jesse Brandeburg <jesse.brandeburg@intel.com>, 
    Tony Nguyen <anthony.l.nguyen@intel.com>, intel-wired-lan@lists.osuosl.org, 
    netdev@vger.kernel.org
Subject: Re: Build regressions/improvements in v6.8-rc3
In-Reply-To: <20240204194607.3067634-1-geert@linux-m68k.org>
Message-ID: <f839ca42-c55-4850-28fe-cb198fa9db4d@linux-m68k.org>
References: <CAHk-=wisik=He=zySDRHq7fe6k_cOXZeZiCkR41TmbzK2KNZtg@mail.gmail.com> <20240204194607.3067634-1-geert@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed

On Sun, 4 Feb 2024, Geert Uytterhoeven wrote:
> JFYI, when comparing v6.8-rc3[1] to v6.8-rc2[3], the summaries are:
>  - build errors: +4/-44

   + /kisskb/src/include/linux/compiler_types.h: error: call to '__compiletime_assert_1093' declared with attribute error: FIELD_GET: mask is not constant:  => 435:38

drivers/net/ethernet/intel/ice/ice_nvm.c: In function 'ice_get_orom_ver_info.isra.0':
powerpc-gcc5/ppc64_book3e_allmodconfig

   + /kisskb/src/include/linux/compiler_types.h: error: call to '__compiletime_assert_1104' declared with attribute error: FIELD_GET: mask is not constant:  => 435:38

In function 'ice_get_itr_intrl_gran.isra.2',
     inlined from 'ice_init_hw' at drivers/net/ethernet/intel/ice/ice_common.c:984:2:
powerpc-gcc5/ppc64_book3e_allmodconfig

   + {standard input}: Error: unknown pseudo-op: `.cfi':  => 605
   + {standard input}: Error: unknown pseudo-op: `.cfi_def_cfa_offse':  => 605

SH ICE crickets

> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/54be6c6c5ae8e0d93a6c4641cb7528eb0b6ba478/ (238 out of 239 configs)
> [3] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/41bccc98fb7931d63d03f326a746ac4d429c1dd3/ (all 239 configs)

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
