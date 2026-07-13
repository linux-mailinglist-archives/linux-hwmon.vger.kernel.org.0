Return-Path: <linux-hwmon+bounces-15873-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Mu1+ObJTVWrFmwAAu9opvQ
	(envelope-from <linux-hwmon+bounces-15873-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 13 Jul 2026 23:08:02 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E457A74F2E5
	for <lists+linux-hwmon@lfdr.de>; Mon, 13 Jul 2026 23:08:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=XKMjxLdX;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15873-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15873-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E6C16300D561
	for <lists+linux-hwmon@lfdr.de>; Mon, 13 Jul 2026 21:07:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3B763382C9;
	Mon, 13 Jul 2026 21:07:55 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8084778F3A;
	Mon, 13 Jul 2026 21:07:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783976875; cv=none; b=hiGBgPYnU2UZD40E23B0RD4+0d//cFTmpZVpny4t5IClHQPPp5gwETP+xnXwfuPD5cvq2rZmJEBtVeydrIVCdbsrgB8wqIlx9fxNFZ3jzYymycTwfhHkydbVnOOGbNXD8odQJaSRfpdCgPVFcDJ0e1nDKNpCeHZgfPvsXZqU3EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783976875; c=relaxed/simple;
	bh=VDWmE7Fa1F2vT3xKe0ocMykZFpmZprSW0/qbwJAKmeY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=p8GbW4oOe+qM9zavQhknNeNPhb7SSskQxloOQYB/Zg4XNvdFOgJfM8GYDXJHIKDtwZqHGKR7d7jMd9bN0ONy+WkB/h53hGmPmAwGFhJtMiEF+xr6QTYM1nIfNXlcH3sPMA74NYzXGiextTOjq6Dd+VJ6SQElWigExJl5/cCZ5F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XKMjxLdX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1074EC2BCB8;
	Mon, 13 Jul 2026 21:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783976875;
	bh=VDWmE7Fa1F2vT3xKe0ocMykZFpmZprSW0/qbwJAKmeY=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=XKMjxLdXz4HIerjr1kRkjM/TePHTFEbpzajccga5ewkQIC9rEvpTkz9I7APG3LtHK
	 O1K7yLtLQQrYxlLSkqipNTJ7eFsp4UOKH8CUAlICNSkY9x9tQs5E4d2tsFtiYAAKwx
	 TuhTg9hHR4MAAjCWnM1GCrTe4CRUPrssdUuaTF3skb+uyn9gWljaYXPTr8MQOjtWCy
	 KlPs9SEfurxZgZaw3/edudix0FWZDcCw/naWLy5gI+PUPJnLnARYNbin/TJNXUPJO9
	 H6RAMXtDkvFOv6V1HK42D0BfOPpli/cD8el3Nl461K+nlKRFG1jMozmJbbM0u4fMyZ
	 Cfx8bE6bXU2HA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0740C43458;
	Mon, 13 Jul 2026 21:07:54 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Mon, 13 Jul 2026 23:07:54 +0200
Subject: [PATCH] hwmon: (tmp401) register with thermal subsystem
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-for-upstream-hwmon-tmp401-register-tz-v1-1-47315d8617bc@free.fr>
X-B4-Tracking: v=1; b=H4sIAKlTVWoC/x2NywqDQAwAf0VybiCrpWJ/pfSgNWoO+yBZtVT89
 257HBhmDjBWYYN7dYDyJiYxFHCXCl5LH2ZGGQtDTfWNWtfgFBXXZFm597jsPgbMPl3JofIsllk
 xf3D8uTR0AzcEpZWUJ3n/P4/neX4BN85exXcAAAA=
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783976874; l=1435;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=KjziWIi0OltnNwCWGxqiR9hdiO69mfw90Ja+vvlTw18=;
 b=PDafruWlxKd+Zk51eUp/TVu8YihLTuQ1OXVy5lEYlD4EGX56l8xI9Rc7l+XmakcCc4uzGaSOD
 6QfYJZ+60K1BsFQzdVXe3DW1b6luC+aK8F+ix0TKYXJNGLduKOoiTnI
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Reply-To: vjardin@free.fr
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15873-lists,linux-hwmon=lfdr.de,vjardin.free.fr];
	FORGED_RECIPIENTS(0.00)[m:linux@roeck-us.net,m:linux-hwmon@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:vjardin@free.fr,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-hwmon@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[free.fr];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	HAS_REPLYTO(0.00)[vjardin@free.fr];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-hwmon@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,free.fr];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-hwmon];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E457A74F2E5

From: Vincent Jardin <vjardin@free.fr>

tmp401 is missing HWMON_C_REGISTER_TZ. So a devicetree thermal
zone referencing a such sensor ('thermal-sensors = <&tmp411 N>')
fails to register it. Then its cooling-maps is not set, which means
that the fans are not managed.

Same as lm90 or jc42, set HWMON_C_REGISTER_TZ.
Boards without the property into the DT keep the same behavior.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
It was checked on a LX2160A board that uses a TMP411 for the chassis ambient
input of a fan thermal zone.
Without this patch the zone silently never registers.
With this patch, the zone registers and the cooling-map drives the EMC2305
fans.
---
 drivers/hwmon/tmp401.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/tmp401.c b/drivers/hwmon/tmp401.c
index ca0ff525ea29..83aafe4bd3e7 100644
--- a/drivers/hwmon/tmp401.c
+++ b/drivers/hwmon/tmp401.c
@@ -695,7 +695,7 @@ static int tmp401_probe(struct i2c_client *client)
 	info->type = hwmon_chip;
 	info->config = data->chip_channel_config;
 
-	data->chip_channel_config[0] = HWMON_C_UPDATE_INTERVAL;
+	data->chip_channel_config[0] = HWMON_C_REGISTER_TZ | HWMON_C_UPDATE_INTERVAL;
 
 	info = &data->temp_info;
 	info->type = hwmon_temp;

---
base-commit: ca078d004cf58137bcf8cb24a8b271397431ba58
change-id: 20260713-for-upstream-hwmon-tmp401-register-tz-d07130b9be30

Best regards,
-- 
Vincent Jardin <vjardin@free.fr>



