Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CEF265757
	for <lists+linux-hwmon@lfdr.de>; Thu, 11 Jul 2019 14:54:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728301AbfGKMy0 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Thu, 11 Jul 2019 08:54:26 -0400
Received: from mail.bugwerft.de ([46.23.86.59]:35062 "EHLO mail.bugwerft.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726039AbfGKMy0 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 11 Jul 2019 08:54:26 -0400
X-Greylist: delayed 552 seconds by postgrey-1.27 at vger.kernel.org; Thu, 11 Jul 2019 08:54:26 EDT
Received: from localhost.localdomain (pD95EF75A.dip0.t-ipconnect.de [217.94.247.90])
        by mail.bugwerft.de (Postfix) with ESMTPSA id D874D292152;
        Thu, 11 Jul 2019 12:41:52 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     linux-hwmon@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux@roeck-us.net, jdelvare@suse.com,
        Daniel Mack <daniel@zonque.org>
Subject: [PATCH 1/2] device-tree: bindinds: add NXP PCT2075 as compatible device to LM75
Date:   Thu, 11 Jul 2019 14:45:03 +0200
Message-Id: <20190711124504.7580-1-daniel@zonque.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The PCT2075 is compatible to other chips that are already handled by
the LM75 driver.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 Documentation/devicetree/bindings/hwmon/lm75.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwmon/lm75.txt b/Documentation/devicetree/bindings/hwmon/lm75.txt
index 12d8cf7cf592..bfb22b249708 100644
--- a/Documentation/devicetree/bindings/hwmon/lm75.txt
+++ b/Documentation/devicetree/bindings/hwmon/lm75.txt
@@ -15,6 +15,7 @@ Required properties:
 		"maxim,max31725",
 		"maxim,max31726",
 		"maxim,mcp980x",
+		"nxp,pct2075",
 		"st,stds75",
 		"st,stlm75",
 		"microchip,tcn75",
-- 
2.21.0

