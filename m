Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70834125AE
	for <linux-kernel@vger.kernel.org>; Sun,  7 Jan 2024 05:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Xq7MB5me"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=GK75hswHbptiElM1VpVJwVBjfuxG16GwBE9vIgYAskc=; b=Xq7MB5meLEo2infRm0jmSR5qz7
	qa9ES8pBmV3NeKfNpJQ27QvNdnQs5444mwfRdtGb0LgzUG6vvzlcmttPQ72ekgyIeUA3jo6rUuYFB
	EEy0dkTOtkvjuv95T8UVgRXxhviwu0Kq1J6dFDMSiSOzsknK0u5BUlitlZ5dFLSRr9G1A4Tf/uJkw
	+lDNgfpYEHhaEsoMKFlplPp+VNR7w1wVAXlmaNrZpwI5DiqfcGssFazKGUht3sExoGqdgyTgYLW4S
	vJc7GDGahsiR7oI+bpZzP32YIKbQdtymT6Ddad3Y6H+XL27cNaQvIGR/RRav9ji6rYZRMUF+ki/eo
	+OrPDMSA==;
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rMMAS-002RGq-2E;
	Sun, 07 Jan 2024 05:57:52 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] driver core: component: fix spellos
Date: Sat,  6 Jan 2024 21:57:50 -0800
Message-ID: <20240107055750.22441-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct spelling mistakes reported by codespell.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/base/component.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -- a/drivers/base/component.c b/drivers/base/component.c
--- a/drivers/base/component.c
+++ b/drivers/base/component.c
@@ -751,7 +751,7 @@ static int __component_add(struct device
  * component_bind_all(). See also &struct component_ops.
  *
  * @subcomponent must be nonzero and is used to differentiate between multiple
- * components registerd on the same device @dev. These components are match
+ * components registered on the same device @dev. These components are match
  * using component_match_add_typed().
  *
  * The component needs to be unregistered at driver unload/disconnect by
@@ -781,7 +781,7 @@ EXPORT_SYMBOL_GPL(component_add_typed);
  * The component needs to be unregistered at driver unload/disconnect by
  * calling component_del().
  *
- * See also component_add_typed() for a variant that allows multipled different
+ * See also component_add_typed() for a variant that allows multiple different
  * components on the same device.
  */
 int component_add(struct device *dev, const struct component_ops *ops)
