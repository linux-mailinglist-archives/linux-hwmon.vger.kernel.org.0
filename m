Return-Path: <linux-hwmon+bounces-15802-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HvUiKqj3UWrOKwMAu9opvQ
	(envelope-from <linux-hwmon+bounces-15802-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sat, 11 Jul 2026 09:58:32 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 08887740D42
	for <lists+linux-hwmon@lfdr.de>; Sat, 11 Jul 2026 09:58:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=debian.org (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15802-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15802-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D060302DF4C
	for <lists+linux-hwmon@lfdr.de>; Sat, 11 Jul 2026 07:58:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AEE937DEB6;
	Sat, 11 Jul 2026 07:58:04 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5EB381EB0
	for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 07:58:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783756684; cv=none; b=bfwSQKtnwdDvhwaDkM3nlUV2TjyiFZ9KaWsGws1foCejcgVt5h3sF/5qG4CoXm9qX8kiP5RR/cJq37U7EgChSYlNeGn4PyIjcf78da4KpCpusLymhgcLhx8gI8yesPwiMsLybkcWwJTs+uqvk2sVt9plm/xZnnp0abl17TKzxpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783756684; c=relaxed/simple;
	bh=TFMbF+6YpQE5zKhsi92k+6lG3+v7THpi7mqTMKsa1tE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JeRyJVfS/WBja862MkXwOpu4Lq+6Gg0unt/Lhck8IC4UMIKMH0UGKKqS5K3NqqlT3QNRGR+Q1Lx4z4K58ag1JaRMqEFd45o8rC/DDVR2hj4METe7PJYErdsZ4m2zkXIF/UFmbo++hRFkYA059o0/S+2yHiz1GA1bx6owQ4Tb4Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.181
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cc6dd436c6so18836375ad.2
        for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 00:58:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783756682; x=1784361482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fCVs3YON/pS66KjufLTdz6MFzQkosWnFvToVGu3OBSs=;
        b=YASqaq5mjxrG3vUTpvdRqBk6xuUM8U8c8ZtFTl8ltE2ifqJPxy94yiHFxsYXp2EX47
         +JcaLHiO6za3NjIyhFinmee5Xc35yITp9vQk+bqpyXjiyXZDbzapE6uI8NpUnr0pbwHs
         UoZELDDG9Ra5Pft7fWVPTWaDbUdFEza3QnEZt0WbPTtEh0sHHMs7wwlPaxLQVB+G8RAv
         VJbFWldgTA+/wX5ecs50Y79tVUfba7FlzT76ewcntFQ/GweF3eB1XyQS33Im1OLDwkFH
         cUP8+j94/uoNooayoeRo2DYt6iCLwXyrvndLh/mCEH7qFz1fEu+BO3RmeZl0/VDkDBZg
         D+AQ==
X-Forwarded-Encrypted: i=1; AHgh+RooOxQ0uWcPsbaKj9MgS3Bi/+b8bYbpzXTGTGQm0YqTXRd0GymXxwcqOizBJEHtzPkADRu8c8dLZpoY7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzElIXTUbx+hGgzMkY72oPF19sihXZoIE0yfIJIsfECKo16mpaJ
	/5TBhfK1WoYiN6ce5+JPHCIrWryMDzHutFjH6n1w8Ix0m2oyjX76YpE=
X-Gm-Gg: AfdE7clU8H/8s/7zWlMrxrt+egnINDoJMJDjAuxOY7xUt/AusIyTQFrHZjXf8BvgRMO
	dJlpWcumpTXVfyUnuhH13tBYAejXB7Jw409VklJwPMkpyeFWbx6+TZ09gWj49pZtEWXkiZTdiM1
	/h5qNCTLtVqApeQvjus8NMcCF8KrtEWgKOvSH65beQBezX2SWeIe/Uf1fUlArQTFAsRF8cRfMCR
	2FFeWJYH6M9xgU6XwH4Wc2TqNpCfqq95mRElAFMajRdSzvKw/Ijdbh0gnsd7uYII4Y4pkK7jW5g
	TP2JQ/fiqKKoJsZyyQT52fbvMqOqN+3UFUM38TtmosmM4RgT9EbXZaL8GShipLODLnDVIcDiQ2X
	QufJp9HetSySyWZuPEQwqjPkmwyjXAIwcZeciEkmagHvCo/aYZkdH/pQC6Sxl1/VlafUQZRob6N
	lMzofBH3L2AlEOXWvDTQnvOsuw+/kkUbxOx29EQq5zgifaVx6rTg+YMj/fmnvRuRG+UUrEm8d3M
	Yeok/GzpEI4JVj14SalkWGMng==
X-Received: by 2002:a17:902:f651:b0:2ca:1594:451e with SMTP id d9443c01a7336-2ce9f286f13mr24254365ad.31.1783756682253;
        Sat, 11 Jul 2026 00:58:02 -0700 (PDT)
Received: from penguin.tail0a1999.ts.net (61-228-52-13.dynamic-ip.hinet.net. [61.228.52.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1e279sm71130285ad.45.2026.07.11.00.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 00:58:01 -0700 (PDT)
From: Shih-Yuan Lee <fourdollars@debian.org>
To: Henrik Rydberg <rydberg@bitmath.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Armin Wolf <W_Armin@gmx.de>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shih-Yuan Lee <fourdollars@debian.org>
Subject: [PATCH v5 1/3] hwmon: (applesmc) Cache fan positions during register initialization
Date: Sat, 11 Jul 2026 15:57:52 +0800
Message-Id: <20260711075754.11358-2-fourdollars@debian.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260711075754.11358-1-fourdollars@debian.org>
References: <20260710123236.10508-1-fourdollars@debian.org>
 <20260711075754.11358-1-fourdollars@debian.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.14 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[debian.org : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15802-lists,linux-hwmon=lfdr.de];
	FREEMAIL_CC(0.00)[gmx.de,vger.kernel.org,debian.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rydberg@bitmath.org,m:linux@roeck-us.net,m:W_Armin@gmx.de,m:linux-hwmon@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:fourdollars@debian.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[fourdollars@debian.org,linux-hwmon@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fourdollars@debian.org,linux-hwmon@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 08887740D42

To support the read_string callback for fan labels in the modern HWMON
API, load and cache the fan position names in smcreg.fan_positions
during register initialization.

Pre-pad fallback labels with four spaces to match the "+ 4" pointer
arithmetic offset used by all fan labels in the read_string callback.

Signed-off-by: Shih-Yuan Lee <fourdollars@debian.org>
---
 drivers/hwmon/applesmc.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/applesmc.c b/drivers/hwmon/applesmc.c
index 90a14a7f2c4c..9b2d9ecb20c0 100644
--- a/drivers/hwmon/applesmc.c
+++ b/drivers/hwmon/applesmc.c
@@ -133,6 +133,7 @@ static struct applesmc_registers {
 	bool init_complete;		/* true when fully initialized */
 	struct applesmc_entry *cache;	/* cached key entries */
 	const char **index;		/* temperature key index */
+	char fan_positions[10][17];	/* cached fan position labels */
 } smcreg = {
 	.mutex = __MUTEX_INITIALIZER(smcreg.mutex),
 };
@@ -566,7 +567,7 @@ static int applesmc_init_smcreg_try(void)
 {
 	struct applesmc_registers *s = &smcreg;
 	bool left_light_sensor = false, right_light_sensor = false;
-	unsigned int count;
+	unsigned int count, i;
 	u8 tmp[1];
 	int ret;
 
@@ -597,6 +598,16 @@ static int applesmc_init_smcreg_try(void)
 	if (s->fan_count > 10)
 		s->fan_count = 10;
 
+	for (i = 0; i < s->fan_count; i++) {
+		char newkey[5];
+
+		scnprintf(newkey, sizeof(newkey), FAN_ID_FMT, i);
+		ret = applesmc_read_key(newkey, s->fan_positions[i], 16);
+		s->fan_positions[i][16] = 0;
+		if (ret)
+			scnprintf(s->fan_positions[i], 17, "    Fan %d", i);
+	}
+
 	ret = applesmc_get_lower_bound(&s->temp_begin, "T");
 	if (ret)
 		return ret;
-- 
2.39.5


