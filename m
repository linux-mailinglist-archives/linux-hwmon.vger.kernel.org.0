Return-Path: <linux-hwmon+bounces-15242-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3Hz8DnQrOWpunwcAu9opvQ
	(envelope-from <linux-hwmon+bounces-15242-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 22 Jun 2026 14:32:52 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 884516AF75E
	for <lists+linux-hwmon@lfdr.de>; Mon, 22 Jun 2026 14:32:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=NhZRkgmx;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15242-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15242-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 91BE73006B6F
	for <lists+linux-hwmon@lfdr.de>; Mon, 22 Jun 2026 12:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE7A83A9D95;
	Mon, 22 Jun 2026 12:32:07 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4003A9D9D;
	Mon, 22 Jun 2026 12:32:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782131527; cv=none; b=aD7pKfXgSRrGIpSmTvqGoPu9aGYmfmu9bLk/slQRHfgHthfpGx4nN+9UDilFwVUvZU2EqsFAhxtIMJ4YjhQBVRHNc/jpH0uT28V7ffDDzOjY4F4+59qKdXKPJfqZZ3FbPpFA19HMaTQ9j3fjtoop87KCvpYCtCl+rkCPmPGbSho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782131527; c=relaxed/simple;
	bh=04evc0QY9MwjCJ8HE6hm4vp8J6NmEVAwZvA5kdbf5yc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Mtd4hYVRsxecbyugRZQKKLHm2rg9FbDzLzlHxf49W9t9vc5V8idyRIQIgJ99qCZnD/DbAb4n0Mt4QkRBPAHQcM8UlUYRKTg1SIgN6aq0BeRwlpMa+hPMuUGfAZOf/80hYMpqtPV9EawkV0ShbX3En184mg4bvKNJKE2O+hJxSUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NhZRkgmx; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 593E41F000E9;
	Mon, 22 Jun 2026 12:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782131526;
	bh=VbXpqg6+W1jS9mSu1VviztJS3nelMMwwn4jOuQsl9X0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NhZRkgmxG28kGyX5qyDp5ah5N9Q1T93ga5VsltxM7742cWEF50SyIuaoUNQPrCdij
	 Wx9811afR1lsM7jScfBrhx7NCYtoRfmMYtpBl4rfwnvuyTGQhNHe8T98dESFDDHpSN
	 DRaYRsiavfFF7IzGJsgQ5olFqRA8vfWtnn3ywDsgRpkLIz5jfoB2joteuTI0EPm6VU
	 m8P5LJsCioBhM6zTim73tvB4MdPGHTgBwb3CpjpAAnXSwQ/FJJcnGmr6TLZyPc/uUZ
	 qmwIuJYYZIGae8/oEDY7/XrTh3O7YPt1vULEtK42XS1dEZXZE8IMjnKUDDss4Zw476
	 wYNMUb2RBfMyw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: chipcap2: Add label property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Flaviu Nistor" <flaviu.nistor@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260622122200.14245-1-flaviu.nistor@gmail.com>
References: <20260622122200.14245-1-flaviu.nistor@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 22 Jun 2026 12:32:05 +0000
Message-Id: <20260622123206.593E41F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:flaviu.nistor@gmail.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:flaviunistor@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-15242-lists,linux-hwmon=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,smtp.kernel.org:mid,sashiko.dev:url,lists.linux.dev:replyto];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 884516AF75E

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] The 'label' property description incorrectly refers to 'this channe=
l', but the property is applied to the top-level device node.

Pre-existing issues:
- [High] Threaded interrupt handlers modify shared state without holding an=
y locks, violating hwmon subsystem guidelines and causing potential loss of=
 alarm events.
--

commit 6b42d122bc193119c40ff5ee9be18fcec09fc567
Author: Flaviu Nistor <flaviu.nistor@gmail.com>

dt-bindings: hwmon: chipcap2: Add label property

Add support for an optional label property similar to other hwmon devices.
This allows, in case of boards with multiple CHIPCAP2 sensors, to assign
distinct names to each instance.

> diff --git a/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.ya=
ml b/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.yaml
> index 17351fdbefce6..f00b5a4b14ddd 100644
> --- a/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.yaml
> @@ -33,6 +33,10 @@ properties:
>    reg:
>      maxItems: 1
> =20
> +  label:
> +    description:
> +      A descriptive name for this channel, like "ambient" or "psu".

[Severity: Low]
Is this description accurate? The label property is being added to the
root node, so it applies to the entire device/instance rather than a single
channel.

The chipcap2 sensor provides multiple channels via a single device
node. Could the description be updated to clarify it names the entire sensor
rather than a single channel?

> +
>    interrupts:
>      items:
>        - description: measurement ready indicator

[Severity: High]
This is a pre-existing issue, but does drivers/hwmon/chipcap2.c lack
locking between the threaded interrupt handlers and the sysfs paths, which
could lead to lost alarm events?

The threaded interrupt handlers modify shared state without holding any
locks, which violates hwmon subsystem guidelines.

If an interrupt fires between the sysfs read and write:

CPU1 in drivers/hwmon/chipcap2.c:cc2_humidity_min_alarm_status() {
	...
	if (data->rh_alarm.low_alarm) {
		*val =3D (measurement < min_hyst) ? 1 : 0;

CPU2 in drivers/hwmon/chipcap2.c:cc2_low_interrupt() {
		cc2->rh_alarm.low_alarm =3D true;
}

CPU1 continues:
		data->rh_alarm.low_alarm =3D *val;
	} else {
		*val =3D 0;
	}
	...
}

The interrupt's update will be overwritten with 0 and permanently lost. The
hwmon subsystem guidelines require drivers to implement locking for interru=
pt
handling and sysfs attributes, recommending the use of hwmon_lock() and
hwmon_unlock().

Could this concurrent access to data->rh_alarm.low_alarm be protected?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260622122200.1424=
5-1-flaviu.nistor@gmail.com?part=3D1

