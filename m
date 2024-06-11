Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 808BE376E9
	for <linux-kernel@vger.kernel.org>; Tue, 11 Jun 2024 17:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718126777; cv=none; b=rhvEyNJlb4LrIm3b34Ypcgy9lpWzYGSgmuinTDfuWLELjn6A7VM63cZbYOcjySGLFHlnSil+mslVozga0srCGoDo/Dxo5ymxnzPn4wPswRbktEjVpV8i3/wxs4sn6/oKNh/lUaI/em235NcNVL2vqt5Fh6esE7ZpMKB69AdU5zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718126777; c=relaxed/simple;
	bh=Bm1Z5h2HDtU+JljYzebjngJn8fDNKlnAEInmNdApScw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ly1VK4MNWH0BXimnIZNKY8z2pozmoCYGEdVPEM/ADo3qjq2kz5NpuiA8TFEPRcxF6n6NQqt5nq7Fe3u22WuB+ra1t2uEfVMY8HYgTMtUrhQO1rYKx+uJGS+5BLYnZ8xREJr+tcLnRZBiiq89WDCGt7DSKgRmhM6yblmRUPsjGLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 194347 invoked by uid 1000); 11 Jun 2024 13:26:09 -0400
Date: Tue, 11 Jun 2024 13:26:09 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+5f996b83575ef4058638@syzkaller.appspotmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
  linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] INFO: rcu detected stall in raw_ioctl
Message-ID: <684687e4-8be4-42ee-a125-8ef9acc3fec9@rowland.harvard.edu>
References: <23b1962c-044d-4dbd-a705-58754f0914cb@rowland.harvard.edu>
 <000000000000c7e169061a9f42e8@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000000000000c7e169061a9f42e8@google.com>

On Tue, Jun 11, 2024 at 08:53:02AM -0700, syzbot wrote:
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
> console output: https://syzkaller.appspot.com/x/log.txt?x=11bcfa36980000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3b4350cf56c61c80
> dashboard link: https://syzkaller.appspot.com/bug?extid=5f996b83575ef4058638
> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
> userspace arch: arm64
> patch:          https://syzkaller.appspot.com/x/patch.diff?x=17790922980000
> 
> Note: testing is done by a robot and is best-effort only.

The interval between adjacent timer interrupts is consistently 20 ms.  
Longer than expected, but it shouldn't be deadly.  Perhaps it would have 
been smaller if I hadn't pinned all the interrupts to the same CPU.

Anyway, let's see what happens with the dev_err() calls in the interrupt 
handler changed to dev_dbg().  That ought to reduce the overhead 
considerably.

Alan Stern

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git 8867bbd4a056

Index: usb-devel/drivers/usb/class/cdc-wdm.c
===================================================================
--- usb-devel.orig/drivers/usb/class/cdc-wdm.c
+++ usb-devel/drivers/usb/class/cdc-wdm.c
@@ -266,14 +266,14 @@ static void wdm_int_callback(struct urb
 			dev_err(&desc->intf->dev, "Stall on int endpoint\n");
 			goto sw; /* halt is cleared in work */
 		default:
-			dev_err(&desc->intf->dev,
+			dev_dbg(&desc->intf->dev,
 				"nonzero urb status received: %d\n", status);
 			break;
 		}
 	}
 
 	if (urb->actual_length < sizeof(struct usb_cdc_notification)) {
-		dev_err(&desc->intf->dev, "wdm_int_callback - %d bytes\n",
+		dev_dbg(&desc->intf->dev, "wdm_int_callback - %d bytes\n",
 			urb->actual_length);
 		goto exit;
 	}

