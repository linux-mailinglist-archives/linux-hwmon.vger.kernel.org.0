Return-Path: <linux-hwmon+bounces-397-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0471080930F
	for <lists+linux-hwmon@lfdr.de>; Thu,  7 Dec 2023 22:07:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB11C1F20FE8
	for <lists+linux-hwmon@lfdr.de>; Thu,  7 Dec 2023 21:07:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8471050264;
	Thu,  7 Dec 2023 21:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="PqXNYQK6"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B4501718;
	Thu,  7 Dec 2023 13:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1701983253; x=1702588053; i=w_armin@gmx.de;
	bh=dokTWT5/qKEIWL3FjJAfR6lazLd3nT0Z4f+vw5U4Urg=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=PqXNYQK65B3Z1cuoUX+pUYSpj+feZYpdLXyrFla7F+ShY+RbsJYKOy0aV0MsapHh
	 2NUUkrkjRtaia8BAnATWr+/dCQAfCdk4Eg72YudIZvG85sn3swvi8cEZiP6eFHPft
	 ReYx/3KvdctwQvS6sxa61rbIFVWn1parj07M0fDh/3f2/fQMPmjtLEfVZZveTwyDj
	 MzAyzicDD6Sq3faUuKLmoKoZ2gpNXZqGXB1TZpc9NLQZQgXOYCnfceKb35PheNUk1
	 D2PI88aWlJ7y26PFxHmWpyYBrPhVajVLfaMsB5sgtA7NFodRr3eFNiP8j1vsqa9Sa
	 pRMW8a6uGsMlHW0FEg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.users.agdsn.de ([141.30.226.129]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MmUHp-1rc7q02jfF-00iQck; Thu, 07 Dec 2023 22:07:33 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: wilken.gottwalt@posteo.net
Cc: jdelvare@suse.com,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (corsair-psu) Fix probe when built-in
Date: Thu,  7 Dec 2023 22:07:23 +0100
Message-Id: <20231207210723.222552-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GCP0IYyl6x0+7OkHz3se1KwxZHXxR7z9mJpNQtKLxCeiqWUcqKF
 sWLZKmt9pQCxmcmgCLFtmHBpc9oGRalpZRtXADrgH7xUscT9B12Dy6vPgZgMDAZqtTwT30M
 7toyZtXQWCO/FVpA9CaZJfGFxFTqphENMZXQWQvCuv3jwV67QHTl+S9m/+q3azcXTdIm3si
 zzWeu1pnMDLYXVs1bs1+Q==
UI-OutboundReport: notjunk:1;M01:P0:vHqp8faGvxk=;VPD02ArP9LJBfdJYyRNb5iGd9bE
 oYy6JcnGI+jpPnZpbLXra+I1k2Un/Q1ODq2DVk8tLB2ed70csY6c25QEwDfs7XxXrbrOCGh0O
 GPz4uLcOi3WtRi25MeKybEWbd5FDX6aGdIM1J5qjIKUqqlO29UX8D5YCE1Q9Am/ayaipPJ7bN
 HTjAiwWmZFPwPqpb+QpCjfK4A2UQDbwVC6ZvruHkmy3fv5YFJIBoZdzUBKseoIShG+ZErsX1n
 8dFQA0enQNcxvs6FNTaqncO88dRzYNhPs1x+9D6QVa8Th4fRR4+UlHTXr0WMrZxDCBJ4J7FGU
 5hxGXdEd9Lxu2UFalqL6xjiZrJNnQHjVjQrmjr1BH1nQYwcOGHPh3/2NcQLr0H6Zl5f/JlvWU
 PoY+KaePeIWKp2T+FtYXBFWEZlz3wWud5yyrs7cPw1J8XuTwHJXXkfPyU0TGkTa496eH8QZtx
 QHUF/bDoAEdMaiT19EBUFdTvVvkI4zL1VgL8uC5LSiILE51v7akzZNcZYcTrmG3pzbJU42IzC
 Am+YGAJnpnNf0reyQqxnn7WZWuKmzCX0vff8Tu1CNk4Zc4+PRXzqL4wan3IwQpnxKwg/8UH7U
 j0mvhebBv5mu6hS9HYRon3aA1oTXho4wklEYioWrIM3GoaSxpOlU7w/9Jbw/vuB8i8tr8wHRN
 mroiAiEB59QQkXYglyaH4qZxJAJbBRZFyVzLU/thihY5V9u0V0aaotB7vWxvBFuC+Bi74bTJs
 7AhGOrq6iFPfWo3yhAbvNIvMZYwuv1PSSEsN8PGmU/tp5P4RpQkyVXX+/s+aTeift0tU8EGtT
 CD3Z4j9Zfix4OpxfirbLI1nHpysPks9NKrTUIFlo2B8jtZyYRQgBc1kx4y1Dksn3HtEZ4uNht
 zfafgsISWG98Q/KCMk5n3rOfESqg0iVYwGea9B5DAKvp65Q+yRhVdVjP9/SkYojVq0tdBhhnO
 6BomVApjEXey2XIZ+ooT+kzOySQ=

It seems that when the driver is built-in, the HID bus is
initialized after the driver is loaded, which whould cause
module_hid_driver() to fail.
Fix this by registering the driver after the HID bus using
late_initcall() in accordance with other hwmon HID drivers.

Compile-tested only.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/hwmon/corsair-psu.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/corsair-psu.c b/drivers/hwmon/corsair-psu.c
index 904890598c11..2c7c92272fe3 100644
=2D-- a/drivers/hwmon/corsair-psu.c
+++ b/drivers/hwmon/corsair-psu.c
@@ -899,7 +899,23 @@ static struct hid_driver corsairpsu_driver =3D {
 	.reset_resume	=3D corsairpsu_resume,
 #endif
 };
-module_hid_driver(corsairpsu_driver);
+
+static int __init corsair_init(void)
+{
+	return hid_register_driver(&corsairpsu_driver);
+}
+
+static void __exit corsair_exit(void)
+{
+	hid_unregister_driver(&corsairpsu_driver);
+}
+
+/*
+ * With module_init() the driver would load before the HID bus when
+ * built-in, so use late_initcall() instead.
+ */
+late_initcall(corsair_init);
+module_exit(corsair_exit);

 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Wilken Gottwalt <wilken.gottwalt@posteo.net>");
=2D-
2.39.2


