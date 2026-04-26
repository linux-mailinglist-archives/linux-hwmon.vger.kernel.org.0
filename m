Return-Path: <linux-hwmon+bounces-13526-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +L+zILRW7WmziAAAu9opvQ
	(envelope-from <linux-hwmon+bounces-13526-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sun, 26 Apr 2026 02:05:08 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A984686AB
	for <lists+linux-hwmon@lfdr.de>; Sun, 26 Apr 2026 02:05:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3429C3041795
	for <lists+linux-hwmon@lfdr.de>; Sun, 26 Apr 2026 00:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 046DB2A1CF;
	Sun, 26 Apr 2026 00:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AMYBlI+K"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C952556E;
	Sun, 26 Apr 2026 00:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777161801; cv=none; b=Y9GZLGeZMUDotByYIqLvsRtfbOFlG4PcNOtJw0h1WRCKY/jZdkm5KTNy+ARzFWRFVl7Je53lIfuXCDytUfPdj35bLpT0zFQRRaX77ZOmH2tqzed+y5wEmjFZvsqrskaMl+Dc9nQXZuUVzCxDAaepEgyJokA5FHDAklPa0V805EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777161801; c=relaxed/simple;
	bh=5fGj6iW05hAnyDjVzh7Hsg1J/Xop4UKdM9625VU1SGA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GLexfy55POdFyVe0U5bWWZ71Lhm+uDGn92VdwKlCHm/gUhvFC8WScx2JmPpk3kVAq3y9mu0tD1dQutfud7Oz6AzZkYAoQGGYVLa0ZV2pQRQjwfAsXNdHdmDXwDZH9+qKeSj0pZSwwSL+YibJpXn/1shpb8fc6NPrny7oW3onRhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AMYBlI+K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0205C2BCB0;
	Sun, 26 Apr 2026 00:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777161801;
	bh=5fGj6iW05hAnyDjVzh7Hsg1J/Xop4UKdM9625VU1SGA=;
	h=From:To:Cc:Subject:Date:From;
	b=AMYBlI+KOJvCWR69weQNstISnUfZP26ZfvrRZLZMtKGUbOrcNPYNVqSJDrcYMp8gj
	 +1LlMJRdrZMpPZ4XdI7qOIBcilZt0GPBAMOOUgZ570ZEEm1iZcCWj3S2gGvY9Y8vgG
	 633Yx6EF5A41sBcmiBdTey78SI10siN1eI/60hTgw6iA2rb5K3gYn1Kz6MTI/ylPUr
	 pdrdYANMEOJVXBgXr+6/TGermqVR7QupwZqsE+Txb07BBM+5oqC9RwRrE+rbffKYuT
	 47zU5KY26dovWu3dABIESfqE3OdCOrI7ZTsSv+FVUzo8gha1maAGVcvVFvYiDOJP3C
	 UQq1hh8/fPgIQ==
From: Sasha Levin <sashal@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: Remove stale CONFIG_SENSORS_SBRMI Makefile reference
Date: Sat, 25 Apr 2026 20:03:19 -0400
Message-ID: <20260426000319.55908-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D3A984686AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13526-lists,linux-hwmon=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

kconfiglint reports:

  X001: CONFIG_SENSORS_SBRMI referenced in Makefile but not defined
        in any Kconfig

The SB-RMI hardware monitoring driver was originally introduced in
commit 5a0f50d110b3 ("hwmon: Add support for SB-RMI power module") with
both a Kconfig entry (CONFIG_SENSORS_SBRMI) and a Makefile line
(obj-$(CONFIG_SENSORS_SBRMI) += sbrmi.o) in drivers/hwmon/.

Commit e156586764050 ("hwmon/misc: amd-sbi: Move core sbrmi from hwmon to
misc")
moved the driver to drivers/misc/amd-sbi/ to support additional
functionality beyond hardware monitoring. That commit correctly removed the
Kconfig entry from drivers/hwmon/Kconfig, moved the source file
drivers/hwmon/sbrmi.c to drivers/misc/amd-sbi/sbrmi.c, and created new
Kconfig/Makefile entries in drivers/misc/amd-sbi/ with a renamed symbol
(CONFIG_AMD_SBRMI_I2C).

However, the Makefile line in drivers/hwmon/Makefile was not removed in
that commit. The orphaned line references a CONFIG symbol that no longer
exists and a source file that is no longer present, so it has no effect
on the build — but it is dead code that should be cleaned up.

Remove the stale Makefile reference.

Assisted-by: Claude:claude-opus-4-6 kconfiglint
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hwmon/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 4788996aa1374..982ee2c6f9deb 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -201,7 +201,6 @@ obj-$(CONFIG_SENSORS_PWM_FAN)	+= pwm-fan.o
 obj-$(CONFIG_SENSORS_QNAP_MCU_HWMON)	+= qnap-mcu-hwmon.o
 obj-$(CONFIG_SENSORS_RASPBERRYPI_HWMON)	+= raspberrypi-hwmon.o
 obj-$(CONFIG_SENSORS_SBTSI)	+= sbtsi_temp.o
-obj-$(CONFIG_SENSORS_SBRMI)	+= sbrmi.o
 obj-$(CONFIG_SENSORS_SCH56XX_COMMON)+= sch56xx-common.o
 obj-$(CONFIG_SENSORS_SCH5627)	+= sch5627.o
 obj-$(CONFIG_SENSORS_SCH5636)	+= sch5636.o
-- 
2.53.0


