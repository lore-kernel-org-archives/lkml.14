Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEECD78C9B;
	Wed,  8 May 2024 13:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715175984; cv=none; b=Co7QbNJAa33LxlyN9VSxVcRqT0n0vOePNsGhmq5EfmIYIolR3j074BRuqo9Y8xREVN2cP9qyt4YpOunQtRthec6zrAqFWvtyAx0RYuRnBsvB6r/jk3quguC2P7Fj66cYE1XMNY7g91v+RmvzRPmeDowuzo7/aCICEqhNF6iQFj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715175984; c=relaxed/simple;
	bh=PdHakPGfziCL3JETjXF2HpcAQm9uAp9U4XC+GgVdLok=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ktj9gkFkhf/zwCPYbAFDJehsi1KHd0vjrd8pkXGXvcvZLNJ4JsH7uVmcGsqF6q6CMrcPrsiec07JLHa3LywmNj8XOF2jPYlDaeA7Q3HpfrAvkUXj8jAKf8CPhRbWDxIbVzAOWbRahwuy146TfypLY2Fgwry1pxw6ga6ycmCTew4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; spf=pass smtp.mailfrom=ellerman.id.au; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VZGdS57yFz4x0v;
	Wed,  8 May 2024 23:46:20 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Vaibhav Jain <vaibhav@linux.ibm.com>, Kautuk Consul <kconsul@linux.vnet.ibm.com>, Amit Machhiwal <amachhiw@linux.vnet.ibm.com>, Jordan Niethe <jniethe5@gmail.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Gautam Menghani <gautam@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org
In-Reply-To: <a7ed4cc12e0a0bbd97fac44fe6c222d1c393ec95.1706441651.git.christophe.jaillet@wanadoo.fr>
References: <a7ed4cc12e0a0bbd97fac44fe6c222d1c393ec95.1706441651.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] KVM: PPC: Book3S HV nestedv2: Fix an error handling path in gs_msg_ops_kvmhv_nestedv2_config_fill_info()
Message-Id: <171517595459.167543.3276617285735136069.b4-ty@ellerman.id.au>
Date: Wed, 08 May 2024 23:45:54 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On Sun, 28 Jan 2024 12:34:25 +0100, Christophe JAILLET wrote:
> The return value of kvmppc_gse_put_buff_info() is not assigned to 'rc' and
> 'rc' is uninitialized at this point.
> So the error handling can not work.
> 
> Assign the expected value to 'rc' to fix the issue.
> 
> 
> [...]

Applied to powerpc/topic/ppc-kvm.

[1/1] KVM: PPC: Book3S HV nestedv2: Fix an error handling path in gs_msg_ops_kvmhv_nestedv2_config_fill_info()
      https://git.kernel.org/powerpc/c/b52e8cd3f835869370f8540f1bc804a47a47f02b

cheers
