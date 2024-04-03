Return-Path: <linux-hwmon+bounces-1621-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA658979F8
	for <lists+linux-hwmon@lfdr.de>; Wed,  3 Apr 2024 22:39:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4C891F213BE
	for <lists+linux-hwmon@lfdr.de>; Wed,  3 Apr 2024 20:39:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46DF9157473;
	Wed,  3 Apr 2024 20:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Yp33osTQ"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81367156F44;
	Wed,  3 Apr 2024 20:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712176625; cv=none; b=Mz9ei86zOX0TENHOlfQWSH9+H4rqbft2hPjLpDU2PtZGQWoyEE4rbll0ci0xB2URPR8aafQMqfziFPQHvz4N8shrJOCGZ9Hw3jkIUtjJYfhMOAuzIPJEHTy21Rj6i1OfPd88y9gu1+Tz8qgbIfMVKRUPFePQRmr8PFwHUh54BpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712176625; c=relaxed/simple;
	bh=WSy/QAN56kZaPJrNA7x6y0ofRhffl7fQnuQXjIwtAtM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V1VX9FxnynvoekDFQheWyf8sn6C4O6T6WrqAFQBUiZQstOgXW8vaTbL/3FrIeJPmpJwmEohH1vRbRmhhRhX25Q1ecegKDIthFvg88XAotPL+LYOR+sS8m4RglxtFbqT1Ib3uhhD1YPqLpc8ZsIY9KxPI13ie3Npad0+e6YkhwpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Yp33osTQ; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 433Kadbe076311;
	Wed, 3 Apr 2024 15:36:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1712176599;
	bh=cvPlm4tRXW8MQW2aRf7DyIM/MCsuKw+h98ilYvZNBns=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Yp33osTQF0WIxh15wN/PO+3u8eYBRtK5i5BcE6XA8DQeopSHLmtyRqy8kZyVA1j1K
	 tYTin7r32xI3xKPiXd4JKQ2dNYXPD730ruPThglCuJYAP7vtol+sS7YEspcNr411v8
	 WaVsH2dmNiWCaxbuvWEka/yau0G02Uv62ryZR1BA=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 433KaduW092380
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 3 Apr 2024 15:36:39 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 3
 Apr 2024 15:36:39 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 3 Apr 2024 15:36:39 -0500
Received: from fllvsmtp8.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 433KaYFs080324;
	Wed, 3 Apr 2024 15:36:38 -0500
From: Andrew Davis <afd@ti.com>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
        Juerg Haefliger <juergh@proton.me>, Riku Voipio <riku.voipio@iki.fi>
CC: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew
 Davis <afd@ti.com>
Subject: [PATCH 13/31] hwmon: (lm75) Remove use of i2c_match_id()
Date: Wed, 3 Apr 2024 15:36:15 -0500
Message-ID: <20240403203633.914389-14-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240403203633.914389-1-afd@ti.com>
References: <20240403203633.914389-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

The function i2c_match_id() is used to fetch the matching ID from
the i2c_device_id table. This is often used to then retrieve the
matching driver_data. This can be done in one step with the helper
i2c_get_match_data().

This helper has a couple other benefits:
 * It doesn't need the i2c_device_id passed in so we do not need
   to have that forward declared, allowing us to remove those or
   move the i2c_device_id table down to its more natural spot
   with the other module info.
 * It also checks for device match data, which allows for OF and
   ACPI based probing. That means we do not have to manually check
   those first and can remove those checks.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/hwmon/lm75.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index e007507185360..2c2205aec7d40 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -625,20 +625,12 @@ static void lm75_remove(void *data)
 	i2c_smbus_write_byte_data(client, LM75_REG_CONF, lm75->orig_conf);
 }
 
-static const struct i2c_device_id lm75_ids[];
-
 static int lm75_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct device *hwmon_dev;
 	struct lm75_data *data;
 	int status, err;
-	enum lm75_type kind;
-
-	if (client->dev.of_node)
-		kind = (uintptr_t)of_device_get_match_data(&client->dev);
-	else
-		kind = i2c_match_id(lm75_ids, client)->driver_data;
 
 	if (!i2c_check_functionality(client->adapter,
 			I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA))
@@ -649,7 +641,7 @@ static int lm75_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	data->client = client;
-	data->kind = kind;
+	data->kind = (uintptr_t)i2c_get_match_data(client);
 
 	data->vs = devm_regulator_get(dev, "vs");
 	if (IS_ERR(data->vs))
-- 
2.39.2


