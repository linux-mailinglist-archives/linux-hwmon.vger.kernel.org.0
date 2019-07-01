Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C341FBD0
	for <lists+linux-hwmon@lfdr.de>; Tue, 30 Apr 2019 16:46:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbfD3OqU (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 30 Apr 2019 10:46:20 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:47797 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726053AbfD3OqU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 30 Apr 2019 10:46:20 -0400
Received: from 82-132-219-116.dab.02.net ([82.132.219.116] helo=ct-lt-765.unassigned)
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1hLU1T-0002kC-0m; Tue, 30 Apr 2019 15:46:19 +0100
Received: from ikerpalomar by ct-lt-765.unassigned with local (Exim 4.89)
        (envelope-from <ikerpalomar@ct-lt-765.unassigned>)
        id 1hLU1M-00055J-5a; Tue, 30 Apr 2019 15:46:12 +0100
From:   Iker Perez <iker.perez@codethink.co.uk>
To:     linux-hwmon@vger.kernel.org
Cc:     linux@roeck-us.net,
        Iker Perez del Palomar Sustatxa 
        <iker.perez@codethink.co.uk>
Subject: [PATCH v3 2/2] dt-bindings: hwmon: Add tmp75b to lm75.txt
Date:   Tue, 30 Apr 2019 15:46:09 +0100
Message-Id: <20190430144609.19500-3-iker.perez@codethink.co.uk>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190430144609.19500-1-iker.perez@codethink.co.uk>
References: <20190430144609.19500-1-iker.perez@codethink.co.uk>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>

Signed-off-by: Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>
---
 Documentation/devicetree/bindings/hwmon/lm75.txt | 1 +
 1 file changed, 1 insertion(+)

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

