Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43C876DB3
	for <linux-kernel@vger.kernel.org>; Thu, 21 Dec 2023 21:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hIlTLpLG"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6d775f9af42so1148534b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 21 Dec 2023 13:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703194764; x=1703799564; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zhf1tMf/LW/OHLg68uyfpBGuS1SeOFAZtXiJHVnml2o=;
        b=hIlTLpLGGkvgmyLO0RTh4yZLOIEO+fzUi6Ka3LfKkBNcZQumJc8554FaPaD9S8jOiN
         tWkATeofqktm7v1K0H/aD5Zl6N6AQMvRrQ4MseJBuaHRCpIgnYUdexFTZEpaHWMq6UHt
         L95JjmAsRYbCUREX/B01I/zMTcO4tyZYh7Qhgtg83aB4AACseDK5OEqfbj+Qs0bBQhLt
         KIUGFz7Zvzmcfiy042ZCoDXgBkNYebzz20JzBLE2bovPmfBrvlWgDAwyYxORZ33EomKc
         dqy95v0ubMwu5tDOUyV5pHSIMZyvjCcWvGuoSNnnKRFt4JikhjwtT/7B0rimN48DxztB
         lQ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703194764; x=1703799564;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zhf1tMf/LW/OHLg68uyfpBGuS1SeOFAZtXiJHVnml2o=;
        b=f96EhPKHA9bIpYynVK/bYWkghSQjW+VztCyOIwMJ6l5xVTnubF/s7yzTJhM9q1+ZQ4
         hiw6G8ZbjFyhXvsqLFXaq7TpSsMZSJkghbBifuL2nDo1pMXI2FF9aqm8gOEqh8UgInoJ
         OE2/MJwT655aKJg0UFuQ6mGsGqlSwcvgs2k435cfSGyZvvMYs6Lx7rLithkL/g/t8D5L
         gVNuSvdMqJYlfKOHBM5gPms5clgLW/svd1KQ7NZE5eoYQajcfTwQCWBX7Z6cYJjPpRQA
         /eYeX4EmnBZM7/gcwKCFhZi0L7BC/TwxL3onwx+BhgImFB/2gZSbXkp0eSkWFSJW4jr9
         qW5Q==
X-Gm-Message-State: AOJu0YygstSel65joGmYWz2GXVDdv7/oXcSfh6nTqGT8V6loxqgmFoqE
	sb7yhUTJ3bi25xoPTamUy/4=
X-Google-Smtp-Source: AGHT+IHaUrm8pe5sgjvamwM6v3eUT9UyaiNbjq9xjkpWghC26nSJEW1PJYY0e1I24Uu0U2EGeEAUrA==
X-Received: by 2002:a05:6a20:4290:b0:18f:97c:9768 with SMTP id o16-20020a056a20429000b0018f097c9768mr477629pzj.80.1703194763902;
        Thu, 21 Dec 2023 13:39:23 -0800 (PST)
Received: from localhost ([121.167.227.144])
        by smtp.gmail.com with ESMTPSA id j20-20020a056a00235400b006d6b6c0b569sm2052478pfj.219.2023.12.21.13.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 13:39:23 -0800 (PST)
Sender: Tejun Heo <htejun@gmail.com>
Date: Fri, 22 Dec 2023 06:39:21 +0900
From: Tejun Heo <tj@kernel.org>
To: Audra Mitchell <audra@redhat.com>
Cc: linux-kernel@vger.kernel.org, raquini@redhat.com,
	jiangshanlai@gmail.com
Subject: Re: [PATCH] workqueue.c: Change workqueue to accept variable length
 name
Message-ID: <ZYSwieA7FeYLh5Ey@mtj.duckdns.org>
References: <20231215193954.1785069-1-audra@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231215193954.1785069-1-audra@redhat.com>

Hello,

On Fri, Dec 15, 2023 at 02:39:54PM -0500, Audra Mitchell wrote:
> Currently we limit the size of the workqueue name to 24 characters due to
> commit ecf6881ff349 ("workqueue: make workqueue->name[] fixed len")
> As device names increase in size a static size for the workqueue name no
> longer satisfies the size requirement, leading to truncated workqueue
> names as we append the device name to the workqueue name. Truncation of
> the workqueue names can cause issues when debugging as each is unique to
> the associated device. Bring back the flexibility of a variable length
> workqueue name to prevent truncation.

I'm not necessarily against it but workqueue code uses that name to
construct rescuer names which are exposed through /proc/PID/comm and so on,
so too long a name can become a nuisance too. Can you give some examples of
the names where 24 char limit is an issue? Can they be shortened?

Thanks.

-- 
tejun
