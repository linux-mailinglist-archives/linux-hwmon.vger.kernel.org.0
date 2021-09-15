Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50C7940C768
	for <lists+linux-hwmon@lfdr.de>; Wed, 15 Sep 2021 16:25:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237894AbhIOO06 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 15 Sep 2021 10:26:58 -0400
Received: from tartarus.angband.pl ([51.83.246.204]:51850 "EHLO
        tartarus.angband.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233745AbhIOO05 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 15 Sep 2021 10:26:57 -0400
X-Greylist: delayed 2259 seconds by postgrey-1.27 at vger.kernel.org; Wed, 15 Sep 2021 10:26:57 EDT
Received: from 89-73-149-240.dynamic.chello.pl ([89.73.149.240] helo=barad-dur.angband.pl)
        by tartarus.angband.pl with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <kilobyte@angband.pl>)
        id 1mQVG9-00CjSL-Pz; Wed, 15 Sep 2021 15:47:48 +0200
Received: from [2a02:a31c:8245:f980::4] (helo=valinor.angband.pl)
        by barad-dur.angband.pl with esmtp (Exim 4.94.2)
        (envelope-from <kilobyte@angband.pl>)
        id 1mQVG3-0003oQ-3r; Wed, 15 Sep 2021 15:47:27 +0200
Received: from kilobyte by valinor.angband.pl with local (Exim 4.95-RC2)
        (envelope-from <kilobyte@valinor.angband.pl>)
        id 1mQVFz-000EXs-KQ;
        Wed, 15 Sep 2021 15:47:23 +0200
From:   Adam Borowski <kilobyte@angband.pl>
To:     =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc:     Adam Borowski <kilobyte@angband.pl>
Date:   Wed, 15 Sep 2021 15:47:18 +0200
Message-Id: <20210915134718.55897-1-kilobyte@angband.pl>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 89.73.149.240
X-SA-Exim-Mail-From: kilobyte@angband.pl
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on tartarus.angband.pl
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00=-1.9,RDNS_NONE=0.793,
        TVD_RCVD_IP=0.001,T_SPF_HELO_TEMPERROR=0.01,T_SPF_TEMPERROR=0.01
        autolearn=no autolearn_force=no languages=en
Subject: [PATCH] hwmon: (dell-smm) Don't build the proc interface if there's no /proc
X-SA-Exim-Version: 4.2.1 (built Sat, 13 Feb 2021 17:57:42 +0000)
X-SA-Exim-Scanned: Yes (on tartarus.angband.pl)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Signed-off-by: Adam Borowski <kilobyte@angband.pl>
---
 drivers/hwmon/dell-smm-hwmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
index 774c1b0715d9..f381dfe1b427 100644
--- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -403,7 +403,7 @@ static int __init i8k_get_dell_signature(int req_fn)
 	return regs.eax == 1145651527 && regs.edx == 1145392204 ? 0 : -1;
 }
 
-#if IS_ENABLED(CONFIG_I8K)
+#if IS_ENABLED(CONFIG_I8K) && IS_ENABLED(CONFIG_PROCFS)
 
 /*
  * Read the Fn key status.
-- 
2.33.0

