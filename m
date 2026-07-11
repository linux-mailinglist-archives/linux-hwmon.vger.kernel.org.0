Return-Path: <linux-hwmon+bounces-15796-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Fph4HALyUWrnKgMAu9opvQ
	(envelope-from <linux-hwmon+bounces-15796-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sat, 11 Jul 2026 09:34:26 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC391740BC9
	for <lists+linux-hwmon@lfdr.de>; Sat, 11 Jul 2026 09:34:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=fKutryTq;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15796-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15796-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2F4F1301179E
	for <lists+linux-hwmon@lfdr.de>; Sat, 11 Jul 2026 07:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BFB433123F;
	Sat, 11 Jul 2026 07:34:23 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BA8239085
	for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 07:34:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783755263; cv=none; b=d9O+0YvazX5QTjv5IpuOX+gLN5odval+ino3RUo23uyWqHrqjBcYRGxKUkfiltWpiDpj08tpGOqaHU47oxcoMh6lCwZ4MEXpC/I4oGnukQxKq8exGEfYTlW1bEjy5YUZRn1lU1k8NybWIdu31vHtRIey7wEJwNOK5evNYGhjr+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783755263; c=relaxed/simple;
	bh=VOHau8KExTCCA5Jn+WSAvIPZA6Fo0H+UOFbFcQKcb6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ch0o/QJz00j9Ei56zAPK0d3EIzH8OgQI8RU3AOW5enNo1ZySXcn93NPKRk1xF3CIEC9VdBTwWOnqYixRFyDEILySgH/ayuIt2J3T0/odm7swLBtRlH8VnRMu6K+9Nt0uIQYW4ulQv5jipOMequlb1xWHo1kk9KNyYOOJMlspl7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fKutryTq; arc=none smtp.client-ip=209.85.128.47
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493c7902f47so14655415e9.1
        for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 00:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783755260; x=1784360060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X52XqTkvJ+bCmUt8oWbyVvQ4li5iv1igLrcDIio8JAA=;
        b=fKutryTqMIn3Cb0TdP01Q9SMprRNHcIugBEB7OHepXBce+iIagAYzQil8avqVVFTdl
         hbGK1S78yKpfnm07paJMSbebNrvK3YpUKpF/dBedShPujj+bupy+oz6GMKpwn1j8JZ7p
         GV2MoyC5UZXyMYpdIX002U6eK7qUbykXRQtPU82VMQ0Bgr4ZLSsgTvY9epcw8x+X3vt7
         2D7ZHxhPQtGKeYlVb0t/tfgXttPM1GfJvzR9XT+3AXSjNEWgmChEdfozRs3F6VeamMaY
         wDE7v5kop1uzT5bBLVDhySugoDAXfK3V0qKJsq3hQRqnnp6sFK1DC1bjdsd4cms9BPeI
         G2HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783755260; x=1784360060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X52XqTkvJ+bCmUt8oWbyVvQ4li5iv1igLrcDIio8JAA=;
        b=LBrEmFX6Aq8294KitBpGra9fwEia8ixzY+L/gDeil7AcclmMY+qmY/nEBqswKtWCwL
         R2MRoegVcJU+OZMou1b0zanXlQuCZ5GTM1wAHeKcG5wCMX8js09qJFwWTYR3dlMB8obe
         icD9n2zquYPDf/GjTKSf4B6uIw3HypUvDhl+mXtjeWRS4U7SX3HRUGjoW+OS6/O1+p0l
         hqp/APSd+eE0v+oRIHWJywJnt+EXghNiNUfpwr0r9nQWAMdS9mGBmR1F2g0O85tZxDsb
         FX8lAJMZUY4DIwuD30yCKs+raCZVwI5eCV7waQdqPGhuJGXsy6MHS7o4FhEf0lMK5JbR
         VFkw==
X-Forwarded-Encrypted: i=1; AHgh+RrfEMNeWGB7ctQteA2O1XhFfj0kEmROGBSuzamdFi2pLFwTmRsRZptZkhg96DZ4yyIDNeh4h9V0DECT5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeSkaeeM7nTz/l71m3CIaucyvfHZyMJc/VNGwFznzHhd0yuHbH
	Fump63OvbRXb8DzgVG+oRgcknUzJRpWBPKf3g3Q28noaRzOUxyq+H5Yp
X-Gm-Gg: AfdE7cne/QuNWeHL75bs6g465Wq5RtEK+5F2l5J+tBpt6XEkdnFjyIczCgYYfFd6oBW
	F0y0V7UzqD5vL/OZbtwaMaBtFSuzMkV137YRt+xYKsusgwDBVLTcpqYa5JNfa9NK5d+qn/3/lq3
	DvJHJB2+GiCNmIVAJq0SeiZzswDyXziqxUKD5KebOUGiQLeeBwzQyugysMUDvXrEbdlD1RnqmfR
	8fTAI6SnCSFKahLpB5b8hAFh5I97sTdDx7dsZ03v0YDc6VYHkKB7IwyFVjKbn6vEFW+8TVy7vOy
	k3mldWm1F3uZukZ30JAUI+1kZNga8L22ut1BW5skFT/77gAoz8NS26vTe1QsDIMPOU7G5zeFZhC
	lERl9/XT+j47lo4sSAAb4IzF3/CzwZv30ku3faezjH9UVkIDxOFfJs2Z7QheQTziQ+C/EUoSAib
	OFQN2ERriF28ywJliRybNZUwEaYqCXZ+Q=
X-Received: by 2002:a05:600c:3b07:b0:493:f0f5:f2dd with SMTP id 5b1f17b1804b1-493f88207a9mr15580815e9.21.1783755260082;
        Sat, 11 Jul 2026 00:34:20 -0700 (PDT)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6df417sm204733245e9.8.2026.07.11.00.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 00:34:19 -0700 (PDT)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Vishaal Saraiya <vishaal.saraiya@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org (open list:ASUS EC HARDWARE MONITOR DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/1] hwmon: (asus-ec-sensors) add T_Sensor for ROG STRIX X870E-E GAMING WIFI
Date: Sat, 11 Jul 2026 09:31:52 +0200
Message-ID: <20260711073319.553163-2-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260711073319.553163-1-eugene.shalygin@gmail.com>
References: <20260711073319.553163-1-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-15796-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:eugene.shalygin@gmail.com,m:vishaal.saraiya@gmail.com,m:linux@roeck-us.net,m:linux-hwmon@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:eugeneshalygin@gmail.com,m:vishaalsaraiya@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,roeck-us.net,vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[eugeneshalygin@gmail.com,linux-hwmon@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eugeneshalygin@gmail.com,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DC391740BC9

From: Vishaal Saraiya <vishaal.saraiya@gmail.com>

Enable T_Sensor for ROG STRIX X870E-E GAMING WIFI.

Board specs list the sensor, reading at the standard for this family
address without the thermistor connected to the motherboard, returns
-62, which is one of the known blank values (the other one in -40)
readings for temperature sensors in the ASUS EC when there is no
thermistor connected to the motherboard socket. With that evidence we
conclude that the T_Sensor can be enabled in the driver for this board.

Signed-off-by: Vishaal Saraiya <vishaal.saraiya@gmail.com>
Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 drivers/hwmon/asus-ec-sensors.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index 29a23484cbe7..742520c485ca 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -743,7 +743,7 @@ static const struct ec_board_info board_info_strix_x870_i_gaming_wifi = {
 
 static const struct ec_board_info board_info_strix_x870e_e_gaming_wifi = {
 	.sensors = SENSOR_TEMP_CPU | SENSOR_TEMP_CPU_PACKAGE |
-		SENSOR_TEMP_MB | SENSOR_TEMP_VRM |
+		SENSOR_TEMP_MB | SENSOR_TEMP_VRM | SENSOR_TEMP_T_SENSOR |
 		SENSOR_FAN_CPU_OPT,
 	.mutex_path = ASUS_HW_ACCESS_MUTEX_SB_PCI0_SBRG_SIO1_MUT0,
 	.family = family_amd_800_series,
-- 
2.55.0


