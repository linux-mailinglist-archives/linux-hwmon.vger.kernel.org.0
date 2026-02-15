Return-Path: <linux-hwmon+bounces-11738-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 5WGoL2obkWndfAEAu9opvQ
	(envelope-from <linux-hwmon+bounces-11738-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sun, 15 Feb 2026 02:03:38 +0100
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2437613DD84
	for <lists+linux-hwmon@lfdr.de>; Sun, 15 Feb 2026 02:03:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4826301547E
	for <lists+linux-hwmon@lfdr.de>; Sun, 15 Feb 2026 01:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF4A418C2C;
	Sun, 15 Feb 2026 01:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ElJmaown"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C0617D2;
	Sun, 15 Feb 2026 01:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771117414; cv=none; b=PH56YWY35QezsJN1+txKluAZAnVPTkIUfCHUduX9LRLPZdxW1BPAfklePbjnMFR6mrcu03olw+vf7ERXxNUZXD7/leaBFUIZEfZl/PCkrB2ulR4sWOE1FhCKsfc0NCwiyNPLmJKccM4y2ebdkYCO9KgzzX2mnrnu206a0/F47zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771117414; c=relaxed/simple;
	bh=8TivcMWQmfsHiCVj2A/l4s6f90uWWyhRjy6jlPWIInQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eS98D1mv6sRn/Vbeb0+qoQHVauyPWHJY4dEAxYrBUY0Z85DRUaqcztZ5qNc7hAZAQwlfQUt9kr0x3OwlMLksSzftrtir2Kvo+BvvjznTcrficv4YeVW0yJ8WviwfTQroE5WrmPnZDghRNIwgy9zryDXXfHwXk5Ej8DM3KJSRxQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ElJmaown; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=lpgVmH6waGTwe1fTdaD02I3zX7MSJiXZIdVR5azzhN0=; b=ElJmaownwCJSB9safd4a0Iev5W
	QBim9uPsKeZhb99KJkg/TjYm1KTL+M2IecaBoCbrX9pkQq0G7RItvCasohGIPpMzuNql8Y1KFXpi0
	ZYhChh6h7P8itFBLncu5pXzMpfpGRtP/JN5hFb2pZJbxgn2a11pMJ31pMS+RVbXAhBhCpbtbRJtrQ
	XFuIi7GEvNU8RDByV16JGqLfcezaM2R76QwxL60F7rqpaCYN6QgJ/xX1VUd6zHJW0F7q9gx93JsLm
	42y/wgFD+zS4dIV13O7UVXT6EPtpc9gVga+jZ+CeRkLr8biwfRGRGzBAGPmeoRAtt7cvl7uqinlhf
	PrVnb+/A==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrQXo-000000054KH-2CFe;
	Sun, 15 Feb 2026 01:03:28 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-doc@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	Kalhan Trisal <kalhan.trisal@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH] hwmon: (emc1403) correct a malformed email address
Date: Sat, 14 Feb 2026 17:03:27 -0800
Message-ID: <20260215010327.1687304-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-11738-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[infradead.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-hwmon@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:url,linuxfoundation.org:email,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2437613DD84
X-Rspamd-Action: no action

Add a closing '>' to Kalhan's emaill address.

line 60:  Kalhan Trisal <kalhan.trisal@intel.com

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Cc: Kalhan Trisal <kalhan.trisal@intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>

 Documentation/hwmon/emc1403.rst |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20260213.orig/Documentation/hwmon/emc1403.rst
+++ linux-next-20260213/Documentation/hwmon/emc1403.rst
@@ -57,7 +57,7 @@ Supported chips:
 	- https://ww1.microchip.com/downloads/en/DeviceDoc/EMC1438%20DS%20Rev.%201.0%20(04-29-10).pdf
 
 Author:
-    Kalhan Trisal <kalhan.trisal@intel.com
+    Kalhan Trisal <kalhan.trisal@intel.com>
 
 
 Description

