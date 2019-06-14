Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D07B45FD5
	for <lists+linux-hwmon@lfdr.de>; Fri, 14 Jun 2019 16:01:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728561AbfFNOBF (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 14 Jun 2019 10:01:05 -0400
Received: from smtp.radiodata.biz ([116.203.112.52]:59851 "EHLO
        smtp.radiodata.biz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727922AbfFNOBF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 14 Jun 2019 10:01:05 -0400
X-Greylist: delayed 505 seconds by postgrey-1.27 at vger.kernel.org; Fri, 14 Jun 2019 10:01:04 EDT
Received: from localhost (localhost [127.0.0.1])
        by smtp.radiodata.biz (Postfix) with ESMTP id 651223E8E7
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Jun 2019 15:52:36 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at smtp.radiodata.biz
Received: from smtp.radiodata.biz ([116.203.112.52])
        by localhost (smtp.radiodata.biz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id bAktcaIHcZ5z for <linux-hwmon@vger.kernel.org>;
        Fri, 14 Jun 2019 15:52:27 +0200 (CEST)
Received: from mail.radiodata.biz (p578044f8.dip0.t-ipconnect.de [87.128.68.248])
        by smtp.radiodata.biz (Postfix) with ESMTPSA id E61BD3E8E6
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Jun 2019 15:52:27 +0200 (CEST)
Received: from [192.168.2.213] (raphael-WINPC.radiodata.xx [192.168.2.213])
        by mail.radiodata.biz (Postfix) with ESMTPSA id 9BA1020264
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Jun 2019 15:52:27 +0200 (CEST)
From:   Christian Schneider <cschneider@radiodata.biz>
Subject: [PATCH] hwmon, gpio-fan: fix that sysfs_notify in void
 fan_alarm_notify is not received in userspace
To:     linux-hwmon@vger.kernel.org
Message-ID: <e9dbbefb-7714-921b-c5d1-4064d8c43f74@radiodata.biz>
Date:   Fri, 14 Jun 2019 15:52:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Christian Schneider <cschneider@radiodata.biz>
   To: linux-hwmon
Alarms on gpio-fan can't be received from sysfs_notify, because the 
wrong kobject is passed.
This patch fixes this.
Signed-off-by: Christian Schneider <cschneider@radiodata.biz>
---
diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
index 84753680a4e8..5f3a35db18a1 100644
--- a/drivers/hwmon/gpio-fan.c
+++ b/drivers/hwmon/gpio-fan.c
@@ -54,7 +54,7 @@ static void fan_alarm_notify(struct work_struct *ws)
         struct gpio_fan_data *fan_data =
                 container_of(ws, struct gpio_fan_data, alarm_work);

-       sysfs_notify(&fan_data->dev->kobj, NULL, "fan1_alarm");
+       sysfs_notify(&fan_data->hwmon_dev->kobj, NULL, "fan1_alarm");
         kobject_uevent(&fan_data->dev->kobj, KOBJ_CHANGE);
  }
