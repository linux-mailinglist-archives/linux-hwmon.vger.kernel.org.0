Return-Path: <linux-hwmon+bounces-2512-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D97628FD4B9
	for <lists+linux-hwmon@lfdr.de>; Wed,  5 Jun 2024 20:01:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7485F283CB4
	for <lists+linux-hwmon@lfdr.de>; Wed,  5 Jun 2024 18:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82AC81534F9;
	Wed,  5 Jun 2024 18:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yNqgUmHy"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA16A14EC79
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Jun 2024 18:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717610416; cv=none; b=Qg2ru+kX+3drx2Euc3Ayycd3aASDyCngwRMxB1oBNb01QDh+Q9rPvMOGSkDVsSRKC899Mjg0C7zlRWBOp1E+zbzk3+45TvJ+Dv6l5Yumnbklze2jcFwAcVojL1akFbD4Afmh5w86vIAKasKX4Y7l9Ilaieb+XlNH+0wExuclFBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717610416; c=relaxed/simple;
	bh=fPdJt4Gydxsb6XLYSRdNJ8hD/W3THq9fKXubquLZs6s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=i6pO2TMpfF9WSxmEgO2OgQMj+dJxB2O9ZPUNseanigLTQlD7BtCocaUnhG3NIxZlrSfBprkFCXYw4oXWpSwDxDW+dNjlwGkinP6gV7VE76oS46/YUkYaxsln0x6hrQ1WF8mMvYy39CpyJZZZ/x0v8Oz9aGL9L9BspHrFDVUYwuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yNqgUmHy; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-627f382fb97so232957b3.3
        for <linux-hwmon@vger.kernel.org>; Wed, 05 Jun 2024 11:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610414; x=1718215214; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qvmsbFq1f0xb8qTUeLHIrwaOpt4YNpx3HYdX4+QrPhA=;
        b=yNqgUmHy2UkDE3heRRb8oMaXmLeLXyM1i27wFJS/QU6flgxbWEI6TZ7da1x1XjqPQO
         VlQ19oRwmx0Yd/blYB/OvER0B5Y/49RGI6us/PAl60yjXA5+o8wOy5hEfj5ZadolRbK+
         XWIHPanx9sQPLs2/5sl8VyvI7v9OkxWCYCvKJqd4BWY60BaRMym9Ck/ROACMI/JPScoo
         WSekErhgKeJiiUPjrxf3KdbGf6pBiF0a1bGCPfBXHONpv8wSDHUMAThTTzKivKWkB3ub
         bbsqHW9iPJwiorjZWv1Xw6UL52JrjCEQWpvC3xexXC3j6MNOu7OViZQDgdh4MDbEtTMU
         WmCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610414; x=1718215214;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qvmsbFq1f0xb8qTUeLHIrwaOpt4YNpx3HYdX4+QrPhA=;
        b=JS+CdDJRc9PCnJ24JWz+Oq6HPHxIzxYRvcMGVG8PCEfyRXOc9Ni81rODwqsn+kvBO0
         6InUbqu0BEdbsndE6Bml+u+XnjQGWUDOPWbVvNmAuDqv2iLmjKpyD0QzJ491Xj1uxiKe
         bYTPCRyZL8npTD7Z3H3+NmR3gO2Ov9nXpdOua9xVwFA1u4zse5g8OJdpER9RGybUisVB
         WiKUubwqiPZw8fiqXIEAre7WstRafh1XF+08yPeS2wu6eJKD2/jpA3h2697nPs2lhSe+
         TL+wxhP/RKJFyYTMyhNbBPUNEiXf2qBmajDJ6ztady827M5nm/V2tekWWEU1QXv3uu9L
         OESA==
X-Gm-Message-State: AOJu0Yy6Ig7668iPh351Y+kNV6xUycbBaxs4x0DPklPqsHhmkUHOcp8c
	C70xJCWw/Z1qzJmDxbiX+YD4XJ0ptMXBzhzXPi5CHCMpVm71UO5tIN/FwfTk4cmU8CjfcBRhrNZ
	lB0FsCCY8lA==
X-Google-Smtp-Source: AGHT+IHixjuOYQ1InGCAjmo87JHH7BxdpNaY95UBwdRBHB8eZTSP6/tJXCeai8kdlzm5GsjEUY/q6O3hk54taA==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a05:690c:6688:b0:622:cd7d:fec4 with SMTP
 id 00721157ae682-62cbb5e6bc6mr8437267b3.9.1717610413829; Wed, 05 Jun 2024
 11:00:13 -0700 (PDT)
Date: Wed,  5 Jun 2024 17:59:47 +0000
In-Reply-To: <20240605175953.2613260-1-joychakr@google.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240605175953.2613260-1-joychakr@google.com>
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605175953.2613260-4-joychakr@google.com>
Subject: [PATCH v1 03/17] media: i2c: video-i2c: Change nvmem reg_read/write
 return type
From: Joy Chakraborty <joychakr@google.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-rtc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-usb@vger.kernel.org, manugautam@google.com, 
	Joy Chakraborty <joychakr@google.com>
Content-Type: text/plain; charset="UTF-8"

Change nvmem read/write function definition return type to ssize_t.

Signed-off-by: Joy Chakraborty <joychakr@google.com>
---
 drivers/media/i2c/video-i2c.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.c
index 56dbe07a1c99..2bfc221b5104 100644
--- a/drivers/media/i2c/video-i2c.c
+++ b/drivers/media/i2c/video-i2c.c
@@ -151,12 +151,15 @@ struct video_i2c_chip {
 	int (*hwmon_init)(struct video_i2c_data *data);
 };
 
-static int mlx90640_nvram_read(void *priv, unsigned int offset, void *val,
-			     size_t bytes)
+static ssize_t mlx90640_nvram_read(void *priv, unsigned int offset, void *val,
+				   size_t bytes)
 {
 	struct video_i2c_data *data = priv;
+	int ret;
+
+	ret = regmap_bulk_read(data->regmap, MLX90640_EEPROM_START_ADDR + offset, val, bytes);
 
-	return regmap_bulk_read(data->regmap, MLX90640_EEPROM_START_ADDR + offset, val, bytes);
+	return ret < 0 ? ret : bytes;
 }
 
 static struct nvmem_config mlx90640_nvram_config = {
-- 
2.45.1.467.gbab1589fc0-goog


