Return-Path: <linux-hwmon+bounces-14135-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0H/IBcYsB2oLsgIAu9opvQ
	(envelope-from <linux-hwmon+bounces-14135-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 15 May 2026 16:25:10 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEB7551564
	for <lists+linux-hwmon@lfdr.de>; Fri, 15 May 2026 16:25:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1111300697C
	for <lists+linux-hwmon@lfdr.de>; Fri, 15 May 2026 14:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C775624336D;
	Fri, 15 May 2026 14:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s/+45s+y"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC263955F2
	for <linux-hwmon@vger.kernel.org>; Fri, 15 May 2026 14:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778854936; cv=none; b=javFupvWHLsWn4ORMQ2OuFJV4VXXvoedmVWfRqW33p/JAi4wHffAiCbq4QINC8lzWVNFXGOmvlYRhx3++XZk1G/PwpihqrhYNKo7EcX2nQi7SnMMBmyvS5O2FYFojDz0ze5OSyb0VOtv/2vKfPN5EcYGhlKdT92DKMnzONDLAXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778854936; c=relaxed/simple;
	bh=SKDmdjpcsn1+r5Jvh/JInilj+DZS0vkrqUUYSNW0muI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LCrTvqHtrnoxmhnc98D0/3UtiQJ1RAHCs/w0vgkMdA4IZ7p1DzIfN9fxBBbmrl02NJT7Po9CW4LyNG8V25KRTH53fC+OVaTeOnHYTdqpSL9SBQCFS3MWYOx0O216FHIrBzcqzxMEMCuNrTJmH3wFNRCd01IRckKL580HtN4sdro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s/+45s+y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CD9EC2BCB0;
	Fri, 15 May 2026 14:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778854936;
	bh=SKDmdjpcsn1+r5Jvh/JInilj+DZS0vkrqUUYSNW0muI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=s/+45s+yyMKvaru8B2ifb94KmPJbjKpbpiIUuTSpOFSIvIf46rvcxX/NrzBZV9wgn
	 357IdNi9J9qGT5EWcPsLiBk+8h1pmBI026mtmgLcXogwtysg1Bpj8zpkdCIpEHiYhy
	 6WvW/CSMvVbzGUaiJX/Zszz5F/Vu4EuTCIMJdKdDG6j7aZKmr6LusoP5fxtRgPGGyr
	 ZzhngnUf1q/DZ6nzalxOSaVYX1RuOjgQD8aN7mqOZhZwbQFfrJ73mO/X/ovW22oYTo
	 Kd9SwBV/FLufnJ/tnEeSYyFwrN8rDs7s95wgUlosrObXquuaf0zYLlrO8aVrj5jNWM
	 AFf3FR/c/TEGw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/6] hwmon/misc: amd-sbi: Move core sbtsi support
 from hwmon to misc
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akshay Gupta" <Akshay.Gupta@amd.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260515134506.397649-2-Akshay.Gupta@amd.com>
References: <20260515134506.397649-2-Akshay.Gupta@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 14:22:15 +0000
Message-Id: <20260515142215.9CD9EC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 2EEB7551564
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-14135-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sashiko.dev:url,smtp.kernel.org:mid,amd.com:email,lists.linux.dev:replyto]
X-Rspamd-Action: no action

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Auxiliary device ID collision prevents probe of multiple SB-TSI se=
nsors
- [Medium] Kconfig dependency change causes silent loss of the hwmon driver=
 on kernel upgrades
--

commit fe75a41fdaa2ec32654699f9128ef6e13b7c7140
Author: Prathima <Prathima.Lk@amd.com>

hwmon/misc: amd-sbi: Move core sbtsi support from hwmon to misc

This commit moves the core Side-Band Temperature Sensor Interface (SBTSI)
logic into drivers/misc/amd-sbi/tsi.c. It registers an auxiliary device per
target so that the hwmon driver can bind to it while allowing other consume=
rs
to reuse the core functionality.

> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 14e4cea48acc4..6fa51e6ef6ff4 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1939,7 +1939,7 @@ config SENSORS_SL28CPLD
> =20
>  config SENSORS_SBTSI
>  	tristate "Emulated SB-TSI temperature sensor"
> -	depends on I2C
> +	depends on AMD_SBTSI

Is there a risk that this dependency change could silently disable the
hwmon driver on kernel upgrades?

Because CONFIG_AMD_SBTSI has no default value, an unattended configuration
update like make olddefconfig might drop CONFIG_SENSORS_SBTSI entirely due
to unmet dependencies.

Could CONFIG_AMD_SBTSI be selected by CONFIG_SENSORS_SBTSI instead, or use
a default strategy to ensure existing user configurations are preserved?

[ ... ]

> diff --git a/drivers/misc/amd-sbi/tsi.c b/drivers/misc/amd-sbi/tsi.c
> new file mode 100644
> index 0000000000000..ee22167855505
> --- /dev/null
> +++ b/drivers/misc/amd-sbi/tsi.c

[ ... ]

> +static int sbtsi_create_hwmon_adev(struct device *dev, u8 dev_addr)
> +{
> +	struct auxiliary_device *adev;
> +	int ret;
> +
> +	adev =3D kzalloc_obj(*adev);
> +	if (!adev)
> +		return -ENOMEM;
> +
> +	adev->name =3D AMD_SBTSI_AUX_HWMON;
> +	adev->id =3D dev_addr;

Could this assignment to adev->id cause a collision on multi-socket AMD
systems?

It looks like auxiliary device names are constructed globally as
modname.name.id by __auxiliary_device_add().

If multi-socket systems have identical sensors at the same I2C address
(for example, 0x4c) on different I2C adapters, probing the second sensor
might result in a duplicate sysfs name and cause device_add() to fail with
-EEXIST.

Should the driver allocate a globally unique instance ID for each
auxiliary device using an IDA, rather than relying solely on the I2C
address?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515134506.3976=
49-1-Akshay.Gupta@amd.com?part=3D1

