Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A6D82D6E
	for <linux-kernel@vger.kernel.org>; Tue, 23 Jan 2024 20:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706040228; cv=none; b=ZCXrIShrtj7Rwttg32kBqFkItKGx0Dhzsbvx60RxI+GP8QQg6FnooXyLhUOiDgmk7tipm8z7Or5wV5kqXPWvIDe7LTjPaPsxn4PRO+GyxV1B4UV04Kbo+Rn8ihZJuCso8rn8ZAxR5KC3+rKmmE6iX0k7pDhSj39MLE3cmTiJCT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706040228; c=relaxed/simple;
	bh=dyQW3NaeVkojEhzJb3PKNuLH5mqxW5v94UTZFeODr5k=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k1IO4h9Fi61FpPphN6ZFS0NGkFKc4PNyqIHAnfvmrqSETXEEU0k4BdaiIHzPuyj6x2LdFZR5NEebbEZJD6PPJmM7T7pCxp4+MzDPxZvlYLYBaky0mivelUCLNDL6hyXEZKe3bjFunXi/Sk0hI4Qzl3Ryexy+3OFiYRGmkmpcXo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-24-108.elisa-laajakaista.fi [88.113.24.108])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id 7ea79e9f-ba2a-11ee-abf4-005056bdd08f;
	Tue, 23 Jan 2024 22:03:38 +0200 (EET)
From: andy.shevchenko@gmail.com
Date: Tue, 23 Jan 2024 22:03:37 +0200
To: =?iso-8859-1?B?zfFpZ28=?= Huguet <ihuguet@redhat.com>
Cc: ojeda@kernel.org, danny@kdrag0n.dev, masahiroy@kernel.org,
	jgg@nvidia.com, mic@digikod.net, linux-kernel@vger.kernel.org,
	corbet@lwn.net, joe@perches.com, linux@rasmusvillemoes.dk,
	willy@infradead.org, mailhol.vincent@wanadoo.fr
Subject: Re: [PATCH v4] Add .editorconfig file for basic formatting
Message-ID: <ZbAbmchIO8Cd5hNd@surfacebook.localdomain>
References: <20230601075333.14021-1-ihuguet@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230601075333.14021-1-ihuguet@redhat.com>

Thu, Jun 01, 2023 at 09:53:33AM +0200, Íñigo Huguet kirjoitti:
> EditorConfig is a specification to define the most basic code formatting
> stuff, and it's supported by many editors and IDEs, either directly or
> via plugins, including VSCode/VSCodium, Vim, emacs and more.
> 
> It allows to define formatting style related to indentation, charset,
> end of lines and trailing whitespaces. It also allows to apply different
> formats for different files based on wildcards, so for example it is
> possible to apply different configs to *.{c,h}, *.py and *.rs.
> 
> In linux project, defining a .editorconfig might help to those people
> that work on different projects with different indentation styles, so
> they cannot define a global style. Now they will directly see the
> correct indentation on every fresh clone of the project.
> 
> See https://editorconfig.org

...

> +[{*.{awk,c,dts,dtsi,dtso,h,mk,s,S},Kconfig,Makefile,Makefile.*}]

Missing Kconfig.* ?

-- 
With Best Regards,
Andy Shevchenko


