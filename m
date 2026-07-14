Return-Path: <linux-hwmon+bounces-15906-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id O0GEBJdfVmo14QAAu9opvQ
	(envelope-from <linux-hwmon+bounces-15906-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 14 Jul 2026 18:11:03 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD7A756D4A
	for <lists+linux-hwmon@lfdr.de>; Tue, 14 Jul 2026 18:11:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=JDooNuiG;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15906-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15906-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26BE331062A5
	for <lists+linux-hwmon@lfdr.de>; Tue, 14 Jul 2026 16:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 685064ADD8D;
	Tue, 14 Jul 2026 16:08:16 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7474A341D;
	Tue, 14 Jul 2026 16:08:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784045296; cv=none; b=fkCfFqzXpGwXmmXWAvtFu3U9sVRKz8pv/QCh4zsG9oZupaopQihDwNkNKBgdw2lksW2kY0dJYDinkxKaTfcBP9i3It1gzntYcomL9vmEZqUL0l5EYM0MJOKfi52TCB+JBn41Es1cKrGu+5pOLa+dB/txWFHYaYG+uaTUjEvlDcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784045296; c=relaxed/simple;
	bh=PCgDJyrZF7PQ2l8Q6C5oAMPD2RJ3ukPL+csOG9GzMgE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZlyA0wdU6uk9UWoWLKfQyD8dWEjLEyonLHgPvL8ahhe+AdIfqeCsGefoBv6ZgunaYwUEvgF08BWuak5x4BxjIWU5G8Y+anxF4hbDl+ZMgMAZjTj1Zngv0aEQaxyhagtOC9g2Y6awVDsZSMMQXaB/JRakulV0hgd8iXQDA9O/fJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JDooNuiG; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CA9B1F000E9;
	Tue, 14 Jul 2026 16:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784045294;
	bh=JE9aoAyM+Ji9IJXJXeicEhJkiknwGEHk7yrb4zd+SIk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JDooNuiG86fiOrjetlceQkGsxICbeghHbQu1F9Xb4kbQGS49Jo+U0LEi9Gv1xcmGk
	 0+rnORbH+zw7OW6sfqGmNT/pmWii8YAMDJYFgrzb+fawJz6sfLmXVsTFqBTH1Nuk31
	 mO4BggfQAZuTETAZV9IwAPuAwo4maSjfOIwjAHm/LB7kS5hOjENzS9igBkDQxynbrO
	 1z4X83O9yPbtLt9ZaSDUkAS/FzqfeNsUtre0i82FE5Vv998F9cA97N5ulo7uj811/F
	 F9StFVbAuhcV3/uxDaWULHQP3z6m1cxaJcrFa1/1MOKDHX4dhkXa5Hwm4zOsa0T0uI
	 lQUb4Wl1ftfxQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/8] Add Advantech EIO driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ramiro Oliveira" <ramiro.oliveira@advantech.com>
Cc: linux-hwmon@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-watchdog@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260714-upstream-v2-v2-1-76e5e41026db@advantech.com>
References: <20260714-upstream-v2-v2-0-76e5e41026db@advantech.com>
 <20260714-upstream-v2-v2-1-76e5e41026db@advantech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 16:08:13 +0000
Message-Id: <20260714160814.3CA9B1F000E9@smtp.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-15906-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,advantech.com:email,lists.linux.dev:replyto];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ramiro.oliveira@advantech.com,m:linux-hwmon@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-watchdog@vger.kernel.org,m:mfd@lists.linux.dev,m:lee@kernel.org,s:lists@lfdr.de];
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
	TAGGED_RCPT(0.00)[linux-hwmon];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5CD7A756D4A

Thank you for your contribution! Sashiko AI review found 15 potential issue=
(s) to consider:
- [Critical] Driver uses zero-initialized `pmc[0]` array without verifying =
if the primary EC was successfully initialized, causing unintended I/O on s=
ystem port 0x00.
- [High] Missing success return for supported legacy code bases in `firmwar=
e_code_base()`.
- [High] Incorrect validation of `devm_ioport_map()` return value.
- [Medium] The `mfd_cell` array `eio_devs` is not declared as `const`.
- [Medium] The driver uses `PLATFORM_DEVID_NONE` instead of `PLATFORM_DEVID=
_AUTO`, risking sysfs naming collisions.
- [Medium] `acpi_ram_access()` truncates negative error codes into positive=
 8-bit integers.
- [Medium] The requested region for the PNP base ports is off-by-one and fa=
ils to reserve the data port.
- [Medium] Missing resource request for the dynamically discovered PMC comm=
and port.
- [Medium] Unaligned memory access and endianness assumptions in `info_show=
()`.
- [Medium] The IO port memory mapping is sized statically up to `0x49A`, bu=
t accesses dynamically discovered hardware registers which can exceed the m=
apped bounds.
- [Medium] `pmc_clear` checks the wrong status bit (`IBF` instead of `OBF`)=
 before attempting to clear pending garbage data.
- [Medium] Hardware PNP configuration mode is left unlocked on error and sk=
ip paths in `eio_init()`.
- [Low] The commit message prefix violates MFD subsystem naming conventions.
- [Low] `MFD_EIO` uses the `isa_driver` API but lacks a Kconfig dependency =
on `ISA_BUS_API`.
- [Low] Driver-specific header file is improperly placed in the global `inc=
lude/linux/mfd/` directory.
--

--- Patch [1]: [PATCH v2 1/8] Add Advantech EIO driver ---
commit d4de2a217ca69b28de748d9dadb7323cafed3d8e
Author: Ramiro Oliveira <ramiro.oliveira@advantech.com>
Subject: Add Advantech EIO driver

Creating the core driver for Advantech EIO, all other drivers depend on thi=
s.

> Add Advantech EIO driver

[Severity: Low]
This isn't a bug, but the commit message prefix violates MFD subsystem nami=
ng
conventions. Should it follow the mfd: <Driver>: <Capitalized description>
format?

> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 35f6e9b76d056..42d133a2eb8dc 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig

[ ... ]

> @@ -517,6 +517,16 @@ config MFD_DLN2
>  	  etc. must be enabled in order to use the functionality of
>  	  the device.
> =20
> +config MFD_EIO
> +	tristate "Advantech EIO core"

[Severity: Low]
Does this config need a dependency on ISA_BUS_API? This driver uses the
isa_driver API which requires CONFIG_ISA_BUS_API to avoid build errors on
architectures lacking ISA support.

> +	select MFD_CORE

[ ... ]

> diff --git a/drivers/mfd/eio_core.c b/drivers/mfd/eio_core.c
> new file mode 100644
> index 0000000000000..25873c0618127
> --- /dev/null
> +++ b/drivers/mfd/eio_core.c

[ ... ]

> +static struct mfd_cell eio_devs[] =3D {

[Severity: Medium]
Should this array be declared as static const? The MFD subsystem guidelines
require child platform data arrays to reside in read-only memory.

> +	MFD_CELL_NAME("eio_wdt"),
> +	MFD_CELL_NAME("gpio_eio"),
> +	MFD_CELL_NAME("eio_hwmon"),

[ ... ]

> +static ssize_t info_show(struct device *dev, struct device_attribute *at=
tr, char *buf)
> +{
> +	uint i;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(attrs); i++) {
> +		int ret;
> +		char str[32] =3D "";
> +		int val;

[ ... ]

> +		if (attrs[i].size !=3D 4)
> +			return sysfs_emit(buf, "%s\n", str);
> +
> +		val =3D *(u32 *)str;

[Severity: Medium]
Can this cast cause read corruption on big-endian platforms or potential
alignment faults? Would using get_unaligned_le32() be safer here?

> +
> +		if (attrs[i].type =3D=3D HEX)

[ ... ]

> +static void pmc_clear(struct device *dev, int id)
> +{
> +	struct eio_dev *eio =3D dev_get_drvdata(dev);
> +	unsigned int val;
> +
> +	/* Check if input buffer blocked */
> +	if ((pmc_read_status(dev, id) & EIO_PMC_STATUS_IBF) =3D=3D 0)

[Severity: Medium]
Is this checking the wrong status bit? To check if there is residual output
data to clear from the EC buffer, shouldn't this check OBF (Output Buffer
Full) instead of IBF (Input Buffer Full)?

> +		return;
> +
> +	/* Read out previous garbage */

[ ... ]

> +static int get_pmc_port(struct device *dev, int id,
> +			struct eio_dev_port *port)
> +{

[ ... ]

> +	/* Make sure IO ports are not occupied */
> +	if (!devm_request_region(dev, pmc->data, 2, KBUILD_MODNAME)) {

[Severity: Medium]
Does this leave the PMC command port (pmc->cmd) unprotected? It looks like
only the data port is requested here.

> +		dev_err(dev, "Request region %X error\n", pmc->data);
> +		return -EBUSY;
> +	}
> +
> +	return 0;
> +}

[ ... ]

> +static int eio_init(struct device *dev)
> +{
> +	struct eio_dev *eio =3D dev_get_drvdata(dev);
> +	u16 chip_id;
> +	unsigned int msb, lsb;
> +	int tmp;
> +	int ret =3D -ENOMEM;
> +
> +	for (int chip =3D 0; chip < ARRAY_SIZE(pnp_port); chip++) {
> +		struct eio_dev_port *port =3D pnp_port + chip;
> +
> +		if (!devm_request_region(dev, pnp_port[chip].idx_port,
> +					 pnp_port[chip].data_port -
> +						 pnp_port[chip].idx_port,

[Severity: Medium]
Is this calculation off-by-one? The subtraction data_port - idx_port evalua=
tes
to 1, which only requests the index port. Should it include a + 1 to reserve
the data port as well?

> +					 KBUILD_MODNAME))
> +			continue;
> +
> +		ret =3D eio_unlock_port(dev, port);
> +		if (ret)
> +			return ret;
> +
> +		ret =3D eio_pnp_read(dev, port, EIO_CHIPID1, &msb);
> +		if (ret)
> +			return ret;
> +
> +		ret =3D eio_pnp_read(dev, port, EIO_CHIPID2, &lsb);
> +		if (ret)
> +			return ret;
> +
> +		chip_id =3D (msb << 8) | lsb;
> +
> +		if (chip_id !=3D EIO200_CHIPID && chip_id !=3D EIO201_211_CHIPID)
> +			continue;

[Severity: Medium]
Does this continue bypass eio_lock_port() and leave the hardware PNP
configuration mode unlocked on error and skip paths? This might leave the
index and data ports susceptible to accidental modification.

[Severity: Critical]
Additionally, if this loop completes without finding a valid chip_id, the l=
oop
exits and returns ret =3D 0. This causes eio_init() to succeed, and the=20
uninitialized pmc[0] array is then passed to acpi_ram_access(). This could
trigger regmap operations on system port 0x00 (system DMA controller base),
potentially leading to hardware corruption or a system hang on unsupported
hardware.

> +
> +		/* Turn on the enable flag */
> +		ret =3D eio_pnp_read(dev, port, EIO_SIOCTRL, &tmp);

[ ... ]

> +static uint8_t acpi_ram_access(struct device *dev, uint8_t offset)

[Severity: Medium]
Does this function truncate negative error codes into positive 8-bit intege=
rs?
Since standard negative error codes (like -110 for timeout) can be returned=
 by
PMC operations, the caller might misinterpret corrupted error codes as valid
ACPI RAM data.

> +{
> +	uint8_t val;
> +	int ret;
> +	struct eio_dev *eio =3D dev_get_drvdata(dev);

[ ... ]

> +static int firmware_code_base(struct device *dev)
> +{
> +	struct eio_dev *eio =3D dev_get_drvdata(dev);
> +	u8 ic_vendor, ic_code, code_base;
> +
> +	ic_vendor =3D acpi_ram_access(dev, EIO_ACPIRAM_ICVENDOR);
> +	ic_code =3D acpi_ram_access(dev, EIO_ACPIRAM_ICCODE);
> +	code_base =3D acpi_ram_access(dev, EIO_ACPIRAM_CODEBASE);
> +
> +	if (ic_vendor !=3D 'R')
> +		return -ENODEV;
> +
> +	if (ic_code !=3D EIO200_ICCODE && ic_code !=3D EIO201_ICCODE &&
> +	    ic_code !=3D EIO211_ICCODE)
> +		goto err;
> +
> +	if (code_base =3D=3D EIO_ACPIRAM_CODEBASE_NEW) {
> +		eio->flag |=3D EIO_F_NEW_CODE_BASE;
> +		return 0;
> +	}
> +
> +	if (code_base =3D=3D 0 &&
> +	    (ic_code !=3D EIO201_ICCODE && ic_code !=3D EIO211_ICCODE)) {
> +		dev_info(dev, "Old code base not supported.");
> +		return -ENODEV;
> +	}
> +
> +err:

[Severity: High]
Does this logic miss a success return for supported legacy code bases? If
code_base =3D=3D 0 and ic_code is a supported legacy code, the if block is
skipped and execution falls through to the err: label, erroneously returning
-ENODEV and failing to probe on supported hardware.

> +	/* Codebase error. This should only happen on firmware error. */
> +	dev_err(dev,
> +		"Codebase check fail: vendor: 0x%X, code: 0x%X, base: 0x%X\n",

[ ... ]

> +static int eio_probe(struct device *dev, unsigned int id)
> +{
> +	int ret =3D 0;
> +	struct eio_dev *eio;
> +
> +	eio =3D devm_kzalloc(dev, sizeof(*eio), GFP_KERNEL);
> +	if (!eio)
> +		return -ENOMEM;
> +
> +	eio->dev =3D dev;
> +	mutex_init(&eio->mutex);
> +
> +	eio->iomem =3D devm_ioport_map(dev, 0, EIO_SUB_PNP_DATA + 1);

[Severity: Medium]
Is this static mapping bound potentially too small? The mapping strictly co=
vers
up to EIO_SUB_PNP_DATA + 1 (0x49B), but the driver accesses dynamically
discovered hardware registers which can exceed these bounds anywhere in the
16-bit IO space.

> +	if (IS_ERR(eio->iomem))

[Severity: High]
Will this error check incorrectly pass on memory exhaustion?
devm_ioport_map() returns NULL on failure, so checking IS_ERR instead of
NULL could lead to a NULL pointer dereference in devm_regmap_init_mmio().

> +		return PTR_ERR(eio->iomem);
> +
> +	eio->map =3D devm_regmap_init_mmio(dev, eio->iomem, &pnp_regmap_config);
> +	if (IS_ERR(eio->map))
> +		return PTR_ERR(eio->map);
> +
> +	/* Publish instance for subdrivers (dev_get_drvdata(dev->parent)) */
> +	dev_set_drvdata(dev, eio);
> +
> +	if (eio_init(dev))
> +		return -ENODEV;
> +
> +	ret =3D firmware_code_base(dev);
> +	if (ret) {
> +		dev_err(dev, "Chip code base check fail\n");
> +		return ret;
> +	}
> +
> +	ret =3D devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,

[Severity: Medium]
Should PLATFORM_DEVID_AUTO be used here instead of PLATFORM_DEVID_NONE?
The MFD subsystem guidelines require using PLATFORM_DEVID_AUTO for automatic
cell indexing to avoid sysfs naming collisions.

> +				   eio_devs, ARRAY_SIZE(eio_devs),
> +				   NULL, 0, NULL);

[ ... ]

> diff --git a/include/linux/mfd/eio.h b/include/linux/mfd/eio.h
> new file mode 100644
> index 0000000000000..c2daad41318bf
> --- /dev/null
> +++ b/include/linux/mfd/eio.h
> @@ -0,0 +1,124 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2025 Advantech Co., Ltd.
> + */
> +
> +#ifndef _MFD_EIO_H_
> +#define _MFD_EIO_H_

[Severity: Low]
This isn't a bug, but should this driver-specific header file be placed in
drivers/mfd/ instead of the global include/linux/mfd/ directory? The MFD
subsystem guidelines explicitly dictate keeping headers local if they are o=
nly
used by the parent and immediate children.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-upstream-v=
2-v2-0-76e5e41026db@advantech.com?part=3D1

