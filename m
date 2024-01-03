Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6617D182A9
	for <linux-kernel@vger.kernel.org>; Wed,  3 Jan 2024 09:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 91A63C15;
	Wed,  3 Jan 2024 01:03:41 -0800 (PST)
Received: from e126645.nice.arm.com (e126645.nice.arm.com [10.34.100.129])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 58FC83F7A6;
	Wed,  3 Jan 2024 01:02:54 -0800 (PST)
From: Pierre Gondois <pierre.gondois@arm.com>
To: linux-kernel@vger.kernel.org
Cc: Pierre Gondois <pierre.gondois@arm.com>,
	Marco Elver <elver@google.com>,
	Kees Cook <keescook@chromium.org>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Jani Nikula <jani.nikula@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH] list: Add hlist_count_nodes()
Date: Wed,  3 Jan 2024 10:02:38 +0100
Message-Id: <20240103090241.164817-1-pierre.gondois@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a function to count nodes in a hlist. hlist_count_nodes()
is similar to list_count_nodes().

Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>
---
 include/linux/list.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/linux/list.h b/include/linux/list.h
index 1837caedf723..0f1b1d4a2e2e 100644
--- a/include/linux/list.h
+++ b/include/linux/list.h
@@ -1175,4 +1175,19 @@ static inline void hlist_move_list(struct hlist_head *old,
 	     pos && ({ n = pos->member.next; 1; });			\
 	     pos = hlist_entry_safe(n, typeof(*pos), member))
 
+/**
+ * hlist_count_nodes - count nodes in the hlist
+ * @head:	the head for your hlist.
+ */
+static inline size_t hlist_count_nodes(struct hlist_head *head)
+{
+	struct hlist_node *pos;
+	size_t count = 0;
+
+	hlist_for_each(pos, head)
+		count++;
+
+	return count;
+}
+
 #endif
-- 
2.25.1

