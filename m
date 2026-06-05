Return-Path: <linux-hwmon+bounces-14794-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yEuWGNU8I2rMlQEAu9opvQ
	(envelope-from <linux-hwmon+bounces-14794-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 05 Jun 2026 23:17:09 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AE26764B526
	for <lists+linux-hwmon@lfdr.de>; Fri, 05 Jun 2026 23:17:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="isH/4Ulu";
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-14794-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-14794-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 27742302A694
	for <lists+linux-hwmon@lfdr.de>; Fri,  5 Jun 2026 21:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A64D03644A0;
	Fri,  5 Jun 2026 21:12:46 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FAFD199385
	for <linux-hwmon@vger.kernel.org>; Fri,  5 Jun 2026 21:12:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780693966; cv=none; b=U1o/Qw9Ub2XCb/LqPSKSMZHnSzLrogRVfxMbtP6F8e/EephAtk52vkUgcUF2YS3IOIcmlflTKTYaiMZvQzkM6TZ4bfjGbvcdsRD/sXn7WbUdWxF/LJKJ9y8rkmoiHfyCc9DqKPO4rgp9oUG+KXIdm24e7x8tbLxdlNcYKL30uc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780693966; c=relaxed/simple;
	bh=vQB/2wPWIRtdMKkKZw27SwIBpuDQaITe9uk5VXl/Pxk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JtCxAN4isLM6XAlu2xMoRI6ZzQY/Bs6qALNwWDJ55LwfnvWO7qbUjalj7L+0y+Fpch2MAFobn6Tb7Ox1qHv+9PovGLadTon73lartneqvL1QcrUqX+EN7XqEcWmGx2aQnZisWa97f4FeQiorSiajbAZTfQp/M0b7yFBU7LVPzXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=isH/4Ulu; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B3DE1F00893;
	Fri,  5 Jun 2026 21:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780693965;
	bh=q3x+APqMnaMGjTRroQLQNkoFZaEe+/C59sopv+uTDmc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=isH/4UluqHNQHzDBcb7DBA3zg7Hmr/Rz7zVkuHad2pL1czh7/ZIgBWAra0O41N/tR
	 wEnLKDl4GeNcXC2b2AA2wfJA0Y+a3Ve2cMRRX9888mNmOzxZDHDD9mvcHRP27+m2C0
	 62bca4BEM9MuuHS9qGAT4XLsBpaCGBCyRqQgCKZhpqw4ddxekE330Yq3d4NDb+Jcox
	 gYl9aI68bRVS/99Y0D1Le19xE3aY1fmw099gHMT0mfXGgu1X9WkwP8zLwZhDw0dLib
	 C2Y2WGP/n3Dn14E+RWNvOpPDJePpn2Q5+VjIruXJ9928OIT3TVLLPWf2igp6Ty1Mr5
	 hSmbHh6MAEPVg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/9] platform/x86: dell-privacy: Use new buffer-based
 WMI API
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260605205937.530897-3-W_Armin@gmx.de>
References: <20260605205937.530897-3-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 21:12:44 +0000
Message-Id: <20260605211245.3B3DE1F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:W_Armin@gmx.de,m:linux-hwmon@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-14794-lists,linux-hwmon=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,smtp.kernel.org:mid,gmx.de:email,sashiko.dev:url,lists.linux.dev:replyto,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AE26764B526

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The exported function `dell_privacy_has_mic_mute()` accesses `priv=
->features_present` outside the `list_mutex` lock, leading to a Use-After-F=
ree.
--

commit 4b75804969d19b3e050e42718c6894e7f725ac80
Author: Armin Wolf <W_Armin@gmx.de>

platform/x86: dell-privacy: Use new buffer-based WMI API

Use the new buffer-based WMI API to also support ACPI firmware
implementations that do not use ACPI buffers for the device state.

> diff --git a/drivers/platform/x86/dell/dell-wmi-privacy.c b/drivers/platf=
orm/x86/dell/dell-wmi-privacy.c
> index ed099a431ea4d..7bc1bae3a196f 100644
> --- a/drivers/platform/x86/dell/dell-wmi-privacy.c
> +++ b/drivers/platform/x86/dell/dell-wmi-privacy.c

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but I noticed a pre-existing
issue in dell_privacy_has_mic_mute().

Is there a risk of a use-after-free when accessing priv->features_present?

In dell_privacy_has_mic_mute(), the list_mutex is released before the priv
pointer is dereferenced:

	mutex_lock(&list_mutex);
	priv =3D list_first_entry_or_null(&wmi_list,
			struct privacy_wmi_data,
			list);
	mutex_unlock(&list_mutex);

	return priv && (priv->features_present & BIT(DELL_PRIVACY_TYPE_AUDIO));

If a concurrent driver unbind (such as via sysfs) executes
dell_privacy_wmi_remove(), it will acquire list_mutex, remove priv from
the list, and complete.

Because priv is managed by devm, devres will automatically free the memory
as soon as the unbind finishes.

If dell_privacy_has_mic_mute() resumes and evaluates priv->features_present
after the mutex is dropped, could this result in dereferencing freed memory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605205937.5308=
97-1-W_Armin@gmx.de?part=3D2

