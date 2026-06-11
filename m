Return-Path: <linux-hwmon+bounces-15022-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XkFyGiFqKmr7owMAu9opvQ
	(envelope-from <linux-hwmon+bounces-15022-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Thu, 11 Jun 2026 09:56:17 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B1666F9D2
	for <lists+linux-hwmon@lfdr.de>; Thu, 11 Jun 2026 09:56:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=hGppIqnC;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15022-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15022-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 34D343001CE2
	for <lists+linux-hwmon@lfdr.de>; Thu, 11 Jun 2026 07:55:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F07C36F8EB;
	Thu, 11 Jun 2026 07:55:11 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE2235E957;
	Thu, 11 Jun 2026 07:55:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781164510; cv=none; b=iavOUddB4eWcPJE56Sx/jV78QCk1zDkezHeB5Bl9hK+o5CZIKTm+Zsywazsynq3e9L2aAX+kD3Rd/HGstIrVYYjnEec517q4iuigx+puKfvejpg2k6cbEuKmxlm1a7q9tq/HfOGOh03LUurcyB3V/Y3Zf3zvA0iIzjBarFS4mME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781164510; c=relaxed/simple;
	bh=0/+W8pphNjt+RhjbEaLAZAg/KX17utLn/JdAkkS+svU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l8Il8WJgP+JQuVPMNWx5rTB5kcpy4gNuApXMADZbjTp8NDm3SSHb4oNX9UraBeJ5xjbFpbLEPxPo9Q4VJW96tT1FPa8b4geuoHmIs5TUGfCgj7WK+8qMRFcuLIm6WrUACVq3dP46sHepAUKJi/LbvImUbJHF6EIDTBFxAP16F8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hGppIqnC; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 532491F00893;
	Thu, 11 Jun 2026 07:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781164509;
	bh=0/+W8pphNjt+RhjbEaLAZAg/KX17utLn/JdAkkS+svU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hGppIqnC+uVVqFLgGNRQZY5fvrPULahfJBklgJK/JSIbjjNVcsYwws1EewL8g5mmk
	 o2Fcq4SOlC9j9KukZOua+hb8stAwdq7V3aHikUjfIXyeN4xfhWTQ3xRdA+D2uUdRmH
	 UPrMrMZdbj6ElWst9MmZWdqNSky6u0ykcxCFBjl2OdQlpbwH/ZT8js8IN3ju49kUJ6
	 C1da3S/3PLKPUBE3FPIxgC4kbN90zieAlfE7c4/xWDIXuDt9sSK5gsw9VRvIMRJit/
	 rxzO4io8v7ZFLIuREugPQsmbreRCd+B1Bcoaf63hNiwqAlS23X6CJJQ/NJx1AijpRw
	 si5ebMfcTsl4A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: hwmon: pmbus: Add bindings for
 Silergy SQ24860
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ziming Zhu" <zmzhu0630@163.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260611074335.4415-2-zmzhu0630@163.com>
References: <20260611074335.4415-2-zmzhu0630@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 07:55:08 +0000
Message-Id: <20260611075509.532491F00893@smtp.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-15022-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zmzhu0630@163.com,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:robh@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[163.com];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B5B1666F9D2

> From: Ziming Zhu <ziming.zhu@silergycorp.com>
>=20
> Add devicetree binding documentation for the Silergy SQ24860 eFuse.
>=20
> The device is a PMBus hardware monitoring device which reports voltage,
> current, power, and temperature telemetry. The board-specific IMON
> resistor value is described with silergy,rimon-micro-ohms.
>=20
> Signed-off-by: Ziming Zhu <ziming.zhu@silergycorp.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611074335.4415=
-1-zmzhu0630@163.com?part=3D1


