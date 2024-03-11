Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37A13C460
	for <linux-kernel@vger.kernel.org>; Mon, 11 Mar 2024 12:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710159962; cv=none; b=j++1I5ad0QA6HVkmrxwvtfA3L221dS39v8RmQjTFwF/eAZ4cj1wU5hZ590KrWdqXkSIyJYd++0Emqx/GRmD00umW2neHeoCz6bC+lzWfPy28bzsxv5j6v8zqJdnOylYALDIZEiHU6aQmjzS2Y4uKp3uNFmmzjaJXYfRY8E9jJvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710159962; c=relaxed/simple;
	bh=8X8T0hKm3DQzmrFrxNbUvHLGmIiUGPTLf6TxTXzdNwI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UO/h6kS43U7yEFtpMKurJebMDTGpLv/h1gwRIRT3A71x7YdPnFydQBL2W2OjvRDzypqAM5588aS+LFVx/TGwDh/GEQG6oGolh/BT+mAVI33LQksJgK3ope2iAI0KH979O0dlngyJzBeWBq52ULDVlHpOL1ueoEAS/JLCA2EO66E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LbazdsTr; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LbazdsTr"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5131c48055cso4370361e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 11 Mar 2024 05:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710159959; x=1710764759; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=6wqO4+xOnDc9c9uJ90sn2rpbjthtJmB9lM5IzZa7CjA=;
        b=LbazdsTrwg/h7TZG+X/qXxPgvi6uWE/sn8uucI3qKeGo/GHqKEvGPeuWJvrCxvNKhA
         2rnnsKYY7RhdwV+hyHY+8oPkOkhXbtnZD64K48GZt5BAbBHjJbkuESmCL+x3c/GReVCH
         UzToODjWr+r9C98EKFdLiWxSYegwEKkv2aVyRXwC2s01Rx3A4Zx44xEVKqMydVNvdQRi
         UNuohKxgqlCHDoRaJjom5AiFdmuTPhddKttlhwXEHyj3LU9pYcoz3SitCY8vCckhuyYZ
         OP9WO/xQ8oCf/NG9JAAWEDCGNhEXF0z5K4C6ylAf8NeO/u2wELGarHmTzm43hgbRXO1b
         ns4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710159959; x=1710764759;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6wqO4+xOnDc9c9uJ90sn2rpbjthtJmB9lM5IzZa7CjA=;
        b=wfmxstMXYjApfz8yRSwDOjbPkR+XCc9iTfQQtSYcfF5lI8i/AAV2IP2z7ogC5hlSGJ
         6N7nEX5thomHLrNeUnXXOVX/2YJ0c1IfDMN30MdbuNEKyBHW6+YtN/S2b3P6kh6VB4jY
         CYWx+Qum5U9g7RmLgn/bD5pmqp2vwfbj9R77Gq9IOgxx+PALqrTKfqxfXxlTxzHM/VQd
         ayYPk7i+WF7n3LSfVoHFVtaPatXiAmQFbYzHU/flceQcjm0g7nYEnw4Eb9CE2DQVMJ+6
         HgKjswYa3GUSq9J9VfTHKV+SBagcLvKM12qiymq5+gu0kPh2vaPVEGicthvIAp6352TJ
         wipw==
X-Gm-Message-State: AOJu0YwTUPGZg5FSIOYRhfEuTAWqNbHV8DaEujIKxGpEV3AhQCYciil+
	DY8jpT3SWw0KuboVQqW/F2T7TZP3etmFsK7stjWcYXp1QK3Ai3scCOdqygw2dTY=
X-Google-Smtp-Source: AGHT+IFdKEcjpP0CUu+o/U1VK8XLGpZEu4JBf1FPyFrZMyy2INWNhwEP06n2DIy8qp+PCp7DMpigHg==
X-Received: by 2002:a05:6512:2388:b0:513:a724:3b9f with SMTP id c8-20020a056512238800b00513a7243b9fmr3354929lfv.7.1710159958715;
        Mon, 11 Mar 2024 05:25:58 -0700 (PDT)
Received: from gmail.com (1F2EF295.nat.pool.telekom.hu. [31.46.242.149])
        by smtp.gmail.com with ESMTPSA id bh11-20020a05600c3d0b00b004132a4b055esm3197647wmb.40.2024.03.11.05.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 05:25:58 -0700 (PDT)
Sender: Ingo Molnar <mingo.kernel.org@gmail.com>
Date: Mon, 11 Mar 2024 13:25:56 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, the arch/x86 maintainers <x86@kernel.org>
Subject: [GIT PULL] x86/asm changes for v6.9
Message-ID: <Ze74VMV1hYeaRuaG@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull the latest x86/asm git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-asm-2024-03-11

   # HEAD: 07a5d4bcbf8e70a430431991f185eb29e74ae533 x86/insn: Directly assign x86_64 state in insn_init()

Two changes to simplify the x86 decoder logic a bit.

 Thanks,

	Ingo

------------------>
Nikolay Borisov (2):
      x86/insn: Remove superfluous checks from instruction decoding routines
      x86/insn: Directly assign x86_64 state in insn_init()


 arch/x86/lib/insn.c       | 58 ++++++++++++++++++-----------------------------
 tools/arch/x86/lib/insn.c | 58 ++++++++++++++++++-----------------------------
 2 files changed, 44 insertions(+), 72 deletions(-)
