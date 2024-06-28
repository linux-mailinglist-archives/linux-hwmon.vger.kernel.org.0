Return-Path: <linux-hwmon+bounces-2808-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A342591C238
	for <lists+linux-hwmon@lfdr.de>; Fri, 28 Jun 2024 17:14:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4BFC1C215A4
	for <lists+linux-hwmon@lfdr.de>; Fri, 28 Jun 2024 15:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C07571C68AD;
	Fri, 28 Jun 2024 15:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XeX4VMJa"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0051C688C;
	Fri, 28 Jun 2024 15:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719587638; cv=none; b=t8NWDoRuqaQH/Y1mrCt+h7I+vEXQPzonf9jXQPRDwEnUoH/3ZL/2TwJcFkXXBffraqRktBbSQM98qx4MNAmZvqHKcf9X97IVOZgqOLkFKAc9yGFN9sMmRLn5IUM0GJx1ElVecoIvFUSSlL/Cv6Eoflrn61RYuNNw4lfoXm7LcWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719587638; c=relaxed/simple;
	bh=PmtaC7yNgiN26bRHbRk6FNqhEr90OZ1Ci7FKulVXAHg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dwPV67YZTFeKzPbTHpV2eQPymKIMGygwb0LBI0mIcqjIDmz7U5WowwFY/NZql1LrmtJ2MRnQ6OofFu8FwoqTYcnPFLZSp46s/ZGUBbTGhbQUD8bQTa3pGp2SJnNpgPH+B/3pgbJCou2ciFk7Rj+Pi49gEaw7lssotvlyeIEs6NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XeX4VMJa; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7226821ad86so505127a12.2;
        Fri, 28 Jun 2024 08:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719587636; x=1720192436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uIApeW/cxziZeQ8Lx+W3IMHYVE9x+3UeM0rtM4gqy8U=;
        b=XeX4VMJaXv7ODexsJvrUNeIXzeKsRmhgngAZk86pSKw9Gncm2ShX5EQD/Oo9GE2+QV
         0mv2LILf4wyZ472q+gq8FHsuaRZwA5c0JFejjU2GSQYgPOz3iuVfW0EwfmmHySAnC0aN
         49QUedchuTdJDApQ6kgHvMox4zhU/kXX8e8ylkTiWPX0rHnUtlfS/YthVX4/B6fapzX5
         mcgEYxROCcWDNiF0c7vaoGcUEZ61e/ichNwlqa1LpPIhb8wBDZI99yoOuYbfUIN+CzH6
         aEY9GqPWP805Fr9UVxceJqFYyZQvTRCDRoajfucOB8vxvyliGKEdPzqNe9M/gzKhEpA8
         NibA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719587636; x=1720192436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uIApeW/cxziZeQ8Lx+W3IMHYVE9x+3UeM0rtM4gqy8U=;
        b=EWyKK2sS02OTDrM5K5y3g9u1wOf/SFRl5II7wzweAXqIKPS5dIcPwi8ItE1HoKSIx8
         YBkXZFzgcfx0dE4Pv3aISIAUhc9ObDF/PxxTlndfMd1lMwwJOU775a5rlhbYmrcAgwhj
         UnWETsiPkZxrcqAzGBRXqXwClvT2qqk6jfs0cvgiPnKLHBpbgDlpQPniz1bbZzMyYuLE
         2I3aHdTO7d+AjYcwJHHlJ2S7NibRnDS/z5VxVkhQ02Z2BLS1G2DdFHSGY+xBH+lPvSVb
         WROpScrS6ujHE+VC0cSu1dwNrIWGxb6SZyTdDW5t2v2/yoKiU61wdBIpMjn6TGUrGD4V
         yutw==
X-Gm-Message-State: AOJu0YyUGYv/s3TZcURVYc6QWgvX7Md0o1o+mXkVZFFm6OkjGazIK/dg
	N9CMRNMxmdhDvLSojvQGswBNGWfmTNXvlZ7yl73h/hmfIRc1JkmDlaobsw==
X-Google-Smtp-Source: AGHT+IHue1VwqUFliIN/gVVynrnVva168H1Z1HzB5eiyeNvpjelRrSEIc0JcDEmbDug1owseqc/n+w==
X-Received: by 2002:a05:6a20:3016:b0:1be:c551:b74f with SMTP id adf61e73a8af0-1bec551ba09mr6967503637.27.1719587635912;
        Fri, 28 Jun 2024 08:13:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c91c7df8b0sm1787504a91.0.2024.06.28.08.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 08:13:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Farouk Bouabid <farouk.bouabid@cherry.de>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 02/10] hwmon: (amc6821) Make reading and writing fan speed limits consistent
Date: Fri, 28 Jun 2024 08:13:38 -0700
Message-Id: <20240628151346.1152838-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240628151346.1152838-1-linux@roeck-us.net>
References: <20240628151346.1152838-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The default value of the maximum fan speed limit register is 0,
essentially translating to an unlimited fan speed. When reading
the limit, a value of 0 is reported in this case. However, writing
a value of 0 results in writing a value of 0xffff into the register,
which is inconsistent.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/amc6821.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/amc6821.c b/drivers/hwmon/amc6821.c
index 3c614a0bd192..e37257ae1a6b 100644
--- a/drivers/hwmon/amc6821.c
+++ b/drivers/hwmon/amc6821.c
@@ -601,7 +601,7 @@ static ssize_t fan_show(struct device *dev, struct device_attribute *devattr,
 	struct amc6821_data *data = amc6821_update_device(dev);
 	int ix = to_sensor_dev_attr(devattr)->index;
 	if (0 == data->fan[ix])
-		return sprintf(buf, "0");
+		return sprintf(buf, "6000000");
 	return sprintf(buf, "%d\n", (int)(6000000 / data->fan[ix]));
 }
 
@@ -625,10 +625,10 @@ static ssize_t fan_store(struct device *dev, struct device_attribute *attr,
 	int ret = kstrtol(buf, 10, &val);
 	if (ret)
 		return ret;
-	val = 1 > val ? 0xFFFF : 6000000/val;
+	val = val < 1 ? 0xFFFF : 6000000 / val;
 
 	mutex_lock(&data->update_lock);
-	data->fan[ix] = (u16) clamp_val(val, 1, 0xFFFF);
+	data->fan[ix] = (u16)clamp_val(val, 0, 0xFFFF);
 	if (i2c_smbus_write_byte_data(client, fan_reg_low[ix],
 			data->fan[ix] & 0xFF)) {
 		dev_err(&client->dev, "Register write error, aborting.\n");
-- 
2.39.2


