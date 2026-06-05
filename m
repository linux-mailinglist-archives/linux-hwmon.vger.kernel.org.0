Return-Path: <linux-hwmon+bounces-14716-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0V9aBxwvImpaTgEAu9opvQ
	(envelope-from <linux-hwmon+bounces-14716-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 05 Jun 2026 04:06:20 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8273264497A
	for <lists+linux-hwmon@lfdr.de>; Fri, 05 Jun 2026 04:06:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=163.com header.s=s110527 header.b=IzKN0iKy;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-14716-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-14716-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=163.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6A90A3039C73
	for <lists+linux-hwmon@lfdr.de>; Fri,  5 Jun 2026 02:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17C993E00BC;
	Fri,  5 Jun 2026 02:05:56 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA2737DEAF;
	Fri,  5 Jun 2026 02:05:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780625155; cv=none; b=Jl9fGFmdOYZSFkjuqlu3c+6XU0h9f1dAacoBWQVNrnhYFMy6O66FEG84bVqCxdxYPYJT48xcqg0Ziec8QNl/7Wfh82IWXfCOTRkZSlidbdtvvgmwzoSsyFBMlINLzIkZ/PzpTfE3NgYh2vCvglQqpY+rWrOAkPcgRab3eDd4g1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780625155; c=relaxed/simple;
	bh=jWMv/OVg0XBOoo5m2/ElvfSL0l48pCnTg9x0hzAzgaE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UbzDrKoue9vuXhxivarxpTCZv9aVwfgGCnJUiB+YT92L/naPkdxd4E02U0qRyQGCtD+aoxtReTT6JDH4LelNY0aAtcxxditmPAOu0GOT1XEYEXyjC/xuuni5OC6iPFO1LdQGLKfAHKFHfatGESeOrwL0pQIpBn0kV4YG+OTulJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=IzKN0iKy; arc=none smtp.client-ip=220.197.31.3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=93
	j7WYO5scoCiDafPFE27aT4pcg41KjcRlyGVBbLkYU=; b=IzKN0iKyJfsU7z/6Wa
	ap5hLO3gnjkaoEQIjXUiBgAHUsspCxJzAHLqXVSD2BYfBiQhdEptdhNuxOalbRMm
	GOwYIGuZNliFJGk0+6i///JUksdQjw5AL+vaV+f8A6u9uu4hAvhe+5iq0ocpPzNi
	aOFdF+YAQ5x10zZ+ZzH1nCgaA=
Received: from ZM.localdomain (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wAXVW_FLiJq4ffOBQ--.62174S2;
	Fri, 05 Jun 2026 10:05:00 +0800 (CST)
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
Subject: [PATCH 0/3] *** Add support for Silergy SQ24860 ***
Date: Fri,  5 Jun 2026 10:04:47 +0800
Message-Id: <20260605020450.89638-1-zmzhu0630@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAXVW_FLiJq4ffOBQ--.62174S2
X-Coremail-Antispam: 1Uf129KBjvJXoWrZrW5AFWUJw17XFy7JF1rCrg_yoW8Jryxpa
	ykZrZIkw1DJr17X393tF18WF90yry8Xa1YkF9rKw1S9Fn5ZF929ry3Krn0yw1DAr4fGFy7
	Zr93Kr4v9w17ArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UHmh7UUUUU=
X-CM-SenderInfo: x2p2x3aqwtiqqrwthudrp/xtbCvwzh2moiLsy6kwAA3L
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-14716-lists,linux-hwmon=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,silergycorp.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8273264497A

From: Ziming Zhu <ziming.zhu@silergycorp.com>

Add support for the Silergy SQ24860 eFuse.

SQ24860 is a PMBus device that reports input voltage, output voltage,
auxiliary voltage, input current, input power, and temperature
telemetry.
It also supports average and peak history reporting.

The series adds the devicetree binding, PMBus hwmon driver, and hwmon
documentation.

Tested on a board with SQ24860 at I2C address 0x40. Verified voltage,
current, power, temperature, samples, and history reset hwmon
attributes.

Ziming Zhu (3):
  dt-bindings: hwmon: pmbus: Add bindings for Silergy SQ24860
  hwmon: pmbus: Add support for Silergy SQ24860
  hwmon: Add documentation for SQ24860

 .../bindings/hwmon/pmbus/silergy,sq24860.yaml |  74 +++
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/sq24860.rst               |  96 ++++
 drivers/hwmon/pmbus/Kconfig                   |  19 +
 drivers/hwmon/pmbus/Makefile                  |   1 +
 drivers/hwmon/pmbus/sq24860.c                 | 423 ++++++++++++++++++
 6 files changed, 614 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/silergy,sq24860.yaml
 create mode 100644 Documentation/hwmon/sq24860.rst
 create mode 100644 drivers/hwmon/pmbus/sq24860.c

-- 
2.25.1


