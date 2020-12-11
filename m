Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AD772D76B0
	for <lists+linux-hwmon@lfdr.de>; Fri, 11 Dec 2020 14:40:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727376AbgLKNgk (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 11 Dec 2020 08:36:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730781AbgLKNgQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 11 Dec 2020 08:36:16 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DED6C0613CF
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Dec 2020 05:35:35 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by andre.telenet-ops.be with bizsmtp
        id 31bZ2400R4C55Sk011bZFS; Fri, 11 Dec 2020 14:35:33 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1knia5-009hlK-8y; Fri, 11 Dec 2020 14:35:33 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1knia4-00CSeQ-KT; Fri, 11 Dec 2020 14:35:32 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] hwmon: (xgene) Drop bogus __refdata annotation
Date:   Fri, 11 Dec 2020 14:35:31 +0100
Message-Id: <20201211133531.2970027-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

As the X-Gene hardware monitoring driver does not have any code or data
located in initmem, there is no need to annotate the xgene_hwmon_driver
structure with __refdata.  Drop the annotation, to avoid suppressing
future section warnings.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/hwmon/xgene-hwmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/xgene-hwmon.c b/drivers/hwmon/xgene-hwmon.c
index f2a5af239c9569b2..1489e83cb0c44011 100644
--- a/drivers/hwmon/xgene-hwmon.c
+++ b/drivers/hwmon/xgene-hwmon.c
@@ -784,7 +784,7 @@ static const struct of_device_id xgene_hwmon_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, xgene_hwmon_of_match);
 
-static struct platform_driver xgene_hwmon_driver __refdata = {
+static struct platform_driver xgene_hwmon_driver = {
 	.probe = xgene_hwmon_probe,
 	.remove = xgene_hwmon_remove,
 	.driver = {
-- 
2.25.1

