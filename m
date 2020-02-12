Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9A25159DC7
	for <lists+linux-hwmon@lfdr.de>; Wed, 12 Feb 2020 01:03:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727979AbgBLADY (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 11 Feb 2020 19:03:24 -0500
Received: from gateway32.websitewelcome.com ([192.185.145.102]:24747 "EHLO
        gateway32.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727956AbgBLADX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 11 Feb 2020 19:03:23 -0500
X-Greylist: delayed 1397 seconds by postgrey-1.27 at vger.kernel.org; Tue, 11 Feb 2020 19:03:23 EST
Received: from cm12.websitewelcome.com (cm12.websitewelcome.com [100.42.49.8])
        by gateway32.websitewelcome.com (Postfix) with ESMTP id E5EBE645B9
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Feb 2020 17:40:05 -0600 (CST)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id 1f8PjKfx9vBMd1f8PjeGTV; Tue, 11 Feb 2020 17:40:05 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
        Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=826huAG5ON0O/lfMhDpKUhNKj75IXOzCCcEnxbYam4I=; b=J8DOEd5+Zj56yKjv9GxEr/9liR
        UxDb0yEozNCQtzTvTsjQ/6Nzv7jY4PMpcocRI1RLtNWUcZdEfadqZcNsYKNTtGPlWbh64mO46Z5fc
        HSmPuT+YqB+oY4cyV7ADajR1EKG1xmts+TOzRBPHNuirE+T2pnefl+SZTFNOL+SpV38VFZwrD4Cq3
        VjGWpDTya1CN0iqllnWMJvE5g8YzTR4zl27fE40CPAQkpP23qk7tJJeHxOyNnENQVBp9r55FJHO+v
        xzmsjHdTZIcGqgGm7cCr6eCyBBuFzxLr5fYeImmEC0zCP1VQv4S/dLs/x56PEYF1/HqKLtx7U3A+3
        4nZJpRdA==;
Received: from [200.68.140.36] (port=31131 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1j1f8O-003iJb-Fb; Tue, 11 Feb 2020 17:40:04 -0600
Date:   Tue, 11 Feb 2020 17:42:37 -0600
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] hwmon: (ibmaem) Replace zero-length array with
 flexible-array member
Message-ID: <20200211234237.GA26971@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 200.68.140.36
X-Source-L: No
X-Exim-ID: 1j1f8O-003iJb-Fb
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [200.68.140.36]:31131
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 51
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The current codebase makes use of the zero-length array language
extension to the C90 standard, but the preferred mechanism to declare
variable-length types such as these ones is a flexible array member[1][2],
introduced in C99:

struct foo {
        int stuff;
        struct boo array[];
};

By making use of the mechanism above, we will get a compiler warning
in case the flexible array does not occur last in the structure, which
will help us prevent some kind of undefined behavior bugs from being
inadvertenly introduced[3] to the codebase from now on.

This issue was found with the help of Coccinelle.

[1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
[2] https://github.com/KSPP/linux/issues/21
[3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/hwmon/ibmaem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/ibmaem.c b/drivers/hwmon/ibmaem.c
index db63c1295cb2..fb052c2d9c34 100644
--- a/drivers/hwmon/ibmaem.c
+++ b/drivers/hwmon/ibmaem.c
@@ -232,7 +232,7 @@ struct aem_read_sensor_req {
 
 struct aem_read_sensor_resp {
 	struct aem_iana_id	id;
-	u8			bytes[0];
+	u8			bytes[];
 } __packed;
 
 /* Data structures to talk to the IPMI layer */
-- 
2.25.0

