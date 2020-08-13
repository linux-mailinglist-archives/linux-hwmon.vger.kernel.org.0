Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C6B7243DB1
	for <lists+linux-hwmon@lfdr.de>; Thu, 13 Aug 2020 18:49:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726253AbgHMQt5 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Thu, 13 Aug 2020 12:49:57 -0400
Received: from 2.mo177.mail-out.ovh.net ([178.33.109.80]:50289 "EHLO
        2.mo177.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726142AbgHMQt5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 13 Aug 2020 12:49:57 -0400
X-Greylist: delayed 1198 seconds by postgrey-1.27 at vger.kernel.org; Thu, 13 Aug 2020 12:49:56 EDT
Received: from player691.ha.ovh.net (unknown [10.108.35.27])
        by mo177.mail-out.ovh.net (Postfix) with ESMTP id B560513B5B5
        for <linux-hwmon@vger.kernel.org>; Thu, 13 Aug 2020 18:10:21 +0200 (CEST)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
        (Authenticated sender: steve@sk2.org)
        by player691.ha.ovh.net (Postfix) with ESMTPSA id 352C3155163E0;
        Thu, 13 Aug 2020 16:10:15 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-104R0051ed08ce6-8045-4efe-9ce6-aae512e6b7fc,
                    E10370F5499BCD549250CF93A1A6372B2A4BB833) smtp.auth=steve@sk2.org
From:   Stephen Kitt <steve@sk2.org>
To:     Beniamin Bia <beniamin.bia@analog.com>,
        Michael Hennerich <Michael.Hennerich@analog.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Stephen Kitt <steve@sk2.org>
Subject: [PATCH] drivers/hwmon/adm1177.c: use simple i2c probe
Date:   Thu, 13 Aug 2020 18:09:58 +0200
Message-Id: <20200813160958.1506536-1-steve@sk2.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 7344526571069328700
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrleehgdejvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepufhtvghphhgvnhcumfhithhtuceoshhtvghvvgesshhkvddrohhrgheqnecuggftrfgrthhtvghrnhepteegudfgleekieekteeggeetveefueefteeugfduieeitdfhhedtfeefkedvfeefnecukfhppedtrddtrddtrddtpdekvddrieehrddvhedrvddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrheiledurdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepshhtvghvvgesshhkvddrohhrghdprhgtphhtthhopehlihhnuhigqdhhfihmohhnsehvghgvrhdrkhgvrhhnvghlrdhorhhg
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This driver doesn't use the id information provided by the old i2c
probe function, so it can trivially be converted to the simple
("probe_new") form.

Signed-off-by: Stephen Kitt <steve@sk2.org>
---
 drivers/hwmon/adm1177.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/adm1177.c b/drivers/hwmon/adm1177.c
index d314223a404a..6e8bb661894b 100644
--- a/drivers/hwmon/adm1177.c
+++ b/drivers/hwmon/adm1177.c
@@ -196,8 +196,7 @@ static void adm1177_remove(void *data)
 	regulator_disable(st->reg);
 }
 
-static int adm1177_probe(struct i2c_client *client,
-			 const struct i2c_device_id *id)
+static int adm1177_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct device *hwmon_dev;
@@ -277,7 +276,7 @@ static struct i2c_driver adm1177_driver = {
 		.name = "adm1177",
 		.of_match_table = adm1177_dt_ids,
 	},
-	.probe = adm1177_probe,
+	.probe_new = adm1177_probe,
 	.id_table = adm1177_id,
 };
 module_i2c_driver(adm1177_driver);
-- 
2.25.4

