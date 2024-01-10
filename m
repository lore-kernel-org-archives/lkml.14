Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 2250A4C3C4
	for <linux-kernel@vger.kernel.org>; Wed, 10 Jan 2024 15:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 568340 invoked by uid 1000); 10 Jan 2024 10:39:13 -0500
Date: Wed, 10 Jan 2024 10:39:13 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Udipto Goswami <quic_ugoswami@quicinc.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
  Krishna Kurapati <quic_kriskura@quicinc.com>,
  Sergei Shtylyov <sergei.shtylyov@gmail.com>, linux-usb@vger.kernel.org,
  linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v5] usb: core: Prevent null pointer dereference in
 update_port_device_state
Message-ID: <20abaa31-9558-4a56-9d34-4407f175cada@rowland.harvard.edu>
References: <20240110095814.7626-1-quic_ugoswami@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240110095814.7626-1-quic_ugoswami@quicinc.com>

On Wed, Jan 10, 2024 at 03:28:14PM +0530, Udipto Goswami wrote:
> Currently, the function update_port_device_state gets the usb_hub from
> udev->parent by calling usb_hub_to_struct_hub.
> However, in case the actconfig or the maxchild is 0, the usb_hub would
> be NULL and upon further accessing to get port_dev would result in null
> pointer dereference.
> 
> Fix this by introducing an if check after the usb_hub is populated.
> 
> Fixes: 83cb2604f641 ("usb: core: add sysfs entry for usb device state")
> Cc: stable@vger.kernel.org
> Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
> ---
> v5: Addressed nit picks in commit and the comment.
> v4: Fixed minor mistakes in the comment.
> v3: Re-wrote the comment for better context.
> v2: Introduced comment for the if check & CC'ed stable.

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/core/hub.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index ffd7c99e24a3..48409d51ea43 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -2053,9 +2053,19 @@ static void update_port_device_state(struct usb_device *udev)
>  
>  	if (udev->parent) {
>  		hub = usb_hub_to_struct_hub(udev->parent);
> -		port_dev = hub->ports[udev->portnum - 1];
> -		WRITE_ONCE(port_dev->state, udev->state);
> -		sysfs_notify_dirent(port_dev->state_kn);
> +
> +		/*
> +		 * The Link Layer Validation System Driver (lvstest)
> +		 * has a test step to unbind the hub before running the
> +		 * rest of the procedure. This triggers hub_disconnect
> +		 * which will set the hub's maxchild to 0, further
> +		 * resulting in usb_hub_to_struct_hub returning NULL.
> +		 */
> +		if (hub) {
> +			port_dev = hub->ports[udev->portnum - 1];
> +			WRITE_ONCE(port_dev->state, udev->state);
> +			sysfs_notify_dirent(port_dev->state_kn);
> +		}
>  	}
>  }
>  
> -- 
> 2.17.1
> 
