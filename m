Return-Path: <linux-hwmon+bounces-14147-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGSNH15cB2oN0QIAu9opvQ
	(envelope-from <linux-hwmon+bounces-14147-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 15 May 2026 19:48:14 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F259A5558E1
	for <lists+linux-hwmon@lfdr.de>; Fri, 15 May 2026 19:48:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5B8A23100D64
	for <lists+linux-hwmon@lfdr.de>; Fri, 15 May 2026 16:48:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42F034C6EEE;
	Fri, 15 May 2026 16:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JPIvQcHa"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3BC4C6EE3;
	Fri, 15 May 2026 16:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778863733; cv=none; b=PRrVcQL2Vp2ayROFOAtIedGrGusQySVda/54AlXhNkho9XkErMvUhssHcd1JcJ2tMCRL1wGeIcbuYe+G3VQtuQcZDdiA8smKxB2XmKKWC5uWMdg/Ys51F62ygF1ck9dhYzzYHEiFYtOhem5gc+jbOKF+4nASuYVITIcFkMCOZc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778863733; c=relaxed/simple;
	bh=ydeO6pbhPsSTDy08iF5L9BvTw26BZ6WQggBk9NY2ZMA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mGHb20+BAm4xa7bbB9z0ygfZm5RiFfOc3eXRnXYWRrHMUzNb4C/fvTqp7axPvW4xHMMEa+FvSgGEaBhymU3Kc1z0IQJLi+FOZu5+45NwcAmCmbZEvh0wPcHfmJzAqehHOMS8CUFaj0EaNTBCddZAS6ia4/Y5V2hn48PcyIAI8K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JPIvQcHa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6848BC2BCB0;
	Fri, 15 May 2026 16:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778863732;
	bh=ydeO6pbhPsSTDy08iF5L9BvTw26BZ6WQggBk9NY2ZMA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=JPIvQcHaR3OcaTbYhvnnXgUW3ezb08rBasc2Ah9nIXasFKXBnr7XVwd5qriND6fCD
	 KZNcHeUQxZf7wtSGDswgr2GHMNVYHo+wPjEBtpBo9ssedAfl6+j/agTXbqglso10tk
	 9BZL9eeSUwQ6vfmOSIPMu+oEUNGU0oAZjC/9f9uFnKfmiQXutTI+F2ue9gcx0dGkjE
	 Nwln8pmy7KaMpHiIisepo3FelrD07OqTIdxQxu52zJH7uW0opUW14oYPFrndkZD4wJ
	 H82NxXG8Gw+zqOJjGgnGJccuoE3uOofMLMOEGZAFZ5BN/wW7yAhQN4Y2/WBBH/5MKa
	 AXPwCSprFi9rQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 2/6] mfd: add NXP MC33978/MC34978 core driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oleksij Rempel" <o.rempel@pengutronix.de>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260515160537.115808-3-o.rempel@pengutronix.de>
References: <20260515160537.115808-3-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 16:48:51 +0000
Message-Id: <20260515164852.6848BC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: F259A5558E1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,smtp.kernel.org:mid,sashiko.dev:url,lists.linux.dev:replyto];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-14147-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Action: no action

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Sustained hardware faults cause a 100% CPU lockup in the event han=
dling loop.
- [Medium] Transient fault detection logic is dead code due to pipelined SP=
I dummy fetch filtering.
--

commit a9e570c4deed793a38c78aa7e88c2bfc68e7b1cd
Author: Oleksij Rempel <o.rempel@pengutronix.de>

    mfd: add NXP MC33978/MC34978 core driver

Add core Multi-Function Device (MFD) driver for the NXP MC33978 and MC34978
Multiple Switch Detection Interfaces (MSDI).

> diff --git a/drivers/platform/misc/mc33978-core.c b/drivers/platform/misc=
/mc33978-core.c
> index 0000000000000..287b524aed98a
> --- /dev/null
> +++ b/drivers/platform/misc/mc33978-core.c

[ ... ]

> 	/*
> 	 * Transient fault detection (=C2=A79.10.27): FAULT_STAT latches on fault
> 	 * occurrence and persists until Fault register (0x42) read clears it.
> 	 * Hwmon driver reads Fault register, which triggers regmap SPI read with
> 	 * pipelined frames: REQ frame (old response, FAULT_STAT=3D1 latched) and
> 	 * PIPE frame (Fault register response clears latch). If fault condition
> 	 * cleared between latch and read, FAULT_STAT won't re-latch (datasheet:
> 	 * "immediately set again if condition still present").
> 	 *
> 	 * Transient detection: hw_flags contains harvested FAULT_STAT bit
> 	 * (latched evidence from REQ frame), but bus_fault_active=3D0 and
> 	 * cached_fault_active=3D0 (PIPE frame showed cleared, condition gone).
> 	 * This proves brief fault (VBATP voltage glitch, threshold oscillation)
> 	 * occurred and cleared before Fault register read. Edge-triggered
> 	 * consumers need this event notification.
> 	 *
> 	 * WAKE_BIT exclusion: WAKE_BIT is synthetic (bus_fault_active changes),
> 	 * not hardware evidence. Including it causes phantom transients when
> 	 * normal faults deassert (WAKE_BIT present but no actual transient).
> 	 */
> 	transient =3D !changed && !fault_active && !cached_fault &&
> 		    (hw_flags & MC33978_HI_BYTE_STAT_FAULT);

Is it possible that the transient fault detection logic is never executed?

Since mc33978_prepare_messages() hardcodes the dummy fetch for the PIPE fra=
me
to be MC33978_REG_CHECK, the REQ frame in the next SPI read will contain the
response to REG_CHECK.

However, mc33978_rx_decode() explicitly sets has_status =3D false for
MC33978_REG_CHECK and returns -ENODATA.

This skips status harvesting for the REQ frame in mc33978_spi_read(), meani=
ng
the latched FAULT_STAT evidence might never be harvested.

[ ... ]

> static void mc33978_process_single_event(struct mc33978_core_data *cdata)
> {
> 	unsigned int harvested;
> 	unsigned int pin_state;
> 	int ret;
>=20
> 	/*
> 	 * Grab harvested_flags BEFORE hardware read. Flags harvested during
> 	 * the read trigger another loop pass. This intentionally forces a
> 	 * redundant SPI read on most interrupts, but is necessary to prevent
> 	 * lost events when concurrent regmap access races with IRQ thread
> 	 * (hardware has clear-on-read INT_flg).
> 	 */
> 	harvested =3D atomic_xchg(&cdata->harvested_flags, 0);
>=20
> 	ret =3D regmap_read(cdata->map, MC33978_REG_READ_IN, &pin_state);
> 	if (ret)
> 		dev_err_ratelimited(&cdata->spi->dev, "failed to read pin state: %d\n",
> 				    ret);
> 	else
> 		mc33978_handle_pin_changes(cdata, pin_state);
>=20
> 	mc33978_handle_fault_condition(cdata, harvested);
> }
>=20
> static void mc33978_handle_events(struct mc33978_core_data *cdata)
> {
> 	guard(mutex)(&cdata->event_lock);
>=20
> 	do {
> 		mc33978_process_single_event(cdata);
> 	} while (atomic_read(&cdata->harvested_flags) !=3D 0);

Can a sustained hardware fault cause a soft lockup in this event loop?

If a persistent physical fault exists, the hardware continuously latches
FAULT_STAT=3D1. The regmap_read() to MC33978_REG_READ_IN inside
mc33978_process_single_event() triggers mc33978_spi_read(), which then
calls mc33978_harvest_status().

Because mc33978_harvest_status() unconditionally adds
MC33978_HI_BYTE_STAT_FAULT back into cdata->harvested_flags, the
atomic_read(&cdata->harvested_flags) check would perpetually evaluate
to true.

> }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515160537.1158=
08-1-o.rempel@pengutronix.de?part=3D2

