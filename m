Return-Path: <linux-hwmon+bounces-14705-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id o1S1MwIzIWqBAgEAu9opvQ
	(envelope-from <linux-hwmon+bounces-14705-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Thu, 04 Jun 2026 10:10:42 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5D263DE17
	for <lists+linux-hwmon@lfdr.de>; Thu, 04 Jun 2026 10:10:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=bwKTpipN;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-14705-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-14705-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8F8903072E12
	for <lists+linux-hwmon@lfdr.de>; Thu,  4 Jun 2026 08:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8847539B94F;
	Thu,  4 Jun 2026 08:10:26 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BE23876C7;
	Thu,  4 Jun 2026 08:10:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780560626; cv=none; b=Mzf1XMeSsbfRV0HM7xeGKFDU3lmYLdrNXqwJopO+sn1uVBdYkh3r56kRsui0XKdvHGqBQ2ogefDFA1ZTJm+v1waRRi2WM2A/FggykH9NCVZUK8senleoHO4zB1E4Vf7qoW1ufVqxVI3TWOI6Z8M0+NujCXu5TVfL0P1ORRtf5hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780560626; c=relaxed/simple;
	bh=EJrr8yiQmlcdEyukp0qCLFb+ItXDayFqyUQGSTpHzSM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Iv1MGl5vNy6O2XmpzKra2n2MmyQh7rRsHtSvNH89KAXmoqGkBO+ECykyij4JdCjr7+m4Yc27IGVN9NBq5byXczvAVm7VEvIAkcx6/j80mmci3ejC+DKOE99Ua/GZBt4Qyx4lPSiH8VD13BmCedXgCZHTT5PAxKF3Mv4CFjLMosU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bwKTpipN; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0C341F00893;
	Thu,  4 Jun 2026 08:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780560625;
	bh=EJrr8yiQmlcdEyukp0qCLFb+ItXDayFqyUQGSTpHzSM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bwKTpipN97g+d2CLZOlA1zacyF0QlqJKw7wGObR6167HH3EpFlpRuSExVOEBd7LXS
	 A/kHkdUSazIhnpgebv/zUIAPuorBpk/7/3FLAKRQP3NSQiowMMBCI1r7pgUVaMd11s
	 OPYO1JMKrFR4n2Suh1TYfJqZ6EHpksTgLcoz2dz1BnCNvBILdCue+8sSz84Tv6jvwE
	 epeTuZkDJhc0nvCyuLGSnSOtQTGzF/+DhqYhc8CzyuG1ykYl6aAAJsyEPp2LFme5c6
	 YvGLohtFpvIcDtSTE6jA9J7Eroog/LIpjzIkDJ1eUdIdG6uqIOLFeK7Y/guV/Abo4h
	 ybLPHkc4duKwQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: hwmon: Add Eswin EIC7700 PVT sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: hehuan1@eswincomputing.com
Cc: robh@kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260604080525.152-1-hehuan1@eswincomputing.com>
References: <20260604080525.152-1-hehuan1@eswincomputing.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 08:10:24 +0000
Message-Id: <20260604081024.E0C341F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-14705-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smtp.kernel.org:mid,lists.linux.dev:replyto,eswincomputing.com:email,sashiko.dev:url,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:hehuan1@eswincomputing.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7D5D263DE17

> From: Huan He <hehuan1@eswincomputing.com>
>=20
> Add device tree binding documentation for ESWIN EIC7700 Voltage and
> Temperature sensor.
>=20
> The EIC7700 SoC integrates two PVT instances for monitoring SoC and DDR
> power domains respectively.
>=20
> Signed-off-by: Yulin Lu <luyulin@eswincomputing.com>
> Signed-off-by: Huan He <hehuan1@eswincomputing.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604080430.126-=
1-hehuan1@eswincomputing.com?part=3D1


