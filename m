Return-Path: <linux-hwmon+bounces-63-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D557ED42F
	for <lists+linux-hwmon@lfdr.de>; Wed, 15 Nov 2023 21:57:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DE1828116F
	for <lists+linux-hwmon@lfdr.de>; Wed, 15 Nov 2023 20:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F99D43ADC;
	Wed, 15 Nov 2023 20:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B56C195;
	Wed, 15 Nov 2023 12:57:08 -0800 (PST)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6ce2fc858feso42009a34.3;
        Wed, 15 Nov 2023 12:57:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700081827; x=1700686627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kOK7JO5EOhsngaH3Qx/xmibO/SIbJATRMlHbrH/xpaY=;
        b=ltpx2begib1pfLOz28zgib2Zf/HdiXqnOmVfxkQ998WLeQ4GiCmcBsm2M7sd4ynkP2
         W6QaHczY1ZZPRnZCJF6p8KPa3rAq+a4BB385yq1lvF+oMrjQnA7Ndb2KaFmIYTQ8DvET
         +yX5HjhPH0dWjfDl6Qcc8cT8cp53P65AGptRvhL9ErrH/qJ+rSWD3Y2FAJpMcwEVLOff
         V6KxUOxm2ZHz2PPjLTNSul65xGnSF1cgyHN8+1ZmdH9RmGwlpSXeq+N5qqAXi3InlrRd
         WYvbV3DvfDjKN8w66hqr5Vxc5eW6y+sJX/AcUXeZqSFGYZMfzFLuVYjLNLZmDg697qtC
         dAvg==
X-Gm-Message-State: AOJu0Yzkc9NxDPqdQpn2dvUO44b4sBr9FkCGaM1/rR3E9Qaw4ZXj4Gwz
	4A3WbbM3t77Dned17keEwwISFtV1Sw==
X-Google-Smtp-Source: AGHT+IHKs1dXxsNVJSUM1oPzK53u4i37AanRlau4wdYYXAofzu8nT/BwVheZeURF4kpAJ8uyyrQTdw==
X-Received: by 2002:a05:6870:f609:b0:1ef:9234:aa2a with SMTP id ek9-20020a056870f60900b001ef9234aa2amr15024607oab.37.1700081827470;
        Wed, 15 Nov 2023 12:57:07 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id c1-20020a056870a58100b001eb0e8b75cdsm1868316oam.10.2023.11.15.12.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 12:57:06 -0800 (PST)
Received: (nullmailer pid 3730597 invoked by uid 1000);
	Wed, 15 Nov 2023 20:57:06 -0000
From: Rob Herring <robh@kernel.org>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] hwmon: max6650: Use i2c_get_match_data()
Date: Wed, 15 Nov 2023 14:57:00 -0600
Message-ID: <20231115205703.3730448-1-robh@kernel.org>
X-Mailer: git-send-email 2.42.0
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

Signed-off-by: Rob Herring <robh@kernel.org>
---
v2:
 - Split up per driver
---
 drivers/hwmon/max6650.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/max6650.c b/drivers/hwmon/max6650.c
index cc8428a3045d..9649c6611d5f 100644
--- a/drivers/hwmon/max6650.c
+++ b/drivers/hwmon/max6650.c
@@ -26,7 +26,7 @@
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
 #include <linux/err.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/thermal.h>
 
 /*
@@ -763,8 +763,6 @@ static int max6650_probe(struct i2c_client *client)
 {
 	struct thermal_cooling_device *cooling_dev;
 	struct device *dev = &client->dev;
-	const struct of_device_id *of_id =
-		of_match_device(of_match_ptr(max6650_dt_match), dev);
 	struct max6650_data *data;
 	struct device *hwmon_dev;
 	int err;
@@ -776,8 +774,8 @@ static int max6650_probe(struct i2c_client *client)
 	data->client = client;
 	i2c_set_clientdata(client, data);
 	mutex_init(&data->update_lock);
-	data->nr_fans = of_id ? (int)(uintptr_t)of_id->data :
-				i2c_match_id(max6650_id, client)->driver_data;
+
+	data->nr_fans = (uintptr_t)i2c_get_match_data(client);
 
 	/*
 	 * Initialize the max6650 chip
-- 
2.42.0


