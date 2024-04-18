Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F03C16ABD8;
	Thu, 18 Apr 2024 14:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713452292; cv=none; b=U/9CSqAPz1QrpabgyXWhpqQzniGpLqligLzUhuuBCcjKEHxWgXvHDe/V6baBvd4083lPRzkn5ONMrS+vrjSFgpzekwXOmR+oGilDX2Vw/t0PmJUObjSE5xwz2asmsqZv8HyCE+SMmS6yYHx8GxGPMstZ2WDh2xlogccVcAicaUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713452292; c=relaxed/simple;
	bh=/5oSkuDJAArud9gZ/VsWUrH2hogQeBaRQ8aAYn5k1LA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A4iOYddMWoC/ljRGJMacMeQzEcgyBQaCtcHc748lMxHZqBIT3KP+quwdXizOFjgEmBqA95z8lJP4AhFle3tMTtmReYtAJwR56AfWE6aT8dorTcOfuzGe9JJwWjN5EON3/ijCyOcdUbqntnmHm3vFPqwXz73TgGwBRpJ6Zw2lkeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DRe7Yp8g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DRe7Yp8g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A44AC113CC;
	Thu, 18 Apr 2024 14:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713452292;
	bh=/5oSkuDJAArud9gZ/VsWUrH2hogQeBaRQ8aAYn5k1LA=;
	h=From:To:Cc:Subject:Date:From;
	b=DRe7Yp8gRTlxSZYk0T1zV0fioZNAZpn1yIKERsk4VphLKcSrt+qBNlQYN/Lv0Aqb5
	 P46Me0GZZjur9BldXbznMkPIDMj2DFrvh0xsGeAZC/+8Ggq55eXcdgZxT2PF9EZRTo
	 8T4Xg4Gq02AnhuTjhwb/ZAhozLoc14gGv+bgeSkN5LmRBnndGao5VX98YR14eU+Pfq
	 0i07vhwXfXaVhOpUCQbAwiQO1dGcdnyb8VkTeq5QDCz1UGFy/Ci5gTAChT6+ESBCXT
	 2MzBO2L2o/FM1pk4w1HQM56CHqmGlP6os14syMD9HbVta2l5BmhK3Q7JdaTTfleWV2
	 ZvUeHTWipKKuw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1rxTDJ-000000001DP-3MOl;
	Thu, 18 Apr 2024 16:58:14 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 0/2] usb: typec: qcom-pmic: fix use-after-free on late probe errors
Date: Thu, 18 Apr 2024 16:57:28 +0200
Message-ID: <20240418145730.4605-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When reviewing a patch updating the qcom-pmic typec driver, I noticed
that the error handling is broken and can lead to use-after-free.

This series addresses the use-after-free and also fixes the error
handling in the pdphy_start() callback which failed to disable its
supply in all error paths.

The latter fix is not marked for stable on purpose as its not a critical
fix (I'm sure autosel will disagree).

Johan


Johan Hovold (2):
  usb: typec: qcom-pmic: fix use-after-free on late probe errors
  usb: typec: qcom-pmic: fix pdphy start() error handling

 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c       |  8 ++++++--
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c | 11 +++++++----
 2 files changed, 13 insertions(+), 6 deletions(-)

-- 
2.43.2

