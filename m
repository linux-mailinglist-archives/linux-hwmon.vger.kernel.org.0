Return-Path: <linux-hwmon+bounces-14383-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFtpK5GBDmrY/AUAu9opvQ
	(envelope-from <linux-hwmon+bounces-14383-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Thu, 21 May 2026 05:52:49 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED1059E8F5
	for <lists+linux-hwmon@lfdr.de>; Thu, 21 May 2026 05:52:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 11AF4304A662
	for <lists+linux-hwmon@lfdr.de>; Thu, 21 May 2026 03:52:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF3D1384CE9;
	Thu, 21 May 2026 03:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ZdM0ywkh"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265F11A5B9D;
	Thu, 21 May 2026 03:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779335560; cv=none; b=aWkx8GDL/ADizbnoSJgV2LjNeGFX8wUzDZLjf77pubJTfUHDNSUF1w+JWwQG2+Ehj4Uv2aBA4sS0qfA2L5wYSRUS33OXvP/mzi2skGow8+V5++xmuEuXp5wohVDiG5OMamDH4K/fX88KFfqbIrgX9csCG56XKRC7XYhyy1mlro8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779335560; c=relaxed/simple;
	bh=23922UvnDE9i7MnLAq1ngdsJ+qAEaoxDcSbPxjVPDhM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dlun+eH3Y52OASzUQKsakWTyDf74tjtMUoVgJP7NRBq7XJOBbwE9bLxY/Hjdu1AFhLLC0+P1EDCyfztuPc/fwWRlgJ6W29TuO79kDszmZmlpoNjbzqi4tIcj+wCbhFK0Q4FVAr9qODoWA1CyCLy0qAMimpw/H0VeTpdTO/zlABo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ZdM0ywkh; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=I4
	hemCqEmxYYXgWd3JN6K79r9ZTVrZR3p1lb2FbaFgw=; b=ZdM0ywkhX9ez0gV+lj
	3ysW0WW8gMwusIOFLNtgUatz54Jfhl9xPJg+NEw4UiUzVBDVQv6Pk1W8yUJehvoL
	JliV1FZK2LNq1KGfp3HL4scMtfeAhHibkrKM+7K4TzkrZzluF79ya5a73JYbhHBU
	+yWtcs/6Zw/GAXMEhO8BeGZnI=
Received: from debian.lenovo.com (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wD3Xx5ngQ5qPDdQCg--.18159S4;
	Thu, 21 May 2026 11:52:14 +0800 (CST)
From: Kean Ren <rh_king@163.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kean Ren <rh_king@163.com>
Subject: [PATCH v3 2/2] hwmon: (lenovo-ec-sensors): Fix EC "MCHP" signature  validation logic
Date: Thu, 21 May 2026 11:52:28 +0800
Message-ID: <20260521035228.533317-3-rh_king@163.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260521035228.533317-1-rh_king@163.com>
References: <20260514011411.4167069-1-rh_king@163.com>
 <20260521035228.533317-1-rh_king@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3Xx5ngQ5qPDdQCg--.18159S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7AFWUCr1kWrWDJr4fuw45Jrb_yoW8WFyxpr
	4UJFW8Crn5Wr9rW3W2y3W7ury5Xa4rt3y0gry3Wan8CrnxWas7u3yFkF1agas8ZFn5Ga4I
	yFyYqrWY9F1DAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zNeHgUUUUUU=
X-CM-SenderInfo: 5ukbyxlqj6il2tof0z/xtbC+w6ZSGoOgW6NIwAA3B
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14383-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[163.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[squebb.ca,vger.kernel.org,163.com];
	DKIM_TRACE(0.00)[163.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rh_king@163.com,linux-hwmon@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,squebb.ca:email]
X-Rspamd-Queue-Id: 2ED1059E8F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The EC signature check uses && instead of || between the four
byte comparisons.  With &&, the condition is true only when ALL
four bytes fail to match simultaneously, meaning the driver
accepts a device as a valid Microchip EC if ANY single byte of
the 4-byte "MCHP" signature happens to match.

Due to short-circuit evaluation, if the first byte reads back as
'M' (0x4D, a very common register value), the remaining three
comparisons are skipped entirely and the device is accepted.

Change && to || so the check rejects devices that do not fully
match the expected EC signature, as originally intended.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Kean Ren <rh_king@163.com>
---
Changes in v3: Corrected bug description and regenerated.

 drivers/hwmon/lenovo-ec-sensors.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/lenovo-ec-sensors.c b/drivers/hwmon/lenovo-ec-sensors.c
index a16cc5e4053a..24a182abf9a3 100644
--- a/drivers/hwmon/lenovo-ec-sensors.c
+++ b/drivers/hwmon/lenovo-ec-sensors.c
@@ -537,9 +537,9 @@ static int lenovo_ec_probe(struct platform_device *pdev)
 	outw_p(MCHP_SING_IDX, MCHP_EMI0_EC_ADDRESS);
 	mutex_unlock(&ec_data->mec_mutex);
 
-	if ((inb_p(MCHP_EMI0_EC_DATA_BYTE0) != 'M') &&
-	    (inb_p(MCHP_EMI0_EC_DATA_BYTE1) != 'C') &&
-	    (inb_p(MCHP_EMI0_EC_DATA_BYTE2) != 'H') &&
+	if ((inb_p(MCHP_EMI0_EC_DATA_BYTE0) != 'M') ||
+	    (inb_p(MCHP_EMI0_EC_DATA_BYTE1) != 'C') ||
+	    (inb_p(MCHP_EMI0_EC_DATA_BYTE2) != 'H') ||
 	    (inb_p(MCHP_EMI0_EC_DATA_BYTE3) != 'P'))
 		return -ENODEV;
 
-- 
2.53.0


