Return-Path: <linux-hwmon+bounces-417-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB3080B763
	for <lists+linux-hwmon@lfdr.de>; Sun, 10 Dec 2023 00:15:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98F6A280CED
	for <lists+linux-hwmon@lfdr.de>; Sat,  9 Dec 2023 23:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D8641B277;
	Sat,  9 Dec 2023 23:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aYy8g5kG"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88676121;
	Sat,  9 Dec 2023 15:15:47 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2c9f223675aso8231811fa.1;
        Sat, 09 Dec 2023 15:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702163746; x=1702768546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i1GfTGfjnOsMQUifihELHRlkzfEyWoX1o2UDGFpeQ5E=;
        b=aYy8g5kGJdawCy0qkI7SarZXaHnG8s18cyddhObkSzgswAO82KPt/rdJXTFlDk/NF0
         nb9Ms1Z1mQ4WkZNiwdxqrs+Wfxd2Z/lLYv6HCQkYyUcKcK53um+QijfNcVHbJgjBAvyg
         sJr5vls1H97Bi6hmnLgONU2NpDonPqWzN9saIDRAqyyDGnIHYvvqAf6phaMah+xEFqbC
         WILZmYnG2Ei6QQ4lAFcuhVhT48NJFGwfSkDBPp9GrhDRxytTBF6WWlUWb/KybENHQVW8
         TJQEIgIMWC6wbiP46BTrptH2YwzJPv6BYzF3YyM/85lgo7YbHffb5kAr/1yA+HGIsqrq
         XQpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702163746; x=1702768546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i1GfTGfjnOsMQUifihELHRlkzfEyWoX1o2UDGFpeQ5E=;
        b=JOV56Cht0XA6fN8t0L2LPluzIahW/FF21anqvNdWfGZO7x/6cakRRk+TUyUrYtsy5P
         5YHAw2bPCbXlPDUBPIaHazhjwLDj1r69Nh3uk5E3mkHRNIxkLNEpxN4TZN1kjWWnRN78
         IPqT6364+F/Jm7VYcDqJ4dcnIk2pUqn4Y6xMqynFQeIGqx430w5tzo9HWHaV0+Eyn9nd
         wXyOTfOGsHvF8t6l19Pzc4tXZjWIiadyJdF4LtD/+HO6JNEkRxnjB8q6x61cZXH8bMzN
         EY5wogg4kiR5lESJz0JGblSVy7xIwOjViJ4OppTu90RTQbfj9vqvLtxakyVCzp9lf+2P
         HBeg==
X-Gm-Message-State: AOJu0YxsUgUTPGKoiZsGsnG4xbslP9wtMR67K00pomD8ACXkN5epIgDB
	KiFYj4C+CH8fAUL9q1Zkz17Fc4kfV5XW158p
X-Google-Smtp-Source: AGHT+IFcfuadxBJdkAPGdWoJgw8vdRvnp4WXwvHtrgAsfLN6LhIXFdi1JNbD6FX3Syqhq5NW+ipOTA==
X-Received: by 2002:a19:f818:0:b0:50b:f088:46b1 with SMTP id a24-20020a19f818000000b0050bf08846b1mr1489045lff.5.1702163745660;
        Sat, 09 Dec 2023 15:15:45 -0800 (PST)
Received: from test1pve.bindibox.net (88-112-229-68.elisa-laajakaista.fi. [88.112.229.68])
        by smtp.gmail.com with ESMTPSA id dw12-20020a0565122c8c00b0050d0b4fc22esm612752lfb.185.2023.12.09.15.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Dec 2023 15:15:45 -0800 (PST)
From: bindkeys@gmail.com
To: Clemens Ladisch <clemens@ladisch.de>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Jami Kurki <bindkeys@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Added support for Zen 3 based AMD Threadrippers (5000WX series). They were previously under Zen3 SP models, but this was incorrect.
Date: Sun, 10 Dec 2023 01:15:44 +0200
Message-Id: <20231209231545.1272806-1-bindkeys@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jami Kurki <bindkeys@gmail.com>

Signed-off-by: Jami Kurki <bindkeys@gmail.com>
---
 drivers/hwmon/k10temp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
index bae0becfa24b..b5738dd8d442 100644
--- a/drivers/hwmon/k10temp.c
+++ b/drivers/hwmon/k10temp.c
@@ -454,7 +454,8 @@ static int k10temp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		data->is_zen = true;
 
 		switch (boot_cpu_data.x86_model) {
-		case 0x0 ... 0x1:	/* Zen3 SP3/TR */
+		case 0x0 ... 0x1:	/* Zen3 SP3 */
+		case 0x8:		/* Zen3 TR */
 		case 0x21:		/* Zen3 Ryzen Desktop */
 		case 0x50 ... 0x5f:	/* Green Sardine */
 			data->ccd_offset = 0x154;
-- 
2.39.2


