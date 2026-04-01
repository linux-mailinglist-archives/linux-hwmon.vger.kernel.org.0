Return-Path: <linux-hwmon+bounces-12997-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qE5AI0BKzWn4bQYAu9opvQ
	(envelope-from <linux-hwmon+bounces-12997-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 01 Apr 2026 18:39:28 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C1337E06E
	for <lists+linux-hwmon@lfdr.de>; Wed, 01 Apr 2026 18:39:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0388830A3794
	for <lists+linux-hwmon@lfdr.de>; Wed,  1 Apr 2026 16:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D476477E2E;
	Wed,  1 Apr 2026 16:25:47 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03BB24611EE
	for <linux-hwmon@vger.kernel.org>; Wed,  1 Apr 2026 16:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775060746; cv=none; b=KOUqNzW50mjD6FV3jZ1mJNbhlObEyly+SB0frIX1NBzcYjP8/n+tRrYXwDvVF07v6Q0aWyD2gyu5H7GAAJdCDbx4kWo2f7mDA1qUXNv63xKJnzH0TqSGZmo9rdbZi5xch+pSDVUkGOXEwleMIfP78GRIJIqDVY3JkOFppveRijs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775060746; c=relaxed/simple;
	bh=Jpv6RTniVBvt70szPgYAv0JGed4nVUgLqx8NINTIpxI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GYq+Pdvh+YsrPJhb1Re75NB5a07PWkuwYbdJv40xgprZUBT87NiWr96l2MDma1MBoeQ6LkeaOQ2TbCZphPVNljnsZl5uqv9Vw5Ht/U0+wFhi7u0VNV63ol35lYNUPSIEURfCNGMfRL88nXfRKgOiwu9ewR1crhOZQErn2Wc8qDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1w7yNV-00088f-RJ; Wed, 01 Apr 2026 18:25:13 +0200
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac] helo=dude04)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1w7yNV-003EjC-0X;
	Wed, 01 Apr 2026 18:25:13 +0200
Received: from ore by dude04 with local (Exim 4.98.2)
	(envelope-from <ore@pengutronix.de>)
	id 1w7yNV-000000079qc-0OLq;
	Wed, 01 Apr 2026 18:25:13 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Peter Rosin <peda@axentia.se>,
	Linus Walleij <linusw@kernel.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	kernel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	David Jander <david@protonic.nl>
Subject: [PATCH v10 0/6] mfd: Add support for NXP MC33978/MC34978 MSDI
Date: Wed,  1 Apr 2026 18:25:04 +0200
Message-ID: <20260401162510.1706073-1-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-hwmon@vger.kernel.org
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-12997-lists,linux-hwmon=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_NEQ_ENVFROM(0.00)[o.rempel@pengutronix.de,linux-hwmon@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.983];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 16C1337E06E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

changes v7:
- drop gpiolib irq fix and make pinctrl more robust against NULL point
  dereference.

This series adds support for the NXP MC33978/MC34978 Multiple Switch Detection
Interface (MSDI) via the MFD framework.

Architecture overview:
* mfd: Core driver handling 2-frame pipelined SPI, regulator sequencing, and
  linear irq_domain. Harvests status bits from SPI MISO MSB.
* pinctrl: Exposes 22 physical switch inputs as standard GPIOs. Proxies IRQs to
  the MFD domain.
* hwmon: Exposes thermal limits, VBATP/VDDQ voltage boundaries, and dynamic
  fault alarms.
* mux: Controls the 24-to-1 AMUX routing analog signals (switch voltages,
  temperature, VBATP) to an external ADC.

Initial pinctrl implementation by David Jander, reworked into this MFD
architecture.

Best regards,
Oleksij

David Jander (1):
  pinctrl: add NXP MC33978/MC34978 pinctrl driver

Oleksij Rempel (5):
  dt-bindings: pinctrl: add NXP MC33978/MC34978 MSDI
  mfd: add NXP MC33978/MC34978 core driver
  pinctrl: core: Make pin group callbacks optional for pin-only drivers
  hwmon: add NXP MC33978/MC34978 driver
  mux: add NXP MC33978/MC34978 AMUX driver

 .../bindings/pinctrl/nxp,mc33978.yaml         |  158 +++
 drivers/hwmon/Kconfig                         |   10 +
 drivers/hwmon/Makefile                        |    1 +
 drivers/hwmon/mc33978-hwmon.c                 |  549 +++++++++
 drivers/mfd/Kconfig                           |   15 +
 drivers/mfd/Makefile                          |    2 +
 drivers/mfd/mc33978.c                         | 1079 +++++++++++++++++
 drivers/mux/Kconfig                           |   14 +
 drivers/mux/Makefile                          |    2 +
 drivers/mux/mc33978-mux.c                     |  141 +++
 drivers/pinctrl/Kconfig                       |   16 +
 drivers/pinctrl/Makefile                      |    1 +
 drivers/pinctrl/core.c                        |   41 +-
 drivers/pinctrl/pinconf.c                     |    9 +-
 drivers/pinctrl/pinctrl-mc33978.c             | 1008 +++++++++++++++
 include/linux/mfd/mc33978.h                   |   95 ++
 16 files changed, 3134 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nxp,mc33978.yaml
 create mode 100644 drivers/hwmon/mc33978-hwmon.c
 create mode 100644 drivers/mfd/mc33978.c
 create mode 100644 drivers/mux/mc33978-mux.c
 create mode 100644 drivers/pinctrl/pinctrl-mc33978.c
 create mode 100644 include/linux/mfd/mc33978.h

--
2.47.3


