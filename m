Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45C01633B8B
	for <lists+linux-hwmon@lfdr.de>; Tue, 22 Nov 2022 12:38:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232583AbiKVLie (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 22 Nov 2022 06:38:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232586AbiKVLiP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 22 Nov 2022 06:38:15 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70E7D606B5
        for <linux-hwmon@vger.kernel.org>; Tue, 22 Nov 2022 03:33:15 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id l14so5379466wrw.13
        for <linux-hwmon@vger.kernel.org>; Tue, 22 Nov 2022 03:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sIMthWRv9QH4f8IhwYnbK6rK18ReVZ6lQR3GH4fCpEY=;
        b=hharGGQN2xOe0HApjcil1RiFHn26qSrEDJyXQg40tzFVPEtUJ0de6zzPwjALG9rZ4z
         BqeUfV97lPBbROssAOWgqiE4oNZsfuP+Aro9ZVZTLrBv3V2n81Kye9TW4R4PrC3EOzuu
         1iWVYbJCMzeSVNKWL3vqWnrKIDUeF+3IDSYtUiTJ0FvSO4Xc9AKZlLGgeMx8zQ8TvrBC
         tBmtj5r6zMVQ9WZqcOssVCFvtNsomaxEL0EUWdGyMkhweI5WRvjKNG97hqtgDX6fxWZA
         EO4oY1826fY7K62Q/GJWj5KR0xaSMzyX0FylWSIWlSeiBiIN4Rv29TpVbe5g76+1LAvB
         M07w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sIMthWRv9QH4f8IhwYnbK6rK18ReVZ6lQR3GH4fCpEY=;
        b=4PSSn9bLP+SiMCLQUEJBVIJSAKl/WIjXPinvyQsRHzVOEIRGwG7ho9sMYCv+oHTF9A
         IfTBt50Gb8QFCcPdtbY/U9hhcuSjF7HQnqZEReyjhIm7q2nHwTZc8IfF+vcmEas4xNem
         X/gErbwLtFLgvStfmqvRYGrEdV5F2nwma5sAvE61xEaVqTXRFucbOBNTxoJ5QgnPnvJa
         FSdzoQWbaNGDZzSy7rXZXuWhCh9aqRxsn67Owkxp9yt3kV/VmlpWZ6pYLuMNPAxNvHIV
         6G1tOSCYEH/y/zh/tgtrbXvGrELRHrdP7dPUqJZewLBu5KIUAxtx+62YO/78DHI4u0Pw
         B9Zg==
X-Gm-Message-State: ANoB5plaxllF8rNOarn9ori2uMT5/1tvugD4mLozRHStqUDGuy3YtElB
        WGKIAXb8YDm4Mvfp/xOauR48PA==
X-Google-Smtp-Source: AA0mqf647JGRBnHPLuoHfAJf2YjY8fCLsFnDMSo3BM+PUmTG+0E4dGr042libqGPqKA/J/axO9zL5g==
X-Received: by 2002:a05:6000:107:b0:22e:3460:5e28 with SMTP id o7-20020a056000010700b0022e34605e28mr2247083wrx.211.1669116793581;
        Tue, 22 Nov 2022 03:33:13 -0800 (PST)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id x11-20020a5d60cb000000b00241bc4880fesm12914086wrt.111.2022.11.22.03.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 03:33:13 -0800 (PST)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>
Cc:     broonie@kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] hwmon: (pmbus/core): Implement IRQ support
Date:   Tue, 22 Nov 2022 12:32:57 +0100
Message-Id: <20221122113257.3213700-3-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221122113257.3213700-1-Naresh.Solanki@9elements.com>
References: <20221122113257.3213700-1-Naresh.Solanki@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Patrick Rudolph <patrick.rudolph@9elements.com>

Implement IRQ support to monitor PMBUS regulator events.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
 drivers/hwmon/pmbus/pmbus.h      |   2 +-
 drivers/hwmon/pmbus/pmbus_core.c | 155 ++++++++++++++++++++++++++++---
 2 files changed, 144 insertions(+), 13 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index 10fb17879f8e..6b2e6cf93b19 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -26,7 +26,7 @@ enum pmbus_regs {
 
 	PMBUS_CAPABILITY		= 0x19,
 	PMBUS_QUERY			= 0x1A,
-
+	PMBUS_SMBALERT_MASK		= 0x1B,
 	PMBUS_VOUT_MODE			= 0x20,
 	PMBUS_VOUT_COMMAND		= 0x21,
 	PMBUS_VOUT_TRIM			= 0x22,
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 7d7d10039987..4234297813bb 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -3033,13 +3033,110 @@ const struct regulator_ops pmbus_regulator_ops = {
 };
 EXPORT_SYMBOL_NS_GPL(pmbus_regulator_ops, PMBUS);
 
-static int pmbus_regulator_register(struct pmbus_data *data)
+static int pmbus_write_smbalert_mask(struct i2c_client *client, u8 page, u8 reg, u8 val)
 {
-	struct device *dev = data->dev;
+	return pmbus_write_word_data(client, page, PMBUS_SMBALERT_MASK, reg | (val << 8));
+}
+
+static int pmbus_irq_subhandler(struct i2c_client *client, struct regulator_err_state *stat,
+			       unsigned long *dev_mask)
+{
+	struct pmbus_data *data = i2c_get_clientdata(client);
+	u8 page = rdev_get_id(stat->rdev);
+	const struct pmbus_regulator_status_category *cat;
+	const struct pmbus_regulator_status_assoc *bit;
+	int status, i;
+	int func = data->info->func[page];
+
+
+	stat->notifs = 0;
+	stat->errors = 0;
+
+	for (i = 0; i < ARRAY_SIZE(pmbus_regulator_flag_map); i++) {
+		cat = &pmbus_regulator_flag_map[i];
+		if (!(func & cat->func))
+			continue;
+
+		status = _pmbus_read_byte_data(client, page, cat->reg);
+		if (status < 0) {
+			mutex_unlock(&data->update_lock);
+			return status;
+		}
+
+		for (bit = cat->bits; bit->pflag; bit++) {
+			if (status & bit->pflag) {
+				stat->notifs |= bit->eflags;
+				stat->errors |= bit->rflag;
+			}
+		}
+	}
+
+	return 0;
+}
+
+static int pmbus_fault_handler(int irq, struct regulator_irq_data *rid, unsigned long *dev_mask)
+{
+	struct regulator_err_state *stat;
+	struct pmbus_data *data;
+	struct device *dev;
+	struct i2c_client *client;
+	int status;
+	u8 page;
+	int i;
+	int ret = REGULATOR_ERROR_CLEARED;
+
+	*dev_mask = 0;
+	rid->opaque = 0;
+
+	for (i = 0; i < rid->num_states; i++) {
+		stat  = &rid->states[i];
+		dev = rdev_get_dev(stat->rdev);
+		client = to_i2c_client(dev->parent);
+		data = i2c_get_clientdata(client);
+		page = rdev_get_id(stat->rdev);
+
+		mutex_lock(&data->update_lock);
+		status = pmbus_irq_subhandler(client, stat, dev_mask);
+		if (status < 0) {
+			ret = REGULATOR_FAILED_RETRY;
+			goto unlock;
+		}
+
+		status = pmbus_read_status_byte(client, page);
+		if (status < 0) {
+			ret = REGULATOR_FAILED_RETRY;
+			goto unlock;
+		}
+
+		if (status & ~(PB_STATUS_OFF | PB_STATUS_BUSY))
+			pmbus_clear_fault_page(client, page);
+
+	}
+unlock:
+	mutex_unlock(&data->update_lock);
+	return ret;
+}
+
+static int pmbus_regulator_register(struct i2c_client *client, struct pmbus_data *data)
+{
+	struct device *dev = &client->dev;
 	const struct pmbus_driver_info *info = data->info;
 	const struct pmbus_platform_data *pdata = dev_get_platdata(dev);
-	struct regulator_dev *rdev;
-	int i;
+	const struct pmbus_regulator_status_category *cat;
+	const struct pmbus_regulator_status_assoc *bit;
+	int func;
+	struct regulator_dev **rdevs;
+	struct regulator_irq_desc pmbus_notif = {
+		.name = "pmbus-irq",
+		.map_event = pmbus_fault_handler,
+	};
+	void *irq_helper;
+	int i, j, err, errs;
+	u8 mask;
+
+	rdevs = devm_kzalloc(dev, sizeof(*rdevs) * info->num_regulators, GFP_KERNEL);
+	if (!rdevs)
+		return -ENOMEM;
 
 	for (i = 0; i < info->num_regulators; i++) {
 		struct regulator_config config = { };
@@ -3050,18 +3147,52 @@ static int pmbus_regulator_register(struct pmbus_data *data)
 		if (pdata && pdata->reg_init_data)
 			config.init_data = &pdata->reg_init_data[i];
 
-		rdev = devm_regulator_register(dev, &info->reg_desc[i],
-					       &config);
-		if (IS_ERR(rdev))
-			return dev_err_probe(dev, PTR_ERR(rdev),
-					     "Failed to register %s regulator\n",
-					     info->reg_desc[i].name);
+		rdevs[i] = devm_regulator_register(dev, &info->reg_desc[i], &config);
+		if (IS_ERR(rdevs[i])) {
+			dev_err(dev, "Failed to register %s regulator\n",
+				info->reg_desc[i].name);
+			return PTR_ERR(rdevs[i]);
+		}
 	}
 
+	if (client->irq > 0) {
+		pmbus_notif.data = rdevs;
+		errs = 0;
+		for (i = 0; i < data->info->pages; i++) {
+			func = data->info->func[i];
+
+			for (j = 0; j < ARRAY_SIZE(pmbus_regulator_flag_map); j++) {
+				cat = &pmbus_regulator_flag_map[i];
+				if (!(func & cat->func))
+					continue;
+				mask = 0;
+				for (bit = cat->bits; bit->pflag; bit++) {
+					errs |= bit->rflag;
+					mask |= bit->pflag;
+				}
+				err = pmbus_write_smbalert_mask(client, i, cat->reg, ~mask);
+				if (err)
+					dev_err(dev, "Failed to set smbalert for reg 0x%02x\n",
+						cat->reg);
+			}
+
+		}
+
+		/* Register notifiers - can fail if IRQ is not given */
+		irq_helper = devm_regulator_irq_helper(dev, &pmbus_notif, client->irq, 0, errs,
+						      NULL, &rdevs[0], info->num_regulators);
+		if (IS_ERR(irq_helper)) {
+			if (PTR_ERR(irq_helper) == -EPROBE_DEFER) {
+				return -EPROBE_DEFER;
+			}
+			dev_warn(dev, "IRQ disabled %pe\n", irq_helper);
+		}
+	}
+	
 	return 0;
 }
 #else
-static int pmbus_regulator_register(struct pmbus_data *data)
+static int pmbus_regulator_register(struct i2c_client *client, struct pmbus_data *data)
 {
 	return 0;
 }
@@ -3425,7 +3556,7 @@ int pmbus_do_probe(struct i2c_client *client, struct pmbus_driver_info *info)
 		return PTR_ERR(data->hwmon_dev);
 	}
 
-	ret = pmbus_regulator_register(data);
+	ret = pmbus_regulator_register(client, data);
 	if (ret)
 		return ret;
 
-- 
2.37.3

