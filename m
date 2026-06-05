Return-Path: <linux-hwmon+bounces-14774-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MhEhKHYfI2qMjAEAu9opvQ
	(envelope-from <linux-hwmon+bounces-14774-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 05 Jun 2026 21:11:50 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A4E64ADB7
	for <lists+linux-hwmon@lfdr.de>; Fri, 05 Jun 2026 21:11:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=N1Y63tkA;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-14774-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-14774-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9C6583002B63
	for <lists+linux-hwmon@lfdr.de>; Fri,  5 Jun 2026 19:06:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AA7038C437;
	Fri,  5 Jun 2026 19:06:39 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CD6416D0A
	for <linux-hwmon@vger.kernel.org>; Fri,  5 Jun 2026 19:06:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780686398; cv=none; b=hYWyjwXsnnG0NIz3g2s952ma2yYdEj0TnOukmRfAZN+7WZISedvk0E0pviWq/qWhaqlFVI3AG+8bFD92Xu+NHbpj5FKFdZ9wLn2R6OzcrBdlV38yX9B/ZDKJNHNYyAVgx4k3Tc4JAOCHA4fmzk9EgQ79FlUR+ykeAFqqsD5cIMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780686398; c=relaxed/simple;
	bh=FZ2t7FP88uVt7Pdit6/BdElRGdhtogP61M4oVv+gN50=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BR83OS7EKD4JNRMN5bUEapiQh2wnLY8F7/SHIF9x/tvtXG1T9lkkApXP7M6BSlaZLtEx5Mz9V9PC2KXMpH4OCTt/GQeEjewoo7G3lVKkPDpH08xblngYR0tGZMZRlNd9JTwiUSzSNl7lDxM2LVE0J9dRp48UA19GlNYGguRVGLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N1Y63tkA; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D9F91F00893;
	Fri,  5 Jun 2026 19:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780686397;
	bh=FZ2t7FP88uVt7Pdit6/BdElRGdhtogP61M4oVv+gN50=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N1Y63tkAnMxmiVvEHBRUmjeF1btatrDt02gROUiAGPG5ffhVmv7le8PZ187odbqnL
	 SMG0lTIrOk9kjp+DkH4qcNuiNK3DOFCnEhd2bUSRzOSUqKA4+ebUpI4yEvKBndHp1T
	 xI+hCIuUF37LJlvr7KgqP9RKrle+ZJG7uVGxzRqQwjszwc53NOyqU0hzWICuWEOhYX
	 +pywg/jWD+5TXrLPyWzwuiqIxpKpjGjKMqI00LEsUXav1J6ADSobHXAYBHQBuStl/b
	 Dsbh/4AQiBN7CWmVe7/F1JFmDFenXTE69liKrgSsI/WGe+eLfvcmA1541ovxipgc7K
	 WaDtLN9HAZ5kg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 6/9] hwmon: (dell-smm) Use new buffer-based WMI API
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260605181433.188847-7-W_Armin@gmx.de>
References: <20260605181433.188847-7-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 19:06:36 +0000
Message-Id: <20260605190637.4D9F91F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:W_Armin@gmx.de,m:linux-hwmon@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-14774-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmx.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.de:email,smtp.kernel.org:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,sashiko.dev:url,vger.kernel.org:from_smtp,lists.linux.dev:replyto,roeck-us.net:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E7A4E64ADB7

> Use the new buffer-based WMI API to also support ACPI firmware
> implementations that do not use ACPI buffers for returning the
> results of a SMM call.
>=20
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605181433.1888=
47-1-W_Armin@gmx.de?part=3D6


