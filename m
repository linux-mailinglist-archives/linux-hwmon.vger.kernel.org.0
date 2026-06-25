Return-Path: <linux-hwmon+bounces-15327-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +RBOKxjIPGrxrwgAu9opvQ
	(envelope-from <linux-hwmon+bounces-15327-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Thu, 25 Jun 2026 08:18:00 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 440976C2F7C
	for <lists+linux-hwmon@lfdr.de>; Thu, 25 Jun 2026 08:18:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=LZZpdQZT;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15327-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15327-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 47D0B304168A
	for <lists+linux-hwmon@lfdr.de>; Thu, 25 Jun 2026 06:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6FD63C0A02;
	Thu, 25 Jun 2026 06:17:36 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08EA27707;
	Thu, 25 Jun 2026 06:17:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782368256; cv=none; b=DyJfkZqQ61HnyacefbZ7a/SxBbg2oqlo8DOdQeFYVR98LOV0+ddya3ohlRL1BwmU2qmeOZx5bYz9ZnWbgfy/205jDzEtOuFq3Ww5J4bKMOSYB5Xdks2fLLAIHtDsF8housn3owfwHDzifX+eaJXBUEiTcw9jVHX6hB78OYIPQFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782368256; c=relaxed/simple;
	bh=EY/cfTRVvk6FjLb+IHXbl340YqvBda8DpZiXIEOGK8Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=M6oBh53on+NBCdIwdtQjaAisaXy68JAQ96sEPmcHHQyF7A+KNmEMv80jn+iOWJGiLzhl615irbCDMDT/AJm8ID3dj8aDBnhr0gTOcOyJbCpZhoU5zWOKLIh3tzuNjRIo6f7pjdROqo+AhS2EDEwWdbuFvSE8iCgIO/RBLUohpEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LZZpdQZT; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FCC91F00A3A;
	Thu, 25 Jun 2026 06:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782368255;
	bh=EY/cfTRVvk6FjLb+IHXbl340YqvBda8DpZiXIEOGK8Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LZZpdQZTjTtskADT3GfNalQslIsEtgW3PKv5hKPSzgP0JFneP+xDlj+rRJsd/MT40
	 HH0EyrPVA50sp6ol1eNeXIN4p+iiBk66ltoR5kKmBVKG4TDMl/HcuMojDoMW7o8x1d
	 ANOzCGH57mcNUzBuEx+CbmZYD+Hgw7q8HJkYFyclXVQCcUkdAvt0jzmGBU9C+thnKv
	 LBU6UZF+N1eRM01Jhds5mXX+qYKnObyz4PE0l2boDa0bykb7hMupflO4cZJ4uvkKfT
	 yGRtagGn9UB1zGWpLbV54C3Vavw30tuVgiAJam59DL6UmRw6vbsTqs7IzGeekigmxJ
	 0qrNMz0IEz3Wg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 1/2] dt-bindings: hwmon: Add Eswin EIC7700 PVT sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: hehuan1@eswincomputing.com
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260625061147.1631-1-hehuan1@eswincomputing.com>
References: <20260625061049.1614-1-hehuan1@eswincomputing.com>
 <20260625061147.1631-1-hehuan1@eswincomputing.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 06:17:34 +0000
Message-Id: <20260625061735.2FCC91F00A3A@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15327-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,eswincomputing.com:email,smtp.kernel.org:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,sashiko.dev:url];
	FORGED_RECIPIENTS(0.00)[m:hehuan1@eswincomputing.com,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:robh@kernel.org,m:linux-hwmon@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 440976C2F7C

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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625061049.1614=
-1-hehuan1@eswincomputing.com?part=3D1


