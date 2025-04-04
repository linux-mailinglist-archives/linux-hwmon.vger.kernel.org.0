Return-Path: <linux-hwmon+bounces-7520-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B858A7C3DC
	for <lists+linux-hwmon@lfdr.de>; Fri,  4 Apr 2025 21:32:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B03C189E66A
	for <lists+linux-hwmon@lfdr.de>; Fri,  4 Apr 2025 19:31:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 814ED21D3EA;
	Fri,  4 Apr 2025 19:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b="fm3oH15k"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BBA13BAE3
	for <linux-hwmon@vger.kernel.org>; Fri,  4 Apr 2025 19:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743795073; cv=none; b=B18YmGPgvBwbmZwEtxOPP00edaDKUgvSRKMp/FB8hSeH5LcZy+Dfp4vsBr4CPCtoNbs7qvFWnA5dEbWl4ez+JIJuLQP7FharEczdUVR9bz3IwORzfbJgNUbj+Bxo1VyUrEugJPVYnk+8fvQZ27960Zq34Xjw4Bdja7swtSaGVjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743795073; c=relaxed/simple;
	bh=GU+BKGPhP1ncxOUriSi+A6K9Rm1tckxuSG8mFYnJzng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jy1Z2+ezP8P4aYLcNMROBSf8YHE7/nG5q7WY/S9p1uwjkajaXc3ZMgjmjb3y8SEAQqGNVh6fyTH9HSDvRn5VIpFTJX+btRSlbcCYxOSI3TFvq9qjU16USSz36zWq6vhZZ647UbnyI9NG8b0qESUU2UesXQMCZd8zWE0S8SaAQAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com; spf=none smtp.mailfrom=wkennington.com; dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b=fm3oH15k; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wkennington.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-227c7e57da2so22172835ad.0
        for <linux-hwmon@vger.kernel.org>; Fri, 04 Apr 2025 12:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1743795070; x=1744399870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iwmtu+uZ52qMzsfxSGrsHEPDBbiiwoZf6ArXjNCWgbQ=;
        b=fm3oH15kqzLpvUh9kdUKanQ6EgK6wxxfHc9x3w9FbRIy2KjnjbEcLj3ZK9cLPDKAg4
         JBmq8PLs8DZuulEeb1MRzYbTy8HZzde1YHF+tK/Oi3GC+UHq0e4q0qWtys7RLxx5xmZi
         im2tVdYDu4vl1FVFP82FtcnT2f2daAHuZ5LuGAQWDNORK432o9izTt1K+aYdhTW9boMk
         Y9s4iZIRDseYg/5izIGtAkcVRZYWx6ocLqbJEtdM3AUTh+ofWaiNbfv2Ngsx+44qHAyC
         A5BEwELLe8dwIHaj+4ZeHXqmZ658P73yy96uE8bfAJV0LwjQ98zkSMLJGdq4E/laqTOt
         R6wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743795070; x=1744399870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iwmtu+uZ52qMzsfxSGrsHEPDBbiiwoZf6ArXjNCWgbQ=;
        b=leD/5y1DXo8DYKzgXvKZHOjVNZeqagUPeTszS2OQRUBUb5pgX3oTKl4vjbM2qN/Tf7
         l6jk/Kh3q3ZH5yaQOtq3/RM110jG33CyyBaWL7uCDuAGx3HNVsTW8CaeOPIhuUY76Yk/
         jZ/gsjVZrt48ISNODqnc7vWlmAxTaJ+UZJRoDMRtQcB1jUB+kq9TdfJ3cK5YDBHOnYn2
         RH1uAoKQDhXi4C4ntCGz8MCxLRrR/itmrV3Aiqvs5RNEVRW+ESLsoFKHGRh6OwACJ70F
         M3JnnEpcFXCyTB1zMDNDvPRtLM5hoKs41OULol9HhezvxbKbZ5wO/YLXfR8Q6I5FUocm
         pRYA==
X-Gm-Message-State: AOJu0YxZ7ol0TBGsmvDROXe2joKnQmyKrCrDpibaSudttIiwNNy0xFEw
	1ebbPERXWlcFylwocY9LPwBO7w0mSPGnbwTX1joc24Y6uar7DywdeejQojX6Qy4=
X-Gm-Gg: ASbGncsC4LBokbhc+np2e+OBJU36uUrnHkaIvfvMxR3yXDK+ZN4gO2p4dPyL//TDsi6
	kE5vAMxu7zEld1BJn97juQI1wjqVQMwcbqKiJUW/7i4wTsHFHyOyqXaomguvAsn2U1rbLlpOg0A
	sMTMfmaAQ/FPEguwQ7usFVHglEAQbXpjmNFLVI65IL63w/klyX16lblflkCft9MRZzvaaWdJmi8
	/Q+ZHwdXNWHoepHRp5lhqdZcfmiHgSIzUsuqJ8kb1JaajdNxhlW2ULDG7wjszcRTpzlRUW6+wCZ
	2kU6g2i/wEz4NFPskKRYPkK9Ww+FXlA1VX9yN3M1mUXd2yyTZcosv3goAE6H2DARW7yPdSWiTCR
	mROU+YLp2NPcJ9wNJ3rIKBIRjI/pQazQ7
X-Google-Smtp-Source: AGHT+IGTDbsIkafCkBmrZ0jPl04z8nF+jvoLkJwwV4Q5//IsfxS/Oh9aioaRAWJTxf5pL4DbpzKmmQ==
X-Received: by 2002:a17:902:e88c:b0:223:f408:c3f8 with SMTP id d9443c01a7336-22a8a0577fcmr55202755ad.14.1743795070218;
        Fri, 04 Apr 2025 12:31:10 -0700 (PDT)
Received: from wak-linux.svl.corp.google.com ([2a00:79e0:2e5b:9:2c9e:1e72:3ae7:b81c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297865e07dsm36260435ad.157.2025.04.04.12.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 12:31:09 -0700 (PDT)
From: "William A. Kennington III" <william@wkennington.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"William A. Kennington III" <william@wkennington.com>
Subject: [PATCH v4] hwmon: (pmbus): Introduce page_change_delay
Date: Fri,  4 Apr 2025 12:31:03 -0700
Message-ID: <20250404193103.4174977-1-william@wkennington.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
In-Reply-To: <20250403211246.3876138-1-william@wkennington.com>
References: <20250403211246.3876138-1-william@wkennington.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We have some buggy pmbus devices that require a delay after performing a
page change operation before trying to issue more commands to the
device.

This allows for a configurable delay after page changes, but not
affecting other read or write operations.

This makes a slight behavioral tweak to the existing delay logic, where
it considers the longest of delays between operations, instead of always
chosing the write delay over the access delay.

Signed-off-by: William A. Kennington III <william@wkennington.com>
---
V1 -> V2: Simplify how the backoff time is stored and computed
V2 -> V3: Use the BIT macro
V3 -> V4: Move defines up
	  Move op combos outside update call
	  Remove unused PMBUS_OP_READ

 drivers/hwmon/pmbus/pmbus.h      |  1 +
 drivers/hwmon/pmbus/pmbus_core.c | 70 ++++++++++++++++----------------
 2 files changed, 36 insertions(+), 35 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index ddb19c9726d6..742dafc44390 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -482,6 +482,7 @@ struct pmbus_driver_info {
 	 */
 	int access_delay;		/* in microseconds */
 	int write_delay;		/* in microseconds */
+	int page_change_delay;		/* in microseconds */
 };
 
 /* Regulator ops */
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 787683e83db6..950a03cd6de9 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -31,6 +31,13 @@
 #define PMBUS_ATTR_ALLOC_SIZE	32
 #define PMBUS_NAME_SIZE		24
 
+/*
+ * The type of operation used for picking the delay between
+ * successive pmbus operations.
+ */
+#define PMBUS_OP_WRITE		BIT(0)
+#define PMBUS_OP_PAGE_CHANGE	BIT(1)
+
 static int wp = -1;
 module_param(wp, int, 0444);
 
@@ -114,8 +121,8 @@ struct pmbus_data {
 
 	int vout_low[PMBUS_PAGES];	/* voltage low margin */
 	int vout_high[PMBUS_PAGES];	/* voltage high margin */
-	ktime_t write_time;		/* Last SMBUS write timestamp */
-	ktime_t access_time;		/* Last SMBUS access timestamp */
+
+	ktime_t next_access_backoff;	/* Wait until at least this time */
 };
 
 struct pmbus_debugfs_entry {
@@ -170,33 +177,26 @@ EXPORT_SYMBOL_NS_GPL(pmbus_set_update, "PMBUS");
 static void pmbus_wait(struct i2c_client *client)
 {
 	struct pmbus_data *data = i2c_get_clientdata(client);
-	const struct pmbus_driver_info *info = data->info;
-	s64 delta;
+	s64 delay = ktime_us_delta(data->next_access_backoff, ktime_get());
 
-	if (info->access_delay) {
-		delta = ktime_us_delta(ktime_get(), data->access_time);
-
-		if (delta < info->access_delay)
-			fsleep(info->access_delay - delta);
-	} else if (info->write_delay) {
-		delta = ktime_us_delta(ktime_get(), data->write_time);
-
-		if (delta < info->write_delay)
-			fsleep(info->write_delay - delta);
-	}
+	if (delay > 0)
+		fsleep(delay);
 }
 
-/* Sets the last accessed timestamp for pmbus_wait */
-static void pmbus_update_ts(struct i2c_client *client, bool write_op)
+/* Sets the last operation timestamp for pmbus_wait */
+static void pmbus_update_ts(struct i2c_client *client, int op)
 {
 	struct pmbus_data *data = i2c_get_clientdata(client);
 	const struct pmbus_driver_info *info = data->info;
+	int delay = info->access_delay;
 
-	if (info->access_delay) {
-		data->access_time = ktime_get();
-	} else if (info->write_delay && write_op) {
-		data->write_time = ktime_get();
-	}
+	if (op & PMBUS_OP_WRITE)
+		delay = max(delay, info->write_delay);
+	if (op & PMBUS_OP_PAGE_CHANGE)
+		delay = max(delay, info->page_change_delay);
+
+	if (delay > 0)
+		data->next_access_backoff = ktime_add_us(ktime_get(), delay);
 }
 
 int pmbus_set_page(struct i2c_client *client, int page, int phase)
@@ -211,13 +211,13 @@ int pmbus_set_page(struct i2c_client *client, int page, int phase)
 	    data->info->pages > 1 && page != data->currpage) {
 		pmbus_wait(client);
 		rv = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
-		pmbus_update_ts(client, true);
+		pmbus_update_ts(client, PMBUS_OP_WRITE | PMBUS_OP_PAGE_CHANGE);
 		if (rv < 0)
 			return rv;
 
 		pmbus_wait(client);
 		rv = i2c_smbus_read_byte_data(client, PMBUS_PAGE);
-		pmbus_update_ts(client, false);
+		pmbus_update_ts(client, 0);
 		if (rv < 0)
 			return rv;
 
@@ -231,7 +231,7 @@ int pmbus_set_page(struct i2c_client *client, int page, int phase)
 		pmbus_wait(client);
 		rv = i2c_smbus_write_byte_data(client, PMBUS_PHASE,
 					       phase);
-		pmbus_update_ts(client, true);
+		pmbus_update_ts(client, PMBUS_OP_WRITE);
 		if (rv)
 			return rv;
 	}
@@ -251,7 +251,7 @@ int pmbus_write_byte(struct i2c_client *client, int page, u8 value)
 
 	pmbus_wait(client);
 	rv = i2c_smbus_write_byte(client, value);
-	pmbus_update_ts(client, true);
+	pmbus_update_ts(client, PMBUS_OP_WRITE);
 
 	return rv;
 }
@@ -286,7 +286,7 @@ int pmbus_write_word_data(struct i2c_client *client, int page, u8 reg,
 
 	pmbus_wait(client);
 	rv = i2c_smbus_write_word_data(client, reg, word);
-	pmbus_update_ts(client, true);
+	pmbus_update_ts(client, PMBUS_OP_WRITE);
 
 	return rv;
 }
@@ -408,7 +408,7 @@ int pmbus_read_word_data(struct i2c_client *client, int page, int phase, u8 reg)
 
 	pmbus_wait(client);
 	rv = i2c_smbus_read_word_data(client, reg);
-	pmbus_update_ts(client, false);
+	pmbus_update_ts(client, 0);
 
 	return rv;
 }
@@ -471,7 +471,7 @@ int pmbus_read_byte_data(struct i2c_client *client, int page, u8 reg)
 
 	pmbus_wait(client);
 	rv = i2c_smbus_read_byte_data(client, reg);
-	pmbus_update_ts(client, false);
+	pmbus_update_ts(client, 0);
 
 	return rv;
 }
@@ -487,7 +487,7 @@ int pmbus_write_byte_data(struct i2c_client *client, int page, u8 reg, u8 value)
 
 	pmbus_wait(client);
 	rv = i2c_smbus_write_byte_data(client, reg, value);
-	pmbus_update_ts(client, true);
+	pmbus_update_ts(client, PMBUS_OP_WRITE);
 
 	return rv;
 }
@@ -523,7 +523,7 @@ static int pmbus_read_block_data(struct i2c_client *client, int page, u8 reg,
 
 	pmbus_wait(client);
 	rv = i2c_smbus_read_block_data(client, reg, data_buf);
-	pmbus_update_ts(client, false);
+	pmbus_update_ts(client, 0);
 
 	return rv;
 }
@@ -2530,7 +2530,7 @@ static int pmbus_read_coefficients(struct i2c_client *client,
 	rv = i2c_smbus_xfer(client->adapter, client->addr, client->flags,
 			    I2C_SMBUS_WRITE, PMBUS_COEFFICIENTS,
 			    I2C_SMBUS_BLOCK_PROC_CALL, &data);
-	pmbus_update_ts(client, true);
+	pmbus_update_ts(client, PMBUS_OP_WRITE);
 
 	if (rv < 0)
 		return rv;
@@ -2734,7 +2734,7 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
 	if (!(data->flags & PMBUS_NO_CAPABILITY)) {
 		pmbus_wait(client);
 		ret = i2c_smbus_read_byte_data(client, PMBUS_CAPABILITY);
-		pmbus_update_ts(client, false);
+		pmbus_update_ts(client, 0);
 
 		if (ret >= 0 && (ret & PB_CAPABILITY_ERROR_CHECK)) {
 			if (i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_PEC))
@@ -2750,13 +2750,13 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
 	data->read_status = pmbus_read_status_word;
 	pmbus_wait(client);
 	ret = i2c_smbus_read_word_data(client, PMBUS_STATUS_WORD);
-	pmbus_update_ts(client, false);
+	pmbus_update_ts(client, 0);
 
 	if (ret < 0 || ret == 0xffff) {
 		data->read_status = pmbus_read_status_byte;
 		pmbus_wait(client);
 		ret = i2c_smbus_read_byte_data(client, PMBUS_STATUS_BYTE);
-		pmbus_update_ts(client, false);
+		pmbus_update_ts(client, 0);
 
 		if (ret < 0 || ret == 0xff) {
 			dev_err(dev, "PMBus status register not found\n");
-- 
2.49.0.504.g3bcea36a83-goog


