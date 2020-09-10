Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E7FE264AB6
	for <lists+linux-hwmon@lfdr.de>; Thu, 10 Sep 2020 19:09:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727058AbgIJRIl (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Thu, 10 Sep 2020 13:08:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726890AbgIJRIZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 10 Sep 2020 13:08:25 -0400
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com [IPv6:2607:f8b0:4864:20::749])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33D80C061757
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2020 10:08:25 -0700 (PDT)
Received: by mail-qk1-x749.google.com with SMTP id m23so1144693qkh.10
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2020 10:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to;
        bh=BZ6YdwlTkATP6YcNm1nCerDB1v94oBKP5AayFPJUuNg=;
        b=Ai2vmMkDkdZ6vRWJ0lhs98xNTLunr8RFYDvleWom+E/NgDXjIOGxYdIbHucuJziRuD
         WQE5erR0AlX8OvVIaY9JSqtcY6ddr5jk/BG7S5PgV4hBp5yeKSIDKT0J9nPW3tQKDGdy
         H4/csGumgf+Ez3Ljm7rsmwPRlvpQP+wM/+INkoVJvNMiLF+z4Vhsnsm8hcGnNyHk6MUG
         vg9A0q0P9dbr46dkU0Iu3fPQoSosoDokIM+2SQL4D23DM7lv3uwivM34d7/vHubKGzGL
         vT39UfQbLX5diR645KJR/SDLnp+VLfpjLN9oXiHe1elMf6sSYIZGHHdy/C8ESoljftjJ
         QhtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to;
        bh=BZ6YdwlTkATP6YcNm1nCerDB1v94oBKP5AayFPJUuNg=;
        b=nX55rUYWMiWivgh9zytfkMcvtrA4UOJlI1dK5rkx5+jyOoUwWS9tytWiGA7h6Zd5gN
         mlGOD8wiFjh0DyyEu30P9oDoypI4SK3gnVnGkEN1+0w/uUPErR9d0ms8cHhP6g2QBBLK
         /JRRRBRn/YdA6kfYSQMrhjpjf3cMw89F092ObCwdVAIFlj47i2oyp0TMD58evX/oqFfQ
         mhdPdZkSxtM1Ch8+Lkd6Pv0OMOXN02BS6cZqlpDT7P+a4AO5GpXIZ1SOrjii7807ilxz
         OqhOlJPRWaieRXHTK7NuJIf6Qql6Qj6PD7QIftzRWb3rVS1V6Iq6sfEAjhnCFuQ9zNGI
         2hPQ==
X-Gm-Message-State: AOAM531ea1BVyY0SAzLL5xAT9aKCl6J9L2uXJV2LRlohAysrfvgAmLF0
        demDRUhdTyffnfzEyqXqz5rhkcB4T6LKF1VD
X-Google-Smtp-Source: ABdhPJx+7OOyKHKXz87Yhbi4VvnetfXmdc6s4b1LWLln9dKwcSBoRl9SCrIo0G9osX3kRPdS3m47zSNu3rjcRW/b
X-Received: from chu-dev.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:3cfb])
 (user=linchuyuan job=sendgmr) by 2002:ad4:43e5:: with SMTP id
 f5mr9086510qvu.12.1599757704282; Thu, 10 Sep 2020 10:08:24 -0700 (PDT)
Date:   Thu, 10 Sep 2020 17:08:21 +0000
Message-Id: <20200910170821.1988467-1-linchuyuan@google.com>
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

