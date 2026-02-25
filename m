Return-Path: <linux-hwmon+bounces-11896-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPAIClG+nmnYXAQAu9opvQ
	(envelope-from <linux-hwmon+bounces-11896-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 25 Feb 2026 10:18:09 +0100
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C233A194C5F
	for <lists+linux-hwmon@lfdr.de>; Wed, 25 Feb 2026 10:18:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D085B3040FE6
	for <lists+linux-hwmon@lfdr.de>; Wed, 25 Feb 2026 09:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1BA23876AE;
	Wed, 25 Feb 2026 09:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="bMH2MptT"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A553876C3;
	Wed, 25 Feb 2026 09:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772011022; cv=none; b=h+Ap2DYiVhXoSQ+WKWKv+giHbZSwRuiciIIgmKOBXSsVnO6Pm67rLmM8Y9eWM47HMwUDaWRRufrDlOXW2bYDpLDO9YVPUhI97KfukBBKcYD7rE4AJ1N+rgqM6OkHhnl05rCMPjy7KRlVZARZ8U0V1SumviS+DyEJOorMacTyXvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772011022; c=relaxed/simple;
	bh=sNRZTgcpPZsCz8cbvJZ1jYH553XMDNPh5UO71mwzKGQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Kqoqv3W1nb0t+rBG5FXpk211Ig3XNgx3JvH/NcSd/zPOjcuGKUNXTSfx5HP8PZpw5K8MfcPyoSZ6xGhh+OAGxZZGTLQM4FLcZseE0DWOETsK7llCbu9cftTRSLtJlwdEbO0fgj9aK0h7RVXg1g5p5yzOUWyd98PSsq0BLnfcxQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=bMH2MptT; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=n1
	lgB1V0njyOaXZ1h1qR2iYhAyIhn7WxWnI2uSp8gco=; b=bMH2MptT8hf4knr8gv
	hDrllPJaILUrE+4MFTGTZ1Spl4MqgNcHGqoeWNGJMIZQiaP7CZp6+6hQM9iMYzrP
	RPHiMRw6P+xEefS1Tui7GvhB3Ahbl3U1N/4ZeBz94wQrkKs5DIzTn5LPEWGIKW74
	PLYySTmynFrqPmBatnj0cNxmk=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with UTF8SMTPA id M88vCgD3z4_vuJ5pMJ2HAQ--.42176S2;
	Wed, 25 Feb 2026 16:55:12 +0800 (CST)
From: wenswang@yeah.net
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@roeck-us.net,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Wensheng Wang <wenswang@yeah.net>
Subject: [PATCH 0/2] hwmon: Add support for MPS mp2845 chip
Date: Wed, 25 Feb 2026 16:55:01 +0800
Message-Id: <20260225085501.164819-1-wenswang@yeah.net>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgD3z4_vuJ5pMJ2HAQ--.42176S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvj4RHrWFUUUUU
X-CM-SenderInfo: 5zhq24xdqjq5hhdkh0dhw/1tbiNBFsEWmeuPE+7wAA33
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[yeah.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[yeah.net:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,yeah.net];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-11896-lists,linux-hwmon=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[yeah.net];
	NEURAL_HAM(-0.00)[-0.995];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenswang@yeah.net,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[yeah.net:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,yeah.net:mid,yeah.net:dkim,yeah.net:email]
X-Rspamd-Queue-Id: C233A194C5F
X-Rspamd-Action: no action

From: Wensheng Wang <wenswang@yeah.net>

Add mp2845 driver in hwmon and add dt-bindings for it.

Wensheng Wang (2):
  dt-bindings: hwmon: Add MPS mp2845
  hwmon: add MP2845 driver

 .../devicetree/bindings/trivial-devices.yaml  |   2 +
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/mp2845.rst                | 143 +++++
 MAINTAINERS                                   |   7 +
 drivers/hwmon/Kconfig                         |  10 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/mp2845.c                        | 493 ++++++++++++++++++
 7 files changed, 657 insertions(+)
 create mode 100644 Documentation/hwmon/mp2845.rst
 create mode 100644 drivers/hwmon/mp2845.c

-- 
2.25.1


