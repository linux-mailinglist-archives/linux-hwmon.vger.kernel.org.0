Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0ACFB53D2F6
	for <lists+linux-hwmon@lfdr.de>; Fri,  3 Jun 2022 22:52:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346284AbiFCUv7 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 3 Jun 2022 16:51:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346039AbiFCUv6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 3 Jun 2022 16:51:58 -0400
Received: from smtp.smtpout.orange.fr (smtp06.smtpout.orange.fr [80.12.242.128])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE2716274
        for <linux-hwmon@vger.kernel.org>; Fri,  3 Jun 2022 13:51:56 -0700 (PDT)
Received: from pop-os.home ([90.11.190.129])
        by smtp.orange.fr with ESMTPA
        id xEGvn9RQRWo1mxEGvnYWa4; Fri, 03 Jun 2022 22:51:54 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Fri, 03 Jun 2022 22:51:54 +0200
X-ME-IP: 90.11.190.129
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-hwmon@vger.kernel.org
Subject: [PATCH] hwmon: (lm75) Replace kernel.h with the necessary inclusions
Date:   Fri,  3 Jun 2022 22:51:46 +0200
Message-Id: <4e07ed43274ad912d4efcfc04f673f25e8f89fdc.1654289489.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

When kernel.h is used in the headers it adds a lot into dependency hell,
especially when there are circular dependencies are involved.

Replace kernel.h inclusion with the list of what is really being used.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/hwmon/lm75.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/lm75.h b/drivers/hwmon/lm75.h
index a398171162a8..b803ada5e3c9 100644
--- a/drivers/hwmon/lm75.h
+++ b/drivers/hwmon/lm75.h
@@ -11,7 +11,8 @@
  * which contains this code, we don't worry about the wasted space.
  */
 
-#include <linux/kernel.h>
+#include <linux/minmax.h>
+#include <linux/types.h>
 
 /* straight from the datasheet */
 #define LM75_TEMP_MIN (-55000)
-- 
2.34.1

