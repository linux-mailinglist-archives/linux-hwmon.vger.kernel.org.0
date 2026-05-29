Return-Path: <linux-hwmon+bounces-14589-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GH05J9HiGGo0oggAu9opvQ
	(envelope-from <linux-hwmon+bounces-14589-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 29 May 2026 02:50:25 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 284A15FBC5A
	for <lists+linux-hwmon@lfdr.de>; Fri, 29 May 2026 02:50:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 87870301CD86
	for <lists+linux-hwmon@lfdr.de>; Fri, 29 May 2026 00:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6738C34D4F9;
	Fri, 29 May 2026 00:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HRahPaWe"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6450919DF62;
	Fri, 29 May 2026 00:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780015809; cv=none; b=ekd2AvI/8Nn788COf3IKMEznePknqMj0rLs5QpI2VO8nnoNbNtKo/OhaMmz850PR6AOJmEHU30eE2TPK+59/iucKPQKXb8v2pWRwJPtjEJPLfiyWWFXL3pKaozWGkl6x1/1pHuv3/QFzR01QQAshGy0TxyMbfb5wD1GUxkoOg7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780015809; c=relaxed/simple;
	bh=tWGoIh7nGvFw1IPIkpAOjC7JqI8OoSHP0arTGd81M8g=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=I+yYLzY0a4MRg66sY43IdH/ycpp/UAiot32/lzBnf9EEMUKPZJ7pR4hKjiXlBmlwGGwVHP2hwytRM9pNsrJ0e8VLPePr//+PBXqDUYEaClx2Xcaxq8Po8HQINh1NvgxYSIpi0TMglsB+Nva2N86Jgb4IaFPfW7lkNDj//ze4oqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HRahPaWe; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCA3C1F00A3A;
	Fri, 29 May 2026 00:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780015808;
	bh=tWGoIh7nGvFw1IPIkpAOjC7JqI8OoSHP0arTGd81M8g=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=HRahPaWeSnwKyEtBI99MjXolhAxID5S3vWbXDijXbhZev5oiDD3Mqx5ytBm+M9hkk
	 YsC5GNC/CMQaFBISlPfWFobqZ8wWZ8lnMEAHKoMVF8oZqT8ghbs45h3muqiUkZnjTo
	 JhZo7CxMAAeNSnjJKp1gu4iagrWeSFj/dX2+T7TTutuzirU3ZaBFcnRE2EKZq/Bhg2
	 wGa3ZZ1BZGiJihxq9WiXs7du303a5idBvkW1mjZdbA2GLbY5pl01/Wd7PrmcXqReHB
	 gcvafUfguhW0vRK+GQggckbfaANMpxdHmMkxvZHPd1GD+UhkrA3YK1eQdgZ9K+gjgU
	 HXRIb+sBelL2A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] hwmon: (pmbus/max20860a) Add driver for Analog
 Devices MAX20860A
Reply-To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260529001903.625737-3-sanman.pradhan@hpe.com>
References: <20260529001903.625737-3-sanman.pradhan@hpe.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 00:50:07 +0000
Message-Id: <20260529005007.BCA3C1F00A3A@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14589-lists,linux-hwmon=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,juniper.net:email,lists.linux.dev:replyto,smtp.kernel.org:mid,hpe.com:email]
X-Rspamd-Queue-Id: 284A15FBC5A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> From: Syed Arif <arif.syed@hpe.com>
>=20
> Add a PMBus driver for the Analog Devices MAX20860A step-down DC-DC
> switching regulator. The MAX20860A provides monitoring of input/output
> voltage, output current, and temperature via the PMBus interface using
> linear data format.
>=20
> Signed-off-by: Syed Arif <arif.syed@hpe.com>
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529001903.6257=
37-1-sanman.pradhan@hpe.com?part=3D2


