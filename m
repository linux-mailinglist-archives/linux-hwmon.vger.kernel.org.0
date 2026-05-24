Return-Path: <linux-hwmon+bounces-14470-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMTLG8RoE2o9AQcAu9opvQ
	(envelope-from <linux-hwmon+bounces-14470-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sun, 24 May 2026 23:08:20 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A715C44E8
	for <lists+linux-hwmon@lfdr.de>; Sun, 24 May 2026 23:08:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F32B63001FA7
	for <lists+linux-hwmon@lfdr.de>; Sun, 24 May 2026 21:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A5F433B6F6;
	Sun, 24 May 2026 21:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eQQgs6iR"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5233382DC;
	Sun, 24 May 2026 21:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779656895; cv=none; b=Inm7WZ6vlLFl496WSE7zc9f77V7EUaiXcZOf6tEqt7/c6Asoo+mqFe4l5B7N0tsVrRHHfrs5/mJw0M+gheubUb7u3z5vOC8WF13giq2pxwCWmf478Z+UZTNmYG13uk7dibR3fKvk6iTsoMkvaCT4oVNJ5OifErq5ehic0bvJe/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779656895; c=relaxed/simple;
	bh=EcdAKWvGXDcDeBYHq/BRTvgnLbwI1es/UsWXWT5WTTw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BsehSh+9uIVJ/BEky5DoX/sFZ0j8xk6rtrZ+XvA4gHUK5CV8TCNljVVAmk9dB6C2gjtqhZDkNg0kdnnnc1866stPaHEZ5gtjB9OTilGMOOKIdu/OCfhQ4NzQo9MmPhxauNOPcCeKVNX6Ul++cU73IjcBOUShJpCSqG8TpU5sZAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eQQgs6iR; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7510B1F000E9;
	Sun, 24 May 2026 21:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779656894;
	bh=ptT+8waT4oskw5av9rKOB2AlBkH9KDIp95lj33RWbsk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eQQgs6iRDdidGJEoqBDwo3URvkBa+vCZTZx5TISqMzMSx1bxKlT0pESSKIZ+8cYxZ
	 iTbeaDKwHmhY+MbX49Htl2Bk1vI80BtJ9VCymkx3o3MaHG9SIWlAd4Ofh6LwS+5N+K
	 KahLU2iWB7iQ4bLeZjOZ5GnTFiYbIHf+rKa1+Qf0lthEOwOWLGF92dTbdtDYUkTbDl
	 SEpqvQjDBB/DAhZbZRXEKx+zNthvTE5KZzR5s7EgZ3EnFKyDVo3xlWNicXABnb1Pcm
	 0v4i2APPzcyCDh6QN4mn/LsQNlKuFFZOC5SkSmXnzsvEmquAc7+svIxz0lYPpNvvxi
	 cEleE5sd4WcrQ==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v1 1/4] iio: types: add IIO_VOLUMEFLOW channel type
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wadim Mueller" <wafgo01@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260524205112.26638-2-wafgo01@gmail.com>
References: <20260524205112.26638-2-wafgo01@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 24 May 2026 21:08:13 +0000
Message-Id: <20260524210814.7510B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14470-lists,linux-hwmon=lfdr.de];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,cmblu.de:email];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Queue-Id: C7A715C44E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> From: Wadim Mueller <wadim.mueller@cmblu.de>
>=20
> Add a new IIO channel type for liquid volumetric flow sensors.  The
> unit exposed via the standard _scale attribute is litres per second
> (l/s), so drivers reporting smaller native units (e.g. ml/min) only
> need to set a fractional scale.
>=20
> Update iio-core's name table, the iio_event_monitor whitelist and
> the sysfs-bus-iio ABI document to match.
>=20
> Signed-off-by: Wadim Mueller <wadim.mueller@cmblu.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260524205112.2663=
8-1-wafgo01@gmail.com?part=3D1


