Return-Path: <linux-hwmon+bounces-14435-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BJGKNu1EGpDcwYAu9opvQ
	(envelope-from <linux-hwmon+bounces-14435-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 22 May 2026 22:00:27 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9F55B9D0A
	for <lists+linux-hwmon@lfdr.de>; Fri, 22 May 2026 22:00:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6B03D3081862
	for <lists+linux-hwmon@lfdr.de>; Fri, 22 May 2026 19:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4B4D37B007;
	Fri, 22 May 2026 19:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=jhbruhn.de header.i=@jhbruhn.de header.b="DTT9oP0e"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mailgate02.uberspace.is (mailgate02.uberspace.is [185.26.156.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1833803CE
	for <linux-hwmon@vger.kernel.org>; Fri, 22 May 2026 19:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.26.156.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779479739; cv=none; b=P0QJuZ+NzXLxIYSlIlWgih377TXcfFHa7EZZr+mOPO4tIA2BxKwqGcUCDyCTdGOT/EExf3Z8X2ux3c9C0IGhu8kYtzXfXX0vU8071eQAl0GCQNAIC/K6slrTfN2QfPTzAqxLbDFjMal4Yb19atZR7dwkQ4ZzEZ1sDA82mGfoSa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779479739; c=relaxed/simple;
	bh=RU7tJUy6YR589htDVpGYepLY8ticGFREps8kjabKsS4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Kkyi+wOPisqaEfrXX/qKBYImQF4c073Xjy9cnv8aS+V6VTWopvRsqs69UZiYuSx6Fhk2EMWW4BC9KmwdWGnL4ZuWyD3jW8QCvy5NbvygRVNSNCpfIql14u81TPU0/KQnUlxhmma1uphH3IzJAeam/j89V1sjJpi3fEBLODzfZgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jhbruhn.de; spf=pass smtp.mailfrom=jhbruhn.de; dkim=pass (4096-bit key) header.d=jhbruhn.de header.i=@jhbruhn.de header.b=DTT9oP0e; arc=none smtp.client-ip=185.26.156.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jhbruhn.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jhbruhn.de
Received: from boethin.uberspace.de (boethin.uberspace.de [185.26.156.96])
	by mailgate02.uberspace.is (Postfix) with ESMTPS id 0856917F6BD
	for <linux-hwmon@vger.kernel.org>; Fri, 22 May 2026 21:55:36 +0200 (CEST)
Received: (qmail 21899 invoked by uid 990); 22 May 2026 19:55:35 -0000
Authentication-Results: boethin.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unknown) (::1)
	by boethin.uberspace.de (Haraka/3.1.1) with ESMTPSA; Fri, 22 May 2026 21:55:35 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 22 May 2026 21:55:35 +0200
Message-Id: <DIPGX4X5HPQE.3JL4QV0Z4R8AL@jhbruhn.de>
Cc: <linux-hwmon@vger.kernel.org>, <sashiko-reviews@lists.linux.dev>
Subject: Re: [PATCH] hwmon: (lm63) expose PWM frequency and LUT hysteresis
 as writable
From: "Jan-Henrik Bruhn" <hi@jhbruhn.de>
To: "Guenter Roeck" <linux@roeck-us.net>, "Jan-Henrik Bruhn"
 <kernel@jhbruhn.de>, <sashiko-bot@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260522142850.E67A01F000E9@smtp.kernel.org>
 <20260522184748.3104415-1-kernel@jhbruhn.de>
 <07e1194f-4935-4713-a4c1-6b587e9aaf75@roeck-us.net>
In-Reply-To: <07e1194f-4935-4713-a4c1-6b587e9aaf75@roeck-us.net>
X-Rspamd-Bar: /
X-Rspamd-Report: BAYES_HAM(-0.000197) MIME_GOOD(-0.1) MV_CASE(0.5)
X-Rspamd-Score: 0.399802
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=jhbruhn.de; s=uberspace;
	h=from:to:cc:subject:date;
	bh=RU7tJUy6YR589htDVpGYepLY8ticGFREps8kjabKsS4=;
	b=DTT9oP0ePi4b3QjZ+wz8t1dexuYIfzDhzP7RTZthhVkWl0r6l9uO7hw5M/rfQVSzp4eU2uN+oa
	uCYAVikrO4N4YiWrl+uG8BdDFic2OfFPcP4fkxsp8swi+up0TOtlhdNhHsbKaZO4TlXi/bk6xpqg
	Qk/jsEWS08CVQx8RKhPN2S7fB8P+BRYG5APM9rJ3gOLVp5zkL3/sY4QeL6iFUAsu6XwiteRSPNtC
	jftbArqmT9hu7e0R/PcwUl/JyZal9WeW6M2UobTCMLRGSvOv+881iIAplOEIBRdopWwUtWOzOYL2
	+pCpASQsqxyp1vyDhxEABxPi0+VPptBGZ2Fq+EqAl+SwyYxwSdfWRRuJMjm5c9rkkjDZavwNjMJ0
	K89h2sXL4VC7PYnHTRnC23Wr9jMzZtJ/Mm6scAo2nPKKxUuzZ5mZ6CiIcEflxGNqthcvRG7JDTc3
	CJDstuhWHAgXCaAiSnJve3cHa8vKGVG6tT6jLQNYyiovB/Z+MMEDLrC+7s0zgGj5eFKR63iivru4
	9jLullufkVcFk3SPL+UGNmIJs7/LeSXkLPIHOlwSUB7awVfEox3Y75U33+A2l+KnBYAtDRYtunLn
	VdOReqd9WOGvbrFixr87PKRFq+B4SO5d870h+3ENYyERW+D/J39U8z4KwfKLbkRk2ej45R0aFApu
	k=
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[jhbruhn.de:s=uberspace];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14435-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[jhbruhn.de:+];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[jhbruhn.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hi@jhbruhn.de,linux-hwmon@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.990];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,jhbruhn.de:mid,jhbruhn.de:dkim]
X-Rspamd-Queue-Id: 1B9F55B9D0A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> Interesting declaration. This isn't about accepting your patch as-is or n=
ot,
> but please explain why you think that fixing bugs would be out of scope f=
or
> this (or any other) driver.

Valid point, I framed that wrong - I wanted to stay consistent with the exi=
sting=20
error handling in this driver, but that isn't a good excuse to skip over po=
tential bugs
when adding new functionality.

I'll submit a v2 which propagates the read errors for the functions added i=
n this patch.

