Received: from mx9.didiglobal.com (mx9.didiglobal.com [111.202.70.124])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 242055C8EF
	for <linux-kernel@vger.kernel.org>; Tue,  2 Jul 2024 07:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.202.70.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719904688; cv=none; b=JnPc7s4/f6FIu5fGVelsGqVi+Xu8UZwSsL5kiDxi1kJQA3Hz4BI8fiPTRKmdExBfNpMCwQMw58ClOF0J+B/UQlOpW+H+WLAPsWIVEeMtx2m+bg30L8/+PsW36FYeNgrpxBiz5ss2xGgZ/lFU7EHDpGeV5W6+cEFNx5GqMYA4Fxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719904688; c=relaxed/simple;
	bh=WX/tN/BM64QozzlJWs1MQlVZ04eFrPrXChr4OFvD57Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:Content-Type:
	 MIME-Version; b=qfruLsHcio5DgQlFI7h1nMaUv7o0U8kqgLW/b1EEuizSsXsisNvIh/UzWUwMsFYtGPoj/WBgXpRfa5LrkXamTQOwWkynybVvVcS0ajhKARr7nHKBZdcoXIgtxD4sy3NpOzvLw1PyUZaa/EaolcElt/G9+aV55L59hzLAYEhWTm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=didiglobal.com; spf=pass smtp.mailfrom=didiglobal.com; arc=none smtp.client-ip=111.202.70.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=didiglobal.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=didiglobal.com
Received: from mail.didiglobal.com (unknown [10.79.65.11])
	by mx9.didiglobal.com (MailData Gateway V2.8.8) with ESMTPS id 1E6441813CFA0A;
	Tue,  2 Jul 2024 15:14:28 +0800 (CST)
Received: from ZJY02-ACTMBX-02.didichuxing.com (10.79.65.12) by
 ZJY02-ACTMBX-01.didichuxing.com (10.79.65.11) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 2 Jul 2024 15:14:33 +0800
Received: from ZJY02-ACTMBX-02.didichuxing.com ([fe80::34e0:2b02:390f:20f4])
 by ZJY02-ACTMBX-02.didichuxing.com ([fe80::34e0:2b02:390f:20f4%4]) with mapi
 id 15.01.2507.039; Tue, 2 Jul 2024 15:14:33 +0800
X-MD-Sfrom: tiozhang@didiglobal.com
X-MD-SrcIP: 10.79.65.11
From: =?utf-8?B?5byg5YWD54CaIFRpbyBaaGFuZw==?= <tiozhang@didiglobal.com>
To: Madadi Vineeth Reddy <vineethr@linux.ibm.com>
CC: Steven Rostedt <rostedt@goodmis.org>, "mhiramat@kernel.org"
	<mhiramat@kernel.org>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Mathieu Desnoyers
	<mathieu.desnoyers@efficios.com>, "zyhtheonly@gmail.com"
	<zyhtheonly@gmail.com>, "zyhtheonly@yeah.net" <zyhtheonly@yeah.net>
Subject: Re: [PATCH 1/1] tracing/sched: sched_switch: place prev_comm and
 next_comm in right order
Thread-Topic: [PATCH 1/1] tracing/sched: sched_switch: place prev_comm and
 next_comm in right order
Thread-Index: AQHakLITnjuNapPR10WQekCFw15ofrF1KT8AgG5UVQA=
Date: Tue, 2 Jul 2024 07:14:33 +0000
Message-ID: <024001B4-3995-4B45-8724-536E02D2BD1A@didiglobal.com>
In-Reply-To: <14898c69-6a2e-4a9d-a0d4-d674087cd1ae@linux.ibm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <789CA36876CD9846994369A4A7D35480@didichuxing.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

SGkgU3RldmVuLCANCg0KUGluZyA6KSANCg0K77u/T24gNC8yMy8yNCDkuIvljYg2OjI0LCAiTWFk
YWRpIFZpbmVldGggUmVkZHkiIDx2aW5lZXRockBsaW51eC5pYm0uY29tIDxtYWlsdG86dmluZWV0
aHJAbGludXguaWJtLmNvbT4+IHdyb3RlOg0KDQoNCkhpIFRpbyB6aGFuZywNCg0KDQpPbiAxNy8w
NC8yNCAxNTo1OSwgVGlvIFpoYW5nIHdyb3RlOg0KPiBTd2l0Y2ggdGhlIG9yZGVyIG9mIHByZXZf
Y29tbSBhbmQgbmV4dF9jb21tIGluIHNjaGVkX3N3aXRjaCdzIGNvZGUgdG8NCj4gYWxpZ24gd2l0
aCBpdHMgcHJpbnRpbmcgb3JkZXIuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBUaW8gWmhhbmcgPHRp
b3poYW5nQGRpZGlnbG9iYWwuY29tIDxtYWlsdG86dGlvemhhbmdAZGlkaWdsb2JhbC5jb20+Pg0K
PiAtLS0NCj4gaW5jbHVkZS90cmFjZS9ldmVudHMvc2NoZWQuaCB8IDQgKystLQ0KPiAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvdHJhY2UvZXZlbnRzL3NjaGVkLmggYi9pbmNsdWRlL3RyYWNlL2V2ZW50cy9z
Y2hlZC5oDQo+IGluZGV4IGRiYjAxYjRiNzQ1MS4uYTRiZDQzMzBkYjRjIDEwMDY0NA0KPiAtLS0g
YS9pbmNsdWRlL3RyYWNlL2V2ZW50cy9zY2hlZC5oDQo+ICsrKyBiL2luY2x1ZGUvdHJhY2UvZXZl
bnRzL3NjaGVkLmgNCj4gQEAgLTIzOSwxMSArMjM5LDExIEBAIFRSQUNFX0VWRU5UKHNjaGVkX3N3
aXRjaCwNCj4gKSwNCj4gDQo+IFRQX2Zhc3RfYXNzaWduKA0KPiAtIG1lbWNweShfX2VudHJ5LT5u
ZXh0X2NvbW0sIG5leHQtPmNvbW0sIFRBU0tfQ09NTV9MRU4pOw0KPiArIG1lbWNweShfX2VudHJ5
LT5wcmV2X2NvbW0sIHByZXYtPmNvbW0sIFRBU0tfQ09NTV9MRU4pOw0KPiBfX2VudHJ5LT5wcmV2
X3BpZCA9IHByZXYtPnBpZDsNCj4gX19lbnRyeS0+cHJldl9wcmlvID0gcHJldi0+cHJpbzsNCj4g
X19lbnRyeS0+cHJldl9zdGF0ZSA9IF9fdHJhY2Vfc2NoZWRfc3dpdGNoX3N0YXRlKHByZWVtcHQs
IHByZXZfc3RhdGUsIHByZXYpOw0KPiAtIG1lbWNweShfX2VudHJ5LT5wcmV2X2NvbW0sIHByZXYt
PmNvbW0sIFRBU0tfQ09NTV9MRU4pOw0KPiArIG1lbWNweShfX2VudHJ5LT5uZXh0X2NvbW0sIG5l
eHQtPmNvbW0sIFRBU0tfQ09NTV9MRU4pOw0KPiBfX2VudHJ5LT5uZXh0X3BpZCA9IG5leHQtPnBp
ZDsNCj4gX19lbnRyeS0+bmV4dF9wcmlvID0gbmV4dC0+cHJpbzsNCj4gLyogWFhYIFNDSEVEX0RF
QURMSU5FICovDQoNCg0KWWVzLCBtYWtlcyBzZW5zZSB0byBoYXZlIGFsbCBwcmV2aW91cyBhbmQg
dGhlbiB0aGUgbmV4dCBmb3IgaW5jcmVhc2VkIHJlYWRhYmlsaXR5Lg0KDQoNClJldmlld2VkLWJ5
OiBNYWRhZGkgVmluZWV0aCBSZWRkeSA8dmluZWV0aHJAbGludXguaWJtLmNvbSA8bWFpbHRvOnZp
bmVldGhyQGxpbnV4LmlibS5jb20+Pg0KDQoNCg0K
