Return-Path: <linux-hwmon+bounces-15391-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jsFtIiHkQWo9vgkAu9opvQ
	(envelope-from <linux-hwmon+bounces-15391-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 29 Jun 2026 05:18:57 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C87A86D5A2D
	for <lists+linux-hwmon@lfdr.de>; Mon, 29 Jun 2026 05:18:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15391-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15391-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4825A300A616
	for <lists+linux-hwmon@lfdr.de>; Mon, 29 Jun 2026 03:18:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E50237BE8A;
	Mon, 29 Jun 2026 03:18:54 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [4.193.249.245])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41A2637AA65;
	Mon, 29 Jun 2026 03:18:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782703134; cv=none; b=nHuywr73TMKmIEiwjHYbRwBsw7xNnRnRzr3ugVGVKsR21eaj3fk9CoEXaQI7M7suhN4qJft6KckvBsdyYlmUm4NnDIDS23yMAKKEdq6Vz5kRsypO+cobhxfTxCJtlo9kweLKFMI3N0WZi5+dvPl+kodOkIQVNgEOI3/eIcwHehA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782703134; c=relaxed/simple;
	bh=2i619orZh5e90Wzn6bgcBluE0cdAT/VejJqmigtzTTw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=BLYWSTjBB8ccKnqj8i7lcYhdjsnNC3TgIZhz9TMqV7Wrb6oiLmhRrCEh6tSlt+idV0HRKPwvAjw48BGah8Avdg61FLDl/r+Ew+3eq5BfZr8Xrcf+V5IodfCnlVQYkrk9Va65C8h1A5wEI67xe9hy1xmAaAJb9B7EViHwoxXy7yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=4.193.249.245
Received: from dongxuyang$eswincomputing.com ( [10.12.96.41] ) by
 ajax-webmail-app2 (Coremail) ; Mon, 29 Jun 2026 11:18:36 +0800 (GMT+08:00)
Date: Mon, 29 Jun 2026 11:18:36 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Xuyang Dong" <dongxuyang@eswincomputing.com>
To: "Julian Braha" <julianbraha@gmail.com>, linux@roeck-us.net,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	p.zabel@pengutronix.de, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: ningyu@eswincomputing.com, linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com, luyulin@eswincomputing.com
Subject: Re: Re: [PATCH v8 2/2] hwmon: Add Eswin EIC7700 PVT sensor driver
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <66945d22-17e4-4856-9704-8256650c4b25@gmail.com>
References: <20260625061049.1614-1-hehuan1@eswincomputing.com>
 <20260625061214.1648-1-hehuan1@eswincomputing.com>
 <66945d22-17e4-4856-9704-8256650c4b25@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <720f0b80.7c8d.19f1162d004.Coremail.dongxuyang@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:TQJkCgAnPJ8M5EFq_MEvAA--.6523W
X-CM-SenderInfo: pgrqw5xx1d0w46hv4xpqfrz1xxwl0woofrz/1tbiAQENAmpBTKQXh
	wABsd
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWUJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julianbraha@gmail.com,m:linux@roeck-us.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:p.zabel@pengutronix.de,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ningyu@eswincomputing.com,m:linmin@eswincomputing.com,m:pinkesh.vaghela@einfochips.com,m:luyulin@eswincomputing.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[eswincomputing.com];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,roeck-us.net,kernel.org,pengutronix.de,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[dongxuyang@eswincomputing.com,linux-hwmon@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	HAS_X_PRIO_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dongxuyang@eswincomputing.com,linux-hwmon@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-15391-lists,linux-hwmon=lfdr.de];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C87A86D5A2D

SGkgSnVsaWFuLAoKPiAKPiBPbiA2LzI1LzI2IDA3OjEyLCBoZWh1YW4xQGVzd2luY29tcHV0aW5n
LmNvbSB3cm90ZToKPiA+ICtjb25maWcgU0VOU09SU19FSUM3NzAwX1BWVAo+ID4gKwl0cmlzdGF0
ZSAiRXN3aW4gRUlDNzcwMCBWb2x0YWdlLCBUZW1wZXJhdHVyZSBzZW5zb3IgZHJpdmVyIgo+ID4g
KwlkZXBlbmRzIG9uIEFSQ0hfRVNXSU4gfHwgQ09NUElMRV9URVNUCj4gPiArCWRlcGVuZHMgb24g
SFdNT04KPiAKPiBZb3UgYWxyZWFkeSBwdXQgU0VOU09SU19FSUM3NzAwX1BWVCBpbnNpZGUgdGhl
ICdpZiBIV01PTiAuLiBlbmRpZicsIHNvCj4geW91IGRvbid0IG5lZWQgdGhlICdkZXBlbmRzIG9u
IEhXTU9OJy4gSXQgY3JlYXRlcyBhIGR1cGxpY2F0ZQo+IGRlcGVuZGVuY3kuCj4gCgpXaWxsIGRy
b3AgdGhlICdkZXBlbmRzIG9uIEhXTU9OJyBpbiB0aGUgbmV4dCB2ZXJzaW9uLgoKQmVzdCByZWdh
cmRzLApYdXlhbmcgRG9uZwoK

