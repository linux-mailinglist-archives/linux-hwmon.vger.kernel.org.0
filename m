Return-Path: <linux-hwmon+bounces-13249-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id LUJQDWuv2mlp5QgAu9opvQ
	(envelope-from <linux-hwmon+bounces-13249-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sat, 11 Apr 2026 22:30:35 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 774EC3E1A27
	for <lists+linux-hwmon@lfdr.de>; Sat, 11 Apr 2026 22:30:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3556300EAA9
	for <lists+linux-hwmon@lfdr.de>; Sat, 11 Apr 2026 20:29:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1446D3B8BB2;
	Sat, 11 Apr 2026 20:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="LADtce1Q"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-106118.protonmail.ch (mail-106118.protonmail.ch [79.135.106.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB3436C9CC
	for <linux-hwmon@vger.kernel.org>; Sat, 11 Apr 2026 20:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775939362; cv=none; b=jJfEw9P4qx3LgevpqNeU029EXqHAE8DtRjzyKAzu0j6I/PhY9C6FFlUBCFOUl1MwYtp7fr7WrQhreduNaNYhU8Y4ZRaYV2nGF7j4zvbiSeJZ0yd8MpNifXzmigG+vD3aNi0TfOVP4Sr6Sajxd3//OgeyVLaCmdg3HSS6/DchX2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775939362; c=relaxed/simple;
	bh=m6J5lxxLeU8itsw6Sn6W9yh1IqpUBGlkd+KPqK31Dg8=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qW00qf2E/TTfSWt/IAcajtVZv9r8tzBposDdPVyjuXzuTdsBzcOWkNTeLQQCyoWUFhvTROzBQl5rAiwFce+1ycclTQPgVFDRT1ZRBkGnIioplf57f9oLO2pmQwNUC8Eyy5F5bXua5JVYCf0ntcF8UtwOglFF00PGZBdJtnpwcyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=LADtce1Q; arc=none smtp.client-ip=79.135.106.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1775939351; x=1776198551;
	bh=td/oOJc3gZYPGB7/JgeYx+etSGDBTNRwPg/fLWF486I=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=LADtce1QcNCBiMoiXRsqJY68qPVxs+73rueHgTyxOV8IZdik7V3QrYkSNnVfFkhTB
	 WutEeKu9+nWIaEzIrV5Sg4laqfthKD8AHL69kLV+QnLE7lCcL1+FvMSNmPRL3NFh2h
	 mtQakWaAp/DupkryKTi3ksB1GRbaggYtfcVbQ0RUx/KX0Jc0/X8FOr4t8nBtM81d/X
	 cJKRvmQSxPftt68szJmVVuOOCXIYOCs1ceVwHrVEpQD9jqp6FjUpJwNc1wNujs3/tS
	 ZscDqJkqEgjtJezhkl3AaAAVS+axaliuyWWq6R34wwzXyhVaeeeEBAjHn0uSGYCTMz
	 TPh1ZlscSR6gg==
Date: Sat, 11 Apr 2026 20:29:07 +0000
To: Guenter Roeck <linux@roeck-us.net>
From: pklotz0@protonmail.com
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, Petr Klotz <pklotz0@protonmail.com>
Subject: [PATCH] hwmon: (nct6683) Add customer ID for ASRock B650I Lightning WiFi
Message-ID: <20260411202922.7875-1-pklotz0@protonmail.com>
Feedback-ID: 191960931:user:proton
X-Pm-Message-ID: 6bcb724bb25440a327930aeca94565cdc865b0ab
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[protonmail.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[protonmail.com:s=protonmail3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13249-lists,linux-hwmon=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pklotz0@protonmail.com,linux-hwmon@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,protonmail.com];
	DKIM_TRACE(0.00)[protonmail.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_FROM(0.00)[protonmail.com];
	TAGGED_RCPT(0.00)[linux-hwmon];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,protonmail.com:dkim,protonmail.com:email,protonmail.com:mid]
X-Rspamd-Queue-Id: 774EC3E1A27
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Petr Klotz <pklotz0@protonmail.com>

This value was found on ASRock B650I Lightning WiFi with NCT6686D chip.
Signed-off-by: Petr Klotz <pklotz0@protonmail.com>
---
 drivers/hwmon/nct6683.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
index 4a8380414038..41523669572c 100644
--- a/drivers/hwmon/nct6683.c
+++ b/drivers/hwmon/nct6683.c
@@ -182,6 +182,7 @@ superio_exit(int ioreg)
 #define NCT6683_CUSTOMER_ID_ASROCK3=090x1631
 #define NCT6683_CUSTOMER_ID_ASROCK4=090x163e
 #define NCT6683_CUSTOMER_ID_ASROCK5=090x1621
+#define NCT6683_CUSTOMER_ID_ASROCK6     0x1633
=20
 #define NCT6683_REG_BUILD_YEAR=09=090x604
 #define NCT6683_REG_BUILD_MONTH=09=090x605
@@ -1245,6 +1246,8 @@ static int nct6683_probe(struct platform_device *pdev=
)
 =09=09break;
 =09case NCT6683_CUSTOMER_ID_ASROCK5:
 =09=09break;
+=09case NCT6683_CUSTOMER_ID_ASROCK6:
+=09=09break;
 =09default:
 =09=09if (!force)
 =09=09=09return -ENODEV;
--=20
2.53.0



