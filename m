Return-Path: <linux-hwmon+bounces-14867-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Dc0tKVPAJmp0cQIAu9opvQ
	(envelope-from <linux-hwmon+bounces-14867-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 08 Jun 2026 15:14:59 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D7B6567F9
	for <lists+linux-hwmon@lfdr.de>; Mon, 08 Jun 2026 15:14:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=YOVB1+AX;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-14867-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-14867-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2C34F301B3F1
	for <lists+linux-hwmon@lfdr.de>; Mon,  8 Jun 2026 13:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CC8337BE6D;
	Mon,  8 Jun 2026 13:13:28 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F61B37AA65
	for <linux-hwmon@vger.kernel.org>; Mon,  8 Jun 2026 13:13:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780924408; cv=none; b=ZPEoPBExS4EQAx/7UwLGiZlFSnRZGUtP4umAE0CFSnYZAGclzAP1L5tB9Bfb97ko0f13ZEZOenD3378+z45SZWC37t8avjf+dDVlDWgFuehXQPtmiScKPD2Y2afc02YaYVFy2EWbFZ4Uvx+5n2QguBqU7DWastdzYrdcqIFbQLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780924408; c=relaxed/simple;
	bh=GKK8Ixi+GHOnr+qaJ7bvGg7XDQ1Hbn/SzQbnLfpXmhg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Asjvd9lAtRQ/0FI8HVKVojwzH45bu/Ae5MSsgCf3QAU2r15prt8wprzfd9nG2CuRQL9317rhbiqVwwgk4Dtn57DUzFNX6k9i5y4G/3tRzTO52K1l8pFyyATqTI10p35pB0BDL2BgYL+SkUaMBV7UezYr6C0wpUITv7QK41GHfds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YOVB1+AX; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 159171F00893;
	Mon,  8 Jun 2026 13:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780924407;
	bh=GKK8Ixi+GHOnr+qaJ7bvGg7XDQ1Hbn/SzQbnLfpXmhg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YOVB1+AXSuxfcrvjsggrhDvRddn/vdutr7q5uJHA+M8MZZuPGwIBWY6PL/lVM3JgQ
	 C6pyTYa6uXHEHq+hFdYg8M7Zvv8uzo6P3AYuL5PDnqmQDxGWCRoqTj1fnepPVsWpzK
	 4pz/u2XzkmLGOpy9fV4mTek3F9L6Z4lC1k1j2rMPb+CIFPnSsDlhLvPbpxlAtHxo3f
	 N39icNXxImpPno2wIXaHxETMSX4bBHrgVGhsQMP9u8tlHMiVau8SzGOK9jueCwt/1R
	 5bpq+HECvgZz2LzgXfO9fENu51f9H5QdAIvxl6zgEWV972x49SpGKVTBLD9C9+BCRp
	 fmvEYx4uMvhFw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] hwmon: ina238: add update_interval_us attribute
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ferdinand Schwenk via B4 Relay" <devnull+ferdinand.schwenk.advastore.com@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260608-hwmon-ina238-update-interval-us-v2-v2-3-2d939fbb2ea1@advastore.com>
References: <20260608-hwmon-ina238-update-interval-us-v2-v2-3-2d939fbb2ea1@advastore.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 13:13:26 +0000
Message-Id: <20260608131327.159171F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-14867-lists,linux-hwmon=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:devnull+ferdinand.schwenk.advastore.com@kernel.org,m:linux-hwmon@vger.kernel.org,m:devnull@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,ferdinand.schwenk.advastore.com];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,smtp.kernel.org:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,advastore.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 35D7B6567F9

> From: Ferdinand Schwenk <ferdinand.schwenk@advastore.com>
>=20
> The INA238 family supports eight conversion time steps from 50 us to
> 4120 us (SQ52206: 66 us to 8230 us). At the millisecond granularity of
> update_interval, the four shortest steps (50, 84, 150, 280 us) all
> round to the same value and cannot be individually selected.
>=20
> Add support for the generic update_interval_us attribute, which reports
> and programs the same ADC cycle time as update_interval but in
> microseconds, giving userspace full access to all conversion time steps.
>=20
> Both attributes reflect the total cycle time including the active
> averaging count: the reported value is the raw conversion time
> multiplied by the number of averaged samples, and writes apply the
> inverse mapping.

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608-hwmon-ina2=
38-update-interval-us-v2-v2-0-2d939fbb2ea1@advastore.com?part=3D3


