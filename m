Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB381C13C
	for <linux-kernel@vger.kernel.org>; Mon,  8 Jan 2024 08:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:d323:2fd4:4f64:e281])
	by baptiste.telenet-ops.be with bizsmtp
	id Y8g72B0070Qz0eJ018g7ua; Mon, 08 Jan 2024 09:40:07 +0100
Received: from geert (helo=localhost)
	by ramsan.of.borg with local-esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rMlB1-00EseN-1s
	for linux-kernel@vger.kernel.org;
	Mon, 08 Jan 2024 09:40:07 +0100
Date: Mon, 8 Jan 2024 09:40:07 +0100 (CET)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: linux-kernel@vger.kernel.org
Subject: Re: Build regressions/improvements in v6.7
In-Reply-To: <20240108075410.1403427-1-geert@linux-m68k.org>
Message-ID: <da1640c9-9fac-9a3-c8c0-cad5ce68cc22@linux-m68k.org>
References: <CAHk-=widprp4XoHUcsDe7e16YZjLYJWra-dK0hE1MnfPMf6C3Q@mail.gmail.com> <20240108075410.1403427-1-geert@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed

On Mon, 8 Jan 2024, Geert Uytterhoeven wrote:
> JFYI, when comparing v6.7[1] to v6.7-rc8[3], the summaries are:
>  - build errors: +7/-0

The usual SH ICE crickets.

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
