Return-Path: <linux-hwmon+bounces-15218-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1oc5KsQaNWo1nAYAu9opvQ
	(envelope-from <linux-hwmon+bounces-15218-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 19 Jun 2026 12:32:36 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6293F6A53B7
	for <lists+linux-hwmon@lfdr.de>; Fri, 19 Jun 2026 12:32:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ZFR7WXAJ;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15218-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15218-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A12B430078A8
	for <lists+linux-hwmon@lfdr.de>; Fri, 19 Jun 2026 10:32:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C19003749EC;
	Fri, 19 Jun 2026 10:32:29 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C3A373C1E
	for <linux-hwmon@vger.kernel.org>; Fri, 19 Jun 2026 10:32:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781865149; cv=none; b=rIXG8FfLgSdYcV5yHgYqC4klZ7wYdBhjz82b5Ky+Uf8qCI8l2imVKPiFbdRiQsrmKqQ0MuH8cY6im5MWNDVBI8EOg7V2Tri4dI1hiRReTcN3ZrLHKFbPScvob5U9rx+MeSRHzw+R7u6MCwdvwi8MZ6KFCVttp5gG36qObSeasXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781865149; c=relaxed/simple;
	bh=VEnQVtwZkIU7RBSHiSyT7NGob5OOuJi2SIKdnJrA1CE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=T4aVCyBubO6J4CcFrGY/0oHV9bjLAH9wBI8RKP9aoY1HmiWcQxjE4qkDPTD/sL0jSNyZdit1fd+nXpC2XrEBjqXVqDD9BDSH2IklCPWvykFwXvufz0g8afRyM/kc8pHLJFVWNyaLeJMDuen2maZnw0K6gbmcI4rYcfew3bRlAB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZFR7WXAJ; arc=none smtp.client-ip=209.85.218.50
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c07a6520cafso210205866b.0
        for <linux-hwmon@vger.kernel.org>; Fri, 19 Jun 2026 03:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781865145; x=1782469945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yWdatNxPt/OSZnGzSt5RKlWyXLWzuEupMhedHxPLM4I=;
        b=ZFR7WXAJpO6xikfbQnyaz4HBl9CSM5PhdFfUa1IhzVoR2UW3hMt8Xgwgzc5BFayI2S
         cUXt6o0NKBrdSeKOZ1j1mpBDKYI0DTb3WKZ3cJZY/H8VWAjymYAsk2ziN2SXJzZuY6AQ
         fDsNvhIDBhl8sZounmG3rQ2xjaRC5h5KmZtu/kvcyZGEfewsh3beTUZTw4Q3Drzxoln2
         xxwJLTSLjpLYOTd9sQt4eKG9FBeWn6bWbISIknWXrmJulbV5oZQsI0H4vq4WIY/70RyH
         dCYFfY5h3CJ6qvZtxsa7A1RpCc0HIOUkf2mT8io5KIUKYt50XtTXlzHuEvbZVLfaymF/
         x4Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781865145; x=1782469945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yWdatNxPt/OSZnGzSt5RKlWyXLWzuEupMhedHxPLM4I=;
        b=WjTLXvOaLwk5vfznXeycXAdY8O29824LPqSGYJgKG2zsyimdiMrFFih0aD13fWLOai
         6rB3y+ZLJpy71K2yMFa6XBV9yScUCtUapRb4IOphg8BEO4iw8iRufY2QxJpgnZPji6yz
         LR3CRpcPPh7OWm+GzZ7uV/4lfkBF6cKLIvxF34s7132opKvuWaUSO7PLEPi+XehWYFeE
         BnO990CiDgrDfeVLWiiN5rA/4YpSuKl5Jjt6LivDXRpl2fOGF9Qi5VbsRpR5hucAt2y/
         b5G8rTe9/vKtqSZEM9wZWsu/UePPpKnuBhrl5bbMpxjyim+RnTAVxthLnGEbQ1T8o5qV
         geOQ==
X-Gm-Message-State: AOJu0Yzaj6X99Q7oSc0+SvAQMsKiV4afBEppm71y8WNaIYllcZNsMHE1
	qDrGJB3FYWv+eV5dR/S/5QV9rxYktYhgG86hSbe6jAr3BX0uWnifjHQ4
X-Gm-Gg: AfdE7cnjBnYZR+4xfToKa9d2Sa20U8fICcsJWcOzoNiysd0SQ9z1mF0kqXs7NiqnmzD
	b/UasVxUiaKT5GiAmOZEMHnu+pRB3mtswvpgQ73RzVGn6tvhGSvvu+4Ay3MlA5XPqtZ8d9BDlG0
	bI9OOVQE+NaVY+tLGYXXwqSb4aqxedoZeLSBmXA6SOoO6FlU+o8Jz4z8pYA7DmH/jXr/05tdKUe
	nerpol7EhOQ0nSIfbCPJSnRanupMd9+hAhmkzN8kGTmLtTcmFaIXPDf74fvyAXO+1UaPDVbKGQc
	BNzYt2J1ffizgvcoSy2H5X+u1gU4XRzCwCySE4H7xkLqAWJkf1AY4TK0BV6q1MI0wVNo2UraGIN
	RH2n9PhCmKxaXvchyWBB9Sig0Z0L7y9InhtoH9YLUXcakdXl+/JaAts6Gr+1+74CDQ1ZOcIbtJu
	N3BbNVpbi6S+jNG+KIFNfK+L3D0c41oCkkRA==
X-Received: by 2002:a17:907:9302:b0:c07:5319:4c32 with SMTP id a640c23a62f3a-c097ae487b4mr145500666b.8.1781865144713;
        Fri, 19 Jun 2026 03:32:24 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0a8490cd59sm76702466b.16.2026.06.19.03.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 03:32:24 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] hwmon: emc1403: Convert to use OF bindings and add regulator support
Date: Fri, 19 Jun 2026 13:31:50 +0300
Message-ID: <20260619103153.216444-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15218-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[suse.com,roeck-us.net,kernel.org,gmail.com];
	FORGED_SENDER(0.00)[clamor95@gmail.com,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jdelvare@suse.com,m:linux@roeck-us.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:clamor95@gmail.com,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6293F6A53B7

Document, add OF and regulator support to EMC14XX thermal sensor family.

Schema file was separated from LM90 since according to Guenter Roeck[1]
these sensors are incompatible with LM90. Proposed schema has basic
hardware description. All registers Guenter Roeck mentioned may be added
later on, when/if driver would need to work with them. As for now driver
successfully works as is.

[1] https://lore.kernel.org/lkml/a0c5c1e8-9a36-4835-a5d9-7bafda79c36f@roeck-us.net/

---
Changes in v2:
- schema separated into a dedicated file
- dropped chip id check
- fixed match data casting
- adjusted regulator name
---

Jonas Schwöbel (1):
  hwmon: (emc1403) Convert to use OF bindings

Svyatoslav Ryhel (2):
  dt-bindings: hwmon: Document SMSC EMC1402/1403/1404/1428
  hwmon: (emc1403) Add regulator support

 .../bindings/hwmon/smsc,emc1403.yaml          | 191 ++++++++++++++++++
 drivers/hwmon/emc1403.c                       |  23 ++-
 2 files changed, 212 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/smsc,emc1403.yaml

-- 
2.53.0


