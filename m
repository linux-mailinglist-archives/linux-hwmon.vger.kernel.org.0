Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33BBC70A9A1
	for <lists+linux-hwmon@lfdr.de>; Sat, 20 May 2023 20:18:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231484AbjETSSP (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sat, 20 May 2023 14:18:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231255AbjETSSM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 20 May 2023 14:18:12 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB02618C;
        Sat, 20 May 2023 11:18:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 46B2B60AFD;
        Sat, 20 May 2023 18:18:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6666C433D2;
        Sat, 20 May 2023 18:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684606688;
        bh=LEXUqYnFYNBp/lSZwiBu4F7bB23102+sZXyYbD4ZC0Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=r6xWldq+MJLNubjwleMlnd8SNKyt5UFAEKRpjlk6suo3oJsZXZulueQuZq6P6DJAK
         WubZxowaAGjnTJAUbyDcVS0bJaW39pNNfRws4PXi3qIKspVFRuRrt1WRP0LeOJxqfm
         3hRwphXcN6gEso5xsq28WrnfsZpbMJMpzAtd4czR/YKCrfN5pxjI6CFW26NFS2shDc
         4mPTcr02QKBv6YvLHDJ8eH+5CIHG7EhtvB5fTNjPVfZeCXIhoF0w5Yz9UFRdm1p0mB
         Yf8q6xL9f0MDndvugBfxglCBqIrnEl+imYQaxpGqiEDl+rnDqn016F0JF8OFeGqxV5
         CjMlBQCYpTa7w==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Mario Limonciello <mario.limonciello@amd.com>,
        Borislav Petkov <bp@alien8.de>,
        Guenter Roeck <linux@roeck-us.net>,
        Sasha Levin <sashal@kernel.org>, clemens@ladisch.de,
        jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH AUTOSEL 6.3 05/18] hwmon: (k10temp) Add PCI ID for family 19, model 78h
Date:   Sat, 20 May 2023 14:17:37 -0400
Message-Id: <20230520181750.823365-5-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230520181750.823365-1-sashal@kernel.org>
References: <20230520181750.823365-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Mario Limonciello <mario.limonciello@amd.com>

[ Upstream commit 7d8accfaa0ab65e4282c8e58950f7d688342cd86 ]

Enable k10temp on this system.

  [ bp: Massage. ]

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Acked-by: Guenter Roeck <linux@roeck-us.net>
Link: https://lore.kernel.org/r/20230427053338.16653-3-mario.limonciello@amd.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hwmon/k10temp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
index be8bbb1c3a02d..823d0ca1d6059 100644
--- a/drivers/hwmon/k10temp.c
+++ b/drivers/hwmon/k10temp.c
@@ -507,6 +507,7 @@ static const struct pci_device_id k10temp_id_table[] = {
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_19H_M50H_DF_F3) },
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_19H_M60H_DF_F3) },
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_19H_M70H_DF_F3) },
+	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_19H_M78H_DF_F3) },
 	{ PCI_VDEVICE(HYGON, PCI_DEVICE_ID_AMD_17H_DF_F3) },
 	{}
 };
-- 
2.39.2

