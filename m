Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B98953389;
	Sun, 14 Jul 2024 11:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720956590; cv=none; b=NT9syxcgif4gbR7qqFZIhgYwhLddB647MHmKnjjL3rzofWCv0v+gmCBx4UxA0yFO3V+Omqxhj+GjDcsUAFY5IH5Pja8YKf6lSbPq6tNaGmO0x757juh4C1lHomFZJ0IvL4Ihys01FOeMU+lkwkstdrFm/gBOFIH6XPm9WEYC4HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720956590; c=relaxed/simple;
	bh=zcBMhHRIzCy1qilRgGzPg+YvD7nhirJqK3VKq5OGrsU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=U2kBSh5dSCKliXnf4WSnKCit2sDgEwZXnklgN8bzI8A4+2tT18AM4bCGUFflRI2q2iDjVyyCtFjwNqx8v40+0pnU6PESpvzdRr1sfRUmYoROIVZbU2grxiq0c3VF90PoPDh8KltjdvXUgPaYpsgm8rLft0ZBlxcmZdIJZ9Q2CVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=G0QnU7uW; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="G0QnU7uW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=kG1SH
	qIBXuf73aIQbp7aBOFRVf/G0bJieYKHxl/hC4g=; b=G0QnU7uWbYikGJUTGbLXT
	Gn8DS15UDGnOR3mCRgENm/cju/huqcHdD0wPLIOIYgE3sr721apADiQqcj/hNosv
	YWHrc2GTvTBkfd/LnBAe1+sEYLRJnZnkYr6V+oJ7o7piLPttdeJpG8RedNj5qZuD
	9ula+L7ZMZd/SSmexyDZPo=
Received: from ProDesk.. (unknown [58.22.7.114])
	by gzga-smtp-mta-g3-0 (Coremail) with SMTP id _____wD3v711tpNm6c94CQ--.57334S2;
	Sun, 14 Jul 2024 19:28:57 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: dsimic@manjaro.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andyshrk@163.com>
Subject: [PATCH 1/2] dt-bindings: arm: rockchip: Add Cool Pi GenBook
Date: Sun, 14 Jul 2024 19:28:50 +0800
Message-Id: <20240714112851.1048184-1-andyshrk@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3v711tpNm6c94CQ--.57334S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XF13urWDZryDGF4kGFWrGrg_yoWfGrcEka
	4xZrWkGF1rtF1Y93Wjyay8GFy5Aw42kFn7A3W5JF1DAwn8JwsxtFWkt34SkFyxuF17urn3
	uF1rJrWDuFnxGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRR4lytUUUUU==
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqRocXmVOBfRQJAAAsf

Add Cool Pi GenBook, a laptop powered by RK3588

Cool Pi GenBook works with a mother board connect
with CM5

Signed-off-by: Andy Yan <andyshrk@163.com>
---

 Documentation/devicetree/bindings/arm/rockchip.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1ef09fbfdfaf..e4f2ae9ec457 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -96,6 +96,14 @@ properties:
           - const: coolpi,pi-cm5
           - const: rockchip,rk3588
 
+      - description: Cool Pi GenBook
+        items:
+          - enum:
+              - coolpi,genbook
+          - const: coolpi,pi-cm5
+          - const: rockchip,rk3588
+
+
       - description: Cool Pi 4 Model B
         items:
           - const: coolpi,pi-4b
-- 
2.34.1

