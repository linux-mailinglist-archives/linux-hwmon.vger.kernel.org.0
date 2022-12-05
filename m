Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 777AB643340
	for <lists+linux-hwmon@lfdr.de>; Mon,  5 Dec 2022 20:35:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234471AbiLETfK (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 5 Dec 2022 14:35:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234209AbiLETeu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 5 Dec 2022 14:34:50 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27E2A29CA4;
        Mon,  5 Dec 2022 11:30:40 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B774C6130C;
        Mon,  5 Dec 2022 19:30:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4D59C433C1;
        Mon,  5 Dec 2022 19:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1670268639;
        bh=dWoWa9c3N7KCEFmn7jda1SE9xRdTIAW4aNEPlki+1V4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JQ8FFb3ZBrj2qCnAcyAuRf4r6oTmQIMFhDrvNUMmZAZNFV5D4v4YL04neWV7UXrS5
         vT+G6pmDr30mc+hDgVWLp88sSejxxc44TD5lgPAxdmyO15BkR0bue0El6kY2Ha/2CW
         Zb26eF40fJHknGG4us0U1+v72cLAcZVosCJbO0Fg=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     stable@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        patches@lists.linux.dev, Phil Auld <pauld@redhat.com>,
        linux-hwmon@vger.kernel.org, Fenghua Yu <fenghua.yu@intel.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.10 51/92] hwmon: (coretemp) Check for null before removing sysfs attrs
Date:   Mon,  5 Dec 2022 20:10:04 +0100
Message-Id: <20221205190805.184292742@linuxfoundation.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221205190803.464934752@linuxfoundation.org>
References: <20221205190803.464934752@linuxfoundation.org>
User-Agent: quilt/0.67
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Phil Auld <pauld@redhat.com>

[ Upstream commit a89ff5f5cc64b9fe7a992cf56988fd36f56ca82a ]

If coretemp_add_core() gets an error then pdata->core_data[indx]
is already NULL and has been kfreed. Don't pass that to
sysfs_remove_group() as that will crash in sysfs_remove_group().

[Shortened for readability]
[91854.020159] sysfs: cannot create duplicate filename '/devices/platform/coretemp.0/hwmon/hwmon2/temp20_label'
<cpu offline>
[91855.126115] BUG: kernel NULL pointer dereference, address: 0000000000000188
[91855.165103] #PF: supervisor read access in kernel mode
[91855.194506] #PF: error_code(0x0000) - not-present page
[91855.224445] PGD 0 P4D 0
[91855.238508] Oops: 0000 [#1] PREEMPT SMP PTI
...
[91855.342716] RIP: 0010:sysfs_remove_group+0xc/0x80
...
[91855.796571] Call Trace:
[91855.810524]  coretemp_cpu_offline+0x12b/0x1dd [coretemp]
[91855.841738]  ? coretemp_cpu_online+0x180/0x180 [coretemp]
[91855.871107]  cpuhp_invoke_callback+0x105/0x4b0
[91855.893432]  cpuhp_thread_fun+0x8e/0x150
...

Fix this by checking for NULL first.

Signed-off-by: Phil Auld <pauld@redhat.com>
Cc: linux-hwmon@vger.kernel.org
Cc: Fenghua Yu <fenghua.yu@intel.com>
Cc: Jean Delvare <jdelvare@suse.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Link: https://lore.kernel.org/r/20221117162313.3164803-1-pauld@redhat.com
Fixes: 199e0de7f5df3 ("hwmon: (coretemp) Merge pkgtemp with coretemp")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hwmon/coretemp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hwmon/coretemp.c b/drivers/hwmon/coretemp.c
index 032129292957..9b49bfc63ffc 100644
--- a/drivers/hwmon/coretemp.c
+++ b/drivers/hwmon/coretemp.c
@@ -533,6 +533,10 @@ static void coretemp_remove_core(struct platform_data *pdata, int indx)
 {
 	struct temp_data *tdata = pdata->core_data[indx];
 
+	/* if we errored on add then this is already gone */
+	if (!tdata)
+		return;
+
 	/* Remove the sysfs attributes */
 	sysfs_remove_group(&pdata->hwmon_dev->kobj, &tdata->attr_group);
 
-- 
2.35.1



