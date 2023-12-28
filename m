Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F63F64D
	for <linux-kernel@vger.kernel.org>; Thu, 28 Dec 2023 00:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iwanders.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b="f4rM+Gmr"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-427e8bb6778so6546941cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 27 Dec 2023 16:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iwanders.net; s=google; t=1703723694; x=1704328494; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g7pRev8d8xqftOZokIk69L3uMsCe9icbzoBaKLUC/8I=;
        b=f4rM+Gmr4L40thb/bMT6suveiR5gOI6+qndTSdwuJ1Oj6pql565GYMJrKxnZXEkrjy
         YEVWiFeseA63ONDvK9TjhDhfPqVIf+VXB67+NrX9pvqQDCIFnQnXDtnqVqZcmHJ3/9th
         rr2cjk9A0w+9La39JSvC7KoviCEK2fIVQIj30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703723694; x=1704328494;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g7pRev8d8xqftOZokIk69L3uMsCe9icbzoBaKLUC/8I=;
        b=H1GdtxOJBxD2t6A4mPy1YKGE9eefeXsg/RB2YOrCMtg67+cS2W3fwLry4s6wKAwyRu
         ENyvTI8Nge47hEzjmiKWTnl7ZhlvDzwEH2AlyMZgl6BCIvebZKjJLJoD1vCqtxIG+cHb
         Kf1QjHSQ8xsk7A9LybquTWS9lojAUuPB5YXcD+QWPKMnaJCWn98K/23x13Jcy7ZyPP08
         lTbOYCztbPT9q+gi7tI7vtMwFpNGt6CnxYpxCIcJTeVL8UzoECe1C4kUTFODTHb/lCI4
         SGY/OXxq1IoBvGjQpND+Vwlqdyp9zcZqDUXB2mYPi6w/uzhakWxqspzAvOqDeHGTZWLJ
         Jl+Q==
X-Gm-Message-State: AOJu0Yzx++47l0xhHNrHCDX2XkE0o0jMOTB5PEvvLwNiFbjsunQOm6nc
	fHZYgBGzXNsbUAwpmdo1zV810Wh/OHqtcw==
X-Google-Smtp-Source: AGHT+IHcAEuSKkn6x06Zu63E79EVZA3zt3OkurPc2n5wJ8H130ik0UbN0GgFacU8nTALVPConu8aBA==
X-Received: by 2002:a05:622a:346:b0:423:ea2f:d604 with SMTP id r6-20020a05622a034600b00423ea2fd604mr10813977qtw.46.1703723694313;
        Wed, 27 Dec 2023 16:34:54 -0800 (PST)
Received: from eagle.lan (24-246-30-234.cable.teksavvy.com. [24.246.30.234])
        by smtp.gmail.com with ESMTPSA id fb9-20020a05622a480900b004279315b3besm7710684qtb.0.2023.12.27.16.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 16:34:53 -0800 (PST)
From: Ivor Wanders <ivor@iwanders.net>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Ivor Wanders <ivor@iwanders.net>,
	Hans de Goede <hdegoede@redhat.com>,
	Mark Gross <markgross@kernel.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 0/2] Surface fan monitoring driver
Date: Wed, 27 Dec 2023 19:34:42 -0500
Message-Id: <20231228003444.5580-1-ivor@iwanders.net>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Second version of a hwmon driver to monitor the fan's rpm on Microsoft 
Surface devices, originally submitted in [1].

Changes in v2:
  - Removed all unsupported sysfs attributes from the hwmon driver, leaving
    the fan input as the only supported attribute.

[1] https://lore.kernel.org/linux-hwmon/20231220234415.5219-1-ivor@iwanders.net/T/

Ivor Wanders (2):
  hwmon: add fan speed monitoring driver for Surface devices
  platform/surface: aggregator_registry: add entry for fan speed

 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/surface_fan.rst           |  25 +++++
 MAINTAINERS                                   |   8 ++
 drivers/hwmon/Kconfig                         |  13 +++
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/surface_fan.c                   | 105 ++++++++++++++++++
 .../surface/surface_aggregator_registry.c     |   7 ++
 7 files changed, 160 insertions(+)
 create mode 100644 Documentation/hwmon/surface_fan.rst
 create mode 100644 drivers/hwmon/surface_fan.c

-- 
2.17.1
