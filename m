Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A822204E0B
	for <lists+linux-hwmon@lfdr.de>; Tue, 23 Jun 2020 11:34:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731997AbgFWJei (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 23 Jun 2020 05:34:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731947AbgFWJeh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 23 Jun 2020 05:34:37 -0400
X-Greylist: delayed 341 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 23 Jun 2020 02:34:37 PDT
Received: from office2.cesnet.cz (office2.cesnet.cz [IPv6:2001:718:1:101::144:244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1911C061573
        for <linux-hwmon@vger.kernel.org>; Tue, 23 Jun 2020 02:34:37 -0700 (PDT)
Received: from localhost (ip-78-45-210-6.net.upcbroadband.cz [78.45.210.6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by office2.cesnet.cz (Postfix) with ESMTPSA id 9965D40005D;
        Tue, 23 Jun 2020 11:28:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cesnet.cz;
        s=office2-2020; t=1592904532;
        bh=Lgwx5V24Fe1mdJ5m8CIJFlXu+h9v3t0FiohwRlciIjw=;
        h=Resent-Date:Resent-From:Resent-To:Resent-Cc:From:Date:Subject:To:
         Cc;
        b=c9E6g28tAzGn9ZnP0siwpugat6Km0weRMdXPy5W5I6kmpWRD8Yv5gyr1dqdASSSA3
         quBD6U9AqNaCSzCVSiELgGXifEj2yorqv7QWJfsUPL38J0QU9oQB1DzFjzB1r24yHv
         qvW7HzlYl0YJg/rZdVgvxVcL9IAhFPsI46HdzqQ/qJGW1JYNd1lISrHmK0tOpJcWjw
         Wf6PuCudzLC+H/vHAej8me7TwUJ7mX6L2SWzBNRpqf0Z47VILdU1IzQtFtmtkOGatY
         Qf+qJAwG6AJrlbE88ognwuGA59hfMyfAT8DjETLV2RjZzRpNgfgrGq3jIKTVe1HgLi
         7X1BH5DTwo13g==
Message-Id: <449bc9e6c0e4305581e45905ce9d043b356a9932.1592904387.git.jan.kundrat@cesnet.cz>
From:   =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>
Date:   Tue, 23 Jun 2020 09:47:39 +0200
Subject: [PATCH] hwmon: (pmbus) Fix page vs. register when accessing fans
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, Vadim Pasternak <vadimp@mellanox.com>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Commit 16358542f32f added support for multi-phase pmbus devices.
However, when calling pmbus_add_sensor() for fans, the patch swapped
the `page` and `reg` attributes. As a result, the fan speeds were
reported as 0 RPM on my device.

Signed-off-by: Jan Kundrát <jan.kundrat@cesnet.cz>
Fixes: 16358542f32f hwmon: (pmbus) Implement multi-phase support
---
 drivers/hwmon/pmbus/pmbus_core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git drivers/hwmon/pmbus/pmbus_core.c drivers/hwmon/pmbus/pmbus_core.c
index 8d321bf7d15b..e721a016f3e7 100644
--- drivers/hwmon/pmbus/pmbus_core.c
+++ drivers/hwmon/pmbus/pmbus_core.c
@@ -1869,7 +1869,7 @@ static int pmbus_add_fan_ctrl(struct i2c_client *client,
 	struct pmbus_sensor *sensor;
 
 	sensor = pmbus_add_sensor(data, "fan", "target", index, page,
-				  PMBUS_VIRT_FAN_TARGET_1 + id, 0xff, PSC_FAN,
+				  0xff, PMBUS_VIRT_FAN_TARGET_1 + id, PSC_FAN,
 				  false, false, true);
 
 	if (!sensor)
@@ -1880,14 +1880,14 @@ static int pmbus_add_fan_ctrl(struct i2c_client *client,
 		return 0;
 
 	sensor = pmbus_add_sensor(data, "pwm", NULL, index, page,
-				  PMBUS_VIRT_PWM_1 + id, 0xff, PSC_PWM,
+				  0xff, PMBUS_VIRT_PWM_1 + id, PSC_PWM,
 				  false, false, true);
 
 	if (!sensor)
 		return -ENOMEM;
 
 	sensor = pmbus_add_sensor(data, "pwm", "enable", index, page,
-				  PMBUS_VIRT_PWM_ENABLE_1 + id, 0xff, PSC_PWM,
+				  0xff, PMBUS_VIRT_PWM_ENABLE_1 + id, PSC_PWM,
 				  true, false, false);
 
 	if (!sensor)
@@ -1929,7 +1929,7 @@ static int pmbus_add_fan_attributes(struct i2c_client *client,
 				continue;
 
 			if (pmbus_add_sensor(data, "fan", "input", index,
-					     page, pmbus_fan_registers[f], 0xff,
+					     page, 0xff, pmbus_fan_registers[f],
 					     PSC_FAN, true, true, true) == NULL)
 				return -ENOMEM;
 
-- 
2.26.0


