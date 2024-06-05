Return-Path: <linux-hwmon+bounces-2520-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B818FD518
	for <lists+linux-hwmon@lfdr.de>; Wed,  5 Jun 2024 20:06:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 44EE2B25E0E
	for <lists+linux-hwmon@lfdr.de>; Wed,  5 Jun 2024 18:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 245D714D71F;
	Wed,  5 Jun 2024 18:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u2X6l/Cn"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D371A149C55
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Jun 2024 18:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717610573; cv=none; b=ao7uIxOO1w0eKrRZxCqv/bYSjM4na+aqGMnki3HSzniRo5jLS5yfURj9SgJMgUszt2iNMrNXwO1sujgUh4AbIdd6Uq+N6AGrAzOUewv47LxaRopjFGyk8zv93B8xRkDtJZfsIrdp/vXfCWDGBh+2IvAR0WuS4vK3K3Qi6dldUs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717610573; c=relaxed/simple;
	bh=L6k+G2m+3j3md7/zl4VB2q4oF1PIwiQxOqm6LYJmtKc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ssjH3AMJmPLnFTohu3135qIt54BiX5S9ERgv006CgVZ+faZ0Xrl6J254gZSjpCFAYb5PM0bkxbfxENK6i7iiWHCwtSS0LvWtY2g9BVbz1bmn22A9ToTypoQxX//3/l+7EFGPsRKnQxaEHd1/eCXIPplO3tKelyBGIs7IVdbMrm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u2X6l/Cn; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-62777fe7b86so404637b3.1
        for <linux-hwmon@vger.kernel.org>; Wed, 05 Jun 2024 11:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610569; x=1718215369; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IUTCTG4PiwJpsjy0QKETkEiNDEwH04EYXsIQhajeZMg=;
        b=u2X6l/CnJHRqsHZ+uqWAuBZR2EDxEE7VQOHBGEJWO82zvjwXqD7qJxXBn9P3wlYn/S
         P4vKe/yG01XKq16yIxYARa/A+s6Mv7WqHlVYjACiA/gDL9Faq/QdOyj9IOzHvlkSJJ+o
         503leGdALXnNTEdpjvOLYNt/GC44iG3fAc0ebZGxR12mgtPkH0ZXYmeFilrL6GAE64+0
         8KFTsXahDn8y7qdHAv9bIAnBQMMV288ZcMOQh+ZTq5vbDThXjxT0KVce2mqe2CIc/nK4
         BIUj+z4Ox71qKxUxvQTViK8c80aQX7iytCFYkqYku39TU847AsFpxldfDH73MxlqBpSi
         gEng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610569; x=1718215369;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IUTCTG4PiwJpsjy0QKETkEiNDEwH04EYXsIQhajeZMg=;
        b=SZmxGBlRZSW65ittf6vcMGCQ/9pWbGuLXQgul0G7JzpFQSie8CuNBVs9t4tjB2uSsF
         LicVCSiRUxS4x4BKGQWW5uzdKWauFmN28nSQO0WPLX/qY9648Q+tEWK13WvN6tz/u3CG
         e2Rk9+NJoliGBsUrankREVpI7PsUeHhxOrT/WsCbkKOFkM6g93siFnJ6BMau/iCoCcdc
         ok5TRY1XG2Bwf/xmtSwlqhgAe+nZGS975olXeXLoMtIMlabiclvmbAvyy3OWltvZgbBN
         KX/xPwyTjOxVPqZsXQo4iyriPiyu8uk6cDTFtvvM/9yS573Ie6x3tVfzTKC/1ZFcF24U
         YCyQ==
X-Gm-Message-State: AOJu0Yyo5YxHB+y6WZFKPP4MDxUIycyZMQzG0V2gQ3+2Yoaxw/ZG65iJ
	+UYFXjJQdzhYNFGlldnd6m3VcDLa2oJsRq1rKTIq+CRJXxig/guR1nXEARyoWapYt7cWbsBw/gl
	K/pn04jN0HA==
X-Google-Smtp-Source: AGHT+IGRE1l9odt4GG6RaI8M/uHdLkQEjh5Taz0VKgQ269YOTeE9TiCNJPVhuqv1Ry405YEIQ6hIdx0yWPVe/Q==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a81:4c07:0:b0:62a:415b:a137 with SMTP id
 00721157ae682-62cbb4a2295mr5047937b3.1.1717610568813; Wed, 05 Jun 2024
 11:02:48 -0700 (PDT)
Date: Wed,  5 Jun 2024 18:02:32 +0000
In-Reply-To: <20240605180238.2617808-1-joychakr@google.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240605180238.2617808-1-joychakr@google.com>
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605180238.2617808-2-joychakr@google.com>
Subject: [PATCH v1 11/17] mtd: ubi: nvmem: Change nvmem reg_read/write return type
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
 drivers/mtd/ubi/nvmem.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/ubi/nvmem.c b/drivers/mtd/ubi/nvmem.c
index 8aeb9c428e51..eab14821343d 100644
--- a/drivers/mtd/ubi/nvmem.c
+++ b/drivers/mtd/ubi/nvmem.c
@@ -20,8 +20,8 @@ struct ubi_nvmem {
 	struct list_head list;
 };
 
-static int ubi_nvmem_reg_read(void *priv, unsigned int from,
-			      void *val, size_t bytes)
+static ssize_t ubi_nvmem_reg_read(void *priv, unsigned int from,
+				  void *val, size_t bytes)
 {
 	size_t to_read, bytes_left = bytes;
 	struct ubi_nvmem *unv = priv;
@@ -55,7 +55,7 @@ static int ubi_nvmem_reg_read(void *priv, unsigned int from,
 	if (err)
 		return err;
 
-	return bytes_left == 0 ? 0 : -EIO;
+	return bytes - bytes_left;
 }
 
 static int ubi_nvmem_add(struct ubi_volume_info *vi)
-- 
2.45.1.467.gbab1589fc0-goog


