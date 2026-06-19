Return-Path: <linux-hwmon+bounces-15222-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lh4bJq4cNWqtnAYAu9opvQ
	(envelope-from <linux-hwmon+bounces-15222-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 19 Jun 2026 12:40:46 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 096026A5451
	for <lists+linux-hwmon@lfdr.de>; Fri, 19 Jun 2026 12:40:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=DAWDVJR9;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15222-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15222-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7BC64300A7C5
	for <lists+linux-hwmon@lfdr.de>; Fri, 19 Jun 2026 10:40:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFB2A375F6C;
	Fri, 19 Jun 2026 10:40:43 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF96375F7B;
	Fri, 19 Jun 2026 10:40:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781865643; cv=none; b=VB+pmQvLEBW2QIjg5MGAi+eOl+rJMzFS8EhPSmdw2J5f256gLKADolt5gHVV6PVilaec3MeEW2s/dbzHzUtpt5HGBMa7WCsAJzLXx4wVRlyJSkId7Nx7+tLnaYpXVG3VfwDoyQ9ymCTdTCllV5sNJQnaOfRfkMsK48WlKsHDCTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781865643; c=relaxed/simple;
	bh=G5S3yYiin/z0EOfr+MSWdQ7+d2ulY5cBDUQ8yp63oDw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WraZa4K49d0/khFZkyfct152rblWFIQ3bEHdeSy5Y8k5+btehB3UtwqMVd7hhGKsPsNBu7NGrgP1pcviPXhAb4DMutIMm1mnrCGJwf9fMkN+1s9M4TQt5BZsZbt9Q+nMG2JwZIgTzy32AdDoJ9a2xUMt0aKoLL8ryV9mh+VICUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DAWDVJR9; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ED151F000E9;
	Fri, 19 Jun 2026 10:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781865641;
	bh=I6nYe2KbGP2oRm9jLDA21qTDRbxOSiqz77dbI6yQWkI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DAWDVJR9Vons3bOyrOF1WNtKRIIdfl1Ixm/bZoIbfEaZCtoGIni4999QTl3Fcw8fd
	 J2go863/3Ho2o/aHhdEkUEdNjzRQZoOf3ObZu+CdFjqKKiRGXpPItM40AMg1XKO5Rr
	 5lQMgL9KvTww95Xc7nh6WEgXGiGGZzuEISsoFr8fXBLDeRuN+tHc/IGHzr4Tf/I6fx
	 ywyHrkM1Kbmfk/jtrCH3HR42IXTANWRi11uSEBKOuNhB3E5K83zTka5n9P04ds1KOn
	 ophDW8inJzk/F9u5Yjp1X8Y5ZNhyGHHa+wy0jMfYqpq3PWkKPPtFYopIQk7o0QxbhY
	 vnxWVZuGfmtgA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: hwmon: Document SMSC
 EMC1402/1403/1404/1428
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260619103153.216444-2-clamor95@gmail.com>
References: <20260619103153.216444-1-clamor95@gmail.com>
 <20260619103153.216444-2-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Jun 2026 10:40:41 +0000
Message-Id: <20260619104041.8ED151F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-15222-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:clamor95@gmail.com,m:devicetree@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 096026A5451

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The device tree binding schema fails to correctly restrict the maxi=
mum number of channels for the `smsc,emc1402` and its variants (emc1412, em=
c1422, emc1442). By grouping it alongside `emc1403` under the `not` conditi=
on for `emc1404`/`emc1428`, it inadvertently sets the channel `reg` maximum=
 to 2 instead of 1.
--

commit 5a834c50ed998e304e4c00fb64e4e434cbd93896
Author: Svyatoslav Ryhel <clamor95@gmail.com>

dt-bindings: hwmon: Document SMSC EMC1402/1403/1404/1428

This commit documents the basic hardware layout of SMSC (now Microchip)
EMC1402/1403/1404/1428 thermal sensors.

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/smsc,emc1403.yaml

[ ... ]

> +allOf:
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                - smsc,emc1404
> +                - smsc,emc1428
> +    then:
> +      patternProperties:
> +        "^channel@([0-7])$":
> +          properties:
> +            reg:
> +              items:
> +                maximum: 2

[Severity: Low]
Does this conditional block correctly restrict the channel limits for the
smsc,emc1402 device and its variants (emc1412, emc1422, emc1442)?

By grouping the emc1402 variants with the emc1403 under the fallback
condition (not containing emc1404/emc1428), it applies a maximum reg value
of 2. This appears to allow up to 3 channels (0, 1, 2) to pass schema
validation.

Since the emc1402 hardware only supports 2 channels (local and 1 remote),
should there be a separate conditional for the emc1402 family setting the
maximum to 1?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260619103153.2164=
44-1-clamor95@gmail.com?part=3D1

