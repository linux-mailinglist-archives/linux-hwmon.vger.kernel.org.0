Return-Path: <linux-hwmon+bounces-15403-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id L4SICS4kQmqX0wkAu9opvQ
	(envelope-from <linux-hwmon+bounces-15403-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 29 Jun 2026 09:52:14 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 863616D72F7
	for <lists+linux-hwmon@lfdr.de>; Mon, 29 Jun 2026 09:52:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=OGBwN6rv;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15403-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15403-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B8C86303989B
	for <lists+linux-hwmon@lfdr.de>; Mon, 29 Jun 2026 07:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C23533E351;
	Mon, 29 Jun 2026 07:42:51 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3247533C188
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 07:42:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782718970; cv=none; b=IvVlKW8zE7RCjqYsVB7grWI6IMwtF7L6KVQZP/tN39A1bbHY6DX5Jx0H00H0UN+QxJ671lLSRxoQzJeb+IhxUgUVVwQZPj2e19AmlX8IAmyNQBQF4WzI1NOIXxV742hw48a+o7nx+LS9lFzFsRjFf7+hHrgFcF/OQhsaiEMcm/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782718970; c=relaxed/simple;
	bh=muO3hFFuHurnFQuMyAUdpKeRIGHyXoPqkhGBs/jhfxQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Jp6lU1qaDHHLudRfFnoUGVs7zmGJH5u3CxrHdzMf395/+X42ZCJxaW3/Cx7VG6E22sBKGdSNzKaz8RTmrvlcTsehRHGF6LDgJQt/2LNEL0BsbPW/6xzBQ3wL4/5ElyKwL31PoEM4PpUMc3DWS9WcyXO+EVWcSUTjNcSxoKaRJ1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OGBwN6rv; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7101B1F00A3A;
	Mon, 29 Jun 2026 07:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782718964;
	bh=xfkFQ1emdGG3hMy2pUEvIQG8T7PxmB+rFKYEL50TCPA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OGBwN6rvjsZtY7K5Uxl5OWqpfrxjh0qBUYiLjET8zP6Ir6WLKVZF+dotKVzwuUv6n
	 zTHHodTouEQ20xlOwkTXLUKiN51nQEhhQFEuNUTYYsAQq8eJdV28bF6Y4a725Mr81s
	 0l7GGNKWdzWWD7PEatTUoC189CRlkZ5GjTJpS8IF4vI4m4y4DcE/EGAAZ536/73Sp9
	 S20e7OKtZbZQDQ2GHAudzor+I6aZho6Fz1qSt+YyTzaKGwwYYTqz2wYA3eOyWpMRLW
	 1QWFwmzddUoCzi8/rpSiLD2QvRNWu8j9gpsO9DN/VlBFK3s8jEpOkAvetucttUzS/X
	 mMV4hwSqKihjg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] firmware: stratix10-svc: add async HWMON read
 commands and register socfpga-hwmon device
Reply-To: sashiko-reviews@lists.linux.dev
To: tze.yee.ng@altera.com
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <d8a647b3873f8e1ee6b3efb22b5aa34c34146ea5.1782715159.git.tze.yee.ng@altera.com>
References: <cover.1782715159.git.tze.yee.ng@altera.com>
 <d8a647b3873f8e1ee6b3efb22b5aa34c34146ea5.1782715159.git.tze.yee.ng@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 07:42:44 +0000
Message-Id: <20260629074244.7101B1F00A3A@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-15403-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:tze.yee.ng@altera.com,m:linux-hwmon@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-hwmon];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,vger.kernel.org:from_smtp,sashiko.dev:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,smtp.kernel.org:mid,altera.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 863616D72F7

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Child devices (hwmon, RSU, and OF-populated devices) are unregiste=
red after the async controller is torn down, leading to a Use-After-Free if=
 a child driver accesses transactions while the parent driver is being remo=
ved.
--

commit 34dda5913b8cf85802a76938265cc19235241f5c
Author: Tze Yee Ng <tze.yee.ng@altera.com>

firmware: stratix10-svc: add async HWMON read commands and register socfpga=
-hwmon device

This commit adds asynchronous read support for hardware monitor temperature
and voltage commands in the Stratix 10 service layer. It also registers a
socfpga-hwmon platform device when hardware monitor support is enabled.

> diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix1=
0-svc.c
> index c24ca5823078f..716b58f5a6170 100644
> --- a/drivers/firmware/stratix10-svc.c
> +++ b/drivers/firmware/stratix10-svc.c
[ ... ]
> @@ -2050,6 +2087,9 @@ static void stratix10_svc_drv_remove(struct platfor=
m_device *pdev)
> =20
>  	of_platform_depopulate(ctrl->dev);
> =20
> +	if (svc->stratix10_svc_hwmon)
> +		platform_device_unregister(svc->stratix10_svc_hwmon);
> +

[Severity: High]
This is a pre-existing issue, but does unregistering the child devices here
lead to a use-after-free if a user is actively accessing them?

Looking at stratix10_svc_drv_remove() in drivers/firmware/stratix10-svc.c,
stratix10_svc_async_exit(ctrl) is called before the child devices are
unregistered:

static void stratix10_svc_drv_remove(struct platform_device *pdev)
{
	...
	stratix10_svc_async_exit(ctrl);

	of_platform_depopulate(ctrl->dev);

	if (svc->stratix10_svc_hwmon)
		platform_device_unregister(svc->stratix10_svc_hwmon);
	...
}

If a user is actively reading a hwmon sysfs attribute during driver
unbind, the child driver could be blocked waiting or polling in
socfpga_hwmon_async_read().

Because stratix10_svc_async_exit() forcefully frees all pending
transaction handlers, and the child endpoints are still active at this poin=
t,
the polling child thread could wake up and call stratix10_svc_async_poll()
or stratix10_svc_async_done() using the now-freed transaction handler,
triggering a use-after-free.

Could we unregister the child devices before tearing down the async
controller to avoid this?

>  	platform_device_unregister(svc->stratix10_svc_rsu);
> =20
>  	for (i =3D 0; i < SVC_NUM_CHANNEL; i++) {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1782715159.gi=
t.tze.yee.ng@altera.com?part=3D1

