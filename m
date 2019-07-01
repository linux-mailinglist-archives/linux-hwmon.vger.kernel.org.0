Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE50447E88
	for <lists+linux-hwmon@lfdr.de>; Mon, 17 Jun 2019 11:34:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725884AbfFQJeV (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 17 Jun 2019 05:34:21 -0400
Received: from smtp.radiodata.biz ([116.203.112.52]:40471 "EHLO
        smtp.radiodata.biz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725837AbfFQJeV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 17 Jun 2019 05:34:21 -0400
Received: from localhost (localhost [127.0.0.1])
        by smtp.radiodata.biz (Postfix) with ESMTP id 4F74D3E8E7;
        Mon, 17 Jun 2019 11:34:19 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at smtp.radiodata.biz
Received: from smtp.radiodata.biz ([116.203.112.52])
        by localhost (smtp.radiodata.biz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 1OKYejc90pSi; Mon, 17 Jun 2019 11:34:10 +0200 (CEST)
Received: from mail.radiodata.biz (p578044f8.dip0.t-ipconnect.de [87.128.68.248])
        by smtp.radiodata.biz (Postfix) with ESMTPSA id C75B63E8E6;
        Mon, 17 Jun 2019 11:34:10 +0200 (CEST)
Received: from christian-VirtualBox.radiodata.xx (christian-VirtualBox.radiodata.xx [192.168.2.133])
        by mail.radiodata.biz (Postfix) with ESMTPA id 7D0612023C;
        Mon, 17 Jun 2019 11:34:10 +0200 (CEST)
From:   cschneider@radiodata.biz
To:     linux-hwmon@vger.kernel.org
Cc:     Christian Schneider <christian@ch-sc.de>,
        Christian Schneider <cschneider@radiodata.biz>
Subject: [PATCH] Fix sysfs_notify and kobject_uevent in fan_alarm_notify
Date:   Mon, 17 Jun 2019 11:33:43 +0200
Message-Id: <20190617093343.1366-1-cschneider@radiodata.biz>
X-Mailer: git-send-email 2.17.1
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Christian Schneider <christian@ch-sc.de>

sysfs_notify and kobject_uevent are passed the wrong kobject.
that why notifications can't be received and uevents have the wrong path.
this patch fixes this.

Signed-off-by: Christian Schneider <cschneider@radiodata.biz>
---
 drivers/hwmon/gpio-fan.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
index 84753680a4e8..76377791ff0e 100644
--- a/drivers/hwmon/gpio-fan.c
+++ b/drivers/hwmon/gpio-fan.c
@@ -54,8 +54,8 @@ static void fan_alarm_notify(struct work_struct *ws)
 	struct gpio_fan_data *fan_data =
 		container_of(ws, struct gpio_fan_data, alarm_work);
 
-	sysfs_notify(&fan_data->dev->kobj, NULL, "fan1_alarm");
-	kobject_uevent(&fan_data->dev->kobj, KOBJ_CHANGE);
+	sysfs_notify(&fan_data->hwmon_dev->kobj, NULL, "fan1_alarm");
+	kobject_uevent(&fan_data->hwmon_dev->kobj, KOBJ_CHANGE);
 }
 
 static irqreturn_t fan_alarm_irq_handler(int irq, void *dev_id)
-- 
2.17.1

