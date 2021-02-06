Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E3C7311C77
	for <lists+linux-hwmon@lfdr.de>; Sat,  6 Feb 2021 10:56:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbhBFJ4I (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sat, 6 Feb 2021 04:56:08 -0500
Received: from lnfm1.sai.msu.ru ([93.180.26.255]:39770 "EHLO lnfm1.sai.msu.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229539AbhBFJ4H (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 6 Feb 2021 04:56:07 -0500
Received: from dragon.sai.msu.ru (dragon.sai.msu.ru [93.180.26.172])
        by lnfm1.sai.msu.ru (8.14.1/8.12.8) with ESMTP id 1169ph2D029783;
        Sat, 6 Feb 2021 12:51:48 +0300
Received: from oak.local (unknown [83.167.113.121])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        by dragon.sai.msu.ru (Postfix) with ESMTPSA id 348F87B645;
        Sat,  6 Feb 2021 12:51:44 +0300 (MSK)
From:   "Matwey V. Kornilov" <matwey@sai.msu.ru>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Javier Martinez Canillas <javier@osg.samsung.com>,
        linux-hwmon@vger.kernel.org (open list:HARDWARE MONITORING),
        linux-kernel@vger.kernel.org (open list)
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Matwey V. Kornilov" <matwey@sai.msu.ru>
Subject: [PATCH v4 4/4] hwmon: lm75: Handle broken device nodes gracefully
Date:   Sat,  6 Feb 2021 12:51:21 +0300
Message-Id: <20210206095121.20625-5-matwey@sai.msu.ru>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210206095121.20625-1-matwey@sai.msu.ru>
References: <2588ea5c-630e-6509-689d-4c8fea358e9b@roeck-us.net>
 <20210206095121.20625-1-matwey@sai.msu.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

There is a logical flaw in lm75_probe() function introduced in

    e97a45f1b460 ("hwmon: (lm75) Add OF device ID table")

Note, that of_device_get_match_data() returns NULL when no match
is found. This is the case when OF node exists but has unknown
compatible line, while the module is still loaded via i2c
detection.

arch/powerpc/boot/dts/fsl/p2041rdb.dts:

    lm75b@48 {
    	compatible = "nxp,lm75a";
    	reg = <0x48>;
    };

In this case, the sensor is mistakenly considered as ADT75 variant.

Fixes: e97a45f1b460 ("hwmon: (lm75) Add OF device ID table")
Signed-off-by: Matwey V. Kornilov <matwey@sai.msu.ru>
---
 drivers/hwmon/lm75.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index 3e4374aa2f99..cd2cda4f557a 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -567,10 +567,17 @@ static int lm75_probe(struct i2c_client *client)
 	int status, err;
 	enum lm75_type kind;
 
-	if (client->dev.of_node)
-		kind = (enum lm75_type)of_device_get_match_data(&client->dev);
-	else
+	if (dev->of_node) {
+		const struct of_device_id *match =
+			of_match_device(dev->driver->of_match_table, dev);
+
+		if (!match)
+			return -ENODEV;
+
+		kind = (enum lm75_type)(match->data);
+	} else {
 		kind = i2c_match_id(lm75_ids, client)->driver_data;
+	}
 
 	if (!i2c_check_functionality(client->adapter,
 			I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA))
-- 
2.26.2

