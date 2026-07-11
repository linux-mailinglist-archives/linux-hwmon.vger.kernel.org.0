Return-Path: <linux-hwmon+bounces-15820-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fKxpGhAUUmonLwMAu9opvQ
	(envelope-from <linux-hwmon+bounces-15820-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sat, 11 Jul 2026 11:59:44 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FF4741213
	for <lists+linux-hwmon@lfdr.de>; Sat, 11 Jul 2026 11:59:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=weissschuh.net header.s=mail header.b=RFQYiVZq;
	dmarc=pass (policy=quarantine) header.from=weissschuh.net;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15820-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15820-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 85018302979C
	for <lists+linux-hwmon@lfdr.de>; Sat, 11 Jul 2026 09:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAF1F395AF2;
	Sat, 11 Jul 2026 09:59:32 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFEB3932DC;
	Sat, 11 Jul 2026 09:59:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783763972; cv=none; b=dFsLJCTIfAS79ZcgJw7LrywFsegLfYu/RxE2Sofsip6icJvN1663m5zklPOQpYl6DArysm0Av1HhFCWBwLjvAhsEQ0XVOAhkSp4+vF9oPa8O2lfqfRFSBGuRR31qbiZ+WmUZbea9rDdGEnDmvdJjzDUmr8FJiRWpvJJD3YzNN54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783763972; c=relaxed/simple;
	bh=1glqh3NKjLr4HSQMMiqeuVdFfYOD/vKOcJ+KkT72tPo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RJ09JvMbkgJ38aBA0QZ/IH2CwV2UbEG278K2xcODL70JCXn4df2wa17UCy6opoSfTzWQ9ACnBSgSSuInYlcr9byooZFYVnRYcZBhYZ1Ii9y6AMstVvKPXCWh9/w2OJsUbBoLg7b6EMivewKGMlItmke4XYaOBDqn7esBvE0qu6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=RFQYiVZq; arc=none smtp.client-ip=159.69.126.157
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1783763961;
	bh=1glqh3NKjLr4HSQMMiqeuVdFfYOD/vKOcJ+KkT72tPo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RFQYiVZqQVDvOswygHZxE5vjeTAAgnzYxjJ4IcRvawLai+Bw1OCv0fNAkuUkJRDam
	 pTpfSvg7h1BfTRNsWIKog/T48dP1F36745BsEZIfwuZZbUss5v73lxF13Ty80kLXp6
	 zw1z9W/63bziQuHWbSoTuiOy39tXpYeKQStUK9so=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 11 Jul 2026 11:59:07 +0200
Subject: [PATCH 3/3] hwmon: (cros_ec) Synchronize EC access from the
 thermal device callbacks
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260711-cros_ec-hwmon-locking-v1-3-cb6d0fdbb2d3@weissschuh.net>
References: <20260711-cros_ec-hwmon-locking-v1-0-cb6d0fdbb2d3@weissschuh.net>
In-Reply-To: <20260711-cros_ec-hwmon-locking-v1-0-cb6d0fdbb2d3@weissschuh.net>
To: Guenter Roeck <linux@roeck-us.net>, Benson Leung <bleung@chromium.org>
Cc: Sung-Chi Li <lschyi@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 chrome-platform@lists.linux.dev, linux-hwmon@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783763961; l=1444;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=1glqh3NKjLr4HSQMMiqeuVdFfYOD/vKOcJ+KkT72tPo=;
 b=oiodRxfkJhMc/PP1eC1YX7FMjKP8QE5nFYj0zvQA42EzAvnPrCe1MUPI8K2AD1X4r+T71hRPM
 zCpzjI/SQ0gAJAaoQTTWjZbzS6zL0eRNAnS66CvLmfoTW1RzbZq4AaI
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15820-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[linux@weissschuh.net,linux-hwmon@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux@roeck-us.net,m:bleung@chromium.org,m:lschyi@chromium.org,m:groeck@chromium.org,m:chrome-platform@lists.linux.dev,m:linux-hwmon@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux@weissschuh.net,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[weissschuh.net:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@weissschuh.net,linux-hwmon@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-hwmon];
	DBL_BLOCKED_OPENRESOLVER(0.00)[weissschuh.net:from_mime,weissschuh.net:email,weissschuh.net:mid,weissschuh.net:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D2FF4741213

To guarantee consistency for the read-modify-write access in
cros_ec_hwmon_cooling_set_cur_state(), locking is necessary.

Use the existing hwmon device lock to do so.

Fixes: 5798b62867b4 ("hwmon: (cros_ec) register fans into thermal framework cooling devices")
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/hwmon/cros_ec_hwmon.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
index fb5daa9f80d1..76d83e1c68cf 100644
--- a/drivers/hwmon/cros_ec_hwmon.c
+++ b/drivers/hwmon/cros_ec_hwmon.c
@@ -5,6 +5,7 @@
  *  Copyright (C) 2024 Thomas Weißschuh <linux@weissschuh.net>
  */
 
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/hwmon.h>
 #include <linux/math.h>
@@ -411,6 +412,8 @@ static int cros_ec_hwmon_cooling_get_cur_state(struct thermal_cooling_device *cd
 	u8 read_val;
 	int ret;
 
+	guard(hwmon_lock)(priv->hwmon_priv->hwmon_dev);
+
 	ret = cros_ec_hwmon_read_pwm_value(priv->hwmon_priv->cros_ec, priv->index, &read_val);
 	if (ret)
 		return ret;
@@ -424,6 +427,8 @@ static int cros_ec_hwmon_cooling_set_cur_state(struct thermal_cooling_device *cd
 {
 	const struct cros_ec_hwmon_cooling_priv *priv = cdev->devdata;
 
+	guard(hwmon_lock)(priv->hwmon_priv->hwmon_dev);
+
 	return cros_ec_hwmon_write_pwm_input(priv->hwmon_priv->cros_ec, priv->index, val);
 }
 

-- 
2.55.0


