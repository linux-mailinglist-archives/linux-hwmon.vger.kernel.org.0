Return-Path: <linux-hwmon+bounces-11887-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0M9rNRi7nmnwWwQAu9opvQ
	(envelope-from <linux-hwmon+bounces-11887-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 25 Feb 2026 10:04:24 +0100
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAA1194972
	for <lists+linux-hwmon@lfdr.de>; Wed, 25 Feb 2026 10:04:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 185943003708
	for <lists+linux-hwmon@lfdr.de>; Wed, 25 Feb 2026 09:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB262341076;
	Wed, 25 Feb 2026 09:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="KuFkn1YR"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D793033A6EC;
	Wed, 25 Feb 2026 09:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772010258; cv=none; b=HV4IxxeBJJxKlU4zroJpTm0txE9C50emo0zofPX83tR3RejUcjotqQAyJbUinntBnkjboDZ+lQqKzf5B7fQZBsQo+qhLzvM55bDZbsuFQ2f7EMXyTDaQMztakWdHxVZDd1ki4+y8Oq1tO7qg2lU2EdKYYUpGXfdDveuIemmaF3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772010258; c=relaxed/simple;
	bh=uI3D4tb6LNykmcjcCHPhaYA8M0HhXxi8TxDVwAaMtPE=;
	h=From:To:Cc:Subject:Date:Message-Id; b=StPLKYPoUu41U549HFjkBqJV/2l0I6jaiYG1WmNEpgtjQV+1XI4NgmKLkXoKp5aV6OrWZWEaSCsW9j05FsIBPPYlfaAyaxt2p/ygBBly/ljz6bBxerVlDCj1NC1Iw8kh8ZpGyVMuEM4fZOaGUfyjjfxKHSKEPN+OjEncuskMCTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=KuFkn1YR; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id; bh=+oUB46+C50gRbbn
	rkO9tBpvuPfP+IT0Ur06rF5x0cy8=; b=KuFkn1YRGgFeBy8BSntN+/oAZLWAonZ
	IwLs99GrWoBIp+JFxjmjvCHu1h9E9LYillBvUI4XzmPsNxyZ3MTE976rm//g+BhX
	bxpLv1qlJHs6/B9moIKe3uQRnorslS5hUB8VOP2KN0zx0ATT8CDJOGlOjLUnodZZ
	MwtspuFyHAgw=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3N4nlup5pilgzMg--.30498S2;
	Wed, 25 Feb 2026 17:03:34 +0800 (CST)
From: Wenliang Yan <wenliang202407@163.com>
To: linux@roeck-us.net,
	Jean Delvare <jdelvare@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Wenliang Yan <wenliang202407@163.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/8] hwmon: (ina3221) Various improvement and add support for SQ52210
Date: Wed, 25 Feb 2026 04:03:16 -0500
Message-Id: <20260225090324.112145-1-wenliang202407@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:_____wD3N4nlup5pilgzMg--.30498S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kw4fXrWDGF4fGF15uF1DGFg_yoW5JFyxp3
	yv9ry5Gwn8tr1xZ39Ikw4xZFyFg3y7JF43ur97G3y0vF4YvF1FvFWvgF15t3WDtr9rKF10
	qayIqFnI93ZrArDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JU-4SOUUUUU=
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/xtbC5wfpvWmeuucxCwAA3k
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[163.com,lwn.net,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-11887-lists,linux-hwmon=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[163.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenliang202407@163.com,linux-hwmon@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[163.com:+];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8AAA1194972
X-Rspamd-Action: no action

Make modifications according to the guidance provided in the reply.

1.Modify the variable naming in ina3221_config to provide clearer
definitions. has_current_reg and has_power_reg indicate whether
there are built-in current and power registers. has_alerts_add
indicates whether there are additional alert settings(PATCH 3,PATCH4).

2.Modify the newly added parameter descriptions in ina3221.rst and
add the corresponding parameter units(PATCH 5).

3.Adjust the content of PATCH 6, moving the modifications of
the alert_limit_write function to PATCH 7, and clarify the
function's purpose.

4.Modify the format conversion of the LIMIT register in the
read_value function.The read_value function reads the shifted
actual register value. Since the LIMIT register can store different
types of values, use comments to explain the difference between
power values and other values(PATCH 6).

5.Adjust the return value of the power attribute to
the default 'uW'(PATCH 7).

6.Rewrite the read/write functions for in and curr, correct the
unit conversion for current and voltage, and modify the conversion
function for the new alert source (SUL) with current values(PATCH 8).



---
v5: https://lore.kernel.org/linux-hwmon/20260119121446.17469-1-wenliang202407@163.com/
v4: https://lore.kernel.org/linux-hwmon/20260114081741.111340-1-wenliang202407@163.com/
v3: https://lore.kernel.org/linux-hwmon/20251120081921.39412-1-wenliang202407@163.com/
v2: https://lore.kernel.org/linux-hwmon/20251118125148.95603-1-wenliang202407@163.com/
v1: https://lore.kernel.org/linux-hwmon/20251111080546.32421-1-wenliang202407@163.com/


*** BLURB HERE ***

Wenliang Yan (8):
  dt-bindings: hwmon: ti,ina3221: Add SQ52210
  hwmon: (ina3221) Add support for SQ52210
  hwmon: (ina3221) Pre-calculate current and power LSB
  hwmon: (ina3221) Support alert configuration
  hwmon: (ina3221) Introduce power attribute and alert characteristics
  hwmon: (ina3221) Modify the 'ina3221_read_value' function
  hwmon: (ina3221) Support alert_limit_write function and write/read
    functions for 'power' attribute
  hwmon: (ina3221) Modify write/read functions for 'in' and 'curr'
    attribute

 .../devicetree/bindings/hwmon/ti,ina3221.yaml |  15 +-
 Documentation/hwmon/ina3221.rst               |  24 +
 drivers/hwmon/ina3221.c                       | 550 +++++++++++++++++-
 3 files changed, 573 insertions(+), 16 deletions(-)

-- 
2.17.1


