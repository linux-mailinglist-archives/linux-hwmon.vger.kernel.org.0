Return-Path: <linux-hwmon+bounces-15665-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id F0YkAnLwTWp1AQIAu9opvQ
	(envelope-from <linux-hwmon+bounces-15665-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 08 Jul 2026 08:38:42 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6336A7223D0
	for <lists+linux-hwmon@lfdr.de>; Wed, 08 Jul 2026 08:38:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=kdw3LYHA;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15665-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15665-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A9E431018AA
	for <lists+linux-hwmon@lfdr.de>; Wed,  8 Jul 2026 06:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C08613D6CA0;
	Wed,  8 Jul 2026 06:31:38 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A734B3C10AF;
	Wed,  8 Jul 2026 06:31:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783492298; cv=none; b=aUY5f6CWTQAF+l+avG+gmFJ3uUagp8AoxSmdEebrNsI00NgrhX6Rzy3OAsbs97X9xiOCu3o48MEGfR+P1+weY4MuWpobb55Wslk5lUZ6XhM4L1JLv0YBbYgM7Fe8oYd1ll46VJogVxZZLcRQ13ptNCyHIVLd59NrDqbZratmJNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783492298; c=relaxed/simple;
	bh=GW7kjzvCHkN0F6hcZ2XNZtRvYOlaMgpM48rXa6yA7hI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AHz2+QGet4l6R+ljLesgrBFUcv+U5KN/UqMb3movD5WAgNbZkZLwk3n136GJagvXritojkRdmy0WYvoFeRmLWswtDISyDPUIgXoLU/yY8oFI8WRH24vqIVLnMMQtrByaqCW90fyfJFHQjb3hODQuFQ/0LZ2sE9AeEx+HXNs1eVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kdw3LYHA; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61D8C1F00AC4;
	Wed,  8 Jul 2026 06:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783492295;
	bh=TFxWpv5Dl4duzIlVOBl+hYOuxD7bCrgl8athjXIXPao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kdw3LYHAQufY9k4qcYF46tcbf8LkXqd85m8YvezHhtyVEJ2HbP9r2MJdKJDV0yIuN
	 sVo0tOcqdcazZt2/YooZOD+/tnuvjD+BWUI+rk5iwV0GtZS1l7v0dWL6AsqlL2i+yR
	 TYFSsSv1Xflh/vWmeaR4Tpn3g1LFYBb29FlqM0I0lgXV2twtXBSqtPEN6+FsPbV2VJ
	 qTLMQXhheNu1O+EDRGmPRcRUETh/l3G+U44ldkdhfDLrTpCIqruhzMpubn7NzC7UQ5
	 CaHaFEFVbWt89WsUvoroIDcX6k9eoQCtxBliqNgPJIzuQOzk5h2r0K7LAtDiqls5zH
	 e4Xm9Bp7tvAEQ==
Date: Wed, 8 Jul 2026 08:31:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v6 1/3] dt-bindings: embedded-controller: Add Lenovo
 ThinkPad T14s thermal sensor provider support
Message-ID: <20260708-copper-ant-from-hell-a7babd@quoll>
References: <20260707192228.14647-1-daniel.lezcano@oss.qualcomm.com>
 <20260707192228.14647-2-daniel.lezcano@oss.qualcomm.com>
 <20260707193005.3CEA11F000E9@smtp.kernel.org>
 <22c4909c-9d2e-4b49-bca2-f218e701138c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <22c4909c-9d2e-4b49-bca2-f218e701138c@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:daniel.lezcano@oss.qualcomm.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-hwmon@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-15665-lists,linux-hwmon=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quoll:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6336A7223D0

On Tue, Jul 07, 2026 at 11:34:53PM +0200, Daniel Lezcano wrote:
> On 7/7/26 21:30, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [Medium] The newly added '#thermal-sensor-cells' property is missing from the 'required' list.
> > --
> > 
> > --- Patch [1]: [PATCH v6 1/3] dt-bindings: embedded-controller: Add Lenovo ThinkPad T14s thermal sensor provider support ---
> > commit 48ae118884c307667e25a720a62e87b8e32443c5
> > Author: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> > 
> > dt-bindings: embedded-controller: Add Lenovo ThinkPad T14s thermal sensor provider support
> > 
> > This commit documents the Lenovo ThinkPad T14s Embedded Controller as a
> > thermal sensor provider by adding the #thermal-sensor-cells property. This
> > allows the EC temperature sensors to be referenced from thermal zones.
> > 
> > > diff --git a/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
> > > --- a/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
> > > +++ b/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
> > > @@ -26,6 +26,9 @@ properties:
> > >     wakeup-source: true
> > > +  "#thermal-sensor-cells":
> > > +    const: 1
> > > +
> > >   required:
> > >     - compatible
> > >     - reg
> > 
> > [Severity: Medium]
> > Should #thermal-sensor-cells be added to this required list?
> > 
> > When hardware gains new provider capabilities, omitting the corresponding
> > standard properties from the required list allows incomplete device tree
> > nodes to pass schema validation. Dependent thermal zones could fail at
> > runtime if they attempt to reference the embedded controller and the property
> > is missing.
> > 
> > [ ... ]
> 
> 
> If I'm not wrong it is a false positive
> 

Looks valid, my previous comment was not addressed, so you did not
document here the ABI which was implemented (at least after quick look
at hwmon code).

Best regards,
Krzysztof


