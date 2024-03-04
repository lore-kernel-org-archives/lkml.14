Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 4918F78B68
	for <linux-kernel@vger.kernel.org>; Mon,  4 Mar 2024 19:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709579850; cv=none; b=rKy59BVWZdOpB8OKQZ+mT+2pmr7Zoza1r2/BL6pIiJKku4ljYQdH7GrSd+QL+bqKXm+SFfc4EqedCjoMc8XOzONB4e6aTfJ8Sw+iKKFQsKhO/ZEWwAn3okmAeUl787KQnnz3/qaf1AdDWbboS8btD6lAoyLx5xSEaiN7XGCMJ6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709579850; c=relaxed/simple;
	bh=iM52eglbIOx8vfaf2uWEDUV+6TvpjT110x/Gr0FQQnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tA6K40iaQq3yx6buoSzD4mo4ows6nx9u0KZP2oTeZaygHsqKjkBmS+bb5P/uGCoLSo4SllDLB+wCI4j2CH+HpioSD5/x2b8R8ozC/1lRNXEW58qPgPd0g7MbC98DhXIEg75Ivlscl0a9yvmGxIm+6qgYuWl3fVqVal3azqWeKcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 131377 invoked by uid 1000); 4 Mar 2024 14:17:27 -0500
Date: Mon, 4 Mar 2024 14:17:27 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Tejun Heo <tj@kernel.org>, Greg KH <gregkh@linuxfoundation.org>
Cc: Kernel development list <linux-kernel@vger.kernel.org>
Subject: Bug in sysfs_break_active_protection()
Message-ID: <9c2484f4-df62-4d23-97a2-55a160eba55f@rowland.harvard.edu>
References: <CAEkJfYO6jRVC8Tfrd_R=cjO0hguhrV31fDPrLrNOOHocDkPoAA@mail.gmail.com>
 <e9d710fc-eace-44de-b3cc-1117c3575ef7@rowland.harvard.edu>
 <2024030428-graph-harmful-1597@gregkh>
 <416a8311-c725-419a-8b22-74c80207347f@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <416a8311-c725-419a-8b22-74c80207347f@rowland.harvard.edu>

Tejun:

It looks like there's a memory leak in sysfs_break_active_protection().  
It and its companion routine do this:

struct kernfs_node *sysfs_break_active_protection(struct kobject *kobj,
						  const struct attribute *attr)
{
	struct kernfs_node *kn;

	kobject_get(kobj);
	kn = kernfs_find_and_get(kobj->sd, attr->name);
	if (kn)
		kernfs_break_active_protection(kn);
	return kn;
}

void sysfs_unbreak_active_protection(struct kernfs_node *kn)
{
	struct kobject *kobj = kn->parent->priv;

	kernfs_unbreak_active_protection(kn);
	kernfs_put(kn);
	kobject_put(kobj);
}

If kn is NULL then the kobject_get(kobj) reference is never dropped.  
It looks like this could happen if two processes want to unregister the 
same kobject at the same time.

Shouldn't sysfs_break_active_protection() do this?

	kobject_get(kobj);
	kn = kernfs_find_and_get(kobj->sd, attr->name);
	if (kn)
		kernfs_break_active_protection(kn);
+	else
+		kobject_put(kobj);
	return kn;

Alan Stern
