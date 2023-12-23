Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD609453;
	Sat, 23 Dec 2023 09:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZsulTFzY"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a2335d81693so452972066b.0;
        Sat, 23 Dec 2023 01:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703325290; x=1703930090; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bHzDFdj6AAq1EkhQ9b2oKbYVeVHhqzNqLXJeReuch38=;
        b=ZsulTFzYRFPNei18xnwpjCg3Xv0qL5miYtOzb7UEmnzaRZZSmbB3RzGWFweuzc7ZBK
         scEKlHvQlaS9ZfHTlcIB4k7PgF+WMLW6v1gdzsWcpab/OibP2G4UwES5bMkS0XmQJFMA
         EYCfxHZlNPuvdKdknOECUMa3iMh9YFct+t/tb8QCKCUuEGW9jnL9Dmk37LR/dh1fBiO1
         Z+OtpcExFXb2Z97cgZ6T6o7QJhVQ4FMTEoSSSfdgNI2TYi6loB98LQfuM7L0l/Tv5W5R
         oSO/dPYcLeDoRzUtUNibPRVk8jAnS5JCQjnks/HTRb0kMpXfRaZkK/hmNAYZpWBCOoLS
         tIkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703325290; x=1703930090;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bHzDFdj6AAq1EkhQ9b2oKbYVeVHhqzNqLXJeReuch38=;
        b=MpO8fTxBrItgzPF2IBJUYGZvZMvkvvkEYhk+aTSOm0c9PZaZ0xp+mJNVeoQ9GQ++QW
         2VB8VXz0JxEQwtRNtbp0WcuDZyPtWYJ6KJYi4JbsYESFHR6h3HNJL3ldVJYQ5nIVQGBm
         5tbKNH7lFFNupJ6arQ3uhd2+ijyHC0zdYK5vtHCR4wk6iEcHEXmCwq6HoKN1FNxaR/dM
         oSqY1CRNIKvcPdGavjuS+tWmwYiZI5Vxoy/whB8h0yOK3lP85j+jAbsMBF+kLY6LoCaN
         47H/16ijWWe54+T1DPG/7X3GgRueBi1c+DTWYZ74QalgxmjiDT1oc9ruHs9NVHOV6det
         P0pQ==
X-Gm-Message-State: AOJu0YzeagYOZipGZ9fuRtBFuZhSWDPAMB11djxEIfZk6r/IsbJ9Kq3G
	DM2kGH4b+EEWyjro6bfTdps=
X-Google-Smtp-Source: AGHT+IFAKkyHuXC+2ZQsDqt+ykZ/JFqGLUj7vfm5+T11hYdDRntXEYXSmzcejJulP8mOKlYfvtm54A==
X-Received: by 2002:a17:906:c143:b0:a1c:4c3e:99e2 with SMTP id dp3-20020a170906c14300b00a1c4c3e99e2mr4320683ejc.22.1703325289779;
        Sat, 23 Dec 2023 01:54:49 -0800 (PST)
Received: from cjw-notebook (188-23-116-43.adsl.highway.telekom.at. [188.23.116.43])
        by smtp.gmail.com with ESMTPSA id cl2-20020a170906c4c200b00a19afc16d23sm2898160ejb.104.2023.12.23.01.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Dec 2023 01:54:49 -0800 (PST)
Date: Sat, 23 Dec 2023 10:54:47 +0100
From: Christoph Winklhofer <cj.winklhofer@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: robh+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2] w1: add UART w1 bus driver
Message-ID: <ZYauZ1ZlyQYco7Yq@cjw-notebook>
References: <20231221065049.30703-1-cj.winklhofer@gmail.com>
 <b2b9d95e-dcc7-4a3e-b4b4-14d5af964b96@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2b9d95e-dcc7-4a3e-b4b4-14d5af964b96@linaro.org>

On Thu, Dec 21, 2023 at 10:13:01PM +0100, Krzysztof Kozlowski wrote:
> On 21/12/2023 07:50, Christoph Winklhofer wrote:
> > Hello!
> > 
> > Krzysztof, thank your very much for your feedback!
> > 
> > This patch contains a driver for a 1-Wire bus over UART. The driver
> > utilizes the UART interface via the Serial Device Bus to create the
> > 1-Wire timing patterns.
> > 
> > Version 1
> > 
> 
> You already sent v1, so this is v2:
> 
> b4 diff '<20231221065049.30703-1-cj.winklhofer@gmail.com>'
> Grabbing thread from
> lore.kernel.org/all/20231221065049.30703-1-cj.winklhofer@gmail.com/t.mbox.gz
> ---
> Analyzing 4 messages in the thread
> ERROR: Could not auto-find previous revision
>        Run "b4 am -T" manually, then "b4 diff -m mbx1 mbx2"
> 
> I still cannot find the changelog. Does it mean nothing improved?
> 
> 

Sorry, I will fix the patch and resend it.

> > - In v1, the driver requests a baud-rate (9600 for reset and 115200 for
> > write/read) and tries to adapt the transmitted byte according to the
> > actual baud-rate returned from serdev. Is this the correct direction or
> > should the baud-rate be specified in the device-tree? Alternatively,
> > it could make sense to specify the minimum and maximum times for the
> > 1-Wire operations in the device-tree, instead of using hard-coded ones
> > similar as in "Figure 11. Configuration tab" of the linked document
> > "Using UART to Implement a 1-Wire Bus Master".
> 
> Depends, are these hardware properties? Are these runtime? What do they
> depend on?
> 

Ok, the timing constraints came from the 1-Wire protocol, so DT makes no
sense. Probably it would be nice to tweak them for different 1-Wire slaves
via parameter to the driver - however, I will left them hardcoded for now.

Thanks!
Christoph
