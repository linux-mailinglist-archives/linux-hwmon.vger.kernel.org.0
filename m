Return-Path: <linux-hwmon+bounces-14666-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFYiAx/XHWpsfQkAu9opvQ
	(envelope-from <linux-hwmon+bounces-14666-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 01 Jun 2026 21:01:51 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA0B624617
	for <lists+linux-hwmon@lfdr.de>; Mon, 01 Jun 2026 21:01:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 983B7303FBB6
	for <lists+linux-hwmon@lfdr.de>; Mon,  1 Jun 2026 18:52:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 179F9357D1E;
	Mon,  1 Jun 2026 18:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nh5QKfES"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C15357CF9;
	Mon,  1 Jun 2026 18:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780339932; cv=none; b=i8AKJupcsv5kiK3dbXf3T4+aciLvvKOVhRn6JZwuTjJ6ctC3Q/aJC9zDne834i8GGRiiHxPIoQMxgN8tyHojL8l5V8QF8R54GRb7pXRV9DVLatGg0c7WFBIHxlTZdlE7mtpApU7wNGFw4CSp97fHE70Uluk7DtDZq+MhfQcVEUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780339932; c=relaxed/simple;
	bh=LCPeUyDd9+D4Ima8HdU5lRtkFu26ax14f9xucwbMGcU=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cvFAo5qdCi4EnsSaPhGpCxFhLvTUuuOmrUymTIoKFlWYkjpWXQ2oUrSoWvusyJvg6/26CRo9Igx6XvAnzbACnRxUVJkHgUBWh7tLf5UhvrHVOnnGX/GIyW16sph00oMjBfdehyX1kodHmMvtWCcEsEsNOdWHkQOyFRC79vVGXHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nh5QKfES; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7964D1F00893;
	Mon,  1 Jun 2026 18:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780339930;
	bh=LCPeUyDd9+D4Ima8HdU5lRtkFu26ax14f9xucwbMGcU=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=Nh5QKfESYFaZhAAjUbPZxnJabmqsOBPj60Y8Uhpgu9kuNIsBCjNDAk4x/UHyXXWOL
	 PJxrEEHTV9GjLXTZ5Ys+qrsW0MBz3a56I2+JQrRrZw/5razE2tCG5q/rR5mq8ReDKp
	 U1Bx4d6k80KiY46QrHT6347X210gEhFrb9YeVtAAa70hBr7SmQCMESGelATNrqswPK
	 P4IZVQWElkttg4cfw+8iczAga/cuk0TnMZowk0co6u17JuQgz/6gmkpfPsP18CKRj6
	 w81SK2esn2b+CLidMB6ukkNLEFileMVP1MeKNL25lKJkgqAEgj1VdO8XHMHNhFxZc9
	 C83yx8mMxFs5A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: pmbus: Add Analog Devices
 MAX20860A
Reply-To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260601184516.919488-2-sanman.pradhan@hpe.com>
References: <20260601184516.919488-2-sanman.pradhan@hpe.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 18:52:10 +0000
Message-Id: <20260601185210.7964D1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [1.84 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	MISSING_TO(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14666-lists,linux-hwmon=lfdr.de];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[juniper.net:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,sashiko.dev:url,lists.linux.dev:replyto,smtp.kernel.org:mid]
X-Rspamd-Queue-Id: 8AA0B624617
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> From: Sanman Pradhan <psanman@juniper.net>
>=20
> Add devicetree binding documentation for the Analog Devices MAX20860A
> step-down DC-DC switching regulator with PMBus interface.
>=20
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601184516.9194=
88-1-sanman.pradhan@hpe.com?part=3D1


