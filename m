Return-Path: <linux-hwmon+bounces-15510-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cAQTCRguRGpdqAoAu9opvQ
	(envelope-from <linux-hwmon+bounces-15510-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 30 Jun 2026 22:59:04 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 832BF6E7F71
	for <lists+linux-hwmon@lfdr.de>; Tue, 30 Jun 2026 22:59:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=weissschuh.net header.s=mail header.b=je9KOpl3;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15510-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15510-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=weissschuh.net;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE49C303FDE7
	for <lists+linux-hwmon@lfdr.de>; Tue, 30 Jun 2026 20:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F093347CC69;
	Tue, 30 Jun 2026 20:58:03 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B9547AF71;
	Tue, 30 Jun 2026 20:58:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782853083; cv=none; b=FcK4CVAREZ9XOS8q1DnnK745nDruS6i22MtzOm4eml2W6qeggkvZekbG9O1vfPrxvCjvt91Ye7F9DQsIiiOqObfzFLFDb+ozv7P+Va3LRMwdo/I5xThKkQg69I7YKQEeTriBUNvzt31jxcPUr6FF/k0J56xLNTAb94VoRu9139o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782853083; c=relaxed/simple;
	bh=z9y+a8m9DWLgeYM1S1GwSI5fxAsFZVMGZiLeMTQ9RAk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oSnAQUMj+2DFvATPU7ii78v97oh1dCi/O+BVZGLhEsHgwT4IXIQRBMcytFYqpkcXOp99vp2AmA0mDlLLA7iiA+QXmo8piuf+U5s6UgKqxV0w+EdpqPogkHaunXaHZT4xE2QaxWDn2PRmROh/t5lXmlJ+zRKRQ6jx4v7TSNmj5Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=je9KOpl3; arc=none smtp.client-ip=159.69.126.157
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1782853080;
	bh=z9y+a8m9DWLgeYM1S1GwSI5fxAsFZVMGZiLeMTQ9RAk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=je9KOpl36qDKfsvzUKrRWUZpv6pAIB9JvHSLO/Io2XEJdfJm0jMDHSNaS2LNxsPw+
	 SZm77FbFwJlUSvjazhovQTd/rPj7JAZedXoKFrUh2W8SBezkYeCGSdzOIFyIzWpT7h
	 sadLi4R1W5NpaJgr8rKPauA6rJ3fvSlBtf1lYzW8=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 30 Jun 2026 22:57:51 +0200
Subject: [PATCH 1/2] hwmon: (cros_ec) Implement custom kelvin to celsius
 conversions
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260630-cros_ec-hwmon-overflow-v1-1-3d2ecd3eb0f2@weissschuh.net>
References: <20260630-cros_ec-hwmon-overflow-v1-0-3d2ecd3eb0f2@weissschuh.net>
In-Reply-To: <20260630-cros_ec-hwmon-overflow-v1-0-3d2ecd3eb0f2@weissschuh.net>
To: Guenter Roeck <linux@roeck-us.net>, Benson Leung <bleung@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782853080; l=1885;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=z9y+a8m9DWLgeYM1S1GwSI5fxAsFZVMGZiLeMTQ9RAk=;
 b=wNTQRL6PMUVINQONPNImsygPrxYQlzAzyZuK1Wreb+NL+gk03L4GrvHPdVr29oF8jp7erdDMq
 I1ZGlKMexisBlvZKFFOEDzXpxKr9LV6Jg5ndGJ2C9L5HmTpzUN2cR4U
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15510-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[linux@weissschuh.net,linux-hwmon@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux@roeck-us.net,m:bleung@chromium.org,m:groeck@chromium.org,m:chrome-platform@lists.linux.dev,m:linux-hwmon@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux@weissschuh.net,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-hwmon];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 832BF6E7F71

The ChromeOS EC APIs use integers representing degrees kelvin for
temperatures. The default conversions from linux/units.h will then
always convert these integer degrees celsius with a 150 millidegree
offset. This is a bit confusing, as it also differs from other CrOS EC
tooling. Internally the EC uses a kelvin to celsius offset of a round
273, so the current conversion is also not entirely accurate.

Implement a custom conversion which preserves round values.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/hwmon/cros_ec_hwmon.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
index ea24056ae646..44291799dd8e 100644
--- a/drivers/hwmon/cros_ec_hwmon.c
+++ b/drivers/hwmon/cros_ec_hwmon.c
@@ -147,9 +147,17 @@ static bool cros_ec_hwmon_is_error_temp(u8 temp)
 	       temp == EC_TEMP_SENSOR_NOT_CALIBRATED;
 }
 
+/* This differs slightly from the variant in units.h to avoid rounding inconsistencies. */
+#define CROS_EC_HWMON_ABSOLUTE_ZERO_MILLICELSIUS (-273000)
+
+static long cros_ec_hwmon_kelvin_to_millicelsius(long t)
+{
+	return t * MILLIDEGREE_PER_DEGREE + CROS_EC_HWMON_ABSOLUTE_ZERO_MILLICELSIUS;
+}
+
 static long cros_ec_hwmon_temp_to_millicelsius(u8 temp)
 {
-	return kelvin_to_millicelsius((((long)temp) + EC_TEMP_SENSOR_OFFSET));
+	return cros_ec_hwmon_kelvin_to_millicelsius((((long)temp) + EC_TEMP_SENSOR_OFFSET));
 }
 
 static bool cros_ec_hwmon_attr_is_temp_threshold(u32 attr)
@@ -228,7 +236,7 @@ static int cros_ec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 								cros_ec_hwmon_attr_to_thres(attr),
 								&threshold);
 			if (ret == 0)
-				*val = kelvin_to_millicelsius(threshold);
+				*val = cros_ec_hwmon_kelvin_to_millicelsius(threshold);
 		}
 	}
 

-- 
2.55.0


