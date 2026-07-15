Return-Path: <linux-hwmon+bounces-15916-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id L0ScCslPV2pGJAEAu9opvQ
	(envelope-from <linux-hwmon+bounces-15916-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 15 Jul 2026 11:15:53 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 792EF75C553
	for <lists+linux-hwmon@lfdr.de>; Wed, 15 Jul 2026 11:15:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=izir0+MK;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15916-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15916-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E7C83127D41
	for <lists+linux-hwmon@lfdr.de>; Wed, 15 Jul 2026 09:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C501A3EFFB4;
	Wed, 15 Jul 2026 09:09:21 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0CBA3ED12B;
	Wed, 15 Jul 2026 09:09:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784106561; cv=none; b=oAShU8jZrBiYO6D7CQ5eeYHibrWNNkGYYXm29AzZPIUH8ZzDqbQq022ojtXtaWAZYNKgeoZZh3HmunH/dul2zjpjubGy1YxhtMI19T4CwPQ57YztksVjMESfwVkkMOC26yFgpPfO/FlV9jqoYrd8yqvKue0uipUh9cbpdGVwLSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784106561; c=relaxed/simple;
	bh=vC3o2yDg4cPfi+aCF/o5s/JFel3QNjfYZLOecDVvGmY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eTmiX8AMiM5HbITMYIZ+Muv+WbbNWKZBaHpZcO1fZvDjXRoztLwHMYME8KBs8w0MPFIN7szKtUZgBL0oe49XbOIg40fXtLiXRKJdORpgY069SH9dqacT9NIeaE1gQC9/1xJRtW0r7Cqpd5WTKnaGHzwBQMDpUykLHPw3g8poXeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=izir0+MK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3944BC2BCB9;
	Wed, 15 Jul 2026 09:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784106561;
	bh=vC3o2yDg4cPfi+aCF/o5s/JFel3QNjfYZLOecDVvGmY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=izir0+MKBhk7cdc+yvowepsEnazWTlM13Dbh2L9tDG5/rNyybBnxFV7bn1scSL/UO
	 k44chRYWCCkGkuNPwJnt7l+Q+qQBpoGqqbZOVLThLKQAS7xX28dDSkgOtRK/SSeYjf
	 kIxuaRipmU+By1IsRP6TU0fHa9YuyF/phCAxZ0dSn5f6f7Idu5gliO7gnnulUKkMSy
	 xpaOpwApdkqmkOMgvQ9HdNquLUiylL7N01kHpFVf/Jix5fszjS+UdYgm7TFwZ16Man
	 lUI/Y0zSYVkAVOFoU0z0G1eOLigS+f0MGUj+LRY93dGZpmpQjDWWCMkeXykLW69zev
	 IruXOQNU/ur7w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25EECC44508;
	Wed, 15 Jul 2026 09:09:21 +0000 (UTC)
From: Andy Chung via B4 Relay <devnull+Andy.Chung.amd.com@kernel.org>
Subject: [PATCH v2 0/4] hwmon: Add Kandou KB9002 PCIe retimer driver
Date: Wed, 15 Jul 2026 17:08:34 +0800
Message-Id: <20260715-kb9002-upstream-v2-0-2fd390383da5@amd.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABJOV2oC/2WNyw6CMBBFf4XM2pppq6Wy8j8MC2gHqYZHWmg0h
 H+XYly5PMm55y4QyDsKUGQLeIouuKHfQBwyMG3V34k5uzEIFApzLtmzviAKNo9h8lR1DJVRWpH
 MtZSwrUZPjXvtxVv55TDXDzJTyiSjdWEa/Hu/jDx5v/rprx45Q6YbKxqsuTxbfa06ezRDB+W6r
 h9s2LZcvgAAAA==
X-Change-ID: 20260713-kb9002-upstream-06c686e37833
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Chung <andy.chung@amd.com>, 
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Andy Chung <Andy.Chung@amd.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784106525; l=2142;
 i=Andy.Chung@amd.com; s=20260327; h=from:subject:message-id;
 bh=vC3o2yDg4cPfi+aCF/o5s/JFel3QNjfYZLOecDVvGmY=;
 b=bNmQvG+9i9OnCw94zCgThjTPu/vZW6Nl5GOCTN0j1YUeLcJ7GWgZjf+8QLM5sq57IAeGs5cxi
 1Dbvqzi5eA3DlkeJfEMo2vyvodULTlY6Dwnb3sa7mjqluuGiyWYVRmg
X-Developer-Key: i=Andy.Chung@amd.com; a=ed25519;
 pk=X2gaHRnhU2q5hvMjkC6xmIcC03vKNvHY9CQRdsj9ecM=
X-Endpoint-Received: by B4 Relay for Andy.Chung@amd.com/20260327 with
 auth_id=696
X-Original-From: Andy Chung <Andy.Chung@amd.com>
Reply-To: Andy.Chung@amd.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15916-lists,linux-hwmon=lfdr.de,Andy.Chung.amd.com];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andy.chung@amd.com,m:linux@roeck-us.net,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-doc@vger.kernel.org,m:Andy.Chung@amd.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-hwmon@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[Andy.Chung@amd.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-hwmon@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,amd.com:mid,amd.com:email,amd.com:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 792EF75C553

The Kandou KB9002 is an 8-lane PCIe 5.0 retimer with an integrated
microcontroller that exposes an SMBus 3.0 target (with mandatory PEC)
on its sideband interface. Its firmware aggregates per-lane die
temperatures and publishes the maximum through a register window.

This series adds a hwmon driver for it. The driver reports the
aggregated maximum die temperature as temp1_input, and exposes the
running firmware version and boot status under debugfs.

The series is organised as:

  1/4  add the "kandou" vendor prefix
  2/4  device tree binding for the retimer
  3/4  the driver, Kconfig/Makefile and MAINTAINERS entry
  4/4  hwmon documentation

Signed-off-by: Andy Chung <Andy.Chung@amd.com>
---
Changes in v2:
- Drop the unconditional I2C_FUNC_I2C requirement at probe; require raw
  I2C only in the host-interface switch path, so the driver loads on
  SMBus-only adapters when the chip is already strapped to SMBus.
- kb9002_read_revid(): return immediately on a hard I2C read error
  instead of retrying the FIFO drain, avoiding needless bus traffic when
  the device is absent.
- Link to v1: https://lore.kernel.org/all/20260714-kb9002-upstream-v1-0-8fd2f0b135d8@amd.com

---
Andy Chung (4):
      dt-bindings: Add vendor prefix for Kandou
      dt-bindings: hwmon: Add Kandou KB9002
      hwmon: (kb9002) Add driver for Kandou KB9002 retimer
      hwmon: (kb9002) Add documentation

 .../devicetree/bindings/hwmon/kandou,kb9002.yaml   |  45 ++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 Documentation/hwmon/index.rst                      |   1 +
 Documentation/hwmon/kb9002.rst                     |  65 +++
 MAINTAINERS                                        |   8 +
 drivers/hwmon/Kconfig                              |  11 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/kb9002.c                             | 479 +++++++++++++++++++++
 8 files changed, 612 insertions(+)
---
base-commit: ca078d004cf58137bcf8cb24a8b271397431ba58
change-id: 20260713-kb9002-upstream-06c686e37833

Best regards,
--  
Andy Chung <Andy.Chung@amd.com>



