Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FA7121C637
	for <lists+linux-hwmon@lfdr.de>; Sat, 11 Jul 2020 22:42:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727083AbgGKUmH (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sat, 11 Jul 2020 16:42:07 -0400
Received: from vps-vb.mhejs.net ([37.28.154.113]:40854 "EHLO vps-vb.mhejs.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726961AbgGKUmH (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 11 Jul 2020 16:42:07 -0400
Received: from MUA
        by vps-vb.mhejs.net with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.93.0.4)
        (envelope-from <mail@maciej.szmigiero.name>)
        id 1juMJu-0007mc-VO; Sat, 11 Jul 2020 22:42:03 +0200
From:   "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] hwmon: (drivetemp) Avoid SCT usage on Toshiba DT01ACA family drives
Date:   Sat, 11 Jul 2020 22:41:57 +0200
Message-Id: <8325438e25a3a5a7e6d12ef6ede8f4350e4c65be.1594500029.git.mail@maciej.szmigiero.name>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

It has been observed that Toshiba DT01ACA family drives have
WRITE FPDMA QUEUED command timeouts and sometimes just freeze until
power-cycled under heavy write loads when their temperature is getting
polled in SCT mode. The SMART mode seems to be fine, though.

Let's make sure we don't use SCT mode for these drives then.

While only the 3 TB model was actually caught exhibiting the problem let's
play safe here to avoid data corruption and extend the ban to the whole
family.

Fixes: 5b46903d8bf3 ("hwmon: Driver for disk and solid state drives with temperature sensors")
Cc: stable@vger.kernel.org
Signed-off-by: Maciej S. Szmigiero <mail@maciej.szmigiero.name>
---

Notes:
    This behavior was observed on two different DT01ACA3 drives.
    
    Usually, a series of queued WRITE FPDMA QUEUED commands just time out,
    but sometimes the whole drive freezes. Merely disconnecting and
    reconnecting SATA interface cable then does not unfreeze the drive.
    
    One has to disconnect and reconnect the drive power connector for the
    drive to be detected again (suggesting the drive firmware itself has
    crashed).
    
    This only happens when the drive temperature is polled very often (like
    every second), so occasional SCT usage via smartmontools is probably
    safe.
    
    Changes from v1:
    'SCT blacklist' -> 'SCT avoid models'

 drivers/hwmon/drivetemp.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/hwmon/drivetemp.c b/drivers/hwmon/drivetemp.c
index 0d4f3d97ffc6..da9cfcbecc96 100644
--- a/drivers/hwmon/drivetemp.c
+++ b/drivers/hwmon/drivetemp.c
@@ -285,6 +285,36 @@ static int drivetemp_get_scttemp(struct drivetemp_data *st, u32 attr, long *val)
 	return err;
 }
 
+static const char * const sct_avoid_models[] = {
+/*
+ * These drives will have WRITE FPDMA QUEUED command timeouts and sometimes just
+ * freeze until power-cycled under heavy write loads when their temperature is
+ * getting polled in SCT mode. The SMART mode seems to be fine, though.
+ *
+ * While only the 3 TB model was actually caught exhibiting the problem
+ * let's play safe here to avoid data corruption and ban the whole family.
+ */
+	"TOSHIBA DT01ACA0",
+	"TOSHIBA DT01ACA1",
+	"TOSHIBA DT01ACA2",
+	"TOSHIBA DT01ACA3",
+};
+
+static bool drivetemp_sct_avoid(struct drivetemp_data *st)
+{
+	struct scsi_device *sdev = st->sdev;
+	unsigned int ctr;
+
+	if (!sdev->model)
+		return false;
+
+	for (ctr = 0; ctr < ARRAY_SIZE(sct_avoid_models); ctr++)
+		if (strncmp(sdev->model, sct_avoid_models[ctr], 16) == 0)
+			return true;
+
+	return false;
+}
+
 static int drivetemp_identify_sata(struct drivetemp_data *st)
 {
 	struct scsi_device *sdev = st->sdev;
@@ -326,6 +356,13 @@ static int drivetemp_identify_sata(struct drivetemp_data *st)
 	/* bail out if this is not a SATA device */
 	if (!is_ata || !is_sata)
 		return -ENODEV;
+
+	if (have_sct && drivetemp_sct_avoid(st)) {
+		dev_notice(&sdev->sdev_gendev,
+			   "will avoid using SCT for temperature monitoring\n");
+		have_sct = false;
+	}
+
 	if (!have_sct)
 		goto skip_sct;
 
