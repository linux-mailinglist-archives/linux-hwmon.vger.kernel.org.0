Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DFA86A3789
	for <lists+linux-hwmon@lfdr.de>; Mon, 27 Feb 2023 03:10:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230102AbjB0CKU (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sun, 26 Feb 2023 21:10:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230373AbjB0CJs (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 26 Feb 2023 21:09:48 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAC8A1B2E9;
        Sun, 26 Feb 2023 18:08:48 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6227160D38;
        Mon, 27 Feb 2023 02:07:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6C4CC4339C;
        Mon, 27 Feb 2023 02:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677463651;
        bh=DNjVxibmn1aE2mGPgY/1cl1tNFgods9I0F1yd4bd4nY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uiqsMWzeBT7LU8kJ89aWgR+LBSKiw+7vzesYSlUpjegu99e+IjtD3aE/dXmRczTmN
         ftW6H74sCs/U2iGwCcd6uLyYvD7azRnUfWiMEKX88CzaGlh/vzPuKwXwq0Uwz7ImLG
         MyqJrCFXUmdPmQk1OfEz4fNibKbyLK2LWLgw/13QyRfkt6ZArTzoJEY93iBP3qkPG4
         6OGO3Xo/wV4AEtvsQvuwiIm9KlCddOq64xPrabSomwmzC7s/bECv6efUBv1eKg21ki
         bY8WufV99fTdfG8V1bVq5JwJw4ZOTTSn3fpsdudxzrv0H2q+CDCQvhxYzwfTJ5WHV5
         v9qEQ10PA17aw==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Denis Pauk <pauk.denis@gmail.com>,
        Ahmad Khalifa <ahmad@khalifa.ws>,
        Jeroen Beerstra <jeroen@beerstra.org>,
        Slawomir Stepien <sst@poczta.fm>,
        Guenter Roeck <linux@roeck-us.net>,
        Sasha Levin <sashal@kernel.org>, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 42/58] hwmon: (nct6775) B650/B660/X670 ASUS boards support
Date:   Sun, 26 Feb 2023 21:04:40 -0500
Message-Id: <20230227020457.1048737-42-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230227020457.1048737-1-sashal@kernel.org>
References: <20230227020457.1048737-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75 autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Denis Pauk <pauk.denis@gmail.com>

[ Upstream commit e2e09989ccc21ad428d6393450add78584b143bd ]

Boards such as:
  "EX-B660M-V5 PRO D4",
  "PRIME B650-PLUS",
  "PRIME B650M-A",
  "PRIME B650M-A AX",
  "PRIME B650M-A II",
  "PRIME B650M-A WIFI",
  "PRIME B650M-A WIFI II",
  "PRIME B660M-A D4",
  "PRIME B660M-A WIFI D4",
  "PRIME X670-P",
  "PRIME X670-P WIFI",
  "PRIME X670E-PRO WIFI",
  "Pro B660M-C-D4",
  "ProArt B660-CREATOR D4",
  "ProArt X670E-CREATOR WIFI",
  "ROG CROSSHAIR X670E EXTREME",
  "ROG CROSSHAIR X670E GENE",
  "ROG CROSSHAIR X670E HERO",
  "ROG MAXIMUS XIII EXTREME GLACIAL",
  "ROG MAXIMUS Z690 EXTREME",
  "ROG MAXIMUS Z690 EXTREME GLACIAL",
  "ROG STRIX B650-A GAMING WIFI",
  "ROG STRIX B650E-E GAMING WIFI",
  "ROG STRIX B650E-F GAMING WIFI",
  "ROG STRIX B650E-I GAMING WIFI",
  "ROG STRIX B660-A GAMING WIFI D4",
  "ROG STRIX B660-F GAMING WIFI",
  "ROG STRIX B660-G GAMING WIFI",
  "ROG STRIX B660-I GAMING WIFI",
  "ROG STRIX X670E-A GAMING WIFI",
  "ROG STRIX X670E-E GAMING WIFI",
  "ROG STRIX X670E-F GAMING WIFI",
  "ROG STRIX X670E-I GAMING WIFI",
  "ROG STRIX Z590-A GAMING WIFI II",
  "ROG STRIX Z690-A GAMING WIFI D4",
  "TUF GAMING B650-PLUS",
  "TUF GAMING B650-PLUS WIFI",
  "TUF GAMING B650M-PLUS",
  "TUF GAMING B650M-PLUS WIFI",
  "TUF GAMING B660M-PLUS WIFI",
  "TUF GAMING X670E-PLUS",
  "TUF GAMING X670E-PLUS WIFI",
  "TUF GAMING Z590-PLUS WIFI",
have got a NCT6799D chip, but by default there's no use of it
because of resource conflict with WMI method.

This commit adds such boards to the monitoring list with new ACPI device
UID.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=204807
Signed-off-by: Denis Pauk <pauk.denis@gmail.com>
Co-developed-by: Ahmad Khalifa <ahmad@khalifa.ws>
Signed-off-by: Ahmad Khalifa <ahmad@khalifa.ws>
Tested-by: Jeroen Beerstra <jeroen@beerstra.org>
Tested-by: Slawomir Stepien <sst@poczta.fm>
Link: https://lore.kernel.org/r/20230111212241.7456-2-pauk.denis@gmail.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hwmon/nct6775-platform.c | 52 ++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/hwmon/nct6775-platform.c b/drivers/hwmon/nct6775-platform.c
index e5d4a79cd5f7d..76c6b564d7fc4 100644
--- a/drivers/hwmon/nct6775-platform.c
+++ b/drivers/hwmon/nct6775-platform.c
@@ -114,6 +114,7 @@ struct nct6775_sio_data {
 #define ASUSWMI_UNSUPPORTED_METHOD	0xFFFFFFFE
 #define ASUSWMI_DEVICE_HID		"PNP0C14"
 #define ASUSWMI_DEVICE_UID		"ASUSWMI"
+#define ASUSMSI_DEVICE_UID		"AsusMbSwInterface"
 
 #if IS_ENABLED(CONFIG_ACPI)
 /*
@@ -1108,6 +1109,52 @@ static const char * const asus_wmi_boards[] = {
 	"TUF GAMING Z490-PLUS (WI-FI)",
 };
 
+static const char * const asus_msi_boards[] = {
+	"EX-B660M-V5 PRO D4",
+	"PRIME B650-PLUS",
+	"PRIME B650M-A",
+	"PRIME B650M-A AX",
+	"PRIME B650M-A II",
+	"PRIME B650M-A WIFI",
+	"PRIME B650M-A WIFI II",
+	"PRIME B660M-A D4",
+	"PRIME B660M-A WIFI D4",
+	"PRIME X670-P",
+	"PRIME X670-P WIFI",
+	"PRIME X670E-PRO WIFI",
+	"Pro B660M-C-D4",
+	"ProArt B660-CREATOR D4",
+	"ProArt X670E-CREATOR WIFI",
+	"ROG CROSSHAIR X670E EXTREME",
+	"ROG CROSSHAIR X670E GENE",
+	"ROG CROSSHAIR X670E HERO",
+	"ROG MAXIMUS XIII EXTREME GLACIAL",
+	"ROG MAXIMUS Z690 EXTREME",
+	"ROG MAXIMUS Z690 EXTREME GLACIAL",
+	"ROG STRIX B650-A GAMING WIFI",
+	"ROG STRIX B650E-E GAMING WIFI",
+	"ROG STRIX B650E-F GAMING WIFI",
+	"ROG STRIX B650E-I GAMING WIFI",
+	"ROG STRIX B660-A GAMING WIFI D4",
+	"ROG STRIX B660-F GAMING WIFI",
+	"ROG STRIX B660-G GAMING WIFI",
+	"ROG STRIX B660-I GAMING WIFI",
+	"ROG STRIX X670E-A GAMING WIFI",
+	"ROG STRIX X670E-E GAMING WIFI",
+	"ROG STRIX X670E-F GAMING WIFI",
+	"ROG STRIX X670E-I GAMING WIFI",
+	"ROG STRIX Z590-A GAMING WIFI II",
+	"ROG STRIX Z690-A GAMING WIFI D4",
+	"TUF GAMING B650-PLUS",
+	"TUF GAMING B650-PLUS WIFI",
+	"TUF GAMING B650M-PLUS",
+	"TUF GAMING B650M-PLUS WIFI",
+	"TUF GAMING B660M-PLUS WIFI",
+	"TUF GAMING X670E-PLUS",
+	"TUF GAMING X670E-PLUS WIFI",
+	"TUF GAMING Z590-PLUS WIFI",
+};
+
 #if IS_ENABLED(CONFIG_ACPI)
 /*
  * Callback for acpi_bus_for_each_dev() to find the right device
@@ -1171,6 +1218,11 @@ static int __init sensors_nct6775_platform_init(void)
 				   board_name);
 		if (err >= 0)
 			access = nct6775_determine_access(ASUSWMI_DEVICE_UID);
+
+		err = match_string(asus_msi_boards, ARRAY_SIZE(asus_msi_boards),
+				   board_name);
+		if (err >= 0)
+			access = nct6775_determine_access(ASUSMSI_DEVICE_UID);
 	}
 
 	/*
-- 
2.39.0

