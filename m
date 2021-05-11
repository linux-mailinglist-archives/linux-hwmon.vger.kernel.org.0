Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E621E37A34B
	for <lists+linux-hwmon@lfdr.de>; Tue, 11 May 2021 11:19:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230442AbhEKJUI (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 11 May 2021 05:20:08 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2560 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230427AbhEKJUI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 11 May 2021 05:20:08 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FfXNP3mChzkWKk;
        Tue, 11 May 2021 17:16:21 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Tue, 11 May 2021 17:18:51 +0800
From:   Zhen Lei <thunder.leizhen@huawei.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon <linux-hwmon@vger.kernel.org>
CC:     Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 1/1] hwmon: (bt1-pvt) Remove redundant error printing in pvt_request_regs()
Date:   Tue, 11 May 2021 17:18:43 +0800
Message-ID: <20210511091843.4561-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.174.177.72]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

When devm_ioremap_resource() fails, a clear enough error message will be
printed by its subfunction __devm_ioremap_resource(). The error
information contains the device name, failure cause, and possibly resource
information.

Therefore, remove the error printing here to simplify code and reduce the
binary size.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/hwmon/bt1-pvt.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/hwmon/bt1-pvt.c b/drivers/hwmon/bt1-pvt.c
index 3e1d56585b91ad1..74ce5211eb752c8 100644
--- a/drivers/hwmon/bt1-pvt.c
+++ b/drivers/hwmon/bt1-pvt.c
@@ -924,10 +924,8 @@ static int pvt_request_regs(struct pvt_hwmon *pvt)
 	}
 
 	pvt->regs = devm_ioremap_resource(pvt->dev, res);
-	if (IS_ERR(pvt->regs)) {
-		dev_err(pvt->dev, "Couldn't map PVT registers\n");
+	if (IS_ERR(pvt->regs))
 		return PTR_ERR(pvt->regs);
-	}
 
 	return 0;
 }
-- 
2.26.0.106.g9fadedd


