Return-Path: <linux-hwmon+bounces-13939-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WG32L67vAmrAywEAu9opvQ
	(envelope-from <linux-hwmon+bounces-13939-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 12 May 2026 11:15:26 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F14251D710
	for <lists+linux-hwmon@lfdr.de>; Tue, 12 May 2026 11:15:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1220030234F7
	for <lists+linux-hwmon@lfdr.de>; Tue, 12 May 2026 09:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B39323A9618;
	Tue, 12 May 2026 09:14:09 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.75.44.102])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33B7C3A5E84
	for <linux-hwmon@vger.kernel.org>; Tue, 12 May 2026 09:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.75.44.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778577249; cv=none; b=uG1omTT6zIcbrDxLM7X9hUR1HVmhS69wQ0vXPjxtnGKRG3oYn+tiZUyZB8VUf5UOdC05zYkFzRgc5WAC699QiehI5YahgKcvfJUIdHD8yJHwhjZ2XhJ4kN3nr460Ynfcuz/WtdkjbG3zJjGSVzSgTcxeuo5MqDJLv/9xPf5HnSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778577249; c=relaxed/simple;
	bh=sCjxp2FDiVf9IqZaN8jRPP5BqnwoUzKVhYi5ATmijQs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=hNL8kZIj3LNt05KcJ+p80kvX26qMRyF8rtyziBfZMEC0ovcYJdsjpJkXb9fXakxC7HaXnlbjYijJSJ64go7/Z/WCDj98mchHBDyOMBsiMMKnxKWsNRBySkpQZMzdpNJvDzp/CnonYTqfgJJlzi5GZ8g89upWoFsCZ5gxSygsbtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=13.75.44.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from hehuan1$eswincomputing.com ( [10.12.96.103] ) by
 ajax-webmail-app2 (Coremail) ; Tue, 12 May 2026 17:14:03 +0800 (GMT+08:00)
Date: Tue, 12 May 2026 17:14:03 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Huan He" <hehuan1@eswincomputing.com>
To: sashiko@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
Subject: Re: Re: [PATCH v4 1/2] dt-bindings: hwmon: Add Eswin EIC7700 PVT
 sensor
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <20260430070049.0B702C2BCB4@smtp.kernel.org>
References: <20260430064444.1615-1-hehuan1@eswincomputing.com>
 <20260430070049.0B702C2BCB4@smtp.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <75446e0c.6167.19e1b76fe55.Coremail.hehuan1@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:TQJkCgAHHaBb7wJqYMQYAA--.5063W
X-CM-SenderInfo: 5khk3tzqr6v25zlqu0xpsx3x1qjou0bp/1tbiAgEFCmoCBREpMwAB
	sr
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-Rspamd-Queue-Id: 5F14251D710
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.36 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13939-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_X_PRIO_THREE(0.00)[3];
	DMARC_NA(0.00)[eswincomputing.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hehuan1@eswincomputing.com,linux-hwmon@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-hwmon];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

SGkgU2FzaGlrbywKClRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHlvdXIgZGV0YWlsZWQgcmV2aWV3
LsKgV2UgYXBwcmVjaWF0ZSB0aGUgZmVlZGJhY2suCgo+IAo+IFRoYW5rIHlvdSBmb3IgeW91ciBj
b250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3IGZvdW5kIDIgcG90ZW50aWFsIGlzc3VlKHMp
IHRvIGNvbnNpZGVyOgo+IC0gW01lZGl1bV0gVGhlICdsYWJlbCcgcHJvcGVydHkgaXMgcmVxdWly
ZWQgYW5kIHJlc3RyaWN0ZWQgdG8gYW4gZW51bSwgbWlzdXNpbmcgaXQgZm9yIGhhcmR3YXJlIGlu
c3RhbmNlIGlkZW50aWZpY2F0aW9uLgo+IC0gW01lZGl1bV0gVGhlICcjdGhlcm1hbC1zZW5zb3It
Y2VsbHMnIHByb3BlcnR5IGlzIGRlZmluZWQgYnV0IG9taXR0ZWQgZnJvbSB0aGUgJ3JlcXVpcmVk
JyBsaXN0Lgo+IC0tCj4gCj4gY29tbWl0IDVhNWVkMzRkMTdlYTRlODhjZDgwYjVhOGU5NmUyMWRj
YzY1ZTlmMTEKPiBBdXRob3I6IEh1YW4gSGUgPGhlaHVhbjFAZXN3aW5jb21wdXRpbmcuY29tPgo+
IAo+IGR0LWJpbmRpbmdzOiBod21vbjogQWRkIEVzd2luIEVJQzc3MDAgUFZUIHNlbnNvcgo+IAo+
IFRoaXMgY29tbWl0IGFkZHMgdGhlIGRldmljZSB0cmVlIGJpbmRpbmcgZG9jdW1lbnRhdGlvbiBm
b3IgdGhlIEVzd2luCj4gRUlDNzcwMCBQcm9jZXNzLCBWb2x0YWdlIGFuZCBUZW1wZXJhdHVyZSBz
ZW5zb3IuIFRoZSBTb0MgaW50ZWdyYXRlcyB0d28KPiBQVlQgaW5zdGFuY2VzIGZvciBtb25pdG9y
aW5nIHRoZSBtYWluIFNvQyBhbmQgRERSIHBvd2VyIGRvbWFpbnMuCj4gCj4gPiBkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2h3bW9uL2Vzd2luLGVpYzc3MDAt
cHZ0LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaHdtb24vZXN3aW4s
ZWljNzcwMC1wdnQueWFtbAo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAw
MDAwMDAwMDAuLmJhODliODI5ZWU5NDcKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9od21vbi9lc3dpbixlaWM3NzAwLXB2dC55YW1s
Cj4gCj4gWyAuLi4gXQo+IAo+ID4gKyAgaW50ZXJydXB0czoKPiA+ICsgICAgbWF4SXRlbXM6IDEK
PiA+ICsKPiA+ICsgIGxhYmVsOgo+ID4gKyAgICBlbnVtOgo+ID4gKyAgICAgIC0gcHZ0MAo+ID4g
KyAgICAgIC0gcHZ0MQo+IAo+IElzIGl0IGFwcHJvcHJpYXRlIHRvIHJlc3RyaWN0IHRoZSBzdGFu
ZGFyZCBsYWJlbCBwcm9wZXJ0eSB0byBhIHN0cmljdCBlbnVtCj4gYW5kIHJlcXVpcmUgaXQ/IAo+
IAo+IFRoZSBkZXZpY2V0cmVlIHNwZWNpZmljYXRpb24gZ2VuZXJhbGx5IGRlZmluZXMgbGFiZWwg
YXMgYW4gb3B0aW9uYWwsCj4gaHVtYW4tcmVhZGFibGUgc3RyaW5nLiBTaG91bGQgdGhlIGhhcmR3
YXJlIGluc3RhbmNlcyBiZSBkaWZmZXJlbnRpYXRlZCBieQo+IHRoZWlyIHJlZyBhZGRyZXNzZXMs
IGFsaWFzZXMsIG9yIGRlZGljYXRlZCBwcm9wZXJ0aWVzIGluc3RlYWQgb2YgaW1wb3NpbmcKPiBh
IHN0cmljdCBlbnVtIG9uIGEgc3RhbmRhcmQgZnJlZS1mb3JtIHN0cmluZz8KCkkgYW0gcGxhbm5p
bmcgdG8gdXBkYXRlIHRoZSBuZXh0IHJldmlzaW9uIGFzIGZvbGxvd3MuIFdvdWxkIHRoaXMgYmUK
YWNjZXB0YWJsZT8KCllBTUw6Ci0gwqBsYWJlbDoKLSDCoCDCoGVudW06Ci0gwqAgwqAgwqAtIHB2
dDAKLSDCoCDCoCDCoC0gcHZ0MQorIMKgbGFiZWw6IHRydWUKCnJlcXVpcmVkOgrCoCAtIGNvbXBh
dGlibGUKwqAgLSByZWcKwqAgLSBjbG9ja3MKwqAgLSBpbnRlcnJ1cHRzCi0gLSBsYWJlbAoKRHJp
dmVyOgrCoHN0YXRpYyBpbnQgZWljNzcwMF9wdnRfY3JlYXRlX2h3bW9uKHN0cnVjdCBwdnRfaHdt
b24gKnB2dCkKwqB7Ci0gwqAgc3RydWN0IGRldmljZSAqZGV2ID0gcHZ0LT5kZXY7Ci0gwqAgc3Ry
dWN0IGRldmljZV9ub2RlICpucCA9IGRldi0+b2Zfbm9kZTsKLSDCoCBjb25zdCBjaGFyICpub2Rl
X2xhYmVsOwotIMKgIGludCB0eXBlOwotIMKgIGNvbnN0IGNoYXIgKm5hbWVzWzJdID0geyJzb2Nf
cHZ0IiwgImRkcl9wdnQifTsKLQotIMKgIGlmIChvZl9wcm9wZXJ0eV9yZWFkX3N0cmluZyhucCwg
ImxhYmVsIiwgJm5vZGVfbGFiZWwpKSB7Ci0gwqAgwqAgwqAgZGV2X2VycihkZXYsICJNaXNzaW5n
ICdsYWJlbCcgcHJvcGVydHkgaW4gRFRTIG5vZGVcbiIpOwotIMKgIMKgIMKgIHJldHVybiAtRUlO
VkFMOwotIMKgIH0KLQotIMKgIGlmIChzdHJjbXAobm9kZV9sYWJlbCwgInB2dDAiKSA9PSAwKSB7
Ci0gwqAgwqAgwqAgdHlwZSA9IDA7Ci0gwqAgfSBlbHNlIGlmIChzdHJjbXAobm9kZV9sYWJlbCwg
InB2dDEiKSA9PSAwKSB7Ci0gwqAgwqAgwqAgdHlwZSA9IDE7Ci0gwqAgfSBlbHNlIHsKLSDCoCDC
oCDCoCBkZXZfZXJyKHB2dC0+ZGV2LCAiVW5zdXBwb3J0ZWQgbGFiZWw6ICVzXG4iLCBub2RlX2xh
YmVsKTsKLSDCoCDCoCDCoCByZXR1cm4gLUVJTlZBTDsKLSDCoCB9CisgwqAgY29uc3QgY2hhciAq
bmFtZSA9ICJwdnQiOworCisgwqAgb2ZfcHJvcGVydHlfcmVhZF9zdHJpbmcocHZ0LT5kZXYtPm9m
X25vZGUsICJsYWJlbCIsICZuYW1lKTsKwqAKLSDCoCBwdnQtPmh3bW9uID0gZGV2bV9od21vbl9k
ZXZpY2VfcmVnaXN0ZXJfd2l0aF9pbmZvKHB2dC0+ZGV2LCBuYW1lc1t0eXBlXSwKKyDCoCBwdnQt
Pmh3bW9uID0gZGV2bV9od21vbl9kZXZpY2VfcmVnaXN0ZXJfd2l0aF9pbmZvKHB2dC0+ZGV2LCBu
YW1lLArCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBwdnQsICZw
dnRfaHdtb25faW5mbywKwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgTlVMTCk7Cgo+IAo+ID4gKwo+ID4gKyAgcmVzZXRzOgo+ID4gKyAgICBtYXhJdGVtczogMQo+
ID4gKwo+ID4gKyAgJyN0aGVybWFsLXNlbnNvci1jZWxscyc6Cj4gPiArICAgIGNvbnN0OiAwCj4g
PiArCj4gPiArcmVxdWlyZWQ6Cj4gPiArICAtIGNvbXBhdGlibGUKPiA+ICsgIC0gcmVnCj4gPiAr
ICAtIGNsb2Nrcwo+ID4gKyAgLSBpbnRlcnJ1cHRzCj4gPiArICAtIGxhYmVsCj4gPiArICAtIHJl
c2V0cwo+IAo+IFNob3VsZCAjdGhlcm1hbC1zZW5zb3ItY2VsbHMgYmUgaW5jbHVkZWQgaW4gdGhp
cyByZXF1aXJlZCBsaXN0Pwo+IAo+IFNpbmNlIHRoZSBkZXZpY2UgYWN0cyBhcyBhIHRoZXJtYWwg
c2Vuc29yIHByb3ZpZGVyLCBvbWl0dGluZyBpdHMgY2VsbC1jb3VudAo+IHByb3BlcnR5IGFsbG93
cyBpbmNvbXBsZXRlIGRldmljZSB0cmVlIG5vZGVzIHRvIHNpbGVudGx5IHBhc3Mgc2NoZW1hCj4g
dmFsaWRhdGlvbi4gVGhpcyBtaWdodCBsZWFkIHRvIHJ1bnRpbWUgZmFpbHVyZXMgb3IgbWlzY29u
ZmlndXJhdGlvbnMgd2hlbgo+IGRlcGVuZGVudCB0aGVybWFsIHpvbmVzIGF0dGVtcHQgdG8gcmVm
ZXJlbmNlIHRoZSBzZW5zb3IuCgpJIHdpbGwgYWRkICIjdGhlcm1hbC1zZW5zb3ItY2VsbHMiIHRv
IHRoZSByZXF1aXJlZCBsaXN0IGluIHRoZSBuZXh0CnJldmlzaW9uLgoKQmVzdCByZWdhcmRzLApI
dWFuIEhlCg==

