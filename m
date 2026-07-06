Return-Path: <linux-hwmon+bounces-15591-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dzcjBmq3S2pyZAEAu9opvQ
	(envelope-from <linux-hwmon+bounces-15591-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 06 Jul 2026 16:10:50 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2B4711C3B
	for <lists+linux-hwmon@lfdr.de>; Mon, 06 Jul 2026 16:10:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=QkSL1Ozs;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15591-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15591-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB9C73274450
	for <lists+linux-hwmon@lfdr.de>; Mon,  6 Jul 2026 12:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1D8142E000;
	Mon,  6 Jul 2026 12:35:58 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9262641F7FE;
	Mon,  6 Jul 2026 12:35:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341358; cv=none; b=GG0QNNvVOoHWpu3ZuCRR/F31H9fKo9wAwoYQuG0YdTSbjeM4NipU2MsmLNi8is945pN35n768/JSMLwSg9Tw4TZUGYxGR6rTlW8dlgGqrTYmSUD2rm8BEfdJWo1pzIJYEbvQmNhTyo6k60xsP7CzwBz1pQvSkvSLGkVq6Qp7iaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341358; c=relaxed/simple;
	bh=3Mrzl+4ph2DGeKXo/EWTckLV+PzCFfxT36PhGSvPUTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Mkhp65kw9yP7Q5tVEgJqZAXpZ0l7rZBOyCTGbILamNCe8OLX+cAJ3ipWtTx6tTySpTOmyxYBrr0Yh+7Tr6c0tKudgHWMeMHFSK8y6NJHXdY+Ag0f7QVVdqbpu8MVdZpFZZFYHsQRDLzZzJvFjhPmKOoYiWA5ROFopeWSBFkiHpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QkSL1Ozs; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7222F1F000E9;
	Mon,  6 Jul 2026 12:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783341354;
	bh=MwkYuxKmlP6lyr9tG4Uavf007E0GPRbp/kKzLwyHIR0=;
	h=From:To:Cc:Subject:Date;
	b=QkSL1OzszhCSlWjtI4wCVd17ZxhBka6gPnrZRAX6ZbttEHaeZ1CX8lKCENCeBDrJs
	 XZsEqL9Kcvt67zGmd5aaJJsBBJtI6qZAPj0l9JG+BzBVwSiITedTYg+Q7ISanhQR9B
	 L6b/MjlO7UPzV6H+IE+ImvnMwlJuheHB8qcE2f4qQE6xb2a2x9wl7pG9y7fKDd0p43
	 Cnapto9rCJFim6//okngYAsE7OnzUzmcAt7MkJLvIw4q/9MTM2vCnRYmD3TBFJ7t/9
	 Rh0o73FLXjjNKPCvinGTZ802TfSSzmF3awQJk/OlwFQ6jkZMfNEJ9euBeMxlma1DTs
	 PN7HyDKjZd/4Q==
From: "Rafael J. Wysocki" <rafael@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>, Linux ACPI <linux-acpi@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject:
 [PATCH v1] hwmon: (acpi_power_meter) Stop setting acpi_device_name/class()
Date: Mon, 06 Jul 2026 14:35:51 +0200
Message-ID: <2297496.irdbgypaU6@rafael.j.wysocki>
Organization: Linux Kernel Development - Intel
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	CTE_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@roeck-us.net,m:linux-hwmon@vger.kernel.org,m:andriy.shevchenko@linux.intel.com,m:hansg@kernel.org,m:linux-acpi@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[rafael@kernel.org,linux-hwmon@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-15591-lists,linux-hwmon=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rafael@kernel.org,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,rafael.j.wysocki:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4F2B4711C3B

From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>

The driver populates acpi_device_name() and acpi_device_class() that are
never read afterward, so make it stop doing that and drop the symbols
defined for this purpose.

Since ACPI_POWER_METER_CLASS is also used for generating ACPI netlink
events, use the "pwr_meter_resource" string literal directly instead of
it for that.

No intentional functional impact.

This will facilitate the removal of device_name and device_class from
struct acpi_device_pnp in the future.

Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 drivers/hwmon/acpi_power_meter.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/hwmon/acpi_power_meter.c b/drivers/hwmon/acpi_power_meter.c
index 0c9b9f4180fb..8a539e8d1334 100644
--- a/drivers/hwmon/acpi_power_meter.c
+++ b/drivers/hwmon/acpi_power_meter.c
@@ -21,8 +21,6 @@
 #include <linux/platform_device.h>
 
 #define ACPI_POWER_METER_NAME		"power_meter"
-#define ACPI_POWER_METER_DEVICE_NAME	"Power Meter"
-#define ACPI_POWER_METER_CLASS		"pwr_meter_resource"
 
 #define NUM_SENSORS			17
 
@@ -877,7 +875,7 @@ static void acpi_power_meter_notify(acpi_handle handle, u32 event, void *data)
 		break;
 	}
 
-	acpi_bus_generate_netlink_event(ACPI_POWER_METER_CLASS,
+	acpi_bus_generate_netlink_event("pwr_meter_resource",
 					dev_name(&resource->acpi_dev->dev),
 					event, 0);
 }
@@ -899,8 +897,6 @@ static int acpi_power_meter_probe(struct platform_device *pdev)
 	resource->sensors_valid = 0;
 	resource->acpi_dev = device;
 	mutex_init(&resource->lock);
-	strscpy(acpi_device_name(device), ACPI_POWER_METER_DEVICE_NAME);
-	strscpy(acpi_device_class(device), ACPI_POWER_METER_CLASS);
 
 	platform_set_drvdata(pdev, resource);
 
-- 
2.51.0





