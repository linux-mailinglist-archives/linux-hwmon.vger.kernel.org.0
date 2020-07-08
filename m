Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96DF52194AB
	for <lists+linux-hwmon@lfdr.de>; Thu,  9 Jul 2020 01:53:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726261AbgGHXxR (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 8 Jul 2020 19:53:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726118AbgGHXxR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 8 Jul 2020 19:53:17 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC34FC08C5C1
        for <linux-hwmon@vger.kernel.org>; Wed,  8 Jul 2020 16:53:16 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id n11so647127ybg.15
        for <linux-hwmon@vger.kernel.org>; Wed, 08 Jul 2020 16:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=M2lcNVP94N8u6USIJ7AI5Qz5okLgXQaJjZNQE9lbfRc=;
        b=CKm1RkVD6K4ooS61a228xaZr75GB9hLf0fHlO58oPTurh0494FLajl7CK8KdyG/r9C
         i2KuVbqWajTP4HyPRqRylfewgic30VtOjyOCtPYTJvJpLtva30H1rQR5Y5UDF3q9tu9X
         98mpCTu3TDUIphgG+obN7E6EVmNqRh/mvuCyVwAgwldR0fJgFl1KvV7i3edj6gzGR/lw
         jTTLXvzTcJLnSg/7vLITTf1cnf5CHDkYF83jUBS+31bAlMJ0D7uOyJAvz/rypoSlMdJk
         KuWAqBgSsBz+thacrjncSabmgN2s2yBqr93JN4I7Qe7FXOi2q5/HAH82oSLN/y4rHEo5
         z72A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=M2lcNVP94N8u6USIJ7AI5Qz5okLgXQaJjZNQE9lbfRc=;
        b=RjoXYYi0xh84NnPrgXF6Fjohp8EkaVlmgYLL5+J1Skc7jdN1Db8WS7Pm1x34aZ7aWy
         62KSG/vjnIkZyWxvrRWCTfa/++B6G7ZfhKomXN5rD2oHXm3eBywAvIrqF+RGnlHgUlxB
         KkpIz+ZIr3D+kLOMhxGStDuhfRQGIg3Ig3inTl6pTT6mWWozaDzUg3vWsKylpa06xT+N
         XQ7dLu1d4C8Yvff+KJAdeiDCA+ZSvHXcUURo4mZfpIKWZ9+a1Pmg0sXlhkyvUdnbTgw/
         MpfZzURHF2H/KKR9DPwUJvOAxQ6AnZtMJt07aZbBoQhLnA8PgCuXYNKhJy6L5WwS7Uml
         eqKQ==
X-Gm-Message-State: AOAM533xGRPTdtsjnibrrORHUxdQeKLNg2+cP7GXTNqPFv6Q/tEWAGcO
        eUb91lyzPu7MW0js2edGlL/7yhIlKIE8xsdD
X-Google-Smtp-Source: ABdhPJwd2/RUXP/5g8Uy5Ix/1E9qm1pzxeXjlaJOOjXjlP/vRc2x87LBrIMMyKVkH+cZG0XxN8RTMVyO5zpk6fwF
X-Received: by 2002:a25:c705:: with SMTP id w5mr100537620ybe.206.1594252395998;
 Wed, 08 Jul 2020 16:53:15 -0700 (PDT)
Date:   Wed,  8 Jul 2020 23:53:06 +0000
Message-Id: <20200708235306.3854404-1-linchuyuan@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
Subject: [PATCH] hwmon: adm1275: Make sure we are reading enough data for
 different chips
From:   Chu Lin <linchuyuan@google.com>
To:     linux@roeck-us.net
Cc:     belgaied@google.com, jasonling@google.com, jdelvare@suse.com,
        linchuyuan@google.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, zhongqil@google.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Issue:
When binding adm1272 to the adm1275 driver, PEC error is reported.
See blow:
adm1275: probe of xxxx failed with error -74

Diagnosis:
Per the datasheet of adm1272 and adm1278 (www.analog.com),
PMON_CONFIG (0xd4) is 16bits wide. On the other hand,
PMON_CONFIG (0xd4) for adm1275 is 8bits wide.
The driver should not assume everything is 8bits wide and read only
8bits from it.

Solution:
if it is adm1272 or adm1278, use i2c_read_word. Else, use i2c_read_byte

Signed-off-by: Chu Lin <linchuyuan@google.com>
---
 drivers/hwmon/pmbus/adm1275.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
index e25f541227da..a0d547d20358 100644
--- a/drivers/hwmon/pmbus/adm1275.c
+++ b/drivers/hwmon/pmbus/adm1275.c
@@ -472,6 +472,7 @@ static int adm1275_probe(struct i2c_client *client,
 	struct adm1275_data *data;
 	const struct i2c_device_id *mid;
 	const struct coefficients *coefficients;
+	s32 (*config_read_fn_ptr)(const struct i2c_client *client, u8 reg);
 	int vindex = -1, voindex = -1, cindex = -1, pindex = -1;
 	int tindex = -1;
 	u32 shunt;
@@ -510,14 +511,6 @@ static int adm1275_probe(struct i2c_client *client,
 			   "Device mismatch: Configured %s, detected %s\n",
 			   id->name, mid->name);
 
-	config = i2c_smbus_read_byte_data(client, ADM1275_PMON_CONFIG);
-	if (config < 0)
-		return config;
-
-	device_config = i2c_smbus_read_byte_data(client, ADM1275_DEVICE_CONFIG);
-	if (device_config < 0)
-		return device_config;
-
 	data = devm_kzalloc(&client->dev, sizeof(struct adm1275_data),
 			    GFP_KERNEL);
 	if (!data)
@@ -532,6 +525,21 @@ static int adm1275_probe(struct i2c_client *client,
 
 	data->id = mid->driver_data;
 
+	/* adm1272 and adm1278 supports temperature monitoring.  The config and device config
+	 * are 16bits wide for these two devices. On the other hand, other devices are 8 bits wide
+	 */
+	if (data->id == adm1272 || data->id == adm1278)
+		config_read_fn_ptr = &i2c_smbus_read_word_data;
+	else
+		config_read_fn_ptr = &i2c_smbus_read_byte_data;
+	config = config_read_fn_ptr(client, ADM1275_PMON_CONFIG);
+	if (config < 0)
+		return config;
+
+	device_config = config_read_fn_ptr(client, ADM1275_DEVICE_CONFIG);
+	if (device_config < 0)
+		return device_config;
+
 	info = &data->info;
 
 	info->pages = 1;
-- 
2.27.0.383.g050319c2ae-goog

