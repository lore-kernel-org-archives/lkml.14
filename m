Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 0CBB9145B09
	for <linux-kernel@vger.kernel.org>; Mon, 10 Jun 2024 17:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718040300; cv=none; b=slP4QfIR/iWl835u4bGreCj1gcgadqcafNmr7v1/aMVO2W/goVXIvEzAOyYlcLqxuzzvTAVOppc1IhxwSCOIewxJ+hWDtRpN006hAPRE1eYaXj5c6PickMz77QqfBWUSfnk6kSX7HIY8vPuBR8jccZVN7NViC9cT8eS3K+iil/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718040300; c=relaxed/simple;
	bh=yDfpHqalm5/j4G3WM6FlWkEaCClv6ag+bC0+aRQ0eoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OvsAOyomgdaddbiqdiKtE/Ic7WiOY3Dm3QHLzZ/Rb7GANawuXH4befl0dmNkNGUu9ZI9w0m8+ipFUM9rGnaQhmHaZSp0Apq5krpApx81xLhs3+VozuEewH0ecCyl1rt1uuoMGvq2OWwiv1/wE0YGKQ29nZqoZqV7cH6EyHGnIdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 156890 invoked by uid 1000); 10 Jun 2024 13:24:50 -0400
Date: Mon, 10 Jun 2024 13:24:50 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+5f996b83575ef4058638@syzkaller.appspotmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
  linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] INFO: rcu detected stall in raw_ioctl
Message-ID: <e8b8013b-d8b4-4eee-8643-1d512aa17133@rowland.harvard.edu>
References: <8177975b-7eff-45db-9b4b-4a6d321ac7ab@rowland.harvard.edu>
 <000000000000f225de061a6da393@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000000000000f225de061a6da393@google.com>

On Sat, Jun 08, 2024 at 09:41:04PM -0700, syzbot wrote:
> Hello,
> 
> syzbot has tested the proposed patch and the reproducer did not trigger any issue:
> 
> Reported-and-tested-by: syzbot+5f996b83575ef4058638@syzkaller.appspotmail.com
> 
> Tested on:
> 
> commit:         8867bbd4 mm: arm64: Fix the out-of-bounds issue in con..
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
> console output: https://syzkaller.appspot.com/x/log.txt?x=11f0680a980000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3b4350cf56c61c80
> dashboard link: https://syzkaller.appspot.com/bug?extid=5f996b83575ef4058638
> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
> userspace arch: arm64
> patch:          https://syzkaller.appspot.com/x/patch.diff?x=118743fc980000
> 
> Note: testing is done by a robot and is best-effort only.

I'd like to determine the reason behind this entire class of bugs.  As 
far as I can see, the design of dummy-hcd shouldn't allow them to occur.

Alan Stern

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git 8867bbd4a056

Index: usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/udc/dummy_hcd.c
+++ usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
@@ -1826,6 +1826,7 @@ static void dummy_timer(struct timer_lis
 			break;
 		dum->ep[i].already_seen = 0;
 	}
+	dev_info(dummy_dev(dum_hcd), "Timer handler\n");
 
 restart:
 	list_for_each_entry_safe(urbp, tmp, &dum_hcd->urbp_list, urbp_list) {
@@ -1835,6 +1836,9 @@ restart:
 		struct dummy_ep		*ep = NULL;
 		int			status = -EINPROGRESS;
 
+		dev_info(dummy_dev(dum_hcd), "urbp %p %x next_frame %p\n",
+				urbp, urbp->urb->pipe, dum_hcd->next_frame_urbp);
+
 		/* stop when we reach URBs queued after the timer interrupt */
 		if (urbp == dum_hcd->next_frame_urbp)
 			break;
