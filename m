Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51AAF63F7DE
	for <lists+linux-hwmon@lfdr.de>; Thu,  1 Dec 2022 20:04:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231282AbiLATEp (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Thu, 1 Dec 2022 14:04:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231203AbiLATEd (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 1 Dec 2022 14:04:33 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F241EC5E1F
        for <linux-hwmon@vger.kernel.org>; Thu,  1 Dec 2022 11:04:31 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id o5so4364629wrm.1
        for <linux-hwmon@vger.kernel.org>; Thu, 01 Dec 2022 11:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7p4ZRoKY8KyAbeLZ3D9FFno3zQClogoAoc0aT3MOswk=;
        b=SH2MVV3BnFZoWATkbczoZvZG/HGAyVAamyZP7S7zZvbT4k/39Bs9cHY023b3UX8VRe
         Bxsnh5DGvAll1GvjWvMRULbj9BOin2dbmJfdUFoXz5+wjtqKAVdInn2faoOlqzBtY/Eh
         Hw1E9X0lEjAiyZIkqB4zsUuT4tUcx2vv/7DhzJrdyH73lJdFJa/WGSbbrkvb2ZsZjo1I
         ADFh2K4rkfPwEkbZ4aruEo4y8q4kgpeWv06BrgWQih3SH3hETYeiH8RnnuFe6qxtOlE5
         mQZSSJ/JgPw71vj+9t2hVwmLoOH/GWhMs9tPQ3+DQeYBk5j4sQCXiW2/Y7FXPa12tD75
         UOIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7p4ZRoKY8KyAbeLZ3D9FFno3zQClogoAoc0aT3MOswk=;
        b=6O+YEtkU7W46oDWSDnMpxeFsXp2DiqCaMq0YXn57BxXda8/p77AaOjkVKV3JoxHEVl
         9Ckly5EnF1XDT/I00bEpRxrsklx/zoOGftTAvgQoKgOKnVhBYr7lEhBoJMzFU+daZ2kg
         7AN9SGPLKw62Risy7lDlRCCdgSWocqzQZdgNHmGALhstBUY34wtsTXBcVOpwEgmY5u3S
         N8LkKIAXjJ2bOnzCTMgc3fIPGkGaUieFgjGZ/wulz3kHUqppPhV40KN0T7bpV+Gl6jWw
         +DiOA65/3P+JKdNYP6btHCkyeonudIqoUHSIRc9CU0QbQPrBirFIV0T2oO8Ba6mM+c6k
         ImSg==
X-Gm-Message-State: ANoB5pnWdOEUGy2u0YFJS4GW4Y77OaYQdf/kyRI+omxY9/lwnStzQ4OI
        F54siAt9ac7WmeEWBGkqd+hbbw==
X-Google-Smtp-Source: AA0mqf4xHLqPxdLdu/xsizAphXKq/j4vIgsGGw8kI+lToc0HFLr8OK8KceGdOynFB2/FIQsRcT1eCQ==
X-Received: by 2002:adf:f605:0:b0:241:ea0f:f0eb with SMTP id t5-20020adff605000000b00241ea0ff0ebmr29182298wrp.358.1669921470559;
        Thu, 01 Dec 2022 11:04:30 -0800 (PST)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id h20-20020a05600c351400b003c6cd82596esm11848474wmq.43.2022.12.01.11.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 11:04:30 -0800 (PST)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>
Subject: [PATCH v4 5/5] hwmon: (pmbus/core): Notify regulator events
Date:   Thu,  1 Dec 2022 20:03:54 +0100
Message-Id: <20221201190354.1512790-5-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221201190354.1512790-1-Naresh.Solanki@9elements.com>
References: <20221201190354.1512790-1-Naresh.Solanki@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Notify regulator events in PMBus irq handler.

Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index daf700210c68..dbdf8c8187db 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -3159,6 +3159,11 @@ static irqreturn_t pmbus_fault_handler(int irq, void *pdata)
 		if (ret)
 			return ret;
 
+		if (event) {
+			regulator_notifier_call_chain(data->rdevs[i], event, NULL);
+			ret = IRQ_HANDLED;
+		}
+
 		page = rdev_get_id(data->rdevs[i]);
 		mutex_lock(&data->update_lock);
 		status = pmbus_read_status_word(client, page);
-- 
2.37.3

