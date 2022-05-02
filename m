Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4B67516EA7
	for <lists+linux-hwmon@lfdr.de>; Mon,  2 May 2022 13:14:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347306AbiEBLRV (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 2 May 2022 07:17:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384676AbiEBLRU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 2 May 2022 07:17:20 -0400
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08CD9B1C4
        for <linux-hwmon@vger.kernel.org>; Mon,  2 May 2022 04:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1651490032;
  x=1683026032;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PBT+qAMxdn8tI5YS0sTH/jXaSyAnUSMwjNgYkCTovPM=;
  b=AzHhZQYbYqz285xUUOin7zxe4FNGjyhKXdncYJaR3LHK+Oh48+RSFVdy
   MRkK0Zsevi+R8ofR+3tzmnQxm2T5zKdFLW3A6iSIBUkO6gShClwKHWFw+
   WUP+O+GYWF4KidNs3wVjnVQnqMHPtiSuws8cvO73KH3ajdP8U/SmB9TR7
   ADm2TzYcZQE8YlzweGeb48EhaOLJBxeorvDoMJ7lpROqpRxOa9bKV9aPM
   TqGyCySGgIh9aLZNfkjCsbosnYz1q+YlD5dsUFHaSfq6ZZ96etJj3xOj3
   bix8xqe3pTENMOPuXrI1MLluEggoDfWgtpgYGv1LRQIFzMlvQQMD5ytUz
   g==;
From:   =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
CC:     <linux-hwmon@vger.kernel.org>, <kernel@axis.com>,
        =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
Subject: [PATCH v5 1/4] hwmon: (pmbus) Introduce and use write_byte_data callback
Date:   Mon, 2 May 2022 13:13:42 +0200
Message-ID: <20220502111345.3100970-2-marten.lindahl@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220502111345.3100970-1-marten.lindahl@axis.com>
References: <20220502111345.3100970-1-marten.lindahl@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Some of the pmbus core functions uses pmbus_write_byte_data, which does
not support driver callbacks for chip specific write operations. This
could potentially influence some specific regulator chips that for
example need a time delay before each data access.

Lets add support for driver callback with _pmbus_write_byte_data.

Signed-off-by: Mårten Lindahl <marten.lindahl@axis.com>
---
 drivers/hwmon/pmbus/pmbus.h      |  2 ++
 drivers/hwmon/pmbus/pmbus_core.c | 24 +++++++++++++++++++++---
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index e74b6ef070f3..c031a9700ace 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -438,6 +438,8 @@ struct pmbus_driver_info {
 	int (*read_byte_data)(struct i2c_client *client, int page, int reg);
 	int (*read_word_data)(struct i2c_client *client, int page, int phase,
 			      int reg);
+	int (*write_byte_data)(struct i2c_client *client, int page, int reg,
+			      u8 byte);
 	int (*write_word_data)(struct i2c_client *client, int page, int reg,
 			       u16 word);
 	int (*write_byte)(struct i2c_client *client, int page, u8 value);
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index b2618b1d529e..98da2db3f831 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -276,6 +276,24 @@ static int _pmbus_write_word_data(struct i2c_client *client, int page, int reg,
 	return pmbus_write_word_data(client, page, reg, word);
 }
 
+/*
+ * _pmbus_write_byte_data() is similar to pmbus_write_byte_data(), but checks if
+ * a device specific mapping function exists and calls it if necessary.
+ */
+static int _pmbus_write_byte_data(struct i2c_client *client, int page, int reg, u8 value)
+{
+	struct pmbus_data *data = i2c_get_clientdata(client);
+	const struct pmbus_driver_info *info = data->info;
+	int status;
+
+	if (info->write_byte_data) {
+		status = info->write_byte_data(client, page, reg, value);
+		if (status != -ENODATA)
+			return status;
+	}
+	return pmbus_write_byte_data(client, page, reg, value);
+}
+
 int pmbus_update_fan(struct i2c_client *client, int page, int id,
 		     u8 config, u8 mask, u16 command)
 {
@@ -290,7 +308,7 @@ int pmbus_update_fan(struct i2c_client *client, int page, int id,
 
 	to = (from & ~mask) | (config & mask);
 	if (to != from) {
-		rv = pmbus_write_byte_data(client, page,
+		rv = _pmbus_write_byte_data(client, page,
 					   pmbus_fan_config_registers[id], to);
 		if (rv < 0)
 			return rv;
@@ -397,7 +415,7 @@ int pmbus_update_byte_data(struct i2c_client *client, int page, u8 reg,
 	tmp = (rv & ~mask) | (value & mask);
 
 	if (tmp != rv)
-		rv = pmbus_write_byte_data(client, page, reg, tmp);
+		rv = _pmbus_write_byte_data(client, page, reg, tmp);
 
 	return rv;
 }
@@ -912,7 +930,7 @@ static int pmbus_get_boolean(struct i2c_client *client, struct pmbus_boolean *b,
 
 	regval = status & mask;
 	if (regval) {
-		ret = pmbus_write_byte_data(client, page, reg, regval);
+		ret = _pmbus_write_byte_data(client, page, reg, regval);
 		if (ret)
 			goto unlock;
 	}
-- 
2.30.2

