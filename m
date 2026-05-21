Return-Path: <linux-hwmon+bounces-14391-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NH6K8dSD2qpJAYAu9opvQ
	(envelope-from <linux-hwmon+bounces-14391-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Thu, 21 May 2026 20:45:27 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B41405AB385
	for <lists+linux-hwmon@lfdr.de>; Thu, 21 May 2026 20:45:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 32EAA318F3EB
	for <lists+linux-hwmon@lfdr.de>; Thu, 21 May 2026 18:04:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D15E3383991;
	Thu, 21 May 2026 18:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=al2klimov.de header.i=@al2klimov.de header.b="Q30D93bx"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mta.al2klimov.de (mta.al2klimov.de [162.55.223.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B7A3630AD;
	Thu, 21 May 2026 18:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.55.223.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779386648; cv=none; b=qiVXnLGijqrDSPJyEkara/1wSPFDtRZuVeo51EwW8wWydHKHwCRzGm8n2sEUfxunMU3NZdOab9Wr4YruWd8mh6G2tGKG0WPoqdfTf65TpZpmSIaJ9IIpEh9u23NrWMj/ey0NA8a3qLFS4FN5IPfVJOWKiqp6CmiobwwBGdXDnvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779386648; c=relaxed/simple;
	bh=IV/1L/Rj7qMwpngEZcxEoQroL40wwhkoCZUkW3msxew=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qQ+jMacwPgfrREJ19+xTUHYyosR86poiYe6g2hXT3cdpFpQHhqjqZo6gV+ou7vbnn7j1ROTDr8nr/6J0MccpmjZ8glmD7j08D7EGPMeXxDBTPOR7BrcC1jG1QcA/9VOkq0xV75HCZytYDGf5aNIoc4sCb7NMwQFtg8BCbCiU0LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=al2klimov.de; spf=pass smtp.mailfrom=al2klimov.de; dkim=pass (2048-bit key) header.d=al2klimov.de header.i=@al2klimov.de header.b=Q30D93bx; arc=none smtp.client-ip=162.55.223.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=al2klimov.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=al2klimov.de
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=default; bh=IV/1L/Rj7qMw
	pngEZcxEoQroL40wwhkoCZUkW3msxew=; h=date:subject:cc:to:from;
	d=al2klimov.de; b=Q30D93bxUhe5/x+GIcPpv80ZoBQHru0iiYvkSKGcX0gJ1ic5PdKC
	tuXbB3IP+a7LMR4X2dloWJG/psl/r4iZTUvKzFhJbJ0+znjk1XMTuLdu24EEt04hqCWUm9
	CqTlqjsnZT5BixwM1jHiXezrp/E1xRjTybRzuvUF0pPP/9PP3qU0N1rtr+VdB0QFCpaCbf
	+DVzsWiZc8HKjg0/aoV350TFSlB0OqPYV6CXGP7PtXQdbvXrcuzJr3HTJYJcCkll+7MPUR
	6u8fVCSBCdK+7D1ZGEaKFKu5RaZ6kyloY/rk+NlNwUp2IjMt4HlauZDYoLEjbOuDBJJ+ds
	DYUZBgo4tQ==
Received: from cachy-ak (2a02-2455-18e9-e011-4d8a-aad2-c25c-50e5.dyn6.pyur.net [2a02:2455:18e9:e011:4d8a:aad2:c25c:50e5])
	by mta.al2klimov.de (OpenSMTPD) with ESMTPSA id 6c7f6f1e (TLSv1.3:TLS_CHACHA20_POLY1305_SHA256:256:NO);
	Thu, 21 May 2026 18:03:53 +0000 (UTC)
From: "Alexander A. Klimov" <grandmaster@al2klimov.de>
To: Guenter Roeck <linux@roeck-us.net>,
	Frank Li <Frank.Li@nxp.com>,
	Florin Leotescu <florin.leotescu@nxp.com>,
	linux-hwmon@vger.kernel.org (open list:HARDWARE MONITORING),
	linux-kernel@vger.kernel.org (open list)
Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: [PATCH] hwmon: (emc2305) update of_emc2305_match_table
Date: Thu, 21 May 2026 20:03:33 +0200
Message-ID: <20260521180334.19706-1-grandmaster@al2klimov.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[al2klimov.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[al2klimov.de:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14391-lists,linux-hwmon=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[grandmaster@al2klimov.de,linux-hwmon@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[al2klimov.de:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[al2klimov.de:email,al2klimov.de:mid,al2klimov.de:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: B41405AB385
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Latter was added with only emc2305, in contrast to emc2305_ids
which also listed emc2301, emc2302 and emc2303.
So these three devices couldn't be probed based on device tree contents
until now. I fixed this.

Fixes: 882bd6de1a5b ("hwmon: emc2305: Add OF support")
Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
 drivers/hwmon/emc2305.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c
index 64b213e1451e..4c99018d0575 100644
--- a/drivers/hwmon/emc2305.c
+++ b/drivers/hwmon/emc2305.c
@@ -716,6 +716,9 @@ static int emc2305_probe(struct i2c_client *client)
 
 static const struct of_device_id of_emc2305_match_table[] = {
 	{ .compatible = "microchip,emc2305", },
+	{ .compatible = "microchip,emc2303", },
+	{ .compatible = "microchip,emc2302", },
+	{ .compatible = "microchip,emc2301", },
 	{},
 };
 MODULE_DEVICE_TABLE(of, of_emc2305_match_table);
-- 
2.54.0


