Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D70F19A23E
	for <lists+linux-hwmon@lfdr.de>; Wed,  1 Apr 2020 01:07:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731424AbgCaXHE (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 31 Mar 2020 19:07:04 -0400
Received: from latitanza.investici.org ([82.94.249.234]:50137 "EHLO
        latitanza.investici.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731259AbgCaXHE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 31 Mar 2020 19:07:04 -0400
X-Greylist: delayed 578 seconds by postgrey-1.27 at vger.kernel.org; Tue, 31 Mar 2020 19:07:03 EDT
Received: from mx3.investici.org (unknown [127.0.0.1])
        by latitanza.investici.org (Postfix) with ESMTP id 3CF54120163;
        Tue, 31 Mar 2020 22:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=autistici.org;
        s=stigmate; t=1585695444;
        bh=EUVPNT4aWgWrg4j90L25aIYTU9A26GlX+O+Qitb1IOA=;
        h=From:To:Cc:Subject:Date:From;
        b=b81fIVXgf+sftvdkV3DQPKqaYQjX/wzNeGmXyoJM4CHmve+kgCQZZMVfFJ3bBPEl5
         CU1Fp57DP2S0K4Ryo4ZbQ7kQ5Yl8GPw4fNDqHwI829R5S5Scu9mGIyQLL6AlOuK9R4
         FAx+qnZKjvPOzWTCfC4gullJf7dcLeBjyiPl/cno=
Received: from [82.94.249.234] (mx3.investici.org [82.94.249.234]) (Authenticated sender: mikefender@cryptolab.net) by localhost (Postfix) with ESMTPSA id AB5E612015F;
        Tue, 31 Mar 2020 22:57:23 +0000 (UTC)
From:   Michele Sorcinelli <michelesr@autistici.org>
To:     =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org,
        Michele Sorcinelli <michelesr@autistici.org>
Subject: [PATCH] drivers/hwmon/dell-smm-hwmon.c: fix blank line
Date:   Tue, 31 Mar 2020 23:57:08 +0100
Message-Id: <20200331225708.52822-1-michelesr@autistici.org>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Fix missing blank line after declaration: reported by checkpatch.pl

There are other missing blank lines reported in the declaration of
struct smm_regs fields (line 120) but they are probably false positives
so I don't think they need to be changed.

Signed-off-by: Michele Sorcinelli <michelesr@autistici.org>
---
 drivers/hwmon/dell-smm-hwmon.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
index ab719d372b0d..7b61b613aff6 100644
--- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -1276,6 +1276,7 @@ static int __init i8k_probe(void)
 	id = dmi_first_match(i8k_dmi_table);
 	if (id && id->driver_data) {
 		const struct i8k_config_data *conf = id->driver_data;
+
 		if (!fan_mult && conf->fan_mult)
 			fan_mult = conf->fan_mult;
 		if (!fan_max && conf->fan_max)
-- 
2.26.0

