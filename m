Received: from mail.nfschina.com (unknown [42.101.60.195])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 23457157475;
	Mon, 25 Mar 2024 06:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711348383; cv=none; b=M1WzJHQ1QONwKU/S1bFkgDrCXU+K1D9SjHUKAiziFkJNcJSeNXJLPz5iH1+PQweShRsUJ00LfXK4mgKjm//1rFggFf9Lks2EvoYpQb3QT9iNVGdjjhMpnLvHdaXDwuNVVOWlqK8c9K8QYkjG9kIJIYkpoQY2fEsW/YG/zEVLXIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711348383; c=relaxed/simple;
	bh=OckePRxIwMwlzlvfeeZnYH2Mn9sWTcwL/alzK8BGPnc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=U9CuX7hQ/cCA4nMGXlgq0PrRvGoOl9Tqm1Njbl8OD+1qNd9V7EWVSe4F0kp4U3fawwK0ocVcLz4iS4jN2WDmmgnLcyZ+wMK8K675QZMYRVFjpUGVnbo0s+471Yr938yze6hlvkE+AIUOj9IkGMaCRg8Evf/IICPBHM2MmREB/Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id E650A6029A552;
	Mon, 25 Mar 2024 14:32:37 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: Felix.Kuehling@amd.com,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	Xinhui.Pan@amd.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Cc: Su Hui <suhui@nfschina.com>,
	Philip.Yang@amd.com,
	alex.sierra@amd.com,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amdkfd: return negative error code in svm_ioctl()
Date: Mon, 25 Mar 2024 14:31:49 +0800
Message-Id: <20240325063148.3950639-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

svm_ioctl() should return negative error code in default case.

Fixes: 42de677f7999 ("drm/amdkfd: register svm range")
Signed-off-by: Su Hui <suhui@nfschina.com>
---
Ps: When I try to compile this file, there is a error :
drivers/gpu/drm/amd/amdkfd/kfd_migrate.c:28:10: fatal error: amdgpu_sync.h:
No such file or directory.

Maybe there are some steps I missed or this place need to be corrected?

 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index f0f7f48af413..41c376f3fd27 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -4147,7 +4147,7 @@ svm_ioctl(struct kfd_process *p, enum kfd_ioctl_svm_op op, uint64_t start,
 		r = svm_range_get_attr(p, mm, start, size, nattrs, attrs);
 		break;
 	default:
-		r = EINVAL;
+		r = -EINVAL;
 		break;
 	}
 
-- 
2.30.2

