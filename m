Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C1412F5A5;
	Mon,  3 Jun 2024 14:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717425508; cv=none; b=M6E3AsZfVy5mqIry3iYB5BPjZdVhZIf+5VMpRBHTEhP9BhH8CpmqDzxTBMpaiZc7tWEAJE6Eat96dfZUtgVIkTmqEIYk2fps9czFqLkfxDftCuseNpudO5z/VTa+Esr9bvh9gEe5L+ILTkqPvvsl8OeCj1LNDFPYM8pu5SuAw2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717425508; c=relaxed/simple;
	bh=TGazb/1IgD0MdnXe7ByDsV4IRWQpAhJrG6j9NfEKmk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pFni7d/FfuDMPydbyHlp8qBgrfLXqwYt2w7KYY3+m6mj5FUSiT7rwsqzvSX/IaLiA4jZP5n2Q8t2tkacyWv4C8IeIZagz4vkoxV0B6fsKvSWD5YXlTfHDtcp7EB0p9Rw4OLpko1yfsVgmZDWDep47XzQZFbt8bI8Dhnfqfcz6uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tNXHinoR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tNXHinoR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C42FC2BD10;
	Mon,  3 Jun 2024 14:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717425508;
	bh=TGazb/1IgD0MdnXe7ByDsV4IRWQpAhJrG6j9NfEKmk4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tNXHinoRxsjkITrYNtgdrAsTg77wsJAaz3CfDxQh8cWKzuyzPp6l8y781StK45wpc
	 ieTxqzS8bjDKYGUXo5c/hDxUdxrTx4jQrRo/NdAIssmuZKB4ulJ8o+IiPrjXcp9ynP
	 ZSISa8SiVXEdr/0c1knBni5JTLqq4Pr1VWYvxOwM9gdMPtinWohYCPWZ+H4b14co4M
	 29dbYWgujuySX1HUMrBJaAPujKWnfQ68tkgiSzcxotVWmU6uV33ktMZxiTPPnb6fnI
	 nCuQCz+qHxjY0aZ33cx2mqhHtnWa4OOSJESMpUJV6q+aDvmkMmy++Z1DRNZg8zq7Uu
	 buicurlfoLpSQ==
From: Christian Brauner <brauner@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Christian Brauner <brauner@kernel.org>,
	linux-fsdevel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Amir Goldstein <amir73il@gmail.com>,
	Chuck Lever <chuck.lever@oracle.com>,
	Dan Williams <dan.j.williams@intel.com>,
	"Darrick J. Wong" <djwong@kernel.org>,
	David Howells <dhowells@redhat.com>,
	Jan Kara <jack@suse.cz>,
	Jeff Layton <jlayton@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Seth Forshee <sforshee@kernel.org>
Subject: Re: [PATCH] fs: nls: add missing MODULE_DESCRIPTION() macros
Date: Mon,  3 Jun 2024 16:38:07 +0200
Message-ID: <20240603-redefreiheit-seeblick-67c06fb0ee5a@brauner>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240516-md-fs-nls-v1-1-ed540d8239bf@quicinc.com>
References: <20240516-md-fs-nls-v1-1-ed540d8239bf@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=4750; i=brauner@kernel.org; h=from:subject:message-id; bh=TGazb/1IgD0MdnXe7ByDsV4IRWQpAhJrG6j9NfEKmk4=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMaTFXo25+f3iGiaTiPT6S9WrLBX2Lhc8c7+Ms/fp0c/Jp d1TfOvlO0pZGMS4GGTFFFkc2k3C5ZbzVGw2ytSAmcPKBDKEgYtTACYiGsbI8H+qGpNcQE7uLisP 9pSHm6y7Pf4FNLVa5p9espy1vaopgOGfmsgFG/kXO9h2pqxZ+Z/DM7x78/6ea0Xv226ZLt4p3ja dHwA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

On Thu, 16 May 2024 09:50:55 -0700, Jeff Johnson wrote:
> Fix the following allmodconfig "make W=1" issues:
> 
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-celtic.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-centeuro.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-croatian.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-cyrillic.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-gaelic.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-greek.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-iceland.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-inuit.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-romanian.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-roman.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-turkish.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_ascii.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp1250.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp1251.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp1255.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp437.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp737.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp775.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp850.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp852.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp855.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp857.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp860.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp861.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp862.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp863.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp864.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp865.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp866.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp869.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp874.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp932.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp936.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp949.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp950.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_euc-jp.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-13.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-14.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-15.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-1.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-2.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-3.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-4.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-5.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-6.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-7.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-9.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_koi8-r.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_koi8-ru.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_koi8-u.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_ucs2_utils.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_utf8.o
> 
> [...]

Applied to the vfs.module.description branch of the vfs/vfs.git tree.
Patches in the vfs.module.description branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs.module.description

[1/1] fs: nls: add missing MODULE_DESCRIPTION() macros
      https://git.kernel.org/vfs/vfs/c/d694e46afb4b
