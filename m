Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33BF1264ABE
	for <lists+linux-hwmon@lfdr.de>; Thu, 10 Sep 2020 19:10:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726914AbgIJRKp (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Thu, 10 Sep 2020 13:10:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726896AbgIJRJO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 10 Sep 2020 13:09:14 -0400
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC63CC061573
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2020 10:09:13 -0700 (PDT)
Received: by mail-pj1-x1049.google.com with SMTP id s15so306382pjn.9
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2020 10:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to;
        bh=BZ6YdwlTkATP6YcNm1nCerDB1v94oBKP5AayFPJUuNg=;
        b=fNUWxPRqJeQUZ6YDlSAgmDDsvwxVfzblFY2p1ci7EGZbYmnUUg/DsZmeO+lxF/TRii
         +Ni2x8RXrw8eiE97Q6bEG+RDk/9nQ+iTYTnYmgEYBI7Jfv3pwwE4+OtIcaqR5/g9g170
         VovVoljQhlNw9EYmYvZr7N5x8apNcubTckVzVxbtswDOXxkYJNa0E+Yy3uOthBhRfM2n
         xgOjbeMg21Cy0+KcNJ2TNQRO/FDzPTP8tkKYPeK/IcMjV62Ir1HdvXxRl26ATHtBO7Oi
         kKtoaCGjiTiDesqTcj7ToD3/MeBJRSjnSJPRWT+ZTbYmLBplDU49MXCGhq5zr/aqIxJS
         ZzPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to;
        bh=BZ6YdwlTkATP6YcNm1nCerDB1v94oBKP5AayFPJUuNg=;
        b=dhEutBlE1bfambPy7w0IYURRVWDlRjFMrW+m3YesPYV7QoXmvg2hpv24HVwLtCAyWG
         LjR5tEomsW7GdBFEr3E+LdU4QT+5G4XWd2JnxdoAhejSdnwRHxyP4P7jbUUcDpbunnUm
         Zwxygrg1K72DygLmv1+Jrj8ChWhYP+u5bB7fPNuTCANT/6tgsCnKZ05rsrHulXfjnHNG
         3hkEOldn/2695dnkEtHCyKlqSgFJV/2DRczlRsRs7/3oFOyO+NL9zEEBUPon1qNzJ6aQ
         gnibLHt/CwomwXo7VHn9ckS0zqFu9I3uAoL/00bVrbK8k8j5NrkLje4HJzcNGp2tXhnP
         8IRQ==
X-Gm-Message-State: AOAM532kMv+ZFV3ptzb9stHuNRavsXtjlI+532H+Tp22dFl4EJO4t1Xd
        xSxrz6VUNSbAkos8gF9t1WJQXKjifEHV+fuR
X-Google-Smtp-Source: ABdhPJwZ01Mgx0DKAaM8vzoyP8ZZKsF7ddI+fm7+3NEsc2EjFne7JbOL+YmmPt0q+3OXeFXMg2vfeYJLO+WZTj3C
X-Received: from chu-dev.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:3cfb])
 (user=linchuyuan job=sendgmr) by 2002:a17:902:6ac7:b029:d0:89f3:28d1 with
 SMTP id i7-20020a1709026ac7b02900d089f328d1mr6356139plt.13.1599757753178;
 Thu, 10 Sep 2020 10:09:13 -0700 (PDT)
Date:   Thu, 10 Sep 2020 17:09:10 +0000
Message-Id: <20200910170910.1990578-1-linchuyuan@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
Subject: [PATCH] hwmon: pmbus: max20730: adjust the vout reading given voltage divider
From:   Chu Lin <linchuyuan@google.com>
To:     linchuyuan@google.com, jdelvare@suse.com, linux@roeck-us.net,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        qiongwang@google.com, zhongqil@google.com, jasonling@google.com,
        belgaied@google.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Problem:
We use voltage dividers so that the voltage presented at the voltage
sense pins is confusing. We might need to convert these readings to more
meaningful readings given the voltage divider.

Solution:
Read the voltage divider resistance from dts and convert the voltage
reading to a more meaningful reading.

Testing:
max20730 with voltage divider

Signed-off-by: Chu Lin <linchuyuan@google.com>
---
 drivers/hwmon/pmbus/max20730.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/hwmon/pmbus/max20730.c b/drivers/hwmon/pmbus/max20730.c
index c0bb05487e0e..4b56810fa894 100644
--- a/drivers/hwmon/pmbus/max20730.c
+++ b/drivers/hwmon/pmbus/max20730.c
@@ -29,6 +29,7 @@ struct max20730_data {
 	struct pmbus_driver_info info;
 	struct mutex lock;	/* Used to protect against parallel writes */
 	u16 mfr_devset1;
+	u32 vout_voltage_divider[2];
 };
 
 #define to_max20730_data(x)  container_of(x, struct max20730_data, info)
@@ -111,6 +112,12 @@ static int max20730_read_word_data(struct i2c_client *client, int page,
 		max_c = max_current[data->id][(data->mfr_devset1 >> 5) & 0x3];
 		ret = val_to_direct(max_c, PSC_CURRENT_OUT, info);
 		break;
+	case PMBUS_READ_VOUT:
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (data->vout_voltage_divider[0] && data->vout_voltage_divider[1])
+			ret = DIV_ROUND_CLOSEST(ret * data->vout_voltage_divider[1],
+						data->vout_voltage_divider[0]);
+		break;
 	default:
 		ret = -ENODATA;
 		break;
@@ -329,6 +336,15 @@ static int max20730_probe(struct i2c_client *client,
 	data->id = chip_id;
 	mutex_init(&data->lock);
 	memcpy(&data->info, &max20730_info[chip_id], sizeof(data->info));
+	if (of_property_read_u32_array(client->dev.of_node, "vout-voltage-divider",
+				       data->vout_voltage_divider,
+				       ARRAY_SIZE(data->vout_voltage_divider)) != 0)
+		memset(data->vout_voltage_divider, 0, sizeof(data->vout_voltage_divider));
+	if (data->vout_voltage_divider[1] < data->vout_voltage_divider[0]) {
+		dev_err(dev,
+			"The total resistance of voltage divider is less than output resistance\n");
+		return -ENODEV;
+	}
 
 	ret = i2c_smbus_read_word_data(client, MAX20730_MFR_DEVSET1);
 	if (ret < 0)
-- 
2.28.0.526.ge36021eeef-goog

