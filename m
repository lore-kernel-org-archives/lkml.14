Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DD16ABB5
	for <linux-kernel@vger.kernel.org>; Thu, 21 Dec 2023 10:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SwnGZ65jcz4xhN;
	Thu, 21 Dec 2023 21:48:38 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
Cc: linux-kernel@vger.kernel.org, aneesh.kumar@linux.ibm.com, naveen.n.rao@linux.ibm.com, christophe.leroy@csgroup.eu, npiggin@gmail.com
In-Reply-To: <20231205051105.736470-1-mpe@ellerman.id.au>
References: <20231205051105.736470-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] MAINTAINERS: powerpc: Add Aneesh & Naveen
Message-Id: <170315561640.2199281.14546617665834569101.b4-ty@ellerman.id.au>
Date: Thu, 21 Dec 2023 21:46:56 +1100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On Tue, 05 Dec 2023 16:11:05 +1100, Michael Ellerman wrote:
> Aneesh and Naveen are helping out with some aspects of upstream
> maintenance, add them as reviewers.
> 
> 

Applied to powerpc/fixes.

[1/1] MAINTAINERS: powerpc: Add Aneesh & Naveen
      https://git.kernel.org/powerpc/c/d2441d3e8c0c076d0a2e705fa235c76869a85140

cheers
