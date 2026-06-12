Return-Path: <linux-hwmon+bounces-15065-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1c+ZGS53K2pu+AMAu9opvQ
	(envelope-from <linux-hwmon+bounces-15065-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 12 Jun 2026 05:04:14 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EC04F6765D4
	for <lists+linux-hwmon@lfdr.de>; Fri, 12 Jun 2026 05:04:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=163.com header.s=s110527 header.b=U2cP4ZKY;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15065-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15065-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=163.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6DEBE30598E0
	for <lists+linux-hwmon@lfdr.de>; Fri, 12 Jun 2026 03:04:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEC9D2F8EA2;
	Fri, 12 Jun 2026 03:04:06 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448A5318ED2;
	Fri, 12 Jun 2026 03:04:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781233446; cv=none; b=RDo+yJ/tWcib+MPtxPnmudtaXjRpYGU3VTbGPFFl7kcfxyKUoWOpoXzPNd3e52JOQVrejwR1luk/6ACsLTDxnG/cNpWdGdR5EHdlVkMiALiCuZmrWOUGVV2yOfPdRMMgb9jXuHqHe4frwcPVLOx5kz389UeEzhWMmHtYPkliqdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781233446; c=relaxed/simple;
	bh=QvmzvfcZpXNesVZ8euDzun5Ygw0bwxsp3g2oZnSi1DI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ck2nXMer3cdPg8FnYsrLirhFRjHpAkJWCCF8YdPoGe/qrO3uaYczLJqKeiuTxZVDy+fm4eC6csuS3EKwdo/9UzfFlTRjbAVSjZAmdXjiNkBsO0RahQ5qsqRxw9pZUP5cHq4J0T1bGFUOKWVYnbc3pPKhX+EZmnPhOrH8SdlpYcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=U2cP4ZKY; arc=none smtp.client-ip=117.135.210.3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=IP
	xYOIMZfD9LwzWLMHlqZ7o/KFF9GDcrJNe/Q38rD1o=; b=U2cP4ZKY55hnEf+F48
	N7i7/c2FK2h4QHqRCMqi86S4Pc1y44xZmgueZGLIHbZiSipZgU1xR6vlIzp6CAoA
	EF5P/MlQXJlPCo6DJpXWbkF09L8qgWxeWorQXD/2pe4DKtw0bvnBUTkLz4rAVjvV
	aIIeT6bUvmc8MEK8KrhvFWalU=
Received: from ZM.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDHAqHqditqPP4wDA--.45071S2;
	Fri, 12 Jun 2026 11:03:07 +0800 (CST)
From: Ziming Zhu <zmzhu0630@163.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Ziming Zhu <ziming.zhu@silergycorp.com>
Subject: [PATCH v4 0/3] Add Silergy SQ24860 support
Date: Fri, 12 Jun 2026 11:03:01 +0800
Message-Id: <20260612030304.5165-1-zmzhu0630@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDHAqHqditqPP4wDA--.45071S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw4kAw1fWFWrtF48XF43Wrg_yoW8CFy5pa
	95ZrZ8tryDJr1IqrZ3t3W8XFWFvr18Xw4jkFy7trnavFykZF9YvrW3Krs8uF9rG3yrCF47
	ZF95Kr1v93Z7AFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UHVb9UUUUU=
X-CM-SenderInfo: x2p2x3aqwtiqqrwthudrp/xtbC6Aw+N2orduw0QQAA3D
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-15065-lists,linux-hwmon=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[zmzhu0630@163.com,linux-hwmon@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@roeck-us.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:ziming.zhu@silergycorp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[163.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zmzhu0630@163.com,linux-hwmon@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[163.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,silergycorp.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EC04F6765D4

From: Ziming Zhu <ziming.zhu@silergycorp.com>

Changes in v4:
- dt-bindings: Collected Reviewed-by tag from Conor Dooley.
- hwmon: pmbus: sq24860: Fixed signedness issue on PMBus limits where
  negative user inputs were silently parsed as large positive unsigned 
  values. Now casting limit values to s16 to properly intercept negative
  bounds.
- hwmon: pmbus: sq24860: Fixed PMBUS_IIN_OC_FAULT_LIMIT handling to 
  silently clamp out-of-range lower limits to the nearest supported
  hardware value (SQ24860_IIN_OCF_OFF) instead of returning -EINVAL, 
  complying with hwmon ABI conventions.
- Fixed function parenthesis alignments reported by checkpatch.

Changes in v3:
- fix remaining checkpatch issues in the SQ24860 driver
- use C comments consistently in the driver
- drop unused header files
- make GIMON a constant in the gain calculation helper
- use proper 64-bit division for the calibration gain calculation
- return -EINVAL when the calculated gain does not fit
- reject PMBUS_IIN_OC_FAULT_LIMIT values outside the hardware range
- treat malformed silergy,rimon-micro-ohms as an error
- sort sq24860 correctly in Documentation/hwmon/index.rst

Ziming Zhu (3):
  dt-bindings: hwmon: pmbus: Add bindings for Silergy SQ24860
  hwmon: pmbus: Add support for Silergy SQ24860
  hwmon: Add documentation for SQ24860

 .../bindings/hwmon/pmbus/silergy,sq24860.yaml |  74 +++
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/sq24860.rst               |  96 ++++
 drivers/hwmon/pmbus/Kconfig                   |  19 +
 drivers/hwmon/pmbus/Makefile                  |   1 +
 drivers/hwmon/pmbus/sq24860.c                 | 430 ++++++++++++++++++
 6 files changed, 621 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/silergy,sq24860.yaml
 create mode 100644 Documentation/hwmon/sq24860.rst
 create mode 100644 drivers/hwmon/pmbus/sq24860.c

-- 
2.25.1


