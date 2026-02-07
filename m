Return-Path: <linux-hwmon+bounces-11649-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPr+Hzx1h2kqYQQAu9opvQ
	(envelope-from <linux-hwmon+bounces-11649-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sat, 07 Feb 2026 18:24:12 +0100
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 500C1106AF2
	for <lists+linux-hwmon@lfdr.de>; Sat, 07 Feb 2026 18:24:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EB16B30039BF
	for <lists+linux-hwmon@lfdr.de>; Sat,  7 Feb 2026 17:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 772433382CB;
	Sat,  7 Feb 2026 17:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="jXLxCrBm"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B893299AAB;
	Sat,  7 Feb 2026 17:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770485042; cv=pass; b=Aj07GLLhzdtx+DAJD2SD8Fo+0u1D7dPwgobiE9YsPnJ8tXxF3ENBfI6Zz4/Qge1JdlACOfb8JILvd+sW5RDFXcevEE6qmDYwevGkoezbV/jgrOoRb3aAoB5LumKkYpFuU7G9gd5xMPBzPrOBikTJcxe+Yjv9fdjCGghgI4JqA+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770485042; c=relaxed/simple;
	bh=s41gT87dWvuzHdqIUv41leecdIo/clKsPj7uK0KyjcM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FVJqu/tWdEDxR+7r9KD5HFBpHQK/4WTGlbqM8/7yami4yHt68qh4LTDDlzPhmZM6eHfccZlzl/+p/dHOJVLOsnlo1CMrY59XQ3X/3l5MznFMiH2EjD+GBXJYJwFHt1AvV1mWPIcaJMUEQ7ffCrvqh8gbHxIaQ3wypJZQd9rI2wk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=jXLxCrBm; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
ARC-Seal: i=1; a=rsa-sha256; t=1770485018; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=A8b6ucQgsHtCFZX9QWtRpFb6BqxWFrC7T0Bu4xZ0ErtC7SV2sZDVh2AzBen9Rs0t2yfFsPJOaBTOyht0uUlKtuup4St0kDOgSuMFOO0dnJMHWQNbzeuvcGHen8NZnA10nzTkZMDIZtTphzdwSp3DKlDIbm2/pTNzN8az8+HHJpA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770485018; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=faMM77TcsvJrLJnEOJkg9GDeZL+mgoEejPqj8vRk9u8=; 
	b=MSrhfo5ksRH3c6lxzSKC31bDbljy/MyJTTrOuqxmGU8+Mp9xM/rvQfIbtPTbUOjNj3sKyoulR0WMMz5jPTlUS+lcJlCx4YafkB/Zy1L4pzPXGDCmRckXDrapTFgg40rr0940bd05I9iX96sKvuOeCgDQwaOe1JRuYpQIKEO8+Bo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770485018;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=faMM77TcsvJrLJnEOJkg9GDeZL+mgoEejPqj8vRk9u8=;
	b=jXLxCrBmwZ09vVYjcVtQ9tzkyXlXoACPj4Wuwcq63JaReciULr+1JzhFvyzXuAgu
	JIWbtEu1OdEzLGXky6F14ck6/DAVCQwVuWCXEqvL0XUvs3QgJSuSxjNw2zGahF8ClNU
	hXOZPt90QrWVO1QxSoEW8/l+KQsMH7FMfScWlswE+7PUBQUkpA6KbysPqynch24Vmhw
	Ck4xNkY/NhvZHW/W/xMRxyimTq2oD05zRmQYZkG2lK5+j3/hCbNg57J7dZyv6ZVgRGx
	5KRLq8NHTfbWibuciJRFZj8O9sb1JJGcYCz4BggPA0UHm6m4yYBs0NvYmvMLBTrZCtF
	8/nFc239qw==
Received: by mx.zohomail.com with SMTPS id 1770485016956754.7552455871597;
	Sat, 7 Feb 2026 09:23:36 -0800 (PST)
From: Rong Zhang <i@rong.moe>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Rong Zhang <i@rong.moe>,
	Guenter Roeck <linux@roeck-us.net>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: [PATCH] platform/x86: lenovo-wmi-{capdata,other}: Fix HWMON channel visibility
Date: Sun,  8 Feb 2026 01:23:27 +0800
Message-ID: <20260207172327.80111-1-i@rong.moe>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[rong.moe,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[rong.moe:s=zmail2048];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-11649-lists,linux-hwmon=lfdr.de];
	FREEMAIL_TO(0.00)[squebb.ca,gmail.com,gmx.de,kernel.org,linux.intel.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[i@rong.moe,linux-hwmon@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[rong.moe:+];
	DBL_FAIL(0.00)[sto.lore.kernel.org:query timed out];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.976];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rong.moe:email,rong.moe:dkim,rong.moe:mid]
X-Rspamd-Queue-Id: 500C1106AF2
X-Rspamd-Action: no action

The LWMI_SUPP_MAY_{GET,SET} macros are fundamentally broken. When I
introduced them, I meant to check LWMI_SUPP_VALID *and* the
corresponding bits for get/set capabilities. However, `supported &
LWMI_SUPP_MAY_{GET,SET}' means *or*, so it accidentally passes the check
when LWMI_SUPP_VALID is set.

Fix them by only including the corresponding get/set bit without
LWMI_SUPP_VALID. Meanwhile, rename them to LWMI_SUPP_{GET,SET} to make
them less confusing.

Fixes: 67d9a39ce85f ("platform/x86: lenovo-wmi-capdata: Wire up Fan Test Data")
Signed-off-by: Rong Zhang <i@rong.moe>
---
 drivers/platform/x86/lenovo/wmi-capdata.h | 4 ++--
 drivers/platform/x86/lenovo/wmi-other.c   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h b/drivers/platform/x86/lenovo/wmi-capdata.h
index 59ca3b3e5760b..8c1df3efcc553 100644
--- a/drivers/platform/x86/lenovo/wmi-capdata.h
+++ b/drivers/platform/x86/lenovo/wmi-capdata.h
@@ -9,8 +9,8 @@
 #include <linux/types.h>
 
 #define LWMI_SUPP_VALID		BIT(0)
-#define LWMI_SUPP_MAY_GET	(LWMI_SUPP_VALID | BIT(1))
-#define LWMI_SUPP_MAY_SET	(LWMI_SUPP_VALID | BIT(2))
+#define LWMI_SUPP_GET		BIT(1)
+#define LWMI_SUPP_SET		BIT(2)
 
 #define LWMI_ATTR_DEV_ID_MASK	GENMASK(31, 24)
 #define LWMI_ATTR_FEAT_ID_MASK	GENMASK(23, 16)
diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index 2a9ede27e13d4..6040f45aa2b0d 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -216,7 +216,7 @@ static umode_t lwmi_om_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_t
 
 		switch (attr) {
 		case hwmon_fan_target:
-			if (!(priv->fan_info[channel].supported & LWMI_SUPP_MAY_SET))
+			if (!(priv->fan_info[channel].supported & LWMI_SUPP_SET))
 				return 0;
 
 			if (relax_fan_constraint ||
@@ -233,7 +233,7 @@ static umode_t lwmi_om_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_t
 			return 0;
 		case hwmon_fan_div:
 		case hwmon_fan_input:
-			visible = priv->fan_info[channel].supported & LWMI_SUPP_MAY_GET;
+			visible = priv->fan_info[channel].supported & LWMI_SUPP_GET;
 			break;
 		case hwmon_fan_min:
 			visible = priv->fan_info[channel].min_rpm >= 0;

base-commit: eeeb4c9874bb7ad11d322156443b1d3ebfaaa1cf
-- 
2.51.0


