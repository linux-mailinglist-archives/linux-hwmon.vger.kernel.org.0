Return-Path: <linux-hwmon+bounces-15001-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oWeqGRXOKWpydgMAu9opvQ
	(envelope-from <linux-hwmon+bounces-15001-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 10 Jun 2026 22:50:29 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D75E966CEB1
	for <lists+linux-hwmon@lfdr.de>; Wed, 10 Jun 2026 22:50:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=KuIEnxjG;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15001-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15001-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4527530CD896
	for <lists+linux-hwmon@lfdr.de>; Wed, 10 Jun 2026 20:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A64E03587A1;
	Wed, 10 Jun 2026 20:50:26 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDB334AB14
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 20:50:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781124626; cv=none; b=P2NgSCoLW4caDEzGcqoUqiwtwxtER3/ecu3nd+/QjnFMgwkyKJzGZ6eSHYWmhl0F9ImteK7EMFBNvKNLMUlGmDRSD2UEcc/k7XO76gkreP76anyJHpPuUrXtSVAMsI97BwHyV162PnAxaz9LeVq9C8pyXh/Vd4IYiV/rtO8Ay8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781124626; c=relaxed/simple;
	bh=e74V+zAIRV1HPdDMjGqlSwYx5VnRre00X2fR9TioBPc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iGAFkhMqjGgAMteRmlL4bX1+37yK2DZrTPtZRAFY0oI7Hm0QwRod55dFbzRImlt/mpijGf0Al9RcIptPkX0welFPY/PUujN0nvs40reucS+nc56AJQQT8V/eRFaVluKUUTDbv9F9Q5AS9z5Ar+nloNfmlVqacBcmxBnqdLoja+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KuIEnxjG; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CA621F00893;
	Wed, 10 Jun 2026 20:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781124625;
	bh=e74V+zAIRV1HPdDMjGqlSwYx5VnRre00X2fR9TioBPc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KuIEnxjGtVL5iqR40M4xmPFjWs0tT+w/sID09+VYXtdorbQG9mBKMXkINdbMbDZi2
	 9UNbecNBIZlWM6vvo7DB/Qax+nsw4GWBa2OAJmBBhvTlGLp+dkdsxchURvwSehxC2r
	 OG7QepydTQ4DFzlX6Mep6tw8VFts/VG328NRnTeE67SLYCPw87Dcbyb0InTGEyQj1a
	 92YZqusBIL0QGKmdQMWtfEsKRf4tcQxPcLhQ18T+iKA5KgeyDiVtAEgKd/7DDXIhUb
	 o6z4qbSZhDkfgYwECgD5P5YIio9Do8c2HprY85yX5RbS6xsPraylSd2eXSI6Ah+X8O
	 wC9WTGPNSmJAQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 9/9] modpost: Handle malformed WMI GUID strings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260610203453.816254-10-W_Armin@gmx.de>
References: <20260610203453.816254-10-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 20:50:24 +0000
Message-Id: <20260610205025.1CA621F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-15001-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:W_Armin@gmx.de,m:linux-hwmon@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmx.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,smtp.kernel.org:mid,sashiko.dev:url,gmx.de:email,lists.linux.dev:replyto,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D75E966CEB1

> Some WMI GUIDs found inside binary MOF files contain both
> uppercase and lowercase characters. Blindly copying such
> GUIDs will prevent the associated WMI driver from loading
> automatically because the WMI GUID found inside WMI device ids
> always contains uppercase characters.
>=20
> Avoid this issue by always converting WMI GUID strings to
> uppercase. Also verify that the WMI GUID string actually looks
> like a valid GUID.
>=20
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610203453.8162=
54-1-W_Armin@gmx.de?part=3D9


