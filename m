Return-Path: <linux-hwmon+bounces-14911-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0ge8EZVLKGoKBwMAu9opvQ
	(envelope-from <linux-hwmon+bounces-14911-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 09 Jun 2026 19:21:25 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7323D662E15
	for <lists+linux-hwmon@lfdr.de>; Tue, 09 Jun 2026 19:21:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=WN1oWcPK;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-14911-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-14911-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 731813016B09
	for <lists+linux-hwmon@lfdr.de>; Tue,  9 Jun 2026 16:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2007C492529;
	Tue,  9 Jun 2026 16:54:22 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D2832B102
	for <linux-hwmon@vger.kernel.org>; Tue,  9 Jun 2026 16:54:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781024062; cv=none; b=fIxDBPjwIaw4EGfK/3kCLrH8Qb7aW7HNTgXuCMpYEdXpuJ6CHbCJssI1tRrAWZb2QmDJtfkhegW3M5YW0LvYhNGi2Cwwp6URJ+reGevTl5Uyu73M2bF+0Bm5QsBeJhUqmV8/9Deg8nj/yBRfhYji3dsfaoVBVh4z/mNejdiOvWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781024062; c=relaxed/simple;
	bh=mPlybDuQxoA/M8ZaOcxtsIu52C8vjD9xGSNduF2cetA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZjLyaCT3Vrt8I9qhkgCjX8lsFf6pb9L1ntrmEIIS0a+tWd4dlz5tZpkVqREgnhXeQAfgP/gzQyhFjAEciaQWa1yjWyo39GjuA2scT7/tqH9SH2teoOsA25kJezNOOzC5cqx9QCBwUEU/mtc6AA5fD/ahKOUW+4Pns0M+DYqKvqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WN1oWcPK; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34CCB1F00893;
	Tue,  9 Jun 2026 16:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781024060;
	bh=kMoscc4gHt4/qoVPNBzm6zDulh0TR5SKsP6lRM+933k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WN1oWcPKZcnfuZ5niTIZ3fmSo+8FGi7DMNTkFlOkQ+zQG8+viNS8ddX/3CTOxm/fT
	 AqeSE0YHxr5cCkjdfsgDlSa0KlnXFvwIVkCCgMtm87IX9m3u0mySjerQtdvPhYNw/Q
	 sqgKcfg5+5cSv6FILwUs9RWQM5QJtrR1LLL7u2oCg5bp4vN0FiwRQ6hI2DSS41YNqc
	 rV+KFDhlJW5553rfStE4WCNhjZT1YYHyPruz3TvCFVPKxhHg9Lnhokj6+LprdsqOdp
	 UqnL60PfaBg7jNsV2aBZzu0oWu3poGctUqQECS3XrwkJZaV/Xv1eNjfYkItTVPcKjP
	 zaKFXic7O1QuA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 RESEND 2/2] scsi: mpt3sas: add hwmon support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis Sautier" <sautier.louis@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260609164423.2829699-3-sautier.louis@gmail.com>
References: <20260609164423.2829699-3-sautier.louis@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 16:54:19 +0000
Message-Id: <20260609165420.34CCB1F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-14911-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sautier.louis@gmail.com,m:linux-hwmon@vger.kernel.org,m:sautierlouis@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,lists.linux.dev:replyto,smtp.kernel.org:mid,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7323D662E15

> Expose the IOC and board temperature sensors of LSI / Broadcom SAS
> HBAs through hwmon. Readings come from MPI IO Unit Page 7 via the
> accessor added in the preceding patch.
>=20
> The same fields are exposed by Broadcom's userspace tooling
> through the /dev/mpt[23]ctl ioctl path (typically root-only):
> IOCTemperature and BoardTemperature in lsiutil; ROC and Controller
> in storcli. With this driver, sensors(1) shows them unprivileged:
>=20
>   $ sensors mpt3sas-pci-0200
>   mpt3sas-pci-0200
>   Adapter: PCI adapter
>   IOC:          +42.0=C2=B0C
>=20
> Each channel is gated independently by its *TemperatureUnits field
> through is_visible(); cards that populate only one sensor expose
> only one input file, and cards that populate neither do not register
> an hwmon device.
>=20
> Built into mpt3sas.ko under a new CONFIG_SCSI_MPT3SAS_HWMON Kconfig
> option.
>=20
> Assisted-by: Claude:claude-opus-4-7
> Signed-off-by: Louis Sautier <sautier.louis@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609164423.2829=
699-1-sautier.louis@gmail.com?part=3D2


