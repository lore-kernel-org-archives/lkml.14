Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADE82905
	for <linux-kernel@vger.kernel.org>; Wed, 13 Mar 2024 14:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710341510; cv=fail; b=WVc1w6AyMhQLsKxmnAtaZfj0XxzklmIJHXk+EkMr26Xmkys9ZOeTLhvCYaQz1j3b0UEMZZDmeyqp/aUirm7BhR7Ef5Ps7R4w3sc1CuEnJIWOVFP7Ygld95Y5XcEFdWtw+W/Zywfpxrr/kWCQKOwc653tp2VR0ZxYxcTTzOy0Dxs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710341510; c=relaxed/simple;
	bh=Zz37TzgdR79iTguik3SkH6+mYICrBe5a1bzBXUZdO9Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=k26b0VWVR55g2PTW0mL/6R+8SjJfkTsdiajewN2Hsc+xGezWKXXsXwQ5EcdzVh6q2CQz/XNa6jGlak+1yP5gtFn1cVcw6Snf3k+8S41jKfWxQ0DRh79yEjOBcbR6xjjZYq+sep5oodmq0yeWzvwooq+pb/T9KKUExOC/il4vaQw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jcCqIDSv; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jcCqIDSv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710341509; x=1741877509;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Zz37TzgdR79iTguik3SkH6+mYICrBe5a1bzBXUZdO9Q=;
  b=jcCqIDSvelx8raaCA/jn7BdE4aWLaz4M2B6xlJJx7YirOoZ+JYGyYPV7
   jrBsrAxiOdQxGzz6QW8W+8N7JHAI2cj82uSi2BGuEoqqmhHN1Br5/nD4t
   HO0Lf+xxBzX9r+5uG4mGdAC2GZoKn8XodjQHbZBuGlAhpMrpq95o4Hmd3
   f2xpJOwWMuwvndoCBfx676ddVnYRsoiMXs9ngbL+3RurPszmm3vyiW4QU
   KbiBtJbqfX9k8/uaVG36gZ4DBuRo8GRZ3qHgrM017P2aV23juKoDnCMQx
   mUpP55+P1UHDL8k0fBqGZFonsdgYwDFbqW3fNf4ns66PdHALWPvo5qqfR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="5717038"
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="5717038"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 07:51:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="11851064"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Mar 2024 07:51:48 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Mar 2024 07:51:47 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Mar 2024 07:51:47 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Mar 2024 07:51:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CaMJ6JhKimU7jzzJVGDNBBaViBzjNp3Sg5hsSAnY1OOYZrIKcamrVAZDavnsb2C3Nq4Tag9Ta/1tvuctHnZg3pTJxfXGWczx0ua6LpH+/cMHMGcSe3e4wwjmr8OwoGAQ4g/KUAphpfYCEsvPTUssj53gP3K0y8h3++dnZXJT140ZB6A4fW5x/q3i3K08op0+YSDZ9HTdGshlE1l4ee/rUJErO5AMDVmMS5vlvH7AfBrfTUR29SGTQZ2DRG0Y9lV6TF4+gM2hnqUvPNKRSK0jPCkvB3ShbQhmMxmlYDffwfng0eJz6pAS2IYfVvlvUt65W4ozjxu5j0R8qPsq+T23mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zz37TzgdR79iTguik3SkH6+mYICrBe5a1bzBXUZdO9Q=;
 b=GJPCHmfF4rDFptCk+zla6Jx4Dm2cMoh4Y2LqeS6lBubMgAI5C/dbLPUkLuvk49gv/HUrLU601LmOy2xALqchIbSp2/bzdlg3ckV3vU9UDCcCopqS8fKAx0acCOGb2ENMXMjAg95XXjZAHsI4FiEB7o0lWAvYpPpPrp3SYUdgsU0tdpdork0I6xL6UlqF6GCtYCxQ2RbbuuNoLSOMxMYS34eoVIacc3IyL4HLJwV71B6kr9yeNz+unR4+KhV0+YaVnsDkw5Z9WnzUuREi33zBzO4cDQmbF6U9wOTJ618bxFx0wFY/XrSywokiE7xXMksyLgjyAV3huLD7hu8Jx8ONJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by CH3PR11MB7673.namprd11.prod.outlook.com (2603:10b6:610:126::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.18; Wed, 13 Mar
 2024 14:51:43 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::fc9e:b72f:eeb5:6c7b]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::fc9e:b72f:eeb5:6c7b%5]) with mapi id 15.20.7386.016; Wed, 13 Mar 2024
 14:51:43 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "debug@rivosinc.com" <debug@rivosinc.com>, "luto@kernel.org"
	<luto@kernel.org>, "x86@kernel.org" <x86@kernel.org>,
	"Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "keescook@chromium.org" <keescook@chromium.org>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "hpa@zytor.com"
	<hpa@zytor.com>, "christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "mingo@redhat.com"
	<mingo@redhat.com>, "kirill.shutemov@linux.intel.com"
	<kirill.shutemov@linux.intel.com>, "bp@alien8.de" <bp@alien8.de>,
	"tglx@linutronix.de" <tglx@linutronix.de>, "peterz@infradead.org"
	<peterz@infradead.org>
CC: "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 02/12] mm: Introduce arch_get_unmapped_area_vmflags()
Thread-Topic: [PATCH v3 02/12] mm: Introduce arch_get_unmapped_area_vmflags()
Thread-Index: AQHadMz59t1/4ENE0ES3XenXRq6QSLE1RNoAgAB9dwA=
Date: Wed, 13 Mar 2024 14:51:43 +0000
Message-ID: <dff7c527fc235a2b9493aaf38e0a4b8634374edf.camel@intel.com>
References: <20240312222843.2505560-1-rick.p.edgecombe@intel.com>
	 <20240312222843.2505560-3-rick.p.edgecombe@intel.com>
	 <d8af66d6-4ba7-45f6-877c-e89627506551@csgroup.eu>
In-Reply-To: <d8af66d6-4ba7-45f6-877c-e89627506551@csgroup.eu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|CH3PR11MB7673:EE_
x-ms-office365-filtering-correlation-id: 5b5af1e3-a727-4a87-c91d-08dc436d1970
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uLL+XWY1O4bQE82/RLuwBHxps0z+EAetpj1YALrH3YyESGrlyTW5LFUKG0X/6RWQ4ib2sbMlnkRmdI2FrRl6aFY2AoVyxnJp6se7oAQrnk/RHW0JtTwSJ+oJZRxkbWV1W6MbCZeXsvj8bxzxP6F5Wtg9s9Q+lf4A316kKN4lQx6ncxfXv3h413SqX/FeafGPU8KKHa0YWTQHl9lEh71judJiyIFD7YdhJ/f0Duahw88h1Dx9F5Zli8yf0ZDeIFwZLwhzXXzQSi9oO+OkAZusOZoej4knlQpCzWCpstWOw6B4bPza8JfrigUcD9A0day1BIYs0ec0qtVQ9v7wWRXEktNIxMwUWhlwy4WphSrTAg8GlmJDSBbLdNtjm/k+C23/s7JNe/YXwXrwquAQ5Df2Au9uDeG3LTX2QDErJFR63Qul4unlzpYApS/dkJZPxjs9J7n96XKcajUA38kMrbZF+j3aBZX2v+vTWJjBpVuU+ufJQrePOCXSjvLumjflVFe4bDefQfWpBMe2jxmE+6nUqzU9re1wR6vhwCwi2EaCaEydH3Ji7AoTZqyAfk5vG9txMc9O3o5X3ObrprTAzjaLAscOD7BKYp1L6l1GBa5R7qvUaKVVEgxld2kAmVOBmHdfQeHCpVMTm78I5tndJyCw1frXPGcAD0hZqpitUFBApDB3QCsak1KwjCmvsMdlA6Cge9OqsChboeZE/1868cFVwQ1NGJDI+vl7XI1efNSaq5A=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(376005)(38070700009)(921011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UUNqL3VxK1ZYalNqR29nbnJkMmxZbENWdWhIa3p6Nzlja1FDM0gxMHBNbWVo?=
 =?utf-8?B?RkxJeFk1NC83akVTQWlYbDNvQ2FDY2ljSWRvNDkrdzBHbnJPYWZaVmFQSVh0?=
 =?utf-8?B?TzdLRFpyeTV2cHdnc3Y5SDlEVCtMeWh0eSt2Nlh5bmxrUmFFNW5RaUFjNldB?=
 =?utf-8?B?bmoyanczNnd3UUZRWXdWUEg5KzRmYXM0eGsvQ0hBajV0akxmZ29JTEIwTk9u?=
 =?utf-8?B?am16T1M2V3o0VkhhMjB3dGdqOUoyNTdzbkpPM1dmMG15Wkx0NXliZ1ZDTnVJ?=
 =?utf-8?B?SWptNnZCQzJoU2U5UzZzSXNHdGExd3YrdHBXYkx6MEFuSmJpOEVBYVlFUmxh?=
 =?utf-8?B?N08yZ3Rla2grWlFERGQvT2lwWm9kcmZZNFJYYVZIQWVUb0QzRW9XMlVZb2pO?=
 =?utf-8?B?SDBabnVvRGF1WHNSUGNVQlk1bTRJNTJCcmN1WEJTZEZaZkxlQkpFay9Pc0lz?=
 =?utf-8?B?a2Mybk9UcFZjazd0aUZLOTJiYkphaFgyTGdHK3RTZXNvSGdWeWtpM0dXVktN?=
 =?utf-8?B?SXk1Z1lBbHBmaTJneWl2QVk2a2VxWGg4U2JLYXhuc1VFNnpTV1ZZMEtJSit0?=
 =?utf-8?B?K1FnUk52eC9KZkZEeWxra0l4YTdZNitjT0Z2aDNvS3lSMlBadjRLYUY3dXRr?=
 =?utf-8?B?Tm1QRjVGdGpVdWx3MjBPamRTdXU5dHQvTG9MbjdjVnRvLzJNRVhvRFZiZVRu?=
 =?utf-8?B?S3J2UnQzakdZbGw0NUtMTG5RL2VhbEExdytWM0FSejl6VTFva2FoaTRGaldL?=
 =?utf-8?B?ZzkzM2tMbGo3ZHBaNFJETWRPSkp4WXhac2pKN2N4cmpYS2QvTFcwSzFjdFZq?=
 =?utf-8?B?OWEzVjRReGpLU2ZmdnpIMlBKRnE4Q3BQb2JEV28xc1ZSSEVTOUVnbk9wbGxp?=
 =?utf-8?B?elpPR3pML2JWRDRIbElQVFJ2ZmtNL3VnSjA4NXFDRFBqN05qckhBTnhhbmtB?=
 =?utf-8?B?bm0vTHBZM1J0RURVZUgyM1V3ODQ0aFpER2NBS05MVnp1TmgwdVBIdVdYV1Fl?=
 =?utf-8?B?SE9LZGRmaTJEODlVUU41ZmlqZ3R4Ulo2Z3I4VXpiaVRocWFTN0pQSEI0UHAw?=
 =?utf-8?B?NWdGNmxyYXlTUUdPSi9NSis5eVVzRlc0TkJuckdZRWxJZDQyVWtiOTVKODMx?=
 =?utf-8?B?Mmh1aDBHSFp1OTdhYnI3RFdyMmprNTR2RlNDTUxQRUtaQUZ2SUdWVDF4OGI4?=
 =?utf-8?B?aDBYbWx5emRvM3Zuby9TZnAxQXZSaW4xV1BXZVo2Vm5xNms1a2VvT3o4dzMw?=
 =?utf-8?B?bytVQTNPRjNUcm5tT1A3eCs2MHp0OUxoNFZ3OWtHT2h1K1QxcGRUMlhZMlJk?=
 =?utf-8?B?eldYRXp5UjBJbnRITWNtNVIyUG1ERmlWaTlFeW9CQU8wNkhZRDBVZWd4NmlO?=
 =?utf-8?B?bGJqdUdDbExmUjBKNVRjUCsyRUxBckNQb0hTSEJCVFQ3a1dFWUVFTW1wSTlm?=
 =?utf-8?B?MHpSM2YvSmhaVXAwV21TT2x5WitlMW9CSmg4WmdhNXV0b09EeEV2MWtzeTZK?=
 =?utf-8?B?TU1sTUZiaXJ5cjNENVBmRVNtTUtFT1pSSE9iQ2l3K2ZQSHFkT1RvbzFES0pt?=
 =?utf-8?B?MXNzTWttVWhUVnhXSmRVZG00MWppLzJkLzlvTWRtSDMrcnZxcW5wTzMzeUxK?=
 =?utf-8?B?STBSMWRYTXRGR0hPQTdmOGEyeG5xcWU5dy9MRzVwMS84cElBVGI1MUllZFhn?=
 =?utf-8?B?aVlNSzE0aklkRVpYakd0M1NGS0xla2s4dkZvOVBuaS8wNmtxQ2pNNDhPTnI1?=
 =?utf-8?B?K0FVM25nY1RVQ3V1SWFzMjE4ZEtFUitwemRFZXgzdDJsc20wSG5uUmxoQUIz?=
 =?utf-8?B?UU9ZWHBMNDRxNTBPUE5nS05YU1FkaEZwbnUvNy9UcHl2bWlDQVAyRmNmNnZ4?=
 =?utf-8?B?Z0o5My9kM0Foanl2ZEpTemxITGtXRVdwS2VWNmVVbk5FTkU0NnNIZGRIMUN0?=
 =?utf-8?B?T1UzdkNWR2tTTmNZNkdqUHpqUHcxdmNsZmdYRnJlUWhLay9SL0hmRTZUaTB2?=
 =?utf-8?B?dmFNdkNCaHRla1hMN2NVRjliUEZUMVhaZjdPeFRob3JzVVlPSkl6ZUUvQkRC?=
 =?utf-8?B?VGxrR0kxbEJZV1JjcDU1Qy84R0lDenFiM0pWcEdXamFDUmU0aWgrdnU5NlQ1?=
 =?utf-8?B?aXcvVjFZdzZCWFRGNk5ua1lRaGlkQkNVSFJ1T0E0SS8yaVMybHg0U0F0K0hl?=
 =?utf-8?Q?OLvLztJYMFszQ6BvzQPEJb4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <75218F9BDED3334F97E581A832BE4C04@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b5af1e3-a727-4a87-c91d-08dc436d1970
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2024 14:51:43.6765
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PbyZQhgjugI91D6+9KlkHuruvhLS404eawckZD1hEFdY6jlf4oQfi0nIL4XGu0xHP6Nzb3EXxtyKLM5FnXCJeiKz/R8LosgOnlcexeVPcm0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7673
X-OriginatorOrg: intel.com

T24gV2VkLCAyMDI0LTAzLTEzIGF0IDA3OjIyICswMDAwLCBDaHJpc3RvcGhlIExlcm95IHdyb3Rl
Og0KPiANCj4gUGxlYXNlLCBubyBuZXcgImV4dGVybiIsIHRoYXQncyBwb2ludGxlc3MgZm9yIGZ1
bmN0aW9uIHByb3RvdHlwZXMgYW5kDQo+IG91dGRhdGUgY29kaW5nIHN0eWxlLiBDaGVja3BhdGNo
IC0tc3RyaWN0IGlzIGxpa2VseSBwcm90ZXN0aW5nIGFib3V0DQo+IGl0Lg0KDQpJIHdhcyB0cnlp
bmcgdG8gbWF0Y2ggdGhlIHN0eWxlIG9mIHRoZSBzdXJyb3VuZGluZyBjb2RlIGluIHRoZSBoZWFk
ZXJzLg0KUHJldmlvdXMgZmVlZGJhY2sgd2FzIHRvIG5vdCBmaXggc29tZSBhbGlnbm1lbnQgYXMg
d2VsbC7CoA0KDQpCdXQgdGhlIGV4dGVybiBpbiB0aGUgbW1hcC5jIGZpbGUgd2FzIGp1c3QgYSBt
aXN0YWtlLiBJIGNhbiByZW1vdmUgdGhlDQpleHRlcm5zLg0K
