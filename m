Return-Path: <linux-hwmon+bounces-14775-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qXOWBNUeI2o3jAEAu9opvQ
	(envelope-from <linux-hwmon+bounces-14775-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 05 Jun 2026 21:09:09 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 918AE64AD8A
	for <lists+linux-hwmon@lfdr.de>; Fri, 05 Jun 2026 21:09:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=UAFQEg3J;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-14775-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-14775-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E85963019394
	for <lists+linux-hwmon@lfdr.de>; Fri,  5 Jun 2026 19:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26C093E1216;
	Fri,  5 Jun 2026 19:08:48 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3D9309EFA
	for <linux-hwmon@vger.kernel.org>; Fri,  5 Jun 2026 19:08:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780686528; cv=none; b=fEa+miooeCX5lDWcj2r/j7nwJT7/h/x2cCotJIV+O32lDibscx6BO5NkBxgZg82DyHexgWfjvLJjmMJrEhf/kO4J5cb76Tp6uhS7pHRAQWo/fQvd55e4xtoorAUJSmMLpggV3T1TDQKc0bNqZLFX2ddH3TYOnI7NCl6wFAwE99w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780686528; c=relaxed/simple;
	bh=ccaVNs/ENjVbMZDcWoZ78K/RG0AnqXAnvNRLg7M/7tk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kKGev8O98qlAuRG5SO2LWH3HcA9IHs2zO0qBSXITjQm2F8yn6jRY0ZHCcQqwLSt3d3jBW8QMiKV2ySIY/5jrLsw3fj0lWv8H0DFJrA8E0FfH4rLuIdvr0eXmitvQlZ9hFm+PDBuI2glsmZBfqsxPezEj9nEp1tnVL/wo3r8CJ8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UAFQEg3J; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 806E71F00893;
	Fri,  5 Jun 2026 19:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780686526;
	bh=ccaVNs/ENjVbMZDcWoZ78K/RG0AnqXAnvNRLg7M/7tk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UAFQEg3JDWxexdJevxf8aloBNbYAq7sQKKw2viF18RJtmvJeP7kYXZun7wvbtGLdH
	 GEshiemqWKCIBIck9qF5krW1DgvrKu75+tqi6RDO4cCFr+vyPQO5SSscNQR3/9YwKI
	 2HgiKiI3aHW2+qpwJI2XUzPcIo83gV7E1rcBDDs3UD/Yec9Yjf7iOsif8BOIX8Bg8/
	 liQe32Snn0SROqzRcpnwwc8t08kPnpxqocXVBxwsRP1egkTzKi0oVQwvwJT66M7/Q0
	 pRONM7zoNlP8x9etULF1cnlNDq81yaGb+ygpv4Ru6X6Fd8Dh6fqQoNRRTi+NfLzZT0
	 vtKCz6HWjBeKg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 7/9] platform/wmi: Make wmi_bus_class const
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260605181433.188847-8-W_Armin@gmx.de>
References: <20260605181433.188847-8-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 19:08:46 +0000
Message-Id: <20260605190846.806E71F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:W_Armin@gmx.de,m:linux-hwmon@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-14775-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmx.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,lists.linux.dev:replyto,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,smtp.kernel.org:mid,vger.kernel.org:from_smtp,gmx.de:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 918AE64AD8A

> The functions class_register()/_unregister() and device_create()
> both support taking a const pointer to the class struct. Use this
> to mark wmi_bus_class as const so that it can be placed into
> read-only memory for better security.
>=20
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605181433.1888=
47-1-W_Armin@gmx.de?part=3D7


