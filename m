Return-Path: <linux-hwmon+bounces-13924-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCuNBh81AmocpAEAu9opvQ
	(envelope-from <linux-hwmon+bounces-13924-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 11 May 2026 21:59:27 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C06F5155BB
	for <lists+linux-hwmon@lfdr.de>; Mon, 11 May 2026 21:59:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 86D6B3007E39
	for <lists+linux-hwmon@lfdr.de>; Mon, 11 May 2026 19:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2F0737EFF2;
	Mon, 11 May 2026 19:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CykrfC3+"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDA030C360;
	Mon, 11 May 2026 19:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778529378; cv=none; b=TLMzxGXFB9u27SjP+gyE3sGArmM3QY8vTCVbX4vPm75qpIv96RU3zsGzildtcV8gIaw/lODjf4EGFra2dJpAIBkM4pjCkKTXWFZmlwTONviNd1tjQfpzWTHtu+RiF/U5VAyW8TAjo6vfcbcT+rNt6urxGQvVPVcmn1bX78jWsE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778529378; c=relaxed/simple;
	bh=93lVSHJd6NyfiSRTkX2eDf3XB5gzNVLnf/Bvh2fKnxY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fX9RFjxqp0n2nZRPhefgrNmD2UL1Y5YQ+2aC7LPjxazPWKjJRij7h7W+FMSuoVTFJsIAwRJ81PsNfit7IA1/OZShvJjUPNaez4pZf0vneqWAdCrdKoTSjjcvXaVLpYscirbTl7amIpcHx9Tr/b6wmsUG2u0FeURue6Mg6IVv9qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CykrfC3+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC5F7C2BCB0;
	Mon, 11 May 2026 19:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778529378;
	bh=93lVSHJd6NyfiSRTkX2eDf3XB5gzNVLnf/Bvh2fKnxY=;
	h=From:To:Cc:Subject:Date:From;
	b=CykrfC3+sRaCnDLwoKKSXf0giciFOW9XsZDEQ7nEGk2uiB74+m9pf0bx4Gl2pQNtQ
	 9xpUDDEvm2vx+tASC2JwJky/eqC9LvxHMWItcUeteMGKPnd1iGPSLyZPKck+6L+Oqp
	 P46vDJnQyKLLdLO4ZTaGDPGmMaXljw6om2sd/cs/r5j7aRG18w/+72sXMSMl622j7W
	 0losqq39mMpdwuKiPiEyrsQiijrYhslCenWuPjG+Hgt6/fQf2DhDDn6T66LflLrFvo
	 Z4FJFjXEFNkqU2DPKZP3LFkZ+jzCkVUX0inCeG4UujgupHGFSIsRYLmiA3yHU2aRN2
	 SjQGOG8EE0hsg==
From: "Rafael J. Wysocki" <rafael@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Linux ACPI <linux-acpi@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux PM <linux-pm@vger.kernel.org>, Luca Tettamanti <kronos.it@gmail.com>
Subject: [PATCH v1] hwmon: (asus_atk0110) Check ACPI_COMPANION() against NULL
Date: Mon, 11 May 2026 21:56:14 +0200
Message-ID: <2261594.irdbgypaU6@rafael.j.wysocki>
Organization: Linux Kernel Development
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 8C06F5155BB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	CTE_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-13924-lists,linux-hwmon=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rafael@kernel.org,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,rafael.j.wysocki:mid,intel.com:email]
X-Rspamd-Action: no action

From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>

Every platform driver can be forced to match a device that doesn't match
its list of device IDs because of device_match_driver_override(), so
platform drivers that rely on the existence of a device's ACPI companion
object need to verify its presence.

Accordingly, add a requisite ACPI_HANDLE() check against NULL to the
asus_atk0110 hwmon driver.

Fixes: ee1752590733 ("hwmon: (asus_atk0110) Convert ACPI driver to a platform one")
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 drivers/hwmon/asus_atk0110.c |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

--- a/drivers/hwmon/asus_atk0110.c
+++ b/drivers/hwmon/asus_atk0110.c
@@ -1273,15 +1273,20 @@ static int atk_probe(struct platform_dev
 	struct acpi_buffer buf;
 	union acpi_object *obj;
 	struct atk_data *data;
+	acpi_handle handle;
 
 	dev_dbg(&pdev->dev, "adding...\n");
 
+	handle = ACPI_HANDLE(&pdev->dev);
+	if (!handle)
+		return -ENODEV;
+
 	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
 	data->dev = &pdev->dev;
-	data->atk_handle = ACPI_HANDLE(&pdev->dev);
+	data->atk_handle = handle;
 	INIT_LIST_HEAD(&data->sensor_list);
 	data->disable_ec = false;
 




