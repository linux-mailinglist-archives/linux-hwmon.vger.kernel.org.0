Return-Path: <linux-hwmon+bounces-2749-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F258911446
	for <lists+linux-hwmon@lfdr.de>; Thu, 20 Jun 2024 23:20:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C9483B21AB8
	for <lists+linux-hwmon@lfdr.de>; Thu, 20 Jun 2024 21:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 886077581F;
	Thu, 20 Jun 2024 21:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="du8jc1am"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43246EB60
	for <linux-hwmon@vger.kernel.org>; Thu, 20 Jun 2024 21:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718918412; cv=none; b=ZqCMVKYwPRGG42OeF47Mkzcs/0skR3nrjqoJ4eWglob2oMS8UUWgInar+Rlq6aF1doui7+8t27QqrRmAbosYPwqOVeW5DuS4AURQC/troSGT0pRpkbicgvzUOO8O0zwWchhqZPYEqbELjfSRqKxRR8ZtLiysTLRh8axbg8Jtc6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718918412; c=relaxed/simple;
	bh=w8tKgNnZphqOV8+1lxnIdoceRh5HvzWFxdxJrnRLlFs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aKN/aSb+1EYezmVJPxakqGVYbsZ+OPZJRxx/Amj62h5gTCpl5JgSbizqJuZ8Vy6CmrEJPhFrVlLRNcYu8V/dWaqnIcrXl/T6tOwky8jxqcZ7ktWzVUTyqifvBCR2cf4n5B4DDi4T9fxkUHi68i6o4CMNcnx88Gd7HBJ6V0+vsz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=du8jc1am; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: jdelvare@suse.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1718918409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nrTd+P8XD11NlExzimKrveSe59LGx3sOd4knYOqqS04=;
	b=du8jc1amvmmLF2vLDp1QOo6rUPwG44p7r9xdxKO0dQOe0Q3wJKUKVo+YOCIKgL7TK8UqR7
	RVbJsGzgxObBjZX8uQ6pncbGUaTGO7/LnEuQM/74AhHbWbkx1hnhmDOdF3EYt4+ztKcV9p
	Nq3R/Bx/hVLxP15t0QLotgzUVYnyxXQ=
X-Envelope-To: linux@roeck-us.net
X-Envelope-To: linux-hwmon@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: sean.anderson@linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH] hwmon: iio: Use iio_read_channel_processed_scale for IIO_POWER
Date: Thu, 20 Jun 2024 17:20:05 -0400
Message-Id: <20240620212005.821805-1-sean.anderson@linux.dev>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Instead of rescaling power channels after the fact, use the dedicated
scaling API. This should reduce any inaccuracies resulting from the
scaling.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 drivers/hwmon/iio_hwmon.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/iio_hwmon.c b/drivers/hwmon/iio_hwmon.c
index 4c8a80847891..fab32e1e15f2 100644
--- a/drivers/hwmon/iio_hwmon.c
+++ b/drivers/hwmon/iio_hwmon.c
@@ -49,16 +49,17 @@ static ssize_t iio_hwmon_read_val(struct device *dev,
 	struct iio_channel *chan = &state->channels[sattr->index];
 	enum iio_chan_type type;
 
-	ret = iio_read_channel_processed(chan, &result);
-	if (ret < 0)
-		return ret;
-
 	ret = iio_get_channel_type(chan, &type);
 	if (ret < 0)
 		return ret;
 
 	if (type == IIO_POWER)
-		result *= 1000; /* mili-Watts to micro-Watts conversion */
+		/* mili-Watts to micro-Watts conversion */
+		ret = iio_read_channel_processed_scale(chan, &result, 1000);
+	else
+		ret = iio_read_channel_processed(chan, &result);
+	if (ret < 0)
+		return ret;
 
 	return sprintf(buf, "%d\n", result);
 }
-- 
2.35.1.1320.gc452695387.dirty


