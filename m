Return-Path: <linux-hwmon+bounces-14675-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id M9b8AEDwH2qfsgAAu9opvQ
	(envelope-from <linux-hwmon+bounces-14675-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 03 Jun 2026 11:13:36 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3AF63606F
	for <lists+linux-hwmon@lfdr.de>; Wed, 03 Jun 2026 11:13:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=erq.se header.s=loopiadkim1730905327 header.b=Bof6K2td;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-14675-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-14675-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9612330151EB
	for <lists+linux-hwmon@lfdr.de>; Wed,  3 Jun 2026 09:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6108E32F748;
	Wed,  3 Jun 2026 09:07:42 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.outgoing.loopia.se (smtp.outgoing.loopia.se [93.188.3.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAC3379C49
	for <linux-hwmon@vger.kernel.org>; Wed,  3 Jun 2026 09:07:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780477662; cv=none; b=gi48Y1Vfgv/oS0cth+i0KGNNlKiZkl+t+rcIxcGRCBns4kI3qwFtRgtToVnx0+SZHymrMthVDqxkYM5rQgSWyoirHYafGDZq8AdrSlzXS9xqVn1gPtB96HzzAq15wRNZaqYPG3UPQN6zZnwmERxdA36+GbjF9GYc5toeJgiQC9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780477662; c=relaxed/simple;
	bh=GZzDIpCba88oaBGJmylGq0xxI3r2qLCCOKGtHPr4wnE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ROEzxmSIMIJb9JdbK7veGGVu9ac/zZzztYqu/Fsj4U08H1fLlQ1VRr5qEw3qB4iseECV6mHhx3XSDJo885rDtyswsWGinoap5dyYnm7v3G4KDNmUbIyIYS6D9oyGX3FlYLwVpsX71hzPNg0IBpKkv+r5qC0710gfLCn/vI4yO6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=erq.se; spf=pass smtp.mailfrom=erq.se; dkim=pass (2048-bit key) header.d=erq.se header.i=@erq.se header.b=Bof6K2td; arc=none smtp.client-ip=93.188.3.37
Received: from s807.loopia.se (localhost [127.0.0.1])
	by s807.loopia.se (Postfix) with ESMTP id 56BF2537B91
	for <linux-hwmon@vger.kernel.org>; Wed, 03 Jun 2026 10:57:48 +0200 (CEST)
Received: from s934.loopia.se (unknown [172.22.191.5])
	by s807.loopia.se (Postfix) with ESMTP id 46358535FF5;
	Wed, 03 Jun 2026 10:57:48 +0200 (CEST)
Received: from localhost (unknown [172.22.191.6])
	by s934.loopia.se (Postfix) with ESMTP id 44491A3D613;
	Wed, 03 Jun 2026 10:57:48 +0200 (CEST)
X-Virus-Scanned: amavis at amavis.loopia.se
X-Spam-Flag: NO
X-Spam-Score: -1.2
X-Spam-Level:
Received: from s934.loopia.se ([172.22.191.6])
 by localhost (s472.loopia.se [172.22.190.12]) (amavis, port 10024) with LMTP
 id zEUscrFsJuUi; Wed,  3 Jun 2026 10:57:47 +0200 (CEST)
X-Loopia-Auth: user
X-Loopia-User: linux@erq.se
X-Loopia-Originating-IP: 90.231.188.7
Received: from mailcluster.loopia.se (90-231-188-7-no600.tbcn.telia.com [90.231.188.7])
	(Authenticated sender: linux@erq.se)
	by s934.loopia.se (Postfix) with ESMTPSA id 792C3917F0D;
	Wed, 03 Jun 2026 10:57:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=erq.se;
	s=loopiadkim1730905327; t=1780477067;
	bh=OZ/y+bkgDX4jjV/dpgyVVxa/MxK1D4rxKGGkZztqNAo=;
	h=From:To:Cc:Subject:Date;
	b=Bof6K2tdLumd4TLF3L5dGVEbEnqtRpy8x1sj5gev4oCE/6ea8k6O8ZsaHEzJIeOPb
	 HEsZzONXS/pMFaNIq0RZDErPKFL+PhOTlmoVMRawpMXe3uJeCHOeyIINWzrfohq80h
	 Btkh9eFX4h87n54bPNS2sTLwK4DO6JyDMkXSvej2bS6Os6beJnlVVx4D5eDkeTvRSp
	 NvY5s7qge5VYriobQ3H+I08YtebqvxQEzOAkrqlFscn6N4V62O0bYKNPhpySLPl7Ti
	 rrEJRf+zlAXGIOlmKiyxL65s6LYr/ueozGSYrbzQbiRJNKRL7ss56nUYpGWRrHNpMo
	 z+JDgjvHKpNvQ==
From: Daniel Nilsson <linux@erq.se>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Daniel Nilsson <linux@erq.se>
Subject: [PATCH 0/1] hwmon: (pmbus) Add support for Flex BMR316, BMR321, BMR350 and BMR351
Date: Wed,  3 Jun 2026 10:57:11 +0200
Message-ID: <20260603085712.659432-1-linux@erq.se>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[erq.se:s=loopiadkim1730905327];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-14675-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[linux@erq.se,linux-hwmon@vger.kernel.org];
	DMARC_NA(0.00)[erq.se];
	FORGED_RECIPIENTS(0.00)[m:linux@roeck-us.net,m:linux-hwmon@vger.kernel.org,m:linux@erq.se,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@erq.se,linux-hwmon@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[erq.se:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,erq.se:mid,erq.se:from_mime,erq.se:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7D3AF63606F

Add support for BMR316, BMR321, BMR350 and BMR351 DC/DC converter
modules from Flex to the generic pmbus driver.

BMR492, BMR316, BMR321, BMR350 and BMR351 all use the same chip, which
has the deficiency that it presents a second phantom PAGE even though
the devices only have a single real PAGE/rail.  By explicitly
specifying the number of pages via driver_data, as is already in place
for BMR492, we avoid exposing the phantom PAGEs.

Update the documentation with a new datasheet URL.  The datasheets for
Flex BMRs are now only found via the product selector on flex.com.

The patch has been tested against BMR316, BMR321, BMR350 and BMR351.

Daniel Nilsson (1):
  hwmon: (pmbus) Add support for Flex BMR316, BMR321, BMR350 and BMR351

 Documentation/hwmon/pmbus.rst | 9 +++++----
 drivers/hwmon/pmbus/pmbus.c   | 4 ++++
 2 files changed, 9 insertions(+), 4 deletions(-)


base-commit: e7ae89a0c97ce2b68b0983cd01eda67cf373517d
-- 
2.51.2


