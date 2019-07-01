Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 056C0131EC
	for <lists+linux-hwmon@lfdr.de>; Fri,  3 May 2019 18:15:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726969AbfECQPI (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 3 May 2019 12:15:08 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:34386 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725809AbfECQPH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 3 May 2019 12:15:07 -0400
Received: from [167.98.27.226] (helo=ct-lt-765.unassigned)
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1hMaq2-0003gm-1l; Fri, 03 May 2019 17:15:06 +0100
Received: from ikerpalomar by ct-lt-765.unassigned with local (Exim 4.89)
        (envelope-from <ikerpalomar@ct-lt-765.unassigned>)
        id 1hMaq1-0007lj-Lw; Fri, 03 May 2019 17:15:05 +0100
From:   Iker Perez <iker.perez@codethink.co.uk>
To:     linux-hwmon@vger.kernel.org
Cc:     linux@roeck-us.net, devicetree@vger.kernel.org,
        Iker Perez del Palomar Sustatxa 
        <iker.perez@codethink.co.uk>
Subject: [PATCH v4 2/2] dt-bindings: hwmon: Add tmp75b to lm75.txt
Date:   Fri,  3 May 2019 17:15:01 +0100
Message-Id: <20190503161501.29489-3-iker.perez@codethink.co.uk>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190503161501.29489-1-iker.perez@codethink.co.uk>
References: <20190503161501.29489-1-iker.perez@codethink.co.uk>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>

Update the LM75's devicetree definition to allow Texas Instruments
TMP75B be probed.

Signed-off-by: Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>
---
 Documentation/devicetree/bindings/hwmon/lm75.txt | 1 +
 1 file changed, 1 insertion(+)

Version log:                                                                     
                                                                                 
- V4:                                                                            
  - Improve the commit description message.                                      
- V3:                                                                            
  - Separate dt-bindings and driver-documentation into different                 
    commits. 

diff --git a/Documentation/devicetree/bindings/hwmon/lm75.txt b/Documentation/devicetree/bindings/hwmon/lm75.txt
index 12d8cf7cf592..586b5ed70be7 100644
--- a/Documentation/devicetree/bindings/hwmon/lm75.txt
+++ b/Documentation/devicetree/bindings/hwmon/lm75.txt
@@ -25,6 +25,7 @@ Required properties:
 		"ti,tmp175",
 		"ti,tmp275",
 		"ti,tmp75",
+		"ti,tmp75b",
 		"ti,tmp75c",
 
 - reg: I2C bus address of the device
-- 
2.11.0

