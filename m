Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C693A13C813
	for <linux-kernel@vger.kernel.org>; Tue, 26 Mar 2024 14:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711464640; cv=none; b=nhwg7sIzAzz4V2bexy7qHZfbYN6LJ53SFCsDFh42Q1FeYV2Y1e70FpLlp5RNcdqj7hmrVs45MGor1mFIM4Wge/9yUZ1xxDv1J0HqZjct5h4rrwemFWWHhqf+cVZPz/0/mi/HuCQxccds9MtKswdm5zs80M1j7ELrVuGR7ZHtkhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711464640; c=relaxed/simple;
	bh=/0pxlMZ1zHArlripP5Z7xHzTAEUYXB04xQcW7CZIOJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jwcNaV6CaPrIEz32w8OXcYuNm5Yd96kNumNYefrIANOvpaApXRaBnYvwkBWDbqE0ohqo32214j7l6xp9M0zmeS4JDilEgvtYkm5r3PitkVBDbjGnIEE7uacFiEaaJr0T4vgsZLScghEoNqV7aOe5+5F8ghCW9N0ks9wDnOpPx6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A732F339;
	Tue, 26 Mar 2024 07:51:11 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E60713F694;
	Tue, 26 Mar 2024 07:50:36 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jens Wiklander <jens.wiklander@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Marc Bonnici <marc.bonnici@arm.com>,
	Olivier Deprez <Olivier.Deprez@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH v2] firmware: arm_ffa: fix ffa_notification_info_get()
Date: Tue, 26 Mar 2024 14:50:33 +0000
Message-ID: <171146460965.2983730.14931789520460861310.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240311110700.2367142-1-jens.wiklander@linaro.org>
References: <20240311110700.2367142-1-jens.wiklander@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 11 Mar 2024 12:07:00 +0100, Jens Wiklander wrote:
> FFA_NOTIFICATION_INFO_GET retrieves information about pending
> notifications. Notifications can be either global or per VCPU. Global
> notifications are reported with the partition ID only in the list of
> endpoints with pending notifications.  ffa_notification_info_get()
> incorrectly expect no ID at all for global notifications. Fix this by
> checking for 1 ID instead of 0.
>
> [...]

Applied to sudeep.holla/linux (for-next/ffa/fixes), thanks!

[1/1] firmware: arm_ffa: fix ffa_notification_info_get()
      https://git.kernel.org/sudeep.holla/c/1a4bd2b128fb
--
Regards,
Sudeep

