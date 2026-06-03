Return-Path: <linux-hwmon+bounces-14683-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2zBqBcQQIGp7vQAAu9opvQ
	(envelope-from <linux-hwmon+bounces-14683-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 03 Jun 2026 13:32:20 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AC6637168
	for <lists+linux-hwmon@lfdr.de>; Wed, 03 Jun 2026 13:32:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b="BuQm/JuQ";
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-14683-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-14683-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D14131E2073
	for <lists+linux-hwmon@lfdr.de>; Wed,  3 Jun 2026 11:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 211E7466B70;
	Wed,  3 Jun 2026 11:11:09 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7387644D022
	for <linux-hwmon@vger.kernel.org>; Wed,  3 Jun 2026 11:11:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780485069; cv=none; b=ebjcFrw1Y+iQXci5K24GMNTooTiBumk9Ma2gNoFaqDb8j1GPWV95lvPbtSs8wZh1OazHx7EekZqO0/VDn4892C/zmQ32YN58TW/uPfyOaw0ehC9rxoBK4s262GvbPg8aj8Jap7Wqy1iAqX5bxh5aCuIBsqb8CgOAbHFhpFtmRqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780485069; c=relaxed/simple;
	bh=WcNNAU1CzyMhLQPUzeNOT5YaIzTDhHnYSoCbUL6lcwo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DpRHXRgqFZTNespKgpy+YATkaSmstr4BiU+zw/Dv4BiIA/i6D4Jk0Dx2Mht+mQieIfnIEnLp0fiA634dd+hDWY8eQ9m8hmAOcOX8yFbalN4mxPGU11Q07wWOEmBFpZ9wcjaJh+ViXJ/r7CeVAuD0kpczQqJti5uqUQcC9Hfn8ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BuQm/JuQ; arc=none smtp.client-ip=185.246.84.56
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 610131A37CC;
	Wed,  3 Jun 2026 11:11:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 246635FFA8;
	Wed,  3 Jun 2026 11:11:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C600B10888CCF;
	Wed,  3 Jun 2026 13:10:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780485059; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vpmnkRxwaFT80g54LLIDsA4yY78yN17CLdroSULW1gc=;
	b=BuQm/JuQurOaZbLp8umCk4vqfPARaLPvYmGVr2qwWpk1cO+igAviTmpN9Mr0qlTmCsXSKv
	VxjhCs97yaB3uEJuWIADBbri7nMJV1CCrNHQScxwmTGTHDhPrl9MVzbor6+S2td+WRcE5P
	VIHsccMydyS36+rCGJ4x5CWakHkA3bil9gs+B/f9vtcRTbVLqj4wNDKUFQD1rvMgd2MiUp
	RIAidtr0BQ8uiUOQk0/9ax7iGu7zvii7ZPV4+5K2uDLpTsgCMXPKNEuNWhkr/AQlcyEZA7
	f1AKf+8JaiP1UwWq7mB2Rd1RogYWvVT8rvdlvNCIDXT3hEBAC+d1uoSYhyfCrQ==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Wed, 03 Jun 2026 13:10:50 +0200
Subject: [PATCH 2/2] hwmon: (adt7462) Add of_match_table to support
 devicetree
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-adt7462-bindings-v1-2-301304bcf774@bootlin.com>
References: <20260603-adt7462-bindings-v1-0-301304bcf774@bootlin.com>
In-Reply-To: <20260603-adt7462-bindings-v1-0-301304bcf774@bootlin.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kory Maincent <kory.maincent@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Romain Gantois <romain.gantois@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14683-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@roeck-us.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kory.maincent@bootlin.com,m:thomas.petazzoni@bootlin.com,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:romain.gantois@bootlin.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bootlin.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[romain.gantois@bootlin.com,linux-hwmon@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[romain.gantois@bootlin.com,linux-hwmon@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,bootlin.com:mid,bootlin.com:dkim,bootlin.com:from_mime,bootlin.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 57AC6637168

From: Kory Maincent <kory.maincent@bootlin.com>

Add of_match_table to add support of devicetree probing.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
---
 drivers/hwmon/adt7462.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hwmon/adt7462.c b/drivers/hwmon/adt7462.c
index 174dfee47f7a7..ef6e5252dc0a4 100644
--- a/drivers/hwmon/adt7462.c
+++ b/drivers/hwmon/adt7462.c
@@ -1814,10 +1814,17 @@ static const struct i2c_device_id adt7462_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, adt7462_id);
 
+static const struct of_device_id __maybe_unused adt7462_of_match[] = {
+	{ .compatible = "adi,adt7462" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, adt7462_of_match);
+
 static struct i2c_driver adt7462_driver = {
 	.class		= I2C_CLASS_HWMON,
 	.driver = {
 		.name	= "adt7462",
+		.of_match_table = of_match_ptr(adt7462_of_match),
 	},
 	.probe		= adt7462_probe,
 	.id_table	= adt7462_id,

-- 
2.54.0


