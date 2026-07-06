Return-Path: <linux-hwmon+bounces-15616-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mdMOHQgLTGo4fQEAu9opvQ
	(envelope-from <linux-hwmon+bounces-15616-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 06 Jul 2026 22:07:36 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B083C7154D8
	for <lists+linux-hwmon@lfdr.de>; Mon, 06 Jul 2026 22:07:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=CIHtD2x4;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15616-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15616-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C261E3178C50
	for <lists+linux-hwmon@lfdr.de>; Mon,  6 Jul 2026 18:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E8C23B0AED;
	Mon,  6 Jul 2026 18:53:54 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C124E367F31;
	Mon,  6 Jul 2026 18:53:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783364034; cv=none; b=V9lWMrkF6EHztOHt6HoOR4prHAh5PnoncBszD+1Hf6MA5ecFjpYPewZqtZVCWtgxT37DdGDhjk09Gjhre2uYvz0Cx+wS2yeFa6Hf75dTLhUt/OK9UDT5HV5eolbQ+p1Vc3KM/Djq+3jj/grdKGujJN2Qh/MRqFGpTBDAeRCrdp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783364034; c=relaxed/simple;
	bh=wTKhWkeVd9qs9xmrb61u5F2kqSC5EVnHN6bJNl0BoiI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bRgT4avQFm7FaFKhAevtXWeZlO26Qas7yygygulzOqsb6z5hVjXdE2Y5rKq1NBfRf7n5/TAfCQf7zUg5uF+CFIw1RlZ6AFKHH9XLEEOGPrevnJXrIMkcnDlDIs/31QIhG4NMfYBd+mLjKA98p+9yAax8BlS4TT5PgBc0m2xWfMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CIHtD2x4; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 967921F000E9;
	Mon,  6 Jul 2026 18:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783364031;
	bh=wTKhWkeVd9qs9xmrb61u5F2kqSC5EVnHN6bJNl0BoiI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CIHtD2x4gvTs/HlRIxhad9cWFyS7C+llyAJyhtwqRJ7Dzsul0xr4z0LdymSrVBJZV
	 jyXx+AQxjiqi/6FNGzZvGCqwbDHuPyzvrtetScHKUxA6tgcTMIVVZ9QcMjhP3sj8E7
	 DW27R5pCN3a6zaUC+MlhcL+0Cf32udi3lCAQ39/t+mXoIBTQA/Bek1bSCrzJnSTi17
	 cJf38uttcxNDudrSGXLCT9q7Ns7v1m848cUuTFY5clQc93a1aNLWRIqc8alvGHR3Hr
	 GYZQibjgDZpiIHaVGcH4qVqpz785JU+NSrb3LJFkbDCmi21dhmkl6L1Q6X0ystwIPj
	 dgnSz/WSNG8MA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: x1e78100-t14s: Add thermal
 zones for keyboard skin and charging sensors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Lezcano" <daniel.lezcano@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260706184648.35613-4-daniel.lezcano@oss.qualcomm.com>
References: <20260706184648.35613-1-daniel.lezcano@oss.qualcomm.com>
 <20260706184648.35613-4-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 18:53:51 +0000
Message-Id: <20260706185351.967921F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15616-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sashiko.dev:url,smtp.kernel.org:mid,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,lists.linux.dev:replyto];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:daniel.lezcano@oss.qualcomm.com,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:robh@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B083C7154D8

> The Lenovo ThinkPad T14s embedded controller exposes several platform
> temperature sensors that are already used by the firmware for thermal
> management.
>=20
> Expose the EC as a thermal sensor provider and describe the keyboard
> skin and charging circuitry sensors as thermal zones in the device
> tree.
>=20
> The keyboard thermal zone defines passive and hot trip points, while
> the charging thermal zone also associates a cooling map with the CPU
> clusters, allowing the generic thermal framework to apply CPU
> throttling when the charging circuitry temperature exceeds the passive
> threshold.
>=20
> This integrates the EC temperature sensors with the Linux thermal
> [ ... ]
> and resets under heavy load.
>=20
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on T14s OLED
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706184648.3561=
3-1-daniel.lezcano@oss.qualcomm.com?part=3D3


