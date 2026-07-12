Return-Path: <linux-hwmon+bounces-15832-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +iD7Fo9MU2qRZgMAu9opvQ
	(envelope-from <linux-hwmon+bounces-15832-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sun, 12 Jul 2026 10:13:03 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E25C37441EF
	for <lists+linux-hwmon@lfdr.de>; Sun, 12 Jul 2026 10:13:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="kiz/td0W";
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15832-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15832-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5BBE53006104
	for <lists+linux-hwmon@lfdr.de>; Sun, 12 Jul 2026 08:13:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4097A371CF1;
	Sun, 12 Jul 2026 08:13:01 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA628373C04
	for <linux-hwmon@vger.kernel.org>; Sun, 12 Jul 2026 08:12:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783843981; cv=none; b=HPMS6UIsf3n06Rcx/mpIvFEy0yoBWbDjrtjQZ9RvHV9Wq2/Esxy4EZu78A/XvXi55zYyCwto78iqfdrDtcmINHy/kXulTpy4C25wAWGyYP9l3iT9+zO06LLs8fj6TlVbwmrnJtZmmjRALVi6SVAL4CjSY9hZ6y5VoVLuUnQIOmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783843981; c=relaxed/simple;
	bh=Z2vUG8jtesgvXw/5DwCT3QPIZBJWUxwh3fcxC37QyFs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fxK67mrPCCBPI2FlNdSuE06hGpTRaGSiUKD5/1bXxrExvU6BMlMBl/syF0zRKRWLNAEwT5eMmyLjmyXH4BP32jlnpSvScIIaMJr1u0dI/PCkiUuYkDTQMbyH2M0P19qOkFQ8547UWGZnS22xQpZ3fjn7ivwoPROYDK0HGEShti4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kiz/td0W; arc=none smtp.client-ip=209.85.216.48
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-36b9d265355so1674256a91.2
        for <linux-hwmon@vger.kernel.org>; Sun, 12 Jul 2026 01:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783843979; x=1784448779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yf8APldQKFFingRIGr4Zmck2pdxBo3U/qGVTsNumbGk=;
        b=kiz/td0W7oUceEbDmpdmT0NeOZ7/uPkMqXAkxZ0laoSw3FAg9bNif9AFb7labC097c
         yzhLq5EzV2m3XpWiuS+1zAUq5pBdj6NLmu1gnEx80/5aHB/hmvTakgRItgpuqQU74sP7
         NXZEGH47fbSex5LsIvEYOEJ0i4H9Y1h4UPW2VJQdPoRAn2bQPzhGECD2WJWLnSJNO02m
         ivAoOHWRC4xdgMdRHpkJxOyb2Y/epBj5wBPPuapwyNc+ZWf7eogLlBOm+NWuv8s9Ml65
         MFtwAfgVmHavK2zjkrNKgtr7MgeMN6JMyHGvUTaY+bzoo/l55YxR79AX1BZXdAId9OmP
         E9xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783843979; x=1784448779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yf8APldQKFFingRIGr4Zmck2pdxBo3U/qGVTsNumbGk=;
        b=eOZ+nzTTW6TRhs2z9ZoZcFj9qq+MYfrLxjqvg5eZ8I9iYQ7tKjbBIgCHqEOqhDrO2p
         YLqK3j9RKPgauQQIjcb091sa6zKdcQdaQ/BKKUCjyt6nJNucG3FI6uvVSW0Lym7JC6h7
         ckxZVM10jlYDaXdbqVInzpwDiXkvAo3UpkaP+UvGhQDBLe/ogjlRfEYAZyxLpsM4tVHN
         9fCh8KqIay2B6vQpYsnlAwkJIv1yboxSvgAipiNoWKmLdeGmYe9h/PemBHXqLTRqq9Bw
         6oSs7F8D62U5wrTC7inXt4gq5h9NFB/MHVQHRfWTuDX4we9qxxRRMSyqPW4KJSsK/JEQ
         zuAw==
X-Gm-Message-State: AOJu0Yxo4FbgbyAXPk9CeBYpZUIz6kDQZzcyyuQwBUZmZ/+YE+3j6zfr
	8back6ZRv1cFyNuyCrJLDaqQXx2EG6MUYIKpj+Wu4MpwYZKjeHOLGHa0
X-Gm-Gg: AfdE7ck1hvUfnZR6h9BoUad7i7WpShg84uMDCqs2XtfWRHMRHK6zD+ttu77PrvTJZxW
	AE0uOJjNGzrtJ0U+z5sH6m7+/Z48m7kJIJWLKYelrbM0pYR0/hWlnNQfVclkN0Y4Hllmnm7LsFB
	K4kYbUTQW/tJuzWmlRWr6kTCjTO4QIDXqAWVvqT7z+Gles031Ni7Ukw0hklOqVvclhLFPucIIPg
	SF88oQwinA8hHuDkZCc1BgpbYbUgZVk3B3OdE3HweESy1zkjhobhow76dm0gs9xm1stOtP6VxxN
	Nj4i06eeeumlsh8qrM6eKF0tlAfuwQT4EHBcZH2NmY7Nub3sCjQgv1UuHtYmAuGLNwuv6+a8Dav
	eIWTRIaVnytcSWf+sxRAYYo2EOaG9Z3Z8DpNHNA7PA+KyMT8mbA+Sm84zdnZ22lXX/b00QFuAx3
	sC7Ji7b5lhQ4oI
X-Received: by 2002:a17:90b:1fc8:b0:37e:2005:6507 with SMTP id 98e67ed59e1d1-38dc75f4cf5mr4884007a91.15.1783843979021;
        Sun, 12 Jul 2026 01:12:59 -0700 (PDT)
Received: from kdev.. ([108.180.130.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5680a5b1sm4721358a91.17.2026.07.12.01.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 01:12:58 -0700 (PDT)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: Iwona Winiarska <iwona.winiarska@intel.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Babanpreet Singh <bbnpreetsingh@gmail.com>
Subject: [PATCH] hwmon: (peci) Fix kernel-doc parameter names in common.h
Date: Sun, 12 Jul 2026 08:12:58 +0000
Message-ID: <20260712081258.7-1-bbnpreetsingh@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-15832-lists,linux-hwmon=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:iwona.winiarska@intel.com,m:linux@roeck-us.net,m:linux-hwmon@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bbnpreetsingh@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[bbnpreetsingh@gmail.com,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bbnpreetsingh@gmail.com,linux-hwmon@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E25C37441EF

scripts/kernel-doc -Wall -none reports:

  Warning: drivers/hwmon/peci/common.h:39 function parameter 'state' not
  described in 'peci_sensor_need_update'
  Warning: drivers/hwmon/peci/common.h:39 Excess function parameter
  'sensor' description in 'peci_sensor_need_update'
  Warning: drivers/hwmon/peci/common.h:49 function parameter 'state' not
  described in 'peci_sensor_mark_updated'
  Warning: drivers/hwmon/peci/common.h:49 Excess function parameter
  'sensor' description in 'peci_sensor_mark_updated'

Both peci_sensor_need_update() and peci_sensor_mark_updated() take a
pointer to struct peci_sensor_state named 'state', but their kernel-doc
comments document a parameter named 'sensor' and describe it as a
pointer to the sensor data struct. The comments have been out of sync
with the code since the file was added by commit bf3608f338e9 ("hwmon:
peci: Add cputemp driver").

Update the kernel-doc comments to document the 'state' parameter.

No functional change.

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
---
 drivers/hwmon/peci/common.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/peci/common.h b/drivers/hwmon/peci/common.h
index 92a7ee1925bc..5eae9681e385 100644
--- a/drivers/hwmon/peci/common.h
+++ b/drivers/hwmon/peci/common.h
@@ -31,7 +31,7 @@ struct peci_sensor_data {
 
 /**
  * peci_sensor_need_update() - check whether sensor update is needed or not
- * @sensor: pointer to sensor data struct
+ * @state: pointer to sensor state struct
  *
  * Return: true if update is needed, false if not.
  */
@@ -44,7 +44,7 @@ static inline bool peci_sensor_need_update(struct peci_sensor_state *state)
 
 /**
  * peci_sensor_mark_updated() - mark the sensor is updated
- * @sensor: pointer to sensor data struct
+ * @state: pointer to sensor state struct
  */
 static inline void peci_sensor_mark_updated(struct peci_sensor_state *state)
 {

base-commit: 44696aa3a489d2baf58efa61b37833f100072bee
-- 
2.43.0


