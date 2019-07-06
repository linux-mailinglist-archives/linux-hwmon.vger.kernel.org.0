Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2D22610C8
	for <lists+linux-hwmon@lfdr.de>; Sat,  6 Jul 2019 15:21:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726181AbfGFNVn (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sat, 6 Jul 2019 09:21:43 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:34044 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726065AbfGFNVm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 6 Jul 2019 09:21:42 -0400
Received: by mail-pl1-f193.google.com with SMTP id i2so5901642plt.1
        for <linux-hwmon@vger.kernel.org>; Sat, 06 Jul 2019 06:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=E8N0HI7uSZwpzU44xVmZ+0od29PjCSHllFIul36oipc=;
        b=N8S7j05IchpFl69+0zb6sLOCfA7lVFUJ8OCjpJpV0kXxEl/wgy/b8yQ8Kb9EytA5rz
         aVhIVXL4Ht4l2eJWARQXJb9kQlrA2DWXnc2CEYCiQASZXMqKTSkeiyZc85gX0qO4pz80
         lVGzAlKQeIE13CrBAteUmtO/6IgPiIilcn5rz2mdKVw3A4pKK+EWQ1kSmomyzKPuxtOz
         x4PNwZu/Dr5CeukDrj5uBhnJLVALRAkvMQ93/IVcmu0t36EeBDKMtLuJXbrgcDFgUKV2
         gbHu+xAwLZ63tHovdhWY6QIMkNPmexBO31w81C8hIiye6eV+QhJrF+Z3KIUUaVJyISys
         n8ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=E8N0HI7uSZwpzU44xVmZ+0od29PjCSHllFIul36oipc=;
        b=C5s6RQWHU8YIw6Yvc9szxphPD9akzlML8yQFmsJwF9xwcaDi5apBkIgdsz7C//4Fxs
         RokhWTZzgMKyhOgasv0LHcxzerukvcxDSFmf+64YpWYQB3NCHndRZPQ/NoM16e6U9Dhx
         on7zTHwxbQjLguU/vWRkQL50NTMiI3HFl78TycDkwkM/EgmXEAXx3XEFKn6yii5QnU09
         eBq/YL7OFPOiVoltilFbdm2LqDrGnTx2hJrFboPYdPGVtdPoAVi17aw3UW4vQTXLRH28
         XCyyhdD9doUXJbR3bC0bIwxU7Q3HWsGx5VPccDIls42YOK44/178Txkk+EvXDPWFxk6t
         zJag==
X-Gm-Message-State: APjAAAXKbLd/YfCOitmv+LDT59Om7SmmGtXtYyYOjvDffoi8YkorJPNq
        BV3SKbnnfCkJjXE3rox+cvbSLk4A
X-Google-Smtp-Source: APXvYqyZhD+5VKsEmWwvbrGBc6qsVLlDkCqg/jiry8nQJk4RXz249ycYrrBSbS2bQojVZiaaCXY/rw==
X-Received: by 2002:a17:902:e512:: with SMTP id ck18mr10890281plb.53.1562419302349;
        Sat, 06 Jul 2019 06:21:42 -0700 (PDT)
Received: from localhost.localdomain ([122.163.64.117])
        by smtp.gmail.com with ESMTPSA id d12sm11523827pfd.96.2019.07.06.06.21.40
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 06 Jul 2019 06:21:42 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     jdelvare@suse.com, linux@roeck-us.net, linux-hwmon@vger.kernel.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] hwmon: ina3221.c: Add of_node_put() before return
Date:   Sat,  6 Jul 2019 18:51:30 +0530
Message-Id: <20190706132130.3129-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Each iteration of for_each_child_of_node puts the previous
node, but in the case of a return from the middle of the loop, there is
no put, thus causing a memory leak. Hence add an of_node_put before the
return.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/hwmon/ina3221.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
index 55943b4dcc7b..0037e2bdacd6 100644
--- a/drivers/hwmon/ina3221.c
+++ b/drivers/hwmon/ina3221.c
@@ -713,8 +713,10 @@ static int ina3221_probe_from_dt(struct device *dev, struct ina3221_data *ina)
 
 	for_each_child_of_node(np, child) {
 		ret = ina3221_probe_child_from_dt(dev, child, ina);
-		if (ret)
+		if (ret) {
+			of_node_put(child);
 			return ret;
+		}
 	}
 
 	return 0;
-- 
2.19.1

