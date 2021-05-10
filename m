Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CE773799D0
	for <lists+linux-hwmon@lfdr.de>; Tue, 11 May 2021 00:16:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231905AbhEJWRQ (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 10 May 2021 18:17:16 -0400
Received: from todd.t-8ch.de ([159.69.126.157]:32877 "EHLO todd.t-8ch.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230136AbhEJWRP (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 May 2021 18:17:15 -0400
From:   =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
        s=mail; t=1620684965;
        bh=9xxUl4JU9gAUvmn+fx0hfrIXvYIjn8Lm3pTXPSotdNo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OkwD6kNWSz81EVf4VkAVmkaOYavQciYFd5lnVcZqtREPlf+akFaB76TK1eFCcqbiA
         N1CHtZyBl1eq9cg7PIjcvGM5k7mCtN8H2eTpHj9iFa6tMOLfsZyVFjXJEAl+Q+qx8U
         KlCUJwSyv5v98Gk9tjhKTc/Kyeqzr98iHgso80w8=
To:     platform-driver-x86@vger.kernel.org,
        Mark Gross <mgross@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        linux-hwmon@vger.kernel.org
Subject: [PATCH 2/3] platform/x86: gigabyte-wmi: add support for X570 UD
Date:   Tue, 11 May 2021 00:15:44 +0200
Message-Id: <20210510221545.412522-2-linux@weissschuh.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210510221545.412522-1-linux@weissschuh.net>
References: <20210510221545.412522-1-linux@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Reported as working here:
https://github.com/t-8ch/linux-gigabyte-wmi-driver/issues/4

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/platform/x86/gigabyte-wmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/gigabyte-wmi.c b/drivers/platform/x86/gigabyte-wmi.c
index b95a94ed40b8..7af6c24151e2 100644
--- a/drivers/platform/x86/gigabyte-wmi.c
+++ b/drivers/platform/x86/gigabyte-wmi.c
@@ -146,6 +146,7 @@ static const struct dmi_system_id gigabyte_wmi_known_working_platforms[] = {
 	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("Z390 I AORUS PRO WIFI-CF"),
 	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("X570 AORUS ELITE"),
 	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("X570 I AORUS PRO WIFI"),
+	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("X570 UD"),
 	{ }
 };
 
-- 
2.31.1

