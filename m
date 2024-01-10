Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A79DF2A1D3
	for <linux-kernel@vger.kernel.org>; Wed, 10 Jan 2024 06:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Received: (from willy@localhost)
	by mail.home.local (8.17.1/8.17.1/Submit) id 40A6HqdI006376;
	Wed, 10 Jan 2024 07:17:52 +0100
Date: Wed, 10 Jan 2024 07:17:52 +0100
From: Willy Tarreau <w@1wt.eu>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>
Cc: Brennan Xavier McManus <bxmcmanus@gmail.com>,
        Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] tools/nolibc/stdlib: fix memory error in realloc()
Message-ID: <ZZ42kAxNA0ogdMAF@1wt.eu>
References: <ZZ3aQv3bKk30kKZA@mizu>
 <ZZ4Y+dak5LC6LTg7@biznet-home.integral.gnuweeb.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZZ4Y+dak5LC6LTg7@biznet-home.integral.gnuweeb.org>

Hi,

On Wed, Jan 10, 2024 at 11:11:37AM +0700, Ammar Faizi wrote:
> On Tue, Jan 09, 2024 at 06:44:02PM -0500, Brennan Xavier McManus wrote:
> > Pass user_p_len to memcpy() instead of heap->len to prevent realloc()
> > from copying an extra sizeof(heap) bytes from beyond the allocated
> > region.
> > 
> > Signed-off-by: Brennan Xavier McManus <bxmcmanus@gmail.com>
> > ---
> > 
> > All tests from Ammar's original test program pass:
> > https://gist.github.com/ammarfaizi2/db0af6aa0b95a0c7478bce64e349f021
> > This fix was tested with the following added test for realloc():
> > https://github.com/brennan913/nolibc-test/blob/main/nolibc_test.c#L73-L120
> 
> Hello Brennan,
> 
> Thank you for the fix!
> 
> Cc: stable@vger.kernel.org
> Reviewed-by: Ammar Faizi <ammarfaizi2@gnuweeb.org>
> Fixes: 0e0ff638400be8f497a35b51a4751fd823f6bd6a ("tools/nolibc/stdlib: Implement `malloc()`, `calloc()`, `realloc()` and `free()`")

Thanks both for the fix and the review! I've pushed it to the "fixes"
branch. Thomas, for now I updated the branch to match "next" (which just
got merged) so as to preserve patch ordering, we'll just rebase it once
6.8-rc1 is out.

Willy
