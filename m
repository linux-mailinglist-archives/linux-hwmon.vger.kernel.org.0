Return-Path: <linux-hwmon+bounces-14808-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MGMCFOyDJWqXIwIAu9opvQ
	(envelope-from <linux-hwmon+bounces-14808-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sun, 07 Jun 2026 16:45:00 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D0A650C98
	for <lists+linux-hwmon@lfdr.de>; Sun, 07 Jun 2026 16:44:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=cjdzt74D;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-14808-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-14808-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 42FFF300915B
	for <lists+linux-hwmon@lfdr.de>; Sun,  7 Jun 2026 14:44:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B36C3AB26D;
	Sun,  7 Jun 2026 14:44:57 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D335299931
	for <linux-hwmon@vger.kernel.org>; Sun,  7 Jun 2026 14:44:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780843497; cv=none; b=kE8UK6ssezzw5asHh4t88IJGDtemsTtwKBYZeG3p6a34MbdB7FdtQ3PVMWmqS2AFomWjzY3U9pM9iHHztijJq/NP+ZkE3SmVJeWg3N444PjmCA4ebNiY6rWSNyPxhqorpf/0Om+gM7yyWPlk/Upfko3TXroA7AsXbKXTtCa6S0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780843497; c=relaxed/simple;
	bh=kxINBfME1DycLCerbjJmzqLubr59t4fd7N5s0uKnc5I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e/aV2BuW1c2408VhOlqjlCqyigIBxs+KAuhVoY4OKy+I0WydfxEZfPzC2Dq2GdmhMu/qioaXqKUD8pWsb4hFl0g02HkaIJK4m8C3/M4MG5oyypEhJP9WPOxAKnVqCGHQplZoaMLnW2K03EXGkeE2W1rWL67SJNUOR0f9aIeuESM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cjdzt74D; arc=none smtp.client-ip=209.85.128.45
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490ac10e337so30951935e9.3
        for <linux-hwmon@vger.kernel.org>; Sun, 07 Jun 2026 07:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780843494; x=1781448294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iSKb4Co68AkxuyD+X3nlTFn4HBTTLSES8AUS4z8O11A=;
        b=cjdzt74Dy2a1LxF6dinhaFdRPKVwcP1CY+anY2e9mrlqETFjQq+oF1NPAn/OggJ/to
         EZLCicGGh5hzsyodE8fMyVoXVd5SWm6m4sQHsnYfPttxK5ToEyQZuXCd2uTTcjsosc+x
         CHiuZO46eItnb2q30Fjplme2dYT/5do1kMlE2RKRS5W118t6Bf4yXDQsGaKwLdYSsiXJ
         1FYCT2ex2sPtbyOUu5/aVklKA4V/zCaKqDH7qy1898hbQbKxNHTz/SVEKiykj+ONXRPq
         4YaQ2AUoALYPejm0ecpFLHpm65aTAMnZm7nuCP0gYhbqaIzoAfCnhoT16ITONY4BfwPR
         dmqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780843494; x=1781448294;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iSKb4Co68AkxuyD+X3nlTFn4HBTTLSES8AUS4z8O11A=;
        b=eMiF1hbBP9t77JOd9qlzi3qgLqyQ9encKK0qq3GenEvDS189183WlgZBoeltRJduI/
         X2qoy6Vc5yQPh9j4Ff9tLCpRAbAqG+SVOMVkgjdGeByNl/oDJ+vWuDPbUYv4NNO0Iocp
         KTi+xtRro9ROigxGI6Lx8lPBfPqASyIDAeYUQdiOKeuC33b16/iAbYIsgKlJlYnJsbgW
         Ze/YSiBhHe1/yZr6VKNww26CQ4/EpFxb9aaWn+AgobQzjV8ZA0R/ZeE4X+gmwFoY4uSG
         Pbpga4luwysxPUmr5TzQpzu7UTXdvil2CLGmrYEcCQfyMPranEDntkYndzLc3x7LacSD
         22OQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Ydx01C4LC6L6mnYybz1YcLj3C0Ntg9LnL/gPihM+FLURkmqXW/7+z28SSYcvb2WVnfcIkyMcIBGIYCw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+W7t4CNMgy3tSJRvtfOwCzvpP8MKcrhbtU8/IfvDGcUX+GG8K
	2TLVOvVfsnknyl33JnGCmo6NyKAxHdPx8/HyMXZtb44xB1QnmHZpUTCv
X-Gm-Gg: Acq92OGn9m4rZClSR1ueNvenbWuBiQnjVVVdMNALLtXHG3ZYo/tri8+FezFXUNA59Jx
	5wxn4ueF6gT57ShFMOcQK4FeF+kc9PhZGTGXykdDgo1I9iDT0xcmlrdx/bBoSWzZbAOv1QvkfmK
	OtlWbP1U2nDYj9uS92CA1Zt+ZXqV5cZXYA1CKdm14EeSHt/I4KtI6gY5VQUry5ok6xzL23mk8R7
	sDT+K0EQmV/O3eciUFJ01fblsKaqcvZTgLpsMyYI1cUjrEZjjB5JAAOwfAcDiEw4WcoqFVTGF7g
	0hUIVaVwAIM3yQzNPC+bHRyRx26AsUfbocVBrUprvkO/PJAoaR4govBo78SvjduBZpIrUg1V8PI
	9uHQKXTX7yO81b58qVUO7mc7HWYOnVWJd13wxER8CPW+dp37luuM9NDaaYwTzO3odl092Q4Rln4
	FSf+4KNKIHYXtawDX7i2+9y5ul/gM2QBMmccQ/ew2xP7UaInl/ux0=
X-Received: by 2002:a05:600c:5488:b0:490:9d1b:f07f with SMTP id 5b1f17b1804b1-490c25b1277mr228088655e9.12.1780843494385;
        Sun, 07 Jun 2026 07:44:54 -0700 (PDT)
Received: from puma.museclub.art ([185.189.115.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3cc0f8sm314427815e9.8.2026.06.07.07.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 07:44:53 -0700 (PDT)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Brian Downey <bdowne01@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org (open list:HARDWARE MONITORING),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] hwmon: (asus-ec-sensors) add ROG MAXIMUS Z790 EXTREME
Date: Sun,  7 Jun 2026 16:42:25 +0200
Message-ID: <20260607144238.128259-1-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14808-lists,linux-hwmon=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,roeck-us.net,lwn.net,linuxfoundation.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[eugeneshalygin@gmail.com,linux-hwmon@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:eugene.shalygin@gmail.com,m:bdowne01@gmail.com,m:linux@roeck-us.net,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-hwmon@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:eugeneshalygin@gmail.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eugeneshalygin@gmail.com,linux-hwmon@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 90D0A650C98

From: Brian Downey <bdowne01@gmail.com>

Add support for ROG MAXIMUS Z790 EXTREME

Signed-off-by: Brian Downey <bdowne01@gmail.com>
Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 Documentation/hwmon/asus_ec_sensors.rst | 1 +
 drivers/hwmon/asus-ec-sensors.c         | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
index 9ad3f0a57f55..60f1a6036538 100644
--- a/Documentation/hwmon/asus_ec_sensors.rst
+++ b/Documentation/hwmon/asus_ec_sensors.rst
@@ -29,6 +29,7 @@ Supported boards:
  * ROG MAXIMUS XI HERO
  * ROG MAXIMUS XI HERO (WI-FI)
  * ROG MAXIMUS Z690 FORMULA
+ * ROG MAXIMUS Z790 EXTREME
  * ROG STRIX B550-E GAMING
  * ROG STRIX B550-I GAMING
  * ROG STRIX B650E-I GAMING WIFI
diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index 070bb368f2b7..171f06a4f120 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -509,6 +509,13 @@ static const struct ec_board_info board_info_maximus_z690_formula = {
 	.family = family_intel_600_series,
 };
 
+static const struct ec_board_info board_info_maximus_z790_extreme = {
+	.sensors = SENSOR_TEMP_T_SENSOR | SENSOR_TEMP_VRM |
+		SENSOR_SET_TEMP_WATER | SENSOR_FAN_WATER_FLOW,
+	.mutex_path = ASUS_HW_ACCESS_MUTEX_RMTW_ASMX,
+	.family = family_intel_700_series,
+};
+
 static const struct ec_board_info board_info_prime_x470_pro = {
 	.sensors = SENSOR_SET_TEMP_CHIPSET_CPU_MB |
 		SENSOR_TEMP_T_SENSOR | SENSOR_TEMP_VRM |
@@ -857,6 +864,8 @@ static const struct dmi_system_id dmi_table[] = {
 					&board_info_maximus_x_hero),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG MAXIMUS Z690 FORMULA",
 					&board_info_maximus_z690_formula),
+	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG MAXIMUS Z790 EXTREME",
+					&board_info_maximus_z790_extreme),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B550-E GAMING",
 					&board_info_strix_b550_e_gaming),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B550-I GAMING",
-- 
2.54.0


