Return-Path: <linux-hwmon+bounces-15094-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id il+SJ5NuL2prAQUAu9opvQ
	(envelope-from <linux-hwmon+bounces-15094-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 15 Jun 2026 05:16:35 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 883E7682FFA
	for <lists+linux-hwmon@lfdr.de>; Mon, 15 Jun 2026 05:16:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=E1+3FUtY;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15094-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15094-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 76FEE3001395
	for <lists+linux-hwmon@lfdr.de>; Mon, 15 Jun 2026 03:16:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53EFA247DE1;
	Mon, 15 Jun 2026 03:16:30 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C8B26982C;
	Mon, 15 Jun 2026 03:16:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781493390; cv=none; b=VmGTXF5ImkRNWILHPJ3+LTDewcx9yoPHQpiXjrgTANGgntObxjfdEqas6Y9Zhps+eza1CqALftzHSLg46GjksBksWBtnJa1iwB6hYfMfCNImfN23QCEzOeBmJysc6c+Ni1Bd++Xcr8NyXNhYsCC9eMWlGYUIfLnnZvyPmNtTDeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781493390; c=relaxed/simple;
	bh=PFpGZidSVQjimOaL2vDKRl1y1HKxqH7Hj0VhniYDgsg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fz277D5r+tjAaY/LJDrwIdUfsznmry+9yatu0R6zSbu12I3SET1kps7K2TxUrFFH5xq5l5OnTiDo2RmbTrefdqf/FOBppe2Kv0n49tV3j2juRuwfe7q364byPCo6T4hAKEtJJ6IfQQhiXPi0S0sJfkHFn7FRj6f/ZHbUWXd21+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E1+3FUtY; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADC9C1F000E9;
	Mon, 15 Jun 2026 03:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781493388;
	bh=Sm7t8Ur2gQif0wUOLSUr8qNZ070V9OrK4WH2OX6A61E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E1+3FUtYg7BrHDzv4ixTszQKucPBBQCr/93tjATgvFWlUX69SHPntasSwAxWIeXoH
	 3ogfPtJI+Ldpy5/i+cQLL2KVRzT252RARZsLAPvT6eKKRScahrYQYD7B8pp1SjL3sV
	 juOqGtj4gibvreJ5ECvJFBkZJWW/oWPXHPjKyd9Ckly/EyJoVDeNeOlPO9Yipfg0sZ
	 QQAUrRE/84phstBjkhPK7gn9S3UmypgQvnhw0KjLtNr91evNnHFIOlvkwVvOOeiTQJ
	 G6OoT/JCEvnRXUbyy/JgYLb7M166raJb0908KYaX0ZH8kw81R+HBxV302CIpmH9xU6
	 muJfs6mG5y1Rw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: ti,lm25066: add
 current limit properties
Reply-To: sashiko-reviews@lists.linux.dev
To: "Potin Lai" <potin.lai.pt@gmail.com>
Cc: conor+dt@kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260615-lm25066-cl-config-v2-1-59be46e67d5a@gmail.com>
References: <20260615-lm25066-cl-config-v2-1-59be46e67d5a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 03:16:28 +0000
Message-Id: <20260615031628.ADC9C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:potin.lai.pt@gmail.com,m:conor+dt@kernel.org,m:linux-hwmon@vger.kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:potinlaipt@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-15094-lists,linux-hwmon=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,lists.linux.dev:replyto];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 883E7682FFA

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Device Tree Schema Type Conflict: The new `ti,current-limit` proper=
ty is defined as a string, which conflicts with its existing global definit=
ion as a `uint32`.
--

commit 2d0e259557c772018da03b728b427c7fa9a267ca
Author: Potin Lai <potin.lai.pt@gmail.com>

dt-bindings: hwmon: pmbus: ti,lm25066: add current limit properties

This commit adds a 'ti,current-limit' string property to configure the
device's Current Limit (CL) behavior to "high" or "low". It also disables
this property for the LM25056 variant, which does not support software
configuration for the current limit.

> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yam=
l b/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml
> index a20f140dc79a6..53ee98e871ffc 100644
> --- a/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml
> @@ -46,12 +46,30 @@ properties:
> =20
>      additionalProperties: false
> =20
> +  ti,current-limit:
> +    description: |
> +      Configure the current limit setting. When present, this property
> +      overrides the hardware setting of the physical CL pin by configuri=
ng
> +      the register.
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum:
> +      - low
> +      - high

[Severity: Low]
Does this introduce a global schema type conflict?

Device Tree schema tooling requires property names to have consistent primi=
tive
types globally. The property ti,current-limit is already defined as a uint3=
2 in
other Texas Instruments bindings (such as power/supply/bq2415x.yaml).

Redefining it here as a string breaks make dt_binding_check validation. Wou=
ld
it be possible to rename this property (for example, ti,current-limit-setti=
ng)
to resolve the collision?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615-lm25066-cl=
-config-v2-0-59be46e67d5a@gmail.com?part=3D1

