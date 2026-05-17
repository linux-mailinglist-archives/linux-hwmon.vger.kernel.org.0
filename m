Return-Path: <linux-hwmon+bounces-14247-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPySIQF3CWo7bQQAu9opvQ
	(envelope-from <linux-hwmon+bounces-14247-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sun, 17 May 2026 10:06:25 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6D355FE19
	for <lists+linux-hwmon@lfdr.de>; Sun, 17 May 2026 10:06:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B09DF30182A1
	for <lists+linux-hwmon@lfdr.de>; Sun, 17 May 2026 08:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C755B31195C;
	Sun, 17 May 2026 08:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dX9kROA7"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629762E1F06
	for <linux-hwmon@vger.kernel.org>; Sun, 17 May 2026 08:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779005122; cv=none; b=QDQui3mXFBNfs4yTGSaVi5eRy8Va8Gpjha5/UyK1rVQmkwVJi1c4qbD+CHFEt+DtIIPpQB+p6ZTc2Sr+66prVzfkjDHEaYjYnQOBWfjuP8JksotkcJGmq4YfTYTbb6pobGnMGOkz+6bAnnFPvPAlitNKuv7jG89tH7dSlU/KBQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779005122; c=relaxed/simple;
	bh=NGMb25quMJA/qmhqXGV0PuyWAv1LkEiCtHZF83T9J/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G9jqw6HJN0WEup8J6Na4/wxSXg79HBo9xAdyFo+c/Ij4vKTZ4AdkSVIeu4Eh8Yw58641x0KSSnr/zW49NqTFEL7SnfkQfztx99/TkhV3s4MSvm85ZDmY0jY45Z2yMUlE084Ej6Phz2Tray3tVo5uzehqX+oe04w/IqIw+CbTf+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dX9kROA7; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2b45cb89f7eso7767015ad.0
        for <linux-hwmon@vger.kernel.org>; Sun, 17 May 2026 01:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779005121; x=1779609921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yMtYakkWg6xW89eWo2V/gAFSemUpeEFr7/GQfm8tsfU=;
        b=dX9kROA7A82iVIFYb1z97RYdleh5cBn7EHgQ3KYhRKjOmWeUu581VaJpX+J98LIqIS
         PvTYGF9Hdaipk0QhkKbCUm4YAfff95W+k13r8mjdw1xemczO3PfZdNZgNb+Ql3NkW7k+
         CjF1gihNTes2g2OdLMhaREbiCpJu8Icwz/vUzMpB4EjDVu9IGgsiH93z2tLNDWDGDaFX
         WUHvdtMw5rmyNQjRaCUCxSMHoisdzVXSfurJaQVG0/uluRuP7UKUcIRuHoKtYIzMtQ0h
         8DXlvfVwiXQFgEnPu7i6hXj24XpjCMdSzWgUhamD45rFK709gc7kcUguDvaLlD456EN6
         +cNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779005121; x=1779609921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yMtYakkWg6xW89eWo2V/gAFSemUpeEFr7/GQfm8tsfU=;
        b=adbaUDOBo7wTH14sox6BqBPUbiLvsmCbiVLovfW2cW5CXb0f9+LQLumVf2372Yddp2
         NtbIQEAMZaAWqsJiswwaySzsEiOcD2Od4nF0JVHaJsFBDtagqQJ0G0dMJq/dthoxKKmO
         MbLD7jqBb8OQJDmpNxA32Apy9CkV/Be6FuAsf+mn3+PAeC3tWcDDFXcmhjLwyAcjJ5vo
         8YHlFwLxHzSJgpwJMTb4bOiR8ho/+GiIxXD1cghPqvfjvPFY6rXIPU2gamP4VczLF80+
         6ddc+3auARZTn39SPaAbKWJ2cz7UKjxsZDa3QuyoAfbGhQHB6edgpL8UaiocjgyWVFhB
         I9RQ==
X-Forwarded-Encrypted: i=1; AFNElJ8K7goVjvKT+COMZToFe63Y1gSPbfjCjPLX4DDknY50J6325VxYnknHNNofBdtV1W1ftFLGxyu7g9eXjA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5ZtyzrFkIrpryCqFo1O1DqHA+5xA03YBzhAeydsBeL6mF8gAL
	vK7+Q3gCNmHb79xmgY0orUoMXy4Eq/TduiPHLFU+410b++Qx79M4gwoy
X-Gm-Gg: Acq92OHa3LnLjU9h00+HQST6x+4j8IDSSCZp58NLPIeKgXyrxuf6qd/ex7Upq+YyUc+
	IBN2qjZTpovgj8Qd3clB/ytbAYrkyDP8n7tjgRMgcgXK8fGcsn+Yl783AEuybi+fNRavlDnU68w
	g+xZzhoXFY4wV4CwsoQqYPCQtfTJ5cDXrU8ZZO7bRqKSWSHuTpsocNAwwA9hqnJ4C+cfynzEY6b
	fEIOkV172Q0FIkrj/h7Dkyg4E6d5nRML8BkUAws0EbGqMiob1gVvg6UKAf3HLKYIHrvT0vJYTgS
	erH1HkhNlPilMLqc0Zj2/Ojw+VDl98rykfEL77mqocg4XYhzFkFjFemGyuV0wTkjfNhIHSFSG19
	uXfQMouTwNelnd8MnBXHcMg1f6cRLrTU4izdU/kBnzSEBFD8Etye91KFxecPXecSCeFpY42AHAX
	QWezjs0jdMxO0UfvJdymOWmQem9+VtcK34q8Kim/j37UqGElgAQFM8Ypjf6AMu
X-Received: by 2002:a17:902:7d86:b0:2bc:7486:21cf with SMTP id d9443c01a7336-2bd7e9056dfmr70871815ad.36.1779005120658;
        Sun, 17 May 2026 01:05:20 -0700 (PDT)
Received: from fedora.taildae27b.ts.net ([2409:4064:2d80:75ca:8541:272f:2bb3:5e55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5fb17sm109834595ad.1.2026.05.17.01.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 01:05:20 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Subject: [PATCH v3 3/3] hwmon: raspberrypi: Fix delayed-work teardown race
Date: Sun, 17 May 2026 13:34:45 +0530
Message-ID: <20260517080445.103962-4-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260517080445.103962-1-chakrabortyshubham66@gmail.com>
References: <20260516164407.25255-1-chakrabortyshubham66@gmail.com>
 <20260517080445.103962-1-chakrabortyshubham66@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: ED6D355FE19
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linuxfoundation.org,broadcom.com,vger.kernel.org,lists.infradead.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-14247-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chakrabortyshubham66@gmail.com,linux-hwmon@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-hwmon];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

The delayed polling work rearms itself from the work function, so use
explicit delayed-work setup and cleanup instead of
devm_delayed_work_autocancel().

Initialize the delayed work with INIT_DELAYED_WORK() and register a
devres cleanup action that calls disable_delayed_work_sync() during
teardown.

This addresses the concern raised during review about the polling work
being able to requeue itself while the driver is being removed.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 drivers/hwmon/raspberrypi-hwmon.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/raspberrypi-hwmon.c b/drivers/hwmon/raspberrypi-hwmon.c
index 8ce6dacc19b0..0bbc735f74a4 100644
--- a/drivers/hwmon/raspberrypi-hwmon.c
+++ b/drivers/hwmon/raspberrypi-hwmon.c
@@ -8,7 +8,6 @@
  * Copyright (C) 2026 Shubham Chakraborty <chakrabortyshubham66@gmail.com>
  */
 #include <linux/device.h>
-#include <linux/devm-helpers.h>
 #include <linux/err.h>
 #include <linux/hwmon.h>
 #include <linux/module.h>
@@ -96,6 +95,13 @@ static void get_values_poll(struct work_struct *work)
 	schedule_delayed_work(&data->get_values_poll_work, 2 * HZ);
 }
 
+static void rpi_hwmon_cancel_poll_work(void *res)
+{
+	struct rpi_hwmon_data *data = res;
+
+	disable_delayed_work_sync(&data->get_values_poll_work);
+}
+
 static int rpi_read(struct device *dev, enum hwmon_sensor_types type,
 		    u32 attr, int channel, long *val)
 {
@@ -237,8 +243,8 @@ static int rpi_hwmon_probe(struct platform_device *pdev)
 	if (IS_ERR(data->hwmon_dev))
 		return PTR_ERR(data->hwmon_dev);
 
-	ret = devm_delayed_work_autocancel(dev, &data->get_values_poll_work,
-					   get_values_poll);
+	INIT_DELAYED_WORK(&data->get_values_poll_work, get_values_poll);
+	ret = devm_add_action_or_reset(dev, rpi_hwmon_cancel_poll_work, data);
 	if (ret)
 		return ret;
 	platform_set_drvdata(pdev, data);
-- 
2.54.0


