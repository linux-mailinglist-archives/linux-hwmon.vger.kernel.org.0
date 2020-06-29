Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE85820E202
	for <lists+linux-hwmon@lfdr.de>; Tue, 30 Jun 2020 00:00:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731657AbgF2VBq (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 29 Jun 2020 17:01:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730959AbgF2TM5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 29 Jun 2020 15:12:57 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 985D8C08EC49
        for <linux-hwmon@vger.kernel.org>; Sun, 28 Jun 2020 23:50:16 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id l2so13485742wmf.0
        for <linux-hwmon@vger.kernel.org>; Sun, 28 Jun 2020 23:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YrSMqNfBoEk4+fX9YqI78/jZTXRW6ktfo7V3K+aMn3w=;
        b=upLlvbRF4tMtLhZRgG4aao3H6mcyJe65PDDy7dexjRFuR47lkplRUwULz9d1LCPq5T
         8PSoAkKUWGYPCmCWnMllxsc92k3hShDPWrcL8HEYzbotM7BthsGZOSgH5VYciLXYT4zt
         lRguE7takeSshSPrJHv3v1/KwQrnN8GQUkFVNRVkvYaOIqQW2dNnnhNMCmaK1/NIh0u0
         2bcAM11R1TSDYDyBtsAK2WcHhTipUmnzqkz/wUtX2a+/aqHNuIs3OgSlPpcb6G11Ggn6
         EWJ3YxsCDgroXaqZ9YOcN+r13j4qJ41kFrV2Bp+D713x9EbKN2BFs9kGYgUHZcTWPWkb
         eMMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YrSMqNfBoEk4+fX9YqI78/jZTXRW6ktfo7V3K+aMn3w=;
        b=DT609mSrrVuk3EJ3C90u87IfF9DREukPNBRfm3g5wnpN1KdjCme8HFTKVlm8n/S+Cw
         vcNAP86GmlCD765Npvy1kRDFUBckavpRMs8KU3u+WSL0l8earP8+ovtiPP9+ruwMvHhO
         IIs30fzhfqL0Dx5n5xZjgpY7bl9zjcSTinSyJ5r8wpq5RHsidz1vBxpe/8f+0sk4HO+z
         4qO5JMXZlbjYtgaXplU9N1re3SuLQ8MpdF4Fd1dW/1fft1hMBLHcF03AYf1zrlQKjeFp
         cedNdFIyeLyltIjwahqUDZImE6GP1H3TUJFn5izC3BGWABYbceOJJ0uh/KYwh3plcRTK
         OxHw==
X-Gm-Message-State: AOAM530ab+XcKTer2zpOkyFXn72G/AAs4IbCWS5PU0dOJu2UNwV49+lp
        1wLu4D238FJCvlOUjOJO1lpr/w==
X-Google-Smtp-Source: ABdhPJyiAFSYFjdftA88Pd9SuThnV7f04JjUlm4iXI4vLpqDFrxITGIMoZtYG0VnLs6sByqPmifBzA==
X-Received: by 2002:a1c:5418:: with SMTP id i24mr14741712wmb.47.1593413415302;
        Sun, 28 Jun 2020 23:50:15 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id z25sm26400850wmk.28.2020.06.28.23.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2020 23:50:14 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 1/6] devres: remove stray space from devm_kmalloc() definition
Date:   Mon, 29 Jun 2020 08:50:03 +0200
Message-Id: <20200629065008.27620-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200629065008.27620-1-brgl@bgdev.pl>
References: <20200629065008.27620-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Use the preferred coding style for functions returning pointers.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/base/devres.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/devres.c b/drivers/base/devres.c
index 0bbb328bd17f..c34327219c34 100644
--- a/drivers/base/devres.c
+++ b/drivers/base/devres.c
@@ -807,7 +807,7 @@ static int devm_kmalloc_match(struct device *dev, void *res, void *data)
  * RETURNS:
  * Pointer to allocated memory on success, NULL on failure.
  */
-void * devm_kmalloc(struct device *dev, size_t size, gfp_t gfp)
+void *devm_kmalloc(struct device *dev, size_t size, gfp_t gfp)
 {
 	struct devres *dr;
 
-- 
2.26.1

