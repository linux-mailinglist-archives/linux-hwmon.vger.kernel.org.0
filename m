Return-Path: <linux-hwmon+bounces-13181-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id JqiSGmwV2GmlXQgAu9opvQ
	(envelope-from <linux-hwmon+bounces-13181-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Thu, 09 Apr 2026 23:09:00 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2CF3CFCC4
	for <lists+linux-hwmon@lfdr.de>; Thu, 09 Apr 2026 23:08:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 37AE930054EE
	for <lists+linux-hwmon@lfdr.de>; Thu,  9 Apr 2026 21:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EDDE371CE6;
	Thu,  9 Apr 2026 21:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="XgaHP513"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE2F324B2D
	for <linux-hwmon@vger.kernel.org>; Thu,  9 Apr 2026 21:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775768937; cv=none; b=SK0lfGEnF7e5MEVWf3sBETSQpCo9pjUTRe/7uzACD5ctQOMp1M+Rmpu/o0oxQuaRrySO5pUU1cCEc1QlrhIOJP0NJzblj/q4ThpA40g2jDd0dtCet90z0oA0z3P56+fewnFbOMdBFFbjUsCxmXivynm51Xj02rSttboJJnMrsyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775768937; c=relaxed/simple;
	bh=XheOPdijU1lZxYO4ms3QUXbItdzGCZlfc4fRl37DxXo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eGvONwiHHzWWWoUfZSupbl5sf2fu3X7yGi7UlJe813vALmiwLfYd9O0nKtMMkMYqCn8Um7pl3VorRURRsYlOHrwVoWX+Koccj/EDFl1CtWABvw/wwAAOeFhUb5xkixV3FzmCEz/QcqhuuGJtQb0jmX1cgz3R9UJIN6kS7q5DB5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=XgaHP513; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 937C02C044C;
	Fri, 10 Apr 2026 09:02:43 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1775768563;
	bh=XheOPdijU1lZxYO4ms3QUXbItdzGCZlfc4fRl37DxXo=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=XgaHP513faJnSLELsi1ls21ddeYz1QEn3NFTmfyq+A3Wz7DzWoynHj+HM8yNjVSew
	 OumM316BZUYQkwB2waMjDPGLPxw5ISU2viEePseJmDHYz5wAn3BuBZBThxZ4EBhAUS
	 AZ6rSKjvYo/2KOHUX1epRXedFjzUwIcRRNk94beGoMq3QyxbbTDDOFK/cmO/O3nFQm
	 XgCwaUFKAnnurSDsWICAmm5LP1ziJiwTWWN5vff7lGiwXqwid8XXTroiGH1u0CdROE
	 pgFP4KEWeWpgt+gAVvFJ5mQTzUWLOTAkkDec32oT1qXD539IC527rFoMXeKUC9ZcmE
	 eveZWgAd4qDYg==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B69d813f30001>; Fri, 10 Apr 2026 09:02:43 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.39; Fri, 10 Apr 2026 09:02:43 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1748.039; Fri, 10 Apr 2026 09:02:43 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Guenter Roeck <linux@roeck-us.net>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 0/2] hwmon: pmbus: Sony APS-379
Thread-Topic: [PATCH v4 0/2] hwmon: pmbus: Sony APS-379
Thread-Index: AQHcwkooU7aXFpGjtUmacAZ76cSkdbXKuyMAgAu/hwA=
Date: Thu, 9 Apr 2026 21:02:43 +0000
Message-ID: <20ea1c7b-d7d4-4f29-a0f0-c8a8b5a1076d@alliedtelesis.co.nz>
References: <20260402024101.4136697-1-chris.packham@alliedtelesis.co.nz>
 <cce0e8c4-8df3-408c-b3ac-6ede3c4b2cf0@roeck-us.net>
In-Reply-To: <cce0e8c4-8df3-408c-b3ac-6ede3c4b2cf0@roeck-us.net>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <EA60C1FF54D4AE4B8A8566161038CF02@alliedtelesis.co.nz>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=EcprQ+mC c=1 sm=1 tr=0 ts=69d813f3 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=drD7vYo3kbIA:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=c92rfblmAAAA:8 a=DqNkSbqnGu-f0Yt-4CcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvGzcOZaWPEFPQC_NcjD:22
X-SEG-SpamProfiler-Score: 0
X-Spamd-Result: default: False [-2.06 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[alliedtelesis.co.nz,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[alliedtelesis.co.nz:s=mail181024];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13181-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,sashiko.dev:url,alliedtelesis.co.nz:dkim,alliedtelesis.co.nz:mid];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[alliedtelesis.co.nz:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Chris.Packham@alliedtelesis.co.nz,linux-hwmon@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CE2CF3CFCC4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

DQpPbiAwMi8wNC8yMDI2IDIzOjM4LCBHdWVudGVyIFJvZWNrIHdyb3RlOg0KPiBPbiA0LzEvMjYg
MTk6NDAsIENocmlzIFBhY2toYW0gd3JvdGU6DQo+PiBUaGlzIHNlcmllcyBhZGQgc3VwcG9ydCBm
b3IgdGhlIFBNQnVzIGh3bW9uIG9uIHRoZSBTb255DQo+PiBBUFMtMzc5IHBvd2VyIHN1cHBseSBt
b2R1bGUuIFRoZXJlJ3Mgc29tZSBkZXZpYXRpb25zIGZyb20NCj4+IHRoZSBQTUJ1cyBzcGVjaWZp
Y2F0aW9uIHRoYXQgbmVlZCB0byBiZSBkZWFsdCB3aXRoLg0KPj4NCj4+IENocmlzIFBhY2toYW0g
KDIpOg0KPj4gwqDCoCBkdC1iaW5kaW5nczogdHJpdmlhbC1kZXZpY2VzOiBBZGQgc29ueSxhcHMt
Mzc5DQo+PiDCoMKgIGh3bW9uOiBwbWJ1czogQWRkIHN1cHBvcnQgZm9yIFNvbnkgQVBTLTM3OQ0K
Pj4NCj4+IMKgIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RyaXZpYWwtZGV2aWNlcy55YW1swqAg
fMKgwqAgMiArDQo+PiDCoCBEb2N1bWVudGF0aW9uL2h3bW9uL2Fwcy0zNzkucnN0wqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNTggKysrKysrDQo+PiDCoCBEb2N1bWVudGF0aW9uL2h3
bW9uL2luZGV4LnJzdMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDEgKw0K
Pj4gwqAgZHJpdmVycy9od21vbi9wbWJ1cy9LY29uZmlnwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoMKgIDYgKw0KPj4gwqAgZHJpdmVycy9od21vbi9wbWJ1cy9NYWtlZmls
ZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMSArDQo+PiDCoCBkcml2
ZXJzL2h3bW9uL3BtYnVzL2Fwcy0zNzkuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHwgMTc4ICsrKysrKysrKysrKysrKysrKw0KPj4gwqAgNiBmaWxlcyBjaGFuZ2VkLCAyNDYgaW5z
ZXJ0aW9ucygrKQ0KPj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vaHdtb24v
YXBzLTM3OS5yc3QNCj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2h3bW9uL3BtYnVz
L2Fwcy0zNzkuYw0KPj4NCj4NCj4gU2FzaGlrbyBzdGlsbCBkb2Vzbid0IGxpa2UgaXQuDQo+DQo+
IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDQwMjAyNDEwMS40MTM2Njk3LTEt
Y2hyaXMucGFja2hhbSU0MGFsbGllZHRlbGVzaXMuY28ubnogDQo+DQoNCkp1c3Qgb3V0IGlmIGlu
dGVyZXN0IGlzIHRoaXMgc29tZXRoaW5nIEkgc2hvdWxkIGJlIGxvb2tpbmcgdG8gcnVuIGJlZm9y
ZSANCnN1Ym1pdHRpbmc/IEkgd2FzIHB1dCBvZmYgYnkgdGhlIGxvdyBxdWFsaXR5IHJlc3VsdHMg
KGFuZCBkdWJpb3VzIA0KbGljZW5zZSkgb2Ygc29tZSBvZiB0aGUgZWFybGllciBBSSBjb2RlIGFz
c2lzdGFudHMgc28gSSB0ZW5kIHRvIGF2b2lkIA0KdGhlbS4gVGltZSB0byByZXZpc2l0IHBlcmhh
cHMuDQoNCj4NCj4gLSBZZXMsICJleHRyYWN0ZWQgd2hpbGUgcHJvYmluZyIgaXMgbm8gbG9uZ2Vy
IGFjY3VyYXRlLg0KPiDCoCBNYXliZSBhZGQgYSBjb21tZW50IGV4cGxhaW5pbmcgdGhhdCB0aGUg
ZXhwb25lbnQgaXMgY29uc3RhbnQuDQo+IMKgIE1heWJlIGV2ZW4gdXNlIGEgZGVmaW5lID8gVGhh
dCB3b3VsZCBtYWtlIHN0cnVjdCBhcHNfMzc5X2RhdGENCj4gwqAgdW5uZWNlc3NhcnkuDQpJIGtl
cHQgaXQgZm9yIHR3byByZWFzb25zLiAxKSB0aGUgbXA1OTkwLmMgSSBjb3BpZWQgaXQgZnJvbSBo
YWQgaXQuIDIpIA0KaXQgbGVhdmVzIHRoZSBkb29yIG9wZW4gZm9yIGhhdmluZyBzb21ldGhpbmcg
dGhhdCB1c2VzIGEgZGlmZmVyZW50IA0KZXhwb25lbnQgKHBvc3NpYmx5IGFkanVzdGVkIGF0IHJ1
biB0aW1lKS4gSXQncyBub3QgcmVhbGx5IG5lZWRlZCBzbyBJJ20gDQpoYXBweSB0byByZXBsYWNl
IGl0IHdpdGggYSBkZWZpbmUuDQo+IC0gUmVqZWN0aW5nIHZpcnR1YWwgcmVnaXN0ZXJzOiBXaHkg
aW5kZWVkID8gSXMgdGhlcmUgYSByZWFzb24gPw0KDQpDb3B5IGFuZCBwYXN0ZSBzdHJpa2VzIGFn
YWluLiBJIHNob3VsZCBwcm9iYWJseSByZW1vdmUgdGhlIHNhbWUgdGhpbmcgDQpmcm9tIHRoZSBi
cGEtcnM2MDAuYyAoSSdsbCBuZWVkIHRvIGZpbmQgb25lIGFyb3VuZCBoZXJlKS4NCg0KPg0KPiBU
aGFua3MsDQo+IEd1ZW50ZXINCj4=

