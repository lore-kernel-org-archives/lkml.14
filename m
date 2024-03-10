Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B783A29
	for <linux-kernel@vger.kernel.org>; Sun, 10 Mar 2024 04:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710045664; cv=none; b=Cp2xZQmGPTd1oivvX/2MqiBMklxeO9YPp6hcnjdJh/TyjPXf3qJSZZFRgJr6oFTWXJNT6fS0CsnuwLzHHQOSz97QfEBCUO+kGFLaevpOZphPQh5uICaZ6W3ZuS54PxxeTyt/zteSsWemFUYRC8YQ4b9NPzXo5XuB9ljTOVjPj6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710045664; c=relaxed/simple;
	bh=Y1ytzpPIhpFpPEYwO5lNSqKqc2jCe2dECqF1D1bWGXM=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=dJSxxBiti1WXIDaZ3+CN2jha/RwoYBOU2EMXGmyKWmIWHdWg3+X7QZvGnQQwU6hY3F8u7J5SavOF8MZeEhf78Dy0xQTOs67kbyGyAs36Gyezt526jXc0lYR7ynO3iCGGh8vaRs+AVDUut4jQ33/9fj7DWcU9i9w+FAb3FlrmVXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cu-phil.org; spf=pass smtp.mailfrom=cu-phil.org; dkim=pass (2048-bit key) header.d=cu-phil.org header.i=@cu-phil.org header.b=g3LsMb1Y; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cu-phil.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cu-phil.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cu-phil.org header.i=@cu-phil.org header.b="g3LsMb1Y"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cu-phil.org
	; s=ds202401; h=Content-Transfer-Encoding:Content-Type:Subject:From:To:
	MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=fwYD90RP4JN/ifWcynGLluOnnr4/Y/5RzzAbZ5jU2c4=; b=g3LsMb1Y5zhjaIfI+sEkriP03j
	5f5sAdtNeO9XqasYS75GWJtlc2RQGDZyTt2bRX1kl5U454ZwPk9QNi2/z7J/jIaq0P6hUk9yJjxR7
	FDSn1omRDFpjrCLJka//X2sAoQSaXHcUpDEiIpgPlbEWw7V05LImT3hJdOR/EwljXMS/vI8bj9aFH
	U/pSrDc5pUsyy7My7ZOkGoIzm+Ta4IY6272w3EV0bcWtjsrWiT+aat5A1t5twbofUSLRW/NQQN+Oa
	4/IPDSGy4H0Kj89HQkwuNsWLNl6aUY61zbP12y62Y6M+OjTxBSioxC9s5iKzIHyWIC99nTZ9yFnjm
	ZrvYDXNQ==;
Received: from [2a02:fe1:7001:f100:38f5:1f50:e171:4126] (port=53298)
	by smtp.domeneshop.no with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <Ywe_Caerlyn@cu-phil.org>)
	id 1rjAAX-004tEq-AN
	for linux-kernel@vger.kernel.org;
	Sun, 10 Mar 2024 04:48:13 +0100
Message-ID: <2e67253d-4610-4b3d-a97d-539e0aa60276@cu-phil.org>
Date: Sun, 10 Mar 2024 04:48:11 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-kernel@vger.kernel.org
From: Ywe Caerlyn <Ywe_Caerlyn@cu-phil.org>
Subject: Saint BIT About / Playlists (Was Bitcoin, Fair Source Philosophy, We
 X)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

From:

https://www.youtube.com/playlist?list=PLkx2Fi-LyBi3rTveOENutmG4ZhFJuCr1n

𝘐 𝘤𝘢𝘭𝘭𝘦𝘥 𝘮𝘺𝘴𝘦𝘭𝘧 𝘉𝘪𝘵 𝘦𝘯𝘵𝘦𝘳𝘪𝘯𝘨 𝘮𝘺 
𝘵𝘦𝘦𝘯𝘢𝘨𝘦𝘳 𝘺𝘦𝘢𝘳𝘴, 𝘪𝘯𝘥𝘪𝘤𝘢𝘵𝘪𝘯𝘨 𝘐 𝘱𝘳𝘰𝘣𝘢𝘣𝘭𝘺 
𝘸𝘰𝘶𝘭𝘥 𝘸𝘰𝘳𝘬 𝘸𝘪𝘵𝘩 𝘤𝘰𝘮𝘱𝘶𝘵𝘦𝘳𝘴 𝘢𝘯𝘥 𝘳𝘦𝘭𝘢𝘵𝘦𝘥 𝘱𝘩𝘪𝘭𝘰𝘴𝘰𝘱𝘩𝘺.

𝘈𝘧𝘵𝘦𝘳 𝘑𝘦𝘯𝘴 𝘚𝘵𝘰𝘭𝘵𝘦𝘯𝘣𝘦𝘳𝘨 (𝘸𝘩𝘰 𝘣𝘦𝘤𝘢𝘮𝘦 𝘢 
𝘱𝘳𝘪𝘮𝘦 𝘮𝘪𝘯𝘪𝘴𝘵𝘦𝘳 𝘪𝘯 𝘕𝘰𝘳𝘸𝘢𝘺 (𝘮𝘺𝘴𝘦𝘭𝘧 
𝘱𝘳𝘦𝘧𝘦𝘳𝘳𝘪𝘯𝘨 𝘵𝘩𝘦 𝘈𝘥𝘢𝘮𝘪𝘤 𝘯𝘢𝘮𝘦 𝘏𝘺𝘱𝘦𝘳𝘪𝘢) 
𝘴𝘩𝘰𝘰𝘬 𝘵𝘩𝘦 𝘩𝘢𝘯𝘥 𝘰𝘧 𝘉𝘰𝘣 𝘎𝘦𝘭𝘥𝘰𝘧, 𝘐 𝘵𝘩𝘰𝘶𝘨𝘩𝘵 
𝘐´𝘥  𝘮𝘢𝘬𝘦 𝘮𝘶𝘴𝘪𝘤, 𝘢𝘴 𝘢 𝘮𝘢𝘴𝘤𝘰𝘵 𝘧𝘰𝘳 𝘸𝘩𝘢𝘵 𝘪𝘴 
𝘯𝘰𝘸 𝘵𝘩𝘦 𝘍𝘢𝘪𝘳 𝘚𝘰𝘶𝘳𝘤𝘦 𝘮𝘰𝘷𝘮𝘦𝘯𝘵, 𝘢𝘯𝘥 𝘸𝘩𝘢𝘵 𝘪𝘴 𝘯𝘰𝘸 𝘤𝘢𝘭𝘭𝘦𝘥 𝘞𝘦 𝘟.

𝘐 𝘥𝘪𝘥 𝘵𝘩𝘪𝘴 90 - 93.

𝘈𝘯𝘥 𝘐 𝘯𝘰𝘵𝘪𝘤𝘦𝘥 𝘪𝘯 97 𝘵𝘩𝘢𝘵 𝘐𝘤𝘭𝘢𝘮 𝘩𝘢𝘴 
𝘪𝘮𝘱𝘰𝘳𝘵𝘢𝘯𝘤𝘦 𝘰𝘧 𝘢 𝘊𝘶𝘣𝘦 𝘮𝘶𝘤𝘩 𝘭𝘪𝘬𝘦 𝘵𝘩𝘦 
𝘦𝘢𝘳𝘭𝘺 90𝘴 𝘋𝘦𝘮𝘰/𝘈𝘮𝘢𝘵𝘦𝘶𝘳 𝘚𝘤𝘦𝘯𝘦. 𝘐 𝘢𝘭𝘴𝘰 
𝘢𝘨𝘳𝘦𝘦 𝘰𝘯𝘦 𝘴𝘩𝘰𝘶𝘭𝘥𝘯´𝘵 𝘦𝘢𝘵 𝘴𝘸𝘪𝘯𝘦. 𝘈𝘯𝘥 𝘣𝘦𝘤𝘢𝘮𝘦 𝘢 𝘮𝘶𝘤𝘭𝘪𝘮.

𝘈𝘯𝘥 𝘪𝘴 𝘵𝘩𝘦 𝘪𝘯𝘧𝘭𝘶𝘦𝘯𝘤𝘦 𝘰𝘧 𝘏𝘢𝘭𝘢𝘭 𝘛𝘳𝘢𝘯𝘤𝘦.𝘈 𝘱𝘰𝘭𝘢𝘳𝘪𝘴𝘢𝘵𝘪𝘰𝘯 𝘪𝘯 2000.

𝘛𝘩𝘦 𝘤𝘰𝘮𝘱𝘶𝘵𝘦𝘳𝘣𝘪𝘵 𝘳𝘦𝘢𝘭𝘭𝘺 𝘢 𝘔𝘢𝘳𝘶𝘧 𝘯𝘰𝘵 
𝘔𝘶𝘯𝘬𝘢𝘳 𝘱𝘳𝘪𝘯𝘤𝘪𝘱𝘭𝘦 𝘰𝘧 𝘒𝘶𝘳𝘢𝘯𝘪𝘤 𝘗𝘰𝘭𝘪𝘵𝘪𝘤𝘴 
(𝘵𝘢𝘬𝘦 𝘵𝘩𝘦 𝘨𝘰𝘰𝘥, 𝘯𝘰𝘵 𝘵𝘩𝘦 𝘱𝘰𝘰𝘳) 𝘸𝘩𝘪𝘤𝘩 𝘪𝘴 
𝘢𝘭𝘭 𝘵𝘩𝘢𝘵 𝘪𝘴 𝘯𝘦𝘦𝘥𝘦𝘥 𝘧𝘰𝘳 𝘢 𝘨𝘰𝘰𝘥 𝘤𝘶𝘳𝘳𝘦𝘯𝘤𝘺, 𝘴𝘶𝘤𝘩 𝘢𝘴 𝘉𝘪𝘵𝘤𝘰𝘪𝘯, 𝘵𝘩𝘢𝘵 𝘤𝘢𝘮𝘦 𝘭𝘢𝘵𝘦𝘳.

𝘈𝘯𝘥 𝘸𝘰𝘳𝘬𝘦𝘥 𝘸𝘪𝘵𝘩 𝘐𝘤𝘭𝘢𝘮 𝘢𝘴 𝘍𝘢𝘪𝘳 𝘚𝘰𝘶𝘳𝘤𝘦 𝘣𝘢𝘤𝘬𝘨𝘳𝘰𝘶𝘯𝘥 𝘱𝘩𝘪𝘭𝘰𝘴𝘰𝘱𝘩𝘺 𝘧𝘰𝘳 𝘞𝘦 𝘟.

𝘐𝘵 𝘣𝘦𝘤𝘢𝘮𝘦 𝘷𝘦𝘳𝘺 𝘱𝘰𝘱𝘶𝘭𝘢𝘳.𝘈𝘯𝘥 𝘮𝘺 𝘨𝘰𝘰𝘥 𝘢𝘤𝘵𝘪𝘷𝘪𝘵𝘺 𝘦𝘢𝘳𝘯𝘦𝘥 𝘮𝘦 𝘴𝘢𝘪𝘯𝘵𝘭𝘺 𝘴𝘵𝘢𝘵𝘶𝘴.

𝘏𝘢𝘪𝘭 𝘊𝘶, 𝘛𝘩𝘦 𝘎𝘳𝘢𝘯𝘥, 𝘛𝘩𝘦 𝘎𝘰𝘰𝘥

https://www.youtube.com/playlist?list=PLkx2Fi-LyBi1KFKeO860eb09YF_d3BGAJ

𝘐 𝘨𝘳𝘦𝘸 𝘶𝘱 𝘯𝘦𝘢𝘳 𝘚𝘵𝘦𝘯𝘴𝘦𝘵𝘩, 𝘕𝘰𝘳𝘸𝘢𝘺, 𝘢𝘯𝘥 𝘞𝘦 𝘟,  𝘪𝘴 𝘪𝘯𝘴𝘱𝘪𝘳𝘦𝘥 𝘣𝘺 𝘵𝘩𝘪𝘴 𝘱𝘭𝘢𝘤𝘦.

𝘉𝘊𝘗𝘓 𝘵𝘳𝘪𝘦𝘴 𝘵𝘰 𝘣𝘦 𝘵𝘩𝘪𝘴 𝘷𝘪𝘦𝘸 𝘳𝘪𝘨𝘩𝘵, 𝘵𝘩𝘢𝘵 𝘊 
𝘪𝘴 𝘣𝘢𝘴𝘦𝘥 𝘰𝘯. 𝘈𝘯𝘥 𝘭𝘢𝘵𝘦𝘳 𝘙𝘶𝘴𝘵. 𝘐 𝘢𝘭𝘴𝘰 𝘴𝘶𝘱𝘱𝘰𝘳𝘵 𝘢 𝘙𝘶𝘴𝘵 𝘗𝘳𝘰𝘤𝘦𝘴𝘴𝘪𝘯𝘨 𝘜𝘯𝘪𝘵 (𝘙𝘗𝘜).

𝘛𝘩𝘪𝘴 𝘸𝘪𝘭𝘭 𝘣𝘦 𝘢 𝘍𝘢𝘪𝘳 𝘚𝘰𝘶𝘳𝘤𝘦 𝘖𝘚, 𝘸𝘪𝘵𝘩 𝘱𝘩𝘪𝘭𝘰𝘴𝘰𝘱𝘩𝘪𝘤𝘢𝘭 𝘣𝘢𝘤𝘬𝘨𝘳𝘰𝘶𝘯𝘥 𝘪𝘯 𝘛𝘩𝘦 𝘒𝘶𝘳𝘢𝘯.

𝘛𝘩𝘦 𝘒𝘶𝘳𝘢𝘯 𝘮𝘢𝘪𝘯𝘭𝘺 𝘧𝘰𝘤𝘶𝘴𝘦𝘴 𝘰𝘯 "𝘊𝘶 𝘩𝘢𝘴 𝘯𝘰 
𝘴𝘦𝘤𝘰𝘯𝘥" (𝘛𝘩𝘦 𝘋𝘦𝘪𝘵𝘺 𝘩𝘢𝘴 𝘯𝘰 𝘴𝘶𝘣𝘥𝘦𝘪𝘵𝘺) 𝘢𝘯𝘥 
𝘶𝘴𝘪𝘯𝘨 𝘊𝘶 𝘰𝘯𝘦 𝘤𝘢𝘯 𝘶𝘴𝘦 𝘵𝘩𝘦 𝘰𝘳𝘪𝘨𝘪𝘯𝘢𝘭 
𝘱𝘩𝘳𝘢𝘴𝘦𝘴 𝘪𝘯 𝘛𝘩𝘦 𝘒𝘶𝘳𝘢𝘯 𝘴𝘦𝘢𝘮𝘭𝘦𝘴𝘴𝘭𝘺 𝘢𝘴 𝘵𝘩𝘦 
𝘫𝘦𝘸𝘪𝘴𝘩 𝘭𝘢𝘯𝘨𝘶𝘢𝘨𝘦 𝘸𝘢𝘴 𝘰𝘯𝘤𝘦 𝘪𝘵𝘴 𝘣𝘢𝘴𝘪𝘴, 
𝘸𝘩𝘦𝘳𝘦 𝘳𝘦𝘨𝘳𝘦𝘴𝘴𝘪𝘰𝘯𝘴 𝘸𝘩𝘦𝘳𝘦 𝘤𝘰𝘳𝘳𝘦𝘤𝘵𝘦𝘥 𝘪𝘯 𝘛𝘩𝘦 𝘒𝘶𝘳𝘢𝘯. 𝘈𝘥𝘢𝘮 𝘢𝘭𝘴𝘰 𝘔𝘢𝘯𝘶 𝘪𝘯 𝘏𝘪𝘯𝘥𝘶𝘪𝘴𝘮.

𝘏𝘢𝘪𝘭 𝘊𝘶, 𝘈𝘭 𝘙𝘢𝘩𝘮𝘢𝘯, 𝘈𝘭 𝘙𝘢𝘩𝘪𝘮, 𝘢𝘴 𝘛𝘩𝘦 
𝘳𝘦𝘭𝘢𝘵𝘦𝘥 𝘢𝘳𝘢𝘣𝘪𝘤 𝘸𝘰𝘶𝘭𝘥 𝘴𝘰𝘶𝘯𝘥. - 𝘊𝘶, 𝘛𝘩𝘦 𝘎𝘳𝘢𝘯𝘥, 𝘛𝘩𝘦 𝘎𝘰𝘰𝘥.

-𝘗𝘦𝘢𝘤𝘦.
𝘚𝘢𝘪𝘯𝘵 𝘉𝘐𝘛
Rabbi 𝘠𝘸𝘦 𝘊æ𝘳𝘭𝘺𝘯.
