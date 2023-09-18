Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14E977A4564
	for <lists+linux-hwmon@lfdr.de>; Mon, 18 Sep 2023 11:04:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241042AbjIRJA7 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 18 Sep 2023 05:00:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240901AbjIRJAR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Sep 2023 05:00:17 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02507138
        for <linux-hwmon@vger.kernel.org>; Mon, 18 Sep 2023 02:00:03 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6r-0008V0-DT; Mon, 18 Sep 2023 11:00:01 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6q-007B6w-Iu; Mon, 18 Sep 2023 11:00:00 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6q-002Z9x-9e; Mon, 18 Sep 2023 11:00:00 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Juerg Haefliger <juergh@proton.me>, linux-hwmon@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 20/24] hwmon: (vt1211) Convert to platform remove callback returning void
Date:   Mon, 18 Sep 2023 10:59:47 +0200
Message-Id: <20230918085951.1234172-21-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230918085951.1234172-1-u.kleine-koenig@pengutronix.de>
References: <20230918085951.1234172-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1692; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=7YTdkKp9WZi2RZWUvgGvSMHdcv9J/v0L3eNYSth4Luc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCBBATjKJhpeMffKMjHYl6nDe7e0NwkHw+rk0F gS1pzCWXHiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQgQQAAKCRCPgPtYfRL+ TlBuCACm3FYpEvqxIA+eQ0zzmk3iit7M3vZMjhVfIXRgX+WMNj47EtevJMc/oaMx94x3BwvPxF1 jHlOz6DVY0meQXdRui1Nw6DqWNejKyfy+FQn17GWmrN+4E32Za3dqtWjvGtRscmeWFO8KPVbIBY ZwFGffKs1Y1Tm4HwvxHCpsrvfdyKWVVDlc4vev/CGXBSkxl8HwIQVeZuyDA7BZoKQ7+6Tpe0aSS gJT3ehhDRB3/RhGQXgI65KozbjXjT07CtBIvGVO+8c1gPj3GJwV6QGZdJfW+Wgy3h+IuHM4Px5H NE1ROg400iy8asdNaySezrVuzGPSxB/fQFpE6h8k3jOiqHD3
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-hwmon@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.
To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new() which already returns void. Eventually after all drivers
are converted, .remove_new() is renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/hwmon/vt1211.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/vt1211.c b/drivers/hwmon/vt1211.c
index fcd4be7a5a85..2f3890463e18 100644
--- a/drivers/hwmon/vt1211.c
+++ b/drivers/hwmon/vt1211.c
@@ -1208,14 +1208,12 @@ static int vt1211_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int vt1211_remove(struct platform_device *pdev)
+static void vt1211_remove(struct platform_device *pdev)
 {
 	struct vt1211_data *data = platform_get_drvdata(pdev);
 
 	hwmon_device_unregister(data->hwmon_dev);
 	vt1211_remove_sysfs(pdev);
-
-	return 0;
 }
 
 static struct platform_driver vt1211_driver = {
@@ -1223,7 +1221,7 @@ static struct platform_driver vt1211_driver = {
 		.name  = DRVNAME,
 	},
 	.probe  = vt1211_probe,
-	.remove = vt1211_remove,
+	.remove_new = vt1211_remove,
 };
 
 static int __init vt1211_device_add(unsigned short address)
-- 
2.40.1

