Return-Path: <linux-hwmon+bounces-12025-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sM2CNtnCpmn3TQAAu9opvQ
	(envelope-from <linux-hwmon+bounces-12025-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 03 Mar 2026 12:15:37 +0100
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 552A31ED988
	for <lists+linux-hwmon@lfdr.de>; Tue, 03 Mar 2026 12:15:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 284B031EA1D8
	for <lists+linux-hwmon@lfdr.de>; Tue,  3 Mar 2026 11:07:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 378FA41162C;
	Tue,  3 Mar 2026 11:07:12 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A963EB7F2
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Mar 2026 11:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772536032; cv=none; b=HcahMs876z+VGV4gNZ43/F3QuCN9zK+Zuyx0QggUxgPOD1i2iOeTYSV5T7NV6pzkKhlkFZzb3nKbplrthRjS551JfywsGpcbwYV3OBOzDC/jvCGsmB1LUdNo/YBHaJqwZhKgIu8z87AGMQVn4L7NxlJZ506DLqwZfh5PM6IVKwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772536032; c=relaxed/simple;
	bh=mxGBOMpgZHWodrnqfxlO+PQbfE3hD/FLCR9bbQF/8to=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O7MoT8Eubh2UW6VKcPovpVOZ5MFVEfyTT6nWSMAW3Ap/HpPXUAhAnRPxTEE6Xqk9DPJuugf6dovnyyRpuU9BEzqWLAoW2yC3lEQzKvuEHzUELULzFeYE5Wm0Io6ExGYKpfLDHUj+sPTx6c844gYDRSqzVJwkPYS5pKvFApjr0Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jre@pengutronix.de>)
	id 1vxNak-0002HT-JH; Tue, 03 Mar 2026 12:07:06 +0100
From: Jonas Rebmann <jre@pengutronix.de>
Date: Tue, 03 Mar 2026 12:07:01 +0100
Subject: [PATCH 1/2] hwmon: (ina2xx) clean up unused macro and outdated
 comment
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-ina234-shift-v1-1-318c33ac4480@pengutronix.de>
References: <20260303-ina234-shift-v1-0-318c33ac4480@pengutronix.de>
In-Reply-To: <20260303-ina234-shift-v1-0-318c33ac4480@pengutronix.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jonas Rebmann <jre@pengutronix.de>
X-Mailer: b4 0.15-dev-7abec
X-Developer-Signature: v=1; a=openpgp-sha256; l=1790; i=jre@pengutronix.de;
 h=from:subject:message-id; bh=mxGBOMpgZHWodrnqfxlO+PQbfE3hD/FLCR9bbQF/8to=;
 b=owGbwMvMwCV2ZcYT3onnbjcwnlZLYshcduDmO9Z2rqKTX769/f5JKKsu1O23LreKtJmi8Idct
 tVdUsn6HaUsDGJcDLJiiiyxanIKQsb+180q7WJh5rAygQxh4OIUgIksXcHIcFV4z6TQOn/BR9c+
 ndigdvX+bt4Dq0t+3jttHtif6LvKlIORYcnjl4sDQ+tnagb4X7m10XV3tVzFtNi534vuz/pzZo+
 YNicA
X-Developer-Key: i=jre@pengutronix.de; a=openpgp;
 fpr=0B7B750D5D3CD21B3B130DE8B61515E135CD49B5
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::ac
X-SA-Exim-Mail-From: jre@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-hwmon@vger.kernel.org
X-Rspamd-Queue-Id: 552A31ED988
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:mid,pengutronix.de:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ti.com:url];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_RCPT(0.00)[linux-hwmon];
	NEURAL_HAM(-0.00)[-0.896];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	R_DKIM_NA(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jre@pengutronix.de,linux-hwmon@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12025-lists,linux-hwmon=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4]
X-Rspamd-Action: no action

The list of supported chips in the header is incomplete and contains no
other information not readily available. Remove the list and instead
hint that the chips supported by this driver have 219/226 compatible
register layout [unlike the ones supported by e.g. ina238].

Remove the unused INA226_DIE_ID macro.

Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
---
 drivers/hwmon/ina2xx.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index 836e15a5a780..6a2cebbb9f15 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -1,22 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Driver for Texas Instruments INA219, INA226 power monitor chips
- *
- * INA219:
- * Zero Drift Bi-Directional Current/Power Monitor with I2C Interface
- * Datasheet: https://www.ti.com/product/ina219
- *
- * INA220:
- * Bi-Directional Current/Power Monitor with I2C Interface
- * Datasheet: https://www.ti.com/product/ina220
- *
- * INA226:
- * Bi-Directional Current/Power Monitor with I2C Interface
- * Datasheet: https://www.ti.com/product/ina226
- *
- * INA230:
- * Bi-directional Current/Power Monitor with I2C Interface
- * Datasheet: https://www.ti.com/product/ina230
+ * Driver for Texas Instruments INA219, INA226 and register-layout compatible
+ * current/power monitor chips with I2C Interface
  *
  * Copyright (C) 2012 Lothar Felten <lothar.felten@gmail.com>
  * Thanks to Jan Volkering
@@ -49,7 +34,6 @@
 /* INA226 register definitions */
 #define INA226_MASK_ENABLE		0x06
 #define INA226_ALERT_LIMIT		0x07
-#define INA226_DIE_ID			0xFF
 
 /* SY24655 register definitions */
 #define SY24655_EIN				0x0A

-- 
2.51.2.535.g419c72cb8a


