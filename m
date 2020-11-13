Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 419952B1AFE
	for <lists+linux-hwmon@lfdr.de>; Fri, 13 Nov 2020 13:19:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgKMMT6 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 13 Nov 2020 07:19:58 -0500
Received: from mout01.posteo.de ([185.67.36.65]:57652 "EHLO mout01.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726176AbgKMMT6 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 13 Nov 2020 07:19:58 -0500
Received: from submission (posteo.de [89.146.220.130]) 
        by mout01.posteo.de (Postfix) with ESMTPS id 71D2716005F
        for <linux-hwmon@vger.kernel.org>; Fri, 13 Nov 2020 13:19:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
        t=1605269996; bh=ZEqgJv4B069sVgy/NRMeomEG6N6gQqY3dEgQs23fQk4=;
        h=Date:From:To:Cc:Subject:From;
        b=qKutQ/LJx/uU9etkGY9rKeaD03+SYwh2dbjJwAaW1m3rp9AdcsgxRynf4GwQmnogU
         hmaf0K32v69CD0SvGfTf9wl+9Z4KLL83cpxLVOMsoOQtGt6jpO4xSgPCvK6qIVbnOr
         sB5zhojE7gJ+kwLu5P1zgAcOroFyTFAgVaKL3O28I9zIKoac8qgMvB2qrR50UAm+R8
         ftP/fshQiPXZrR9VDfhb/btngCbV7c0G6AOky6JI38BsTK2jtXA/hDkGZpFO5inJaq
         UFIc9RlNikU8OHLVs1qfMwtRvs1Je5ns7T4eXOMc4UJTnWUUTZW+WBuRWVPmIVh+O6
         JRYap7hpTRDtw==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4CXcwq3RHNz9rxP;
        Fri, 13 Nov 2020 13:19:55 +0100 (CET)
Date:   Fri, 13 Nov 2020 13:19:54 +0100
From:   Wilken Gottwalt <wilken.gottwalt@posteo.net>
To:     linux-kernel@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org
Subject: [PATCH] hwmon: fix corsair-psu fan rpm calculation
Message-ID: <20201113121954.GA8488@monster.powergraphx.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The correct fan rpm value is also a LINEAR11 value but without a factor.
Verified by using the fan test button on the psu to let the fan spin up
to maximum for some seconds.

Fixes: 933222c98445 ("hwmon: (corsair-psu) fix unintentional sign extension issue")
Signed-off-by: Wilken Gottwalt <wilken.gottwalt@posteo.net>
---
 drivers/hwmon/corsair-psu.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/hwmon/corsair-psu.c b/drivers/hwmon/corsair-psu.c
index 5d19a888231a..99494056f4bd 100644
--- a/drivers/hwmon/corsair-psu.c
+++ b/drivers/hwmon/corsair-psu.c
@@ -252,12 +252,7 @@ static int corsairpsu_get_value(struct corsairpsu_data *priv, u8 cmd, u8 rail, l
 		*val = corsairpsu_linear11_to_int(tmp & 0xFFFF) * 1000;
 		break;
 	case PSU_CMD_FAN:
-		/*
-		 * this value is best guess, so the calculated value could be wrong, it is hard
-		 * to ge the fan to spin in these semi-passive power supplies, which need a
-		 * quite high load to do so
-		 */
-		*val = ((tmp & 0xFF) << 8) + ((tmp >> 8) & 0xFF);
+		*val = corsairpsu_linear11_to_int(tmp & 0xFFFF);
 		break;
 	case PSU_CMD_RAIL_WATTS:
 	case PSU_CMD_TOTAL_WATTS:
-- 
2.29.2

