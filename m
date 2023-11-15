Return-Path: <linux-hwmon+bounces-64-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 154E57ED431
	for <lists+linux-hwmon@lfdr.de>; Wed, 15 Nov 2023 21:57:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45D581C208D3
	for <lists+linux-hwmon@lfdr.de>; Wed, 15 Nov 2023 20:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 150D643ADD;
	Wed, 15 Nov 2023 20:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B2C7198;
	Wed, 15 Nov 2023 12:57:10 -0800 (PST)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6cd09663b1cso42391a34.3;
        Wed, 15 Nov 2023 12:57:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700081830; x=1700686630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yn8cWgc0LR3eqt+tX9p4U9PZWhRMqUpEjC58C6kq9fE=;
        b=B/g6bTNulvrF4D1C+on42Mpg0ksJJv4fQ7mMXVN8wFA+ixA2t6Pu6GlKQhgF+913zX
         qHkfBva41hfWQElalsz1zX2SaiSU89HA+Hh4vTb+c6rvxdQociP042n9JiKdg+VJsdCK
         q/rI4hY2FGK9vvo20LigbPLN40Em0CAP//J9xWUGufO4drep0BKrsKOcOXjHvCkZqOQV
         DtFsMhay0OEsNdcCVBGMTnDLTkZsAhoT99c93bF2HtxFbyAQjl3lvg/Zfqa7o+pAyI4S
         CP/wvbtwXGOMeBnfI9vLkNXn0iM8qQFcaq+dAivPzGRd/wxQRfMI3t4dG0ZpdjCKoNG4
         uu0A==
X-Gm-Message-State: AOJu0YxMSmjRJkEd5+Ep3j1WD0KODiEN1v1G8CxMKiWxhDXX2nCi9xZF
	94herRwhxZP1u5o1/XZvnNayDYFpXQ==
X-Google-Smtp-Source: AGHT+IH9v+8lfC+47xxhorj2KGtbG1hK/QjCQLqm2wzXxqpzFQA6ulmJcmQteJ78UVZZZygsXL/8ew==
X-Received: by 2002:a9d:6553:0:b0:6d6:45f1:d7b4 with SMTP id q19-20020a9d6553000000b006d645f1d7b4mr6684680otl.35.1700081829927;
        Wed, 15 Nov 2023 12:57:09 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id t10-20020a05683014ca00b006ce46212341sm689671otq.54.2023.11.15.12.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 12:57:08 -0800 (PST)
Received: (nullmailer pid 3730642 invoked by uid 1000);
	Wed, 15 Nov 2023 20:57:06 -0000
From: Rob Herring <robh@kernel.org>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] hwmon: lm25066: Use i2c_get_match_data()
Date: Wed, 15 Nov 2023 14:57:02 -0600
Message-ID: <20231115205703.3730448-3-robh@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231115205703.3730448-1-robh@kernel.org>
References: <20231115205703.3730448-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use preferred i2c_get_match_data() instead of of_match_device() and
i2c_match_id() to get the driver match data. With this, adjust the
includes to explicitly include the correct headers.

Adjust the 'chips' enum to not use 0, so that no match data can be
distinguished from a valid enum value.

Signed-off-by: Rob Herring <robh@kernel.org>
---
v2:
 - Split up per driver
---
 drivers/hwmon/pmbus/lm25066.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/hwmon/pmbus/lm25066.c b/drivers/hwmon/pmbus/lm25066.c
index 929fa6d34efd..bd43457094a6 100644
--- a/drivers/hwmon/pmbus/lm25066.c
+++ b/drivers/hwmon/pmbus/lm25066.c
@@ -14,10 +14,10 @@
 #include <linux/slab.h>
 #include <linux/i2c.h>
 #include <linux/log2.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include "pmbus.h"
 
-enum chips { lm25056, lm25066, lm5064, lm5066, lm5066i };
+enum chips { lm25056 = 1, lm25066, lm5064, lm5066, lm5066i };
 
 #define LM25066_READ_VAUX		0xd0
 #define LM25066_MFR_READ_IIN		0xd1
@@ -468,8 +468,6 @@ static int lm25066_probe(struct i2c_client *client)
 	struct lm25066_data *data;
 	struct pmbus_driver_info *info;
 	const struct __coeff *coeff;
-	const struct of_device_id *of_id;
-	const struct i2c_device_id *i2c_id;
 
 	if (!i2c_check_functionality(client->adapter,
 				     I2C_FUNC_SMBUS_READ_BYTE_DATA))
@@ -484,14 +482,8 @@ static int lm25066_probe(struct i2c_client *client)
 	if (config < 0)
 		return config;
 
-	i2c_id = i2c_match_id(lm25066_id, client);
+	data->id = (enum chips)i2c_get_match_data(client);
 
-	of_id = of_match_device(lm25066_of_match, &client->dev);
-	if (of_id && (unsigned long)of_id->data != i2c_id->driver_data)
-		dev_notice(&client->dev, "Device mismatch: %s in device tree, %s detected\n",
-			   of_id->name, i2c_id->name);
-
-	data->id = i2c_id->driver_data;
 	info = &data->info;
 
 	info->pages = 1;
-- 
2.42.0


