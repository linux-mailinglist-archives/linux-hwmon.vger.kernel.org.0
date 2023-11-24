Return-Path: <linux-hwmon+bounces-199-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF817F7E0D
	for <lists+linux-hwmon@lfdr.de>; Fri, 24 Nov 2023 19:29:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99CDA1C2133C
	for <lists+linux-hwmon@lfdr.de>; Fri, 24 Nov 2023 18:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 912303A8E5;
	Fri, 24 Nov 2023 18:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="RG0xaV/0"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 411211BC9;
	Fri, 24 Nov 2023 10:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1700850472; x=1701455272; i=w_armin@gmx.de;
	bh=YOwNjDfGnJRJthcNBht0dNRhiwLqkmRlexlwOFwzi44=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=RG0xaV/0Th+t69dZ+vzHSCjLERYvu/mBSKNlrG1LxgamPxKcUzarGDd8dkLM8KJM
	 ye0glsE1DZCQX7W5MTKNHX4BD1he20dTbxg5h+YgdV/G2IxMcZZn21Jamp0jaXFKY
	 Hfl73iQgLLGg34AVBbZoMzyvj5Rwpk+KMHPaFDfj0RWIgdC+mBRZQRGlE1qPlmVH4
	 gOHgAautMpOakAi5XEayHTkk/D/GEM9sjlVcxaPgbMMFi9FdMA4n/Wrwjz7ZYye9G
	 QBT65sQyZGRvYahEP8xzhFAU2as37wUz8Alxh7VRzscJjiewzMPN6Cw4+iRz3meZy
	 84AxzmxPMxEgG1ixWg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.users.agdsn.de ([141.30.226.129]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MatVh-1rifTf1kSJ-00cULO; Fri, 24 Nov 2023 19:27:52 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: jdelvare@suse.com,
	linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (acpi_power_meter) Fix 4.29 MW bug
Date: Fri, 24 Nov 2023 19:27:47 +0100
Message-Id: <20231124182747.13956-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FSfNVWMWv8UmnIPizhw0uZDKiGrcoL0B18QnbH5XNikbR+CPo+r
 UhCsbAxKGd8saZs5Jt0uMC7HphiM7y//Rx9IQjSIWQfmwlOwfqA3UZ3SMf0lyyyaD7ajvfI
 JrboNahOd1r8+D0fX+lQ4nWIKKII6nr8Ja5PFws2jFv6BeLj0lUHmB7/CGV44eVg/VfIo0T
 jHu8U291TkotvmhNi0X2w==
UI-OutboundReport: notjunk:1;M01:P0:6rj7i4piqfE=;XFSf2fXxtxeD6KElg3zwEDlmweZ
 qYUnmgmsNyQ7o/HjxD2PMhsH2Mpn8U4KZEzR6KCeqgKfNQWOHddUg+3Tug7yWPkMR3c9CFvzd
 RnXpknb2ZfuyqacYzfI+SNLli75YvXTHORiSdWUj5/b8sBjGdfMo41UJIdLpOW5urBtownWu0
 Xwr+L0GFG3WNxQtVRtUPy1HMRHUcNlZ+xpRfpc9ejcM5B7aSCXQ1sD8G7kRvGx76argJMohcQ
 P/+9yI1ChUTdTPfUpYUb5WhhQ+zu0XPOnePGyiLCxQDVqR+mqq6W5LBtObrZxUwOOF3MteGQ5
 MAhJw/zcZyw/+0OGNYXxQMhiyW3pwyoi8XVc0ld8Clycht2R6pIesz54a2mFZdH1Hyws+2zyp
 aebSgkaVcCE3iNjLNeXz2mOB9y4438B/rkTXs84cxna6L0xHOoVeW6DEwZjJ2SnvjLG3F31J3
 HsKNtUsVlxtpznN960hs1bOeGSS73nmpDlOEC6JptUyVAh6sR3wlrDKdRIIt5SsW4Yb+lkD/l
 NG6ZUG1vMIL2WQmrxL5yOJoM+jfWneJeelH0om/k+5uv4S1dk7F+MrmnIuwR8UHWgZLjccTop
 8C7Bdes/n7HfrgijlyfPFDRtSYIlLmecxSlMYRQUFbCzxcH37VXLk3LXvQSJlC4wpeYrkg04m
 XjKZvaLMG0ARBoP3gHaT4nRZWVvrvLSGMOa1eB8SMkHM8b5KHiG7na0yszd3jjW6VFL7SRa9A
 ctThhVEZ7TrmNsRiBchu+iYyawT9d/n1xGqOuyj323TBF0HNGpxpIzhcBwff5+u/5n5n+2eSU
 g/NMC3RMDPinFWkq+eZ8NWVbOp0iT1bgU2e7OQRAovRlXRzWkZ9ucSRxFP6f/h2MOGNVPRqjI
 IpnJUyoG6IHRm0uMDA1UPjThsprCSKYO7DZQmQLw9tdxxqpXusxCXuJ0R6p4Zf2xMZTHvWSPq
 TYnL2UBSZxMwlXVAruZZ1bdPU90=

The ACPI specification says:

"If an error occurs while obtaining the meter reading or if the value
is not available then an Integer with all bits set is returned"

Since the "integer" is 32 bits in case of the ACPI power meter,
userspace will get a power reading of 2^32 * 1000 miliwatts (~4.29 MW)
in case of such an error. This was discovered due to a lm_sensors
bugreport (https://github.com/lm-sensors/lm-sensors/issues/460).
Fix this by returning -ENODATA instead.

Tested-by: <urbinek@gmail.com>
Fixes: de584afa5e18 ("hwmon driver for ACPI 4.0 power meters")
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/hwmon/acpi_power_meter.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hwmon/acpi_power_meter.c b/drivers/hwmon/acpi_power_m=
eter.c
index 8db740214ffd..703666b95bf4 100644
=2D-- a/drivers/hwmon/acpi_power_meter.c
+++ b/drivers/hwmon/acpi_power_meter.c
@@ -31,6 +31,7 @@
 #define POWER_METER_CAN_NOTIFY	(1 << 3)
 #define POWER_METER_IS_BATTERY	(1 << 8)
 #define UNKNOWN_HYSTERESIS	0xFFFFFFFF
+#define UNKNOWN_POWER		0xFFFFFFFF

 #define METER_NOTIFY_CONFIG	0x80
 #define METER_NOTIFY_TRIP	0x81
@@ -348,6 +349,9 @@ static ssize_t show_power(struct device *dev,
 	update_meter(resource);
 	mutex_unlock(&resource->lock);

+	if (resource->power =3D=3D UNKNOWN_POWER)
+		return -ENODATA;
+
 	return sprintf(buf, "%llu\n", resource->power * 1000);
 }

=2D-
2.39.2


