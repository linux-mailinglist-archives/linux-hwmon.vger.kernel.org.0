Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4310F435074
	for <lists+linux-hwmon@lfdr.de>; Wed, 20 Oct 2021 18:42:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230325AbhJTQoh (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 20 Oct 2021 12:44:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230293AbhJTQog (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 20 Oct 2021 12:44:36 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8FCBC061753
        for <linux-hwmon@vger.kernel.org>; Wed, 20 Oct 2021 09:42:21 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id p8-20020a056902114800b005bad2571fbeso31145737ybu.23
        for <linux-hwmon@vger.kernel.org>; Wed, 20 Oct 2021 09:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=IHLUn7sE+CWeyJGwUt9Fg19fE4IBXhW7HDVWDJnGVsY=;
        b=o0P6AGlO1B1cvFuR8WzDFCSvpRXabsmrwPyKL0Rg68XwoiYSjnqkvjC09iEWxT7sxg
         sMUHvv3aTwwBEbpDCFyYI8l/QVinPngzdqzpGDHMXy6ftOtYwF+qCoF8FklsTEuexEI9
         0XmxohZlfdkS4x+1/mCd5enIImH3uwUeF22j7jrCqmmJDxbPlcYT9k8wYq7oMvfpOS7G
         mlDE/NxvoMTS2U8wy18xfLKnQQL+ovFNLq1bwIU+Us4L3K6/qoEhnRYu8UzFxxpz0LkJ
         1808Lzp4IslAwb4WOP/VPwdgKQ32bbJ93liWFhpUeECzQa+HBKNXVNXFerD/cpFVmA8W
         AuDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=IHLUn7sE+CWeyJGwUt9Fg19fE4IBXhW7HDVWDJnGVsY=;
        b=ePrEKHuC7QGAJONzDkh5JontvzG3aSv3k+yHjrwHskN1757obmv5EMZYTG9pkBMTgT
         gJ2wuupUN50QIDd9d22Gg06SJIf+Nvvm/2eWAp/vbMXK5i2a27qGkj3Pp+jiIPieDrxk
         frgZ17X8pFM+0lmvXVwiuAHmYoMy/bRdfSpMU/hz3hPNMy6f71kPcjiQknelFI+ZFrx2
         cAoGAT2zZ5j2icBUipIUgbUPy9qIGYYY2PwHJ1tbinq/VvDI0I95d6vSfNOFYVznIrjv
         s5ssdw34fzdOdVLq3DnR0MvvAp2zjvs9TudBA0g89bvFh3lwwX0nuaCqAGUN/RyNpJIJ
         fnOQ==
X-Gm-Message-State: AOAM530z4WHMwYXxF4Fq08B8DBeNbwptAY/sF4YB2PsvXRN2+ukYM+6S
        Fx9Fuq4T5pJDm0ESrS5iSwOGRQI=
X-Google-Smtp-Source: ABdhPJz5iTmijp1jngJ7qyzAn/XVSTjtv9vToNoDNnjqGwNYbfVS3QF++s8/rYPSOo7hJi81ne7jEWs=
X-Received: from osk.cam.corp.google.com ([2620:0:1004:1a:a607:1490:fbbf:43bc])
 (user=osk job=sendgmr) by 2002:a25:cb03:: with SMTP id b3mr155435ybg.138.1634748140825;
 Wed, 20 Oct 2021 09:42:20 -0700 (PDT)
Date:   Wed, 20 Oct 2021 12:42:13 -0400
In-Reply-To: <20211020164213.174597-1-osk@google.com>
Message-Id: <20211020164213.174597-2-osk@google.com>
Mime-Version: 1.0
References: <20211020164213.174597-1-osk@google.com>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
Subject: [PATCH v8 2/2] hwmon: (nct7802) Make temperature/voltage sensors configurable
From:   Oskar Senft <osk@google.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Oskar Senft <osk@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This change allows LTD and RTD inputs to be configured via
device tree bindings. If the DT bindings are not present or
invalid, the input configuration is not modified and left at
HW defaults.

Signed-off-by: Oskar Senft <osk@google.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
Changes from PATCH v6 and v7:
- None (resubmitted due to changes in nuvoton,nct7802.yaml).

Changes from PATCH v5:
- Removed unused "found_channel_config" variable.
- Initialize mode_mask and mode_val to defaults.
---
 drivers/hwmon/nct7802.c | 129 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 125 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/nct7802.c b/drivers/hwmon/nct7802.c
index 604af2f6103a..d56f78327619 100644
--- a/drivers/hwmon/nct7802.c
+++ b/drivers/hwmon/nct7802.c
@@ -51,6 +51,23 @@ static const u8 REG_VOLTAGE_LIMIT_MSB_SHIFT[2][5] = {
 #define REG_CHIP_ID		0xfe
 #define REG_VERSION_ID		0xff
 
+/*
+ * Resistance temperature detector (RTD) modes according to 7.2.32 Mode
+ * Selection Register
+ */
+#define RTD_MODE_CURRENT	0x1
+#define RTD_MODE_THERMISTOR	0x2
+#define RTD_MODE_VOLTAGE	0x3
+
+#define MODE_RTD_MASK		0x3
+#define MODE_LTD_EN		0x40
+
+/*
+ * Bit offset for sensors modes in REG_MODE.
+ * Valid for index 0..2, indicating RTD1..3.
+ */
+#define MODE_BIT_OFFSET_RTD(index) ((index) * 2)
+
 /*
  * Data structures and manipulation thereof
  */
@@ -1038,7 +1055,112 @@ static const struct regmap_config nct7802_regmap_config = {
 	.volatile_reg = nct7802_regmap_is_volatile,
 };
 
-static int nct7802_init_chip(struct nct7802_data *data)
+static int nct7802_get_channel_config(struct device *dev,
+				      struct device_node *node, u8 *mode_mask,
+				      u8 *mode_val)
+{
+	u32 reg;
+	const char *type_str, *md_str;
+	u8 md;
+
+	if (!node->name || of_node_cmp(node->name, "channel"))
+		return 0;
+
+	if (of_property_read_u32(node, "reg", &reg)) {
+		dev_err(dev, "Could not read reg value for '%s'\n",
+			node->full_name);
+		return -EINVAL;
+	}
+
+	if (reg > 3) {
+		dev_err(dev, "Invalid reg (%u) in '%s'\n", reg,
+			node->full_name);
+		return -EINVAL;
+	}
+
+	if (reg == 0) {
+		if (!of_device_is_available(node))
+			*mode_val &= ~MODE_LTD_EN;
+		else
+			*mode_val |= MODE_LTD_EN;
+		*mode_mask |= MODE_LTD_EN;
+		return 0;
+	}
+
+	/* At this point we have reg >= 1 && reg <= 3 */
+
+	if (!of_device_is_available(node)) {
+		*mode_val &= ~(MODE_RTD_MASK << MODE_BIT_OFFSET_RTD(reg - 1));
+		*mode_mask |= MODE_RTD_MASK << MODE_BIT_OFFSET_RTD(reg - 1);
+		return 0;
+	}
+
+	if (of_property_read_string(node, "sensor-type", &type_str)) {
+		dev_err(dev, "No type for '%s'\n", node->full_name);
+		return -EINVAL;
+	}
+
+	if (!strcmp(type_str, "voltage")) {
+		*mode_val |= (RTD_MODE_VOLTAGE & MODE_RTD_MASK)
+			     << MODE_BIT_OFFSET_RTD(reg - 1);
+		*mode_mask |= MODE_RTD_MASK << MODE_BIT_OFFSET_RTD(reg - 1);
+		return 0;
+	}
+
+	if (strcmp(type_str, "temperature")) {
+		dev_err(dev, "Invalid type '%s' for '%s'\n", type_str,
+			node->full_name);
+		return -EINVAL;
+	}
+
+	if (reg == 3) {
+		/* RTD3 only supports thermistor mode */
+		md = RTD_MODE_THERMISTOR;
+	} else {
+		if (of_property_read_string(node, "temperature-mode",
+					    &md_str)) {
+			dev_err(dev, "No mode for '%s'\n", node->full_name);
+			return -EINVAL;
+		}
+
+		if (!strcmp(md_str, "thermal-diode"))
+			md = RTD_MODE_CURRENT;
+		else if (!strcmp(md_str, "thermistor"))
+			md = RTD_MODE_THERMISTOR;
+		else {
+			dev_err(dev, "Invalid mode '%s' for '%s'\n", md_str,
+				node->full_name);
+			return -EINVAL;
+		}
+	}
+
+	*mode_val |= (md & MODE_RTD_MASK) << MODE_BIT_OFFSET_RTD(reg - 1);
+	*mode_mask |= MODE_RTD_MASK << MODE_BIT_OFFSET_RTD(reg - 1);
+
+	return 0;
+}
+
+static int nct7802_configure_channels(struct device *dev,
+				      struct nct7802_data *data)
+{
+	/* Enable local temperature sensor by default */
+	u8 mode_mask = MODE_LTD_EN, mode_val = MODE_LTD_EN;
+	struct device_node *node;
+	int err;
+
+	if (dev->of_node) {
+		for_each_child_of_node(dev->of_node, node) {
+			err = nct7802_get_channel_config(dev, node, &mode_mask,
+							 &mode_val);
+			if (err)
+				return err;
+		}
+	}
+
+	return regmap_update_bits(data->regmap, REG_MODE, mode_mask, mode_val);
+}
+
+static int nct7802_init_chip(struct device *dev, struct nct7802_data *data)
 {
 	int err;
 
@@ -1047,8 +1169,7 @@ static int nct7802_init_chip(struct nct7802_data *data)
 	if (err)
 		return err;
 
-	/* Enable local temperature sensor */
-	err = regmap_update_bits(data->regmap, REG_MODE, 0x40, 0x40);
+	err = nct7802_configure_channels(dev, data);
 	if (err)
 		return err;
 
@@ -1074,7 +1195,7 @@ static int nct7802_probe(struct i2c_client *client)
 	mutex_init(&data->access_lock);
 	mutex_init(&data->in_alarm_lock);
 
-	ret = nct7802_init_chip(data);
+	ret = nct7802_init_chip(dev, data);
 	if (ret < 0)
 		return ret;
 
-- 
2.33.0.1079.g6e70778dc9-goog

