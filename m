Return-Path: <linux-hwmon+bounces-11670-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGurN0dSjGmukgAAu9opvQ
	(envelope-from <linux-hwmon+bounces-11670-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 11 Feb 2026 10:56:23 +0100
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCB01230D0
	for <lists+linux-hwmon@lfdr.de>; Wed, 11 Feb 2026 10:56:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E5153012EAA
	for <lists+linux-hwmon@lfdr.de>; Wed, 11 Feb 2026 09:56:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 009933612EE;
	Wed, 11 Feb 2026 09:56:07 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [207.46.229.174])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EFCC366827;
	Wed, 11 Feb 2026 09:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.46.229.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770803766; cv=none; b=WcrvFileXrriRuThayoSVHXhkWVixAmZxkPgtQ3zNa9S1ACu0X6aPjkpWfXk+XUdTAiVWxYp623b6VKRWLweg4zp1aadSqSOitowSHD9eUd6AH9uShvtxHLmIz4S7XbhC4pdQTXumptlMqVN2Ljr834ohnXaCHy6hlQEHuN6m/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770803766; c=relaxed/simple;
	bh=AruFY8w4UezkwYIrCC+S4ULMIKU8rUkvNNNZ5SmVyR8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=Xe4z1zBH8CWj6ftlezrFFRZ0fe+GKnt6SNOnzt/GZXKlLvUahz0p2uL3wQnpY3FD4eq657Fg+4vt13aoewm82QnOOgobRn9mxC24xOV0ahWNysFFWof38UXHTVmg76jLj/Cr/gqYzwdGoQroICG6RjMEs9li3ANxycUW1iqTMCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=207.46.229.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from hehuan1$eswincomputing.com ( [10.12.96.103] ) by
 ajax-webmail-app2 (Coremail) ; Wed, 11 Feb 2026 17:55:47 +0800 (GMT+08:00)
Date: Wed, 11 Feb 2026 17:55:47 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Huan He" <hehuan1@eswincomputing.com>
To: linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, p.zabel@pengutronix.de,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: ningyu@eswincomputing.com, linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com, luyulin@eswincomputing.com
Subject: Re: [PATCH v2 0/2] Add driver support for ESWIN EIC7700 PVT
 controller
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <20260128101400.859-1-hehuan1@eswincomputing.com>
References: <20260128101400.859-1-hehuan1@eswincomputing.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <1a08e50a.362b.19c4c20db59.Coremail.hehuan1@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:TQJkCgD38s0jUoxp0hoAAA--.182W
X-CM-SenderInfo: 5khk3tzqr6v25zlqu0xpsx3x1qjou0bp/1tbiAgEPCmmLXgRK6QAB
	sc
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-11670-lists,linux-hwmon=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[eswincomputing.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hehuan1@eswincomputing.com,linux-hwmon@vger.kernel.org];
	HAS_X_PRIO_THREE(0.00)[3];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,eswincomputing.com:mid]
X-Rspamd-Queue-Id: 8CCB01230D0
X-Rspamd-Action: no action

PiAKPiBBZGQgc3VwcG9ydCBmb3IgdGhlIEVTV0lOIEVJQzc3MDAgUFZUIChQcm9jZXNzLCBWb2x0
YWdlLCBUZW1wZXJhdHVyZSkKPiBzZW5zb3IKPiAKPiBGZWF0dXJlczoKPiBUaGUgZHJpdmVyIHN1
cHBvcnRzIG1vbml0b3Jpbmcgb2YgcHJvY2Vzcywgdm9sdGFnZSBhbmQgdGVtcGVyYXR1cmUKPiBw
YXJhbWV0ZXJzIHRocm91Z2ggdGhlIGhhcmR3YXJlIG1vbml0b3Jpbmcgc3Vic3lzdGVtLiBJdCBw
cm92aWRlcyBhbgo+IGFjY2VzcyB0byB0aGUgc2FtcGxlZCBUZW1wZXJhdHVyZSBhbmQgVm9sdGFn
ZS4KPiAKPiBUZXN0Ogo+IFRlc3RlZCB0aGlzIHBhdGNoIG9uIHRoZSBTaUZpdmUgSGlGaXZlIFBy
ZW1pZXIgUDU1MCAod2hpY2ggdXNlcyB0aGUgRVNXSU4KPiBFSUM3NzAwIFNvQykuCj4gCj4gVXBk
YXRlczoKPiAKPiAgIENoYW5nZXMgaW4gdjI6Cj4gICAtIFVwZGF0ZSBlc3dpbixlaWM3NzAwLXB2
dC55YW1sCj4gICAgIC0gUmVmZXJlbmNlIHRoZSBod21vbi1jb21tb24ueWFtbCBmaWxlCj4gICAg
IC0gUmVtb3ZlIHRoZSBjbG9jay1uYW1lcyBhbmQgcmVzZXQtbmFtZXMgcHJvcGVydGllcwo+ICAg
ICAtIE1vdmUgYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlIGFmdGVyIHRoZSByZXF1aXJlZCBi
bG9jawo+ICAgICAtIFJlbW92ZSBvbmUgZXhhbXBsZSBub2RlIHRvIGF2b2lkIHJlZHVuZGFuY3kK
PiAgIC0gVXBkYXRlIGVpYzc3MDAtcHZ0LmMgYW5kIGVpYzc3MDAtcHZ0LmgKPiAgICAgLSBSZW1v
dmUgdW51c2VkIHNlbnNvciBtYWNyb3MgKFBWVF9TRU5TT1JfRklSU1QsIFBWVF9TRU5TT1JfTEFT
VCwKPiAgICAgICBQVlRfU0VOU09SU19OVU0pCj4gICAgIC0gRHJvcCB0aGUgdW5uZWNlc3Nhcnkg
aHdtb24tc3lzZnMuaCBoZWFkZXIKPiAgICAgLSBSZXBsYWNlIGR5bmFtaWMgc2Vuc29yIGluZm8g
YWxsb2NhdGlvbiB3aXRoIGEgc3RhdGljIGFycmF5IGFuZCB1bmlmeQo+ICAgICAgIHNlbnNvciBs
YWJlbHMKPiAgICAgLSBSZW1vdmUgdW51c2VkIGh3bW9uX3RlbXBfdHlwZSBhdHRyaWJ1dGUKPiAg
ICAgLSBFbGltaW5hdGUgcmVkdW5kYW50IHZhbGlkYXRpb24gY2hlY2tzCj4gICAgIC0gUmVtb3Zl
IG11dGV4IGFuZCByZWxhdGVkIGxvY2tpbmcsIHJlbHlpbmcgb24gaHdtb24gY29yZQo+ICAgICAg
IHNlcmlhbGl6YXRpb24KPiAgICAgLSBSZXBsYWNlIHBlci1zZW5zb3IgY2FjaGVzIGFuZCBjb21w
bGV0aW9ucyB3aXRoIGEgc2luZ2xlIGRhdGEgY2FjaGUKPiAgICAgICBhbmQgY29tcGxldGlvbiBv
YmplY3QKPiAgICAgLSBSZW1vdmUgcHZ0LT5zZW5zb3IgdHJhY2tpbmcuIElTUiBubyBsb25nZXIg
ZGVwZW5kcyBvbiB0aGUgY3VycmVudGx5Cj4gICAgICAgc2VsZWN0ZWQgc2Vuc29yCj4gICAgIC0g
TW92ZSBkZXZtX2FkZF9hY3Rpb24oKSByZWdpc3RyYXRpb24gYWZ0ZXIgaW5pdF9jb21wbGV0aW9u
KCkgZm9yCj4gICAgICAgc2FmZXIgY2xlYW51cCwgYW5kIHVwZGF0ZSBjbGVhbnVwIGZ1bmN0aW9u
IChwdnRfY2xlYXJfZGF0YSkKPiAgICAgLSBSZXBsYWNlIGRldm1fcmVzZXRfY29udHJvbF9nZXRf
b3B0aW9uYWxfZXhjbHVzaXZlKCkgd2l0aAo+ICAgICAgIGRldm1fcmVzZXRfY29udHJvbF9nZXRf
ZXhjbHVzaXZlX2RlYXNzZXJ0ZWQoKQo+ICAgICAtIFJlcGxhY2UgZWljNzcwMF9wdnRfcmVtb3Zl
KCkgd2l0aCBlaWM3NzAwX3B2dF9kaXNhYmxlX3BtX3J1bnRpbWUoKQo+ICAgICAgIGFuZCBtb3Zl
IGl0IGFmdGVyIFBNIHJ1bnRpbWUgZW5hYmxlIHRvIGF2b2lkIHJlc291cmNlIGxlYWtzIG9uIHBy
b2JlCj4gICAgICAgZmFpbHVyZSBhbmQgcmVtb3ZlIGNsb2NrIGRpc2FibGUgYW5kIHJlc2V0IGFz
c2VydCBmcm9tCj4gICAgICAgZWljNzcwMF9wdnRfZGlzYWJsZV9wbV9ydW50aW1lKCkgYXMgaXQg
aXMgYWxyZWFkeSBoYW5kbGVkIGJ5IGRldm1fKgo+ICAgICAgIGZyYW1ld29yawo+ICAgICAtIFJl
bW92ZSByZWR1bmRhbnQgY2xvY2sgcHJlc2VuY2UgY2hlY2sgaW4gcnVudGltZV9yZXN1bWUKPiAK
CkhpIEtyenlzenRvZiwgR3VlbnRlciwgYWxsLAoKVGhlIHYxIHBhdGNoIHJlY2VpdmVkIHJldmll
d3MgYW5kIGNvbW1lbnRzIGZyb20gS3J6eXN6dG9mIGFuZCBHdWVudGVyLgpUaGUgdjIgcGF0Y2gg
aW5jb3Jwb3JhdGVzIGNoYW5nZXMgYmFzZWQgb24gdGhvc2UgY29tbWVudHMgYW5kIGhhcyByZWNl
aXZlZApmZWVkYmFjayBmcm9tIENvbm9yLgoKSSdtIG5vdCBzdXJlIGlmIHRoZXJlIGhhcyBiZWVu
IHRpbWUgdG8gcmV2aWV3IHRoZSB1cGRhdGVkIHYyIHlldC4gU2hvdWxkIEkKd2FpdCBmb3IgZnVy
dGhlciBmZWVkYmFjaywgb3IgaXMgYW55IGFjdGlvbiBuZWVkZWQgZnJvbSBteSBzaWRlPwoKQmVz
dCByZWdhcmRzLApIdWFuIEhlCgo+ICAgLSBMaW5rIHRvIHYxOiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9hbGwvMjAyNjAxMDkwOTA3MTguNDQyLTEtaGVodWFuMUBlc3dpbmNvbXB1dGluZy5jb20v
Cj4K

