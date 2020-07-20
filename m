Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 483532271A7
	for <lists+linux-hwmon@lfdr.de>; Mon, 20 Jul 2020 23:45:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728542AbgGTVoh (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 20 Jul 2020 17:44:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:55858 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727861AbgGTVhu (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 20 Jul 2020 17:37:50 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D144D22C9D;
        Mon, 20 Jul 2020 21:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595281070;
        bh=KHiEmeSDHEk36Ap081u5lxBnesPSBOC4MwK1QNOPB98=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=k5A2skXysTaAJhzSawCy0GJrXzw4df0wGTzj9lrrOB4HNiJ0QyOHl4CkV3ulXzlaM
         PgdbalG2SSx9L+uLOdHPVAhSe3gz498Q8ouqbh7bz0rE/cjnDjLkrnNmNOihYHnWmI
         dMPMac4kk2ZAK2EzgBIYK3hq0Rm1n2Cbtw7SPLMk=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Guenter Roeck <linux@roeck-us.net>, Stefan Dietrich <roots@gmx.de>,
        Sasha Levin <sashal@kernel.org>, linux-hwmon@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 28/40] hwmon: (nct6775) Accept PECI Calibration as temperature source for NCT6798D
Date:   Mon, 20 Jul 2020 17:37:03 -0400
Message-Id: <20200720213715.406997-28-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200720213715.406997-1-sashal@kernel.org>
References: <20200720213715.406997-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Guenter Roeck <linux@roeck-us.net>

[ Upstream commit 8a03746c8baf82e1616f05a1a716d34378dcf780 ]

Stefan Dietrich reports invalid temperature source messages on Asus Formula
XII Z490.

nct6775 nct6775.656: Invalid temperature source 28 at index 0,
		source register 0x100, temp register 0x73

Debugging suggests that temperature source 28 reports the CPU temperature.
Let's assume that temperature sources 28 and 29 reflect "PECI Agent {0,1}
Calibration", similar to other chips of the series.

Reported-by: Stefan Dietrich <roots@gmx.de>
Cc: Stefan Dietrich <roots@gmx.de>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hwmon/nct6775.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
index 7efa6bfef0609..ba9b96973e808 100644
--- a/drivers/hwmon/nct6775.c
+++ b/drivers/hwmon/nct6775.c
@@ -786,13 +786,13 @@ static const char *const nct6798_temp_label[] = {
 	"Agent1 Dimm1",
 	"BYTE_TEMP0",
 	"BYTE_TEMP1",
-	"",
-	"",
+	"PECI Agent 0 Calibration",	/* undocumented */
+	"PECI Agent 1 Calibration",	/* undocumented */
 	"",
 	"Virtual_TEMP"
 };
 
-#define NCT6798_TEMP_MASK	0x8fff0ffe
+#define NCT6798_TEMP_MASK	0xbfff0ffe
 #define NCT6798_VIRT_TEMP_MASK	0x80000c00
 
 /* NCT6102D/NCT6106D specific data */
-- 
2.25.1

