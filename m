Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526D0487AE
	for <linux-kernel@vger.kernel.org>; Mon, 10 Jun 2024 21:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718055577; cv=none; b=cij9As+7PB2uVrdacEiJM4507Rhdl8aqmEvclUi+APIm5rA6oMWXwi86ffj4h4PtiFWX6HCc0AOmbQUggeJqDxuYlVVahEzAkP/fA1wvyScyMAJTJK0Y2VtmX2/DHgqtyx3vS5/5zSCeVXrV67Kvb/E9BdL3VadheuvWF0O/0Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718055577; c=relaxed/simple;
	bh=p5v03wqk4r/D1AxxClduQGMRMDn4mwY63f4ViqjHShY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CT9yZ6016GKopdJM5yRWx0FZUhSWvUEf9KOYDG+eTrBhVk3V/TgJ2q9wRcK7Ja091Cez7Sc8hu+Dak3V/ttzX4ZXBKhnGnmVxsoqOnYPLSSTC1RU9woIgZQpRaCjHdxf7pRY36WvDVINbBdfJwtimyKVmg34YYoweIDsRpnSnEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iyiVdk9F; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iyiVdk9F"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7041a7d4beeso2662776b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 10 Jun 2024 14:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718055575; x=1718660375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pHhEV7G3TW1fZ8UBVWrGrUiYqsmxXNHg0LEO3pUhV08=;
        b=iyiVdk9F8JJzqwB9sJy54nVyCu4oEkrodn93VwtUs0p7tuH+3Y+CKrXNDj5E0bV72/
         +Edg0+xxx/oCFZPyT9SauD98w/62eWsz7oFvZqbqJMbobXFbk8PEYZdUSL9KuuqNWJ2K
         gqw0p0Vc4p90uENOcsHVikvjLemDt/IX2+LdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718055575; x=1718660375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pHhEV7G3TW1fZ8UBVWrGrUiYqsmxXNHg0LEO3pUhV08=;
        b=b8NRnsLQHDCgnnPb08rAH4zyE8LdusRPkDuvifikHWOM8rNdrSJ23vmtgSxbkVsG+/
         NYixSerj0QkVUi5FJ4+sGIurs2ghnaO4eNs/B22zuVRAt3b8xdE5mf3UX2aUt3F0PCSv
         BVuERIfjTOKesFo2vwaeqGHkgEz7qatNnYpMvOupDwQ4cgzKR9U+YZfVfL1u0TYK5lI/
         /61NpbIRrMlsKiVmHwYbNEHybNItDAPLE6Awi7Ug8N5CEzmjn/u0xOKMrI5qCSR1v0es
         syTXE4p12vK/2KhkJzxU1jNlzSBS9oKf2RRj0vvKf+oBlBOWun4Zvp/QFoK/sskHdTWf
         taUA==
X-Forwarded-Encrypted: i=1; AJvYcCV/W07ziGUXLvqup5mKAgIdYw2akVZJw2iTLjWZ/rAthSA3/Vjbp65lS898ww8yBzjA+BtLInVccPa8Vfbpu/j+HyrQToFnsXJ11z2A
X-Gm-Message-State: AOJu0YxxjRpd8r4iEUiugwvKMCRgoU+55uZKaZtY1tYa9NlXxwnTdaC6
	OSCUJJdJ5igenwvQwbzsIdFkgbnClErFEZeKfn63iDKOzqE7EbEXM8UQHNTJhA==
X-Google-Smtp-Source: AGHT+IG4boBTPxKZMCgQ09XIj5tVBH1DggFDag+OW54rhV83pMU6eb7Ns9uI7ztTOkKSh4pb31/mQA==
X-Received: by 2002:a05:6a20:6a23:b0:1af:8fa8:3126 with SMTP id adf61e73a8af0-1b2f96d6974mr11790746637.6.1718055575491;
        Mon, 10 Jun 2024 14:39:35 -0700 (PDT)
Received: from localhost (213.126.145.34.bc.googleusercontent.com. [34.145.126.213])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-1f6d71a81f1sm67487055ad.98.2024.06.10.14.39.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jun 2024 14:39:35 -0700 (PDT)
From: jeffxu@chromium.org
To: aruna.ramakrishna@oracle.com
Cc: dave.hansen@linux.intel.com,
	keith.lucas@oracle.com,
	linux-kernel@vger.kernel.org,
	mingo@kernel.org,
	tglx@linutronix.de,
	x86@kernel.org,
	andrew.brownsword@oracle.com,
	matthias.neugschwandtner@oracle.com,
	jeffxu@chromium.org,
	jeffxu@google.com,
	jannh@google.com,
	keescook@chromium.org,
	sroettger@google.com,
	jorgelo@chromium.org,
	rick.p.edgecombe@intel.com
Subject: Re [PATCH v5 2/5] x86/pkeys: Add helper functions to update PKRU on sigframe
Date: Mon, 10 Jun 2024 21:39:34 +0000
Message-ID: <20240610213934.3378947-1-jeffxu@chromium.org>
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
In-Reply-To: <20240606224035.3238985-3-aruna.ramakrishna@oracle.com>
References: <20240606224035.3238985-3-aruna.ramakrishna@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The orig_pkru & init_pkru_value is quite difficult to understand.

case 1> init_pkru: 00 (allow all)
orig_pkru all cases  => allow all

case 2> init_pkru: 01 (disable all)
Orig_pkru:
allow all 00 => 00 allow all.
disable all 01 => 01 disable all.
disable write 10 => 00 allow all <--- *** odd ***
disable all 11 => 01 disable all

case 3> init pkru: 10 (disable write)
allow all 00 => 00 allow all.
disable all 01 => 00 (allow all) <----*** odd ***
disable write 10 => 10 allow all
disable all 11 => 10 disable write <--- *** odd ***

case 4> init pkru: 11 (disable all)
orig_pkru all cases => unchanged. 

set PKRU(0) seems to be better, easy to understand.

In addition, kernel overwrites the PKRU during the
signal handleing is a new ABI, it might be the best
to add a flag during sigaltstack(), similar to
how SS_AUTODISARM is set.

> +	return orig_pkru;
> +}
> +
 
-Jeff
