Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49FF832C63;
	Tue,  9 Jan 2024 08:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 054DCC15;
	Tue,  9 Jan 2024 00:44:18 -0800 (PST)
Received: from e120937-lin (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E25AF3F5A1;
	Tue,  9 Jan 2024 00:43:25 -0800 (PST)
Date: Tue, 9 Jan 2024 08:43:19 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: sudeep.holla@arm.com, mturquette@baylibre.com, sboyd@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, ranjani.vaidyanathan@nxp.com,
	glen.wienecke@nxp.com, nitin.garg_3@nxp.com, chuck.cannon@nxp.com,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V2 1/2] firmware: arm_scmi: clock: implement get
 permissions
Message-ID: <ZZ0HJ46EQlClKrHT@e120937-lin>
References: <20231207093345.581048-1-peng.fan@oss.nxp.com>
 <cb7e8dea-cab0-ca04-df52-3d588cf01371@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb7e8dea-cab0-ca04-df52-3d588cf01371@oss.nxp.com>

On Tue, Jan 09, 2024 at 09:06:11AM +0800, Peng Fan wrote:
> Hi Sudeep, Cristian,
> 

Hi,

I have not forgot, I'll have a look this week.

Thanks,
Cristian
