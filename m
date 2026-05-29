Return-Path: <linux-hwmon+bounces-14602-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qET7EgWEGWouxQgAu9opvQ
	(envelope-from <linux-hwmon+bounces-14602-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 29 May 2026 14:18:13 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 497D860226A
	for <lists+linux-hwmon@lfdr.de>; Fri, 29 May 2026 14:18:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2BCA43029311
	for <lists+linux-hwmon@lfdr.de>; Fri, 29 May 2026 12:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 456E43D7A01;
	Fri, 29 May 2026 12:11:51 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from exchange.fintech.ru (exchange.fintech.ru [195.54.195.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B163D0900;
	Fri, 29 May 2026 12:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.54.195.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780056711; cv=none; b=Wk/MZic2STDJABwVepMW/etKHix2vUnUrgbdYwz0+0J+YodRqS7kgZA+nOYxL//7p6zrLFT6BmnAU0vDQ3V8pPyHxggdwko+diJA7OaKtUkAQ4NWSSAUeLldt5bzb3AUjcoS3lsMp4cc33kQ6rIC17qCjb/LbCouh/pQ/lerWcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780056711; c=relaxed/simple;
	bh=NH7ZsUqrsHz50jIlS+EGCsawOoc3cw9k1jkR11u/2TA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Gbri3+p/rluWEHKL6au9Pblj7mJ4mwNcVORABrcC3Xupm2DErISXfwf3C8ur9S2BSMx4N++oYyk6U47QNjFvsHMLGi7N9+4anSQRAvhu+I98iSwdFo1nr+9Iy7uWu3ZO318fzpG74y2tpDRt+a5dsaMKn+akGnmXaWFgTZNn+2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru; spf=pass smtp.mailfrom=fintech.ru; arc=none smtp.client-ip=195.54.195.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fintech.ru
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.159) with Microsoft SMTP Server (TLS) id 14.3.498.0; Fri, 29 May
 2026 15:11:46 +0300
Received: from localhost (10.0.253.153) by Ex16-01.fintech.ru (10.0.10.18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 29 May
 2026 15:11:46 +0300
From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
CC: Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
	<linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<lvc-project@linuxtesting.org>
Subject: [PATCH] hwmon: it87: Reject negative values in set_fan()
Date: Fri, 29 May 2026 15:11:39 +0300
Message-ID: <20260529121141.1633588-1-n.zhandarovich@fintech.ru>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: Ex16-02.fintech.ru (10.0.10.19) To Ex16-01.fintech.ru
 (10.0.10.18)
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[fintech.ru];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-14602-lists,linux-hwmon=lfdr.de];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[n.zhandarovich@fintech.ru,linux-hwmon@vger.kernel.org];
	NEURAL_HAM(-0.00)[-0.975];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-hwmon];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxtesting.org:url,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,fintech.ru:mid,fintech.ru:email]
X-Rspamd-Queue-Id: 497D860226A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

set_fan() parses user input with kstrtol() and passes the resulting
value to FAN16_TO_REG() on chips with 16-bit fan support.

Negative fan speeds are not meaningful and should be rejected before
conversion. Discard val < 0 to keep the conversion in its valid input
domain and avoid invalid arithmetic in the register conversion path.

Worst scenario, one may be able to abuse undefined behaviour of signed
overflow to possibly induce rpm * 2 == 0 in FAN16_TO_REG(), thus
causing a division by zero.

Found by Linux Verification Center (linuxtesting.org) with static
analysis tool SVACE.

Fixes: 17d648bf5786 ("it87: Add support for the IT8716F")
Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
---
 drivers/hwmon/it87.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 5fd310662ee4..888db1975876 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -1412,6 +1412,9 @@ static ssize_t set_fan(struct device *dev, struct device_attribute *attr,
 	if (kstrtol(buf, 10, &val) < 0)
 		return -EINVAL;
 
+	if (val < 0)
+		return -EINVAL;
+
 	err = it87_lock(data);
 	if (err)
 		return err;

