Return-Path: <linux-hwmon+bounces-12119-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKCZKdSuqGmfwQAAu9opvQ
	(envelope-from <linux-hwmon+bounces-12119-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 04 Mar 2026 23:14:44 +0100
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 117402085ED
	for <lists+linux-hwmon@lfdr.de>; Wed, 04 Mar 2026 23:14:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ED05E3015855
	for <lists+linux-hwmon@lfdr.de>; Wed,  4 Mar 2026 22:14:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE3BE384232;
	Wed,  4 Mar 2026 22:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl header.b="hJuK7B8g"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED993542E1
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Mar 2026 22:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.227.64.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772662481; cv=none; b=RGPw2Kp4/KnobXXSRMHIeiRue3Ar4hg+S1pd1wqoF3Ur5v10CN+VDiMUigAOVGndpJW02yHJ29cj32kG04iZ5Rkut2R4V6O5DZ8wwL7hyObjvYhSZYlseyJ9Ay6cvCU6PfozDHd3nMMdZsSMrwFeOLCB+cNRQqMIofro8C9ZjVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772662481; c=relaxed/simple;
	bh=p/FZGYSgjd8d3iCw9nzYGrrNbHJNHtjAgJz5eeYkzZE=;
	h=Date:Message-ID:Subject:MIME-Version:Content-Type:From:To:Cc; b=PQI+6C9qPf1D2MRGn4O4gZxvPYVgeuN6qZgrbygFMXNiAjgSBb/laRp/sxPxZ8e5uOaWqUgJa2sVltoYnehmowJnJ7zVa5Wq5xJIOwajxGyrLhIHRoi2Bs1BGUhCT0I1CBlMWLt6k8xE4Gayhph1ilmw0vqJeuTC13mVxkSYEbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rere.qmqm.pl; spf=pass smtp.mailfrom=rere.qmqm.pl; dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl header.b=hJuK7B8g; arc=none smtp.client-ip=91.227.64.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rere.qmqm.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rere.qmqm.pl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
	t=1772661924; bh=p/FZGYSgjd8d3iCw9nzYGrrNbHJNHtjAgJz5eeYkzZE=;
	h=Date:Subject:From:To:Cc:From;
	b=hJuK7B8gNCezM/woaiuiCMWo2YlroM9K1oadsZ0wDo0tFrNRACZ8meJIEoDgYapGV
	 GGW4pFp/R2PL46P8tOF/RCUq+N7RSSUWHtAx5+pioBCycVB6WIUI8ZOuWshGBYdUZL
	 Xnr7DvkwVroKaNn5G/1iEoh9QD+IVz6jE7Ge4qKvVY1soklUhTjUcWJiwo+4+VqYy2
	 uy38DPUTolNkfd/JbT1n9lUtfco7bJeZ+YfowXEBn98KtMsWqlUa8c80KX2EyAaTdh
	 RjV7r510f8VF8ucHWF4kfAGSfaiZn806AT8n1WqC5EbpOc54gyRaX5x0b7t/QAZdS/
	 AAKugcRitf76w==
Received: from remote.user (localhost [127.0.0.1])
	by rere.qmqm.pl (Postfix) with UTF8SMTPSA id 4fR6DN1pgLzbg;
	Wed, 04 Mar 2026 23:05:24 +0100 (CET)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 1.4.3 at mail
Date: Wed, 04 Mar 2026 23:05:23 +0100
Message-ID: <c7a3a0b6c1658a8ce4cc5962de18c5b2cdbcdb8f.1772661800.git.mirq-linux@rere.qmqm.pl>
Subject: [PATCH 1/5] hwmon: gigabyte_waterforce: Add PID for 2nd gen coolers.
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
From:	=?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
To:	Aleksa Savic <savicaleksa83@gmail.com>
Cc:	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
X-Rspamd-Queue-Id: 117402085ED
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.45 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.71)[subject];
	DMARC_POLICY_ALLOW(-0.50)[rere.qmqm.pl,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[rere.qmqm.pl:s=1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12119-lists,linux-hwmon=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mirq-linux@rere.qmqm.pl,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[rere.qmqm.pl:+];
	NEURAL_HAM(-0.00)[-0.988];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-hwmon];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,rere.qmqm.pl:dkim,rere.qmqm.pl:mid]
X-Rspamd-Action: no action

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 drivers/hwmon/gigabyte_waterforce.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/gigabyte_waterforce.c b/drivers/hwmon/gigabyte_waterforce.c
index 27487e215bdd..ecefac756a19 100644
--- a/drivers/hwmon/gigabyte_waterforce.c
+++ b/drivers/hwmon/gigabyte_waterforce.c
@@ -16,7 +16,6 @@
 #define DRIVER_NAME	"gigabyte_waterforce"
 
 #define USB_VENDOR_ID_GIGABYTE		0x1044
-#define USB_PRODUCT_ID_WATERFORCE	0x7a4d	/* Gigabyte AORUS WATERFORCE X240, X280 and X360 */
 
 #define STATUS_VALIDITY		(2 * 1000)	/* ms */
 #define MAX_REPORT_LENGTH	6144
@@ -397,8 +396,11 @@ static void waterforce_remove(struct hid_device *hdev)
 }
 
 static const struct hid_device_id waterforce_table[] = {
-	{ HID_USB_DEVICE(USB_VENDOR_ID_GIGABYTE, USB_PRODUCT_ID_WATERFORCE) },
-	{ }
+	/* AORUS WATERFORCE X240, X280 and X360 */
+	{ HID_USB_DEVICE(USB_VENDOR_ID_GIGABYTE, 0x7a4d) },
+	/* AORUS WATERFORCE II X240, X280 and X360 */
+	{ HID_USB_DEVICE(USB_VENDOR_ID_GIGABYTE, 0x7a5e) },
+	/* sentinel */ {}
 };
 
 MODULE_DEVICE_TABLE(hid, waterforce_table);
-- 
2.47.3


