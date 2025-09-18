Return-Path: <linux-hwmon+bounces-9042-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C35B1DE6B
	for <lists+linux-hwmon@lfdr.de>; Thu,  7 Aug 2025 22:47:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C07F81AA515E
	for <lists+linux-hwmon@lfdr.de>; Thu,  7 Aug 2025 20:47:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDA3822A813;
	Thu,  7 Aug 2025 20:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="MPZjXgtF"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769A319D8BC
	for <linux-hwmon@vger.kernel.org>; Thu,  7 Aug 2025 20:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754599616; cv=none; b=ZkYP8e40Y6YAjvMMbEi7xEm5DshMUnoF4t0KdTluFOFA26/w9h3ehDh2DlYwRuHtwjAQShg8qvbXIBonV6HjJEcxPq9if76K2Dj6eRdAjQROhCFiDKTM0HMHqAoVHm2ltjqnTcFuDyGmpIcBvMvLT+6UuTfngKWeOjZedPXQjfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754599616; c=relaxed/simple;
	bh=vzQJIxOyvtaSGj/jbVB/03Zj2Ik1zNa5Q8MAcONp1Qs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QTQ3bC5c+7MPVSxMjT93kZgJp+ptCZZddDvEC/Ol9P0fy3O1srRlnNc20Lw26+87yW2uZoIAckxW2iAv5EQayX94p7IJrsodhlXLf6eYAGTjqbPqaUF8OSM5HN5b9x+4eEmIE5OOvd4TLqbv80iLTFkBZiCFlKx5kiu9Otu3lE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=MPZjXgtF; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 8B0D22C0380;
	Fri,  8 Aug 2025 08:46:46 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1754599606;
	bh=vzQJIxOyvtaSGj/jbVB/03Zj2Ik1zNa5Q8MAcONp1Qs=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=MPZjXgtFIm9qtGhe9ypxvQbhJUUJZQP694nI3hMphrFCME+vBCK6lZRrHPWHQVj7R
	 unrT1H4Z8A6kei3LXJy2o9hjE0mSv19ntKSO67pr0aXRXm74Jt4zCQvZmglv49oFCZ
	 jzhP95OXwaKXZsiSkmNHsSXZl/TEXruZ9ilbd+swWo5oUeV4qdFqM/N3hNvju9nAIf
	 c/eZ2YhhfbW1uwRnb8rZfq1Yn6mIATRitMa1xoXOtBfWGlgVhK5Lr91Op/lRR8hCcN
	 d8YickZ0aDBskN4pVfVDpia2l9C2V7Llc91DO0t90cfaGiZvFcBfUzT90yCEXKp1zq
	 kWfrUSvV/Is2w==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B689510b60001>; Fri, 08 Aug 2025 08:46:46 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 8 Aug 2025 08:46:46 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.014; Fri, 8 Aug 2025 08:46:46 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Krzysztof Kozlowski <krzk@kernel.org>, "jdelvare@suse.com"
	<jdelvare@suse.com>, "linux@roeck-us.net" <linux@roeck-us.net>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: ti,ina780a: Add INA780 device
Thread-Topic: [PATCH 1/2] dt-bindings: hwmon: ti,ina780a: Add INA780 device
Thread-Index: AQHcBmxCt+SrkQ5FO0yUSehdXPy4o7RUYcsAgAKA+QA=
Date: Thu, 7 Aug 2025 20:46:46 +0000
Message-ID: <aa814850-79ee-4c88-87d8-a3d70036ef2d@alliedtelesis.co.nz>
References: <20250806005127.542298-1-chris.packham@alliedtelesis.co.nz>
 <f2972a86-f58d-4360-b43a-486377b101e1@kernel.org>
In-Reply-To: <f2972a86-f58d-4360-b43a-486377b101e1@kernel.org>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <5013EBC79F904E43957BD7E299C2A2B4@alliedtelesis.co.nz>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=dtt4CEg4 c=1 sm=1 tr=0 ts=689510b6 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=qGlVGA7JKaW9HrnRmssA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0

DQpPbiAwNi8wOC8yMDI1IDE4OjMyLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOg0KPiBPbiAw
Ni8wOC8yMDI1IDAyOjUxLCBDaHJpcyBQYWNraGFtIHdyb3RlOg0KPj4gKw0KPj4gK3Byb3BlcnRp
ZXM6DQo+PiArICBjb21wYXRpYmxlOg0KPj4gKyAgICBlbnVtOg0KPj4gKyAgICAgIC0gdGksaW5h
NzgwYQ0KPj4gKyAgICAgIC0gdGksaW5hNzgwYg0KPj4gKw0KPj4gKyAgcmVnOg0KPj4gKyAgICBt
YXhJdGVtczogMQ0KPg0KPiBUaGlzIGxvb2tzIGEgYml0IGluY29tcGxldGUuIFdoZXJlIGlzIGEg
c3VwcGx5PyBObyBzaHVudCByZXNpc3Rvcg0KPiBjaG9pY2U/IE5vIG90aGVyIHByb3BlcnRpZXMg
ZnJvbSBpbmEyeHggYXBwbHk/DQpUaGlzIGNoaXAgZG9lc24ndCBuZWVkIGEgc2h1bnQgc28gcHJl
dHR5IG11Y2ggYWxsIHRoYXQgaXMgcmVxdWlyZWQgaXMgDQpjb21wYXRpYmxlICsgcmVnLiBHdWVu
dGVyIGRpZCBtZW50aW9uIHJvbGxpbmcgdGhpcyBpbnRvIHRoZSBleGlzdGluZyANCmluYTIzOCBk
cml2ZXIgKGFuZCBpbmEyeHggYmluZGluZykgc28gSSdtIGxvb2tpbmcgYXQgdGhhdCByaWdodCBu
b3cuIEknbSANCmFsc28gdGhpbmtpbmcgYWJvdXQgZHJvcHBpbmcgdGhlIEEgdnMgQiBkaXN0aW5j
dGlvbi4gVGhleSBhcmUgb3JkZXJpbmcgDQpvcHRpb25zIHRoYXQgZG8gaW1wYWN0IHRoZSBhY2N1
cmFjeSBvZiB0aGUgQURDIGJ1dCBkcml2ZXIgd2lzZSB0aGV5IA0KYmVoYXZlIHRoZSBzYW1lLg==

