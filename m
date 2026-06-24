Return-Path: <linux-hwmon+bounces-15309-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2ea1An61O2qpbggAu9opvQ
	(envelope-from <linux-hwmon+bounces-15309-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 24 Jun 2026 12:46:22 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 512886BD7BC
	for <lists+linux-hwmon@lfdr.de>; Wed, 24 Jun 2026 12:46:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=T9LRnklb;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15309-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15309-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2BADD300F9F5
	for <lists+linux-hwmon@lfdr.de>; Wed, 24 Jun 2026 10:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98B982DCC05;
	Wed, 24 Jun 2026 10:45:56 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4D524676D;
	Wed, 24 Jun 2026 10:45:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782297956; cv=none; b=SO5L74aJc2j18EFXHbRlS/c7TuuYdxIOdPXVoNSwUkr5gGKn43fZ/4hzGKG4/+0Lfdt5FFNb7T2ELVAxAiEFvPkwGU7MV8tvzu9W3TI0V2r0F2EFs6AWf4Nt15yQaTbdMHvm2siVT+l0OanZGhvOjC6t0DIJdiEqPKYpwzYV1eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782297956; c=relaxed/simple;
	bh=vZVfmvw9xB2HuoyqqYJItu4LS2lP2wWNbBJJpDqkOKw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PaP/FOkpHlZIW7vXt2/WzyVdKCXyewX0oj0u8vz/HAGRTLOhHnb4LEXK6DXox58Xa66HDXmgj+94OPF3Xm5yr/Us5yGNTQC40F7c+xOcztiGYu7YnT85z28U/+5STuOlF6sFZtfYJzi7PE37m2XIvPMaapWHcWLbMNfV1+FENCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T9LRnklb; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98EF71F000E9;
	Wed, 24 Jun 2026 10:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782297954;
	bh=jKgs/HAdxm66fJBTL5AbFOaCH3Dsrsjs1Xn5W2bk2uc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T9LRnklbFBzDyZ4eOOjBx+K4b8XigR6393mpFcGCRyqGNm7JOyLOHNXb/E8jAulRl
	 b7zJd4XLYHlAbaS96to9YylCDUztHUZwOyUOT47y6iyaI6ZUBjReM5UjEPW43qGMdI
	 osVrlzzrX+By8WTcI6gTornVcSAPDoceAIJt1zzuhvsy5+y63rrFh66xqaA6nnTNZw
	 KCQ6oQjRiK5ZCAq0H8Q+Li3fJv8vg37alYfn3rJU+yrK/w2TyKY43+t13UmQuiSQ2M
	 j5IRmjzzdL+ZWRekB+ZeAfGxgF5HrVKKOIbe+sabJvgYXuRkekau0ttFNx2ePB3gKp
	 n4silM0x/kElw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 05/12] i3c: master: Add support for devices without
 PID
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: Frank.Li@kernel.org, robh@kernel.org, conor+dt@kernel.org, linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260624102153.1770072-6-akhilrajeev@nvidia.com>
References: <20260624102153.1770072-1-akhilrajeev@nvidia.com>
 <20260624102153.1770072-6-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 10:45:54 +0000
Message-Id: <20260624104554.98EF71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	MISSING_MIME_VERSION(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-15309-lists,linux-hwmon=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akhilrajeev@nvidia.com,m:Frank.Li@kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:linux-i3c@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,sashiko.dev:url,nvidia.com:email,smtp.kernel.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 512886BD7BC

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

New issues:
- [High] Devices returning a PID of 0 during Dynamic Address Assignment (DA=
A) bypass duplicate detection, leading to sysfs naming collisions that reli=
ably trigger a preexisting Use-After-Free.
- [Medium] The driver incorrectly allows non-SETAASA I3C devices to be defi=
ned in the device tree with a PID of 0, permanently breaking device matchin=
g upon Hot-Join re-attachment.
- [Low] The newly added static address matching logic in `i3c_master_attach=
_boardinfo()` will never successfully match any device, rendering the `else=
` branch dead code.
- [Low] Redundant boolean check for `i3cdev->info.pid` inside the duplicate=
 search loop.

Pre-existing issues:
- [High] Dangling pointer in `desc->dev` leads to a Use-After-Free and Doub=
le Free if `device_register()` fails.
- [High] Calling `device_register()` while holding a read lock on the bus r=
wsem can lead to a deadlock if the driver's probe function attempts an I3C =
transfer.
--

commit 76e7c85069f65f75e5476a13e6f4ab2ae705589f
Author: Akhil R <akhilrajeev@nvidia.com>

i3c: master: Add support for devices without PID

Devices using SETAASA for address assignment are not required to have
a 48-bit PID according to the I3C specification. Allow such devices to
register and use the static address where PID was required.

> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 3deae8cdae525..bd0dc76c7ba1e 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1989,8 +1989,17 @@ i3c_master_register_new_i3c_devs(struct i3c_master=
_controller *master)
>  		desc->dev->dev.type =3D &i3c_device_type;
>  		desc->dev->dev.bus =3D &i3c_bus_type;
>  		desc->dev->dev.release =3D i3c_device_release;
> -		dev_set_name(&desc->dev->dev, "%d-%llx", master->bus.id,
> -			     desc->info.pid);
> +
> +		/*
> +		 * For devices without PID (e.g., SETAASA devices), use
> +		 * static address for naming instead.
> +		 */
> +		if (desc->info.pid)
> +			dev_set_name(&desc->dev->dev, "%d-%llx", master->bus.id,
> +				     desc->info.pid);
> +		else
> +			dev_set_name(&desc->dev->dev, "%d-%02x", master->bus.id,
> +				     desc->info.static_addr);
> =20
>  		if (desc->boardinfo)
>  			device_set_node(&desc->dev->dev,

[Severity: High]
This is a pre-existing issue, but does failing to clear desc->dev when
device_register() fails lead to a double free and use-after-free later?

Looking at i3c_master_register_new_i3c_devs():

    ret =3D device_register(&desc->dev->dev);
    if (ret) {
        dev_err(&master->dev, "Failed to add I3C device (err =3D %d)\n", re=
t);
        put_device(&desc->dev->dev);
    }

If device_register() fails, put_device() is called which frees the i3c_devi=
ce
structure, but desc->dev is left dangling. Later, when the master is
unregistered in i3c_master_unregister_i3c_devs(), the loop checks:

    if (!i3cdev->dev)
        continue;
    i3cdev->dev->desc =3D NULL;
    if (device_is_registered(&i3cdev->dev->dev))
        device_unregister(&i3cdev->dev->dev);
    else
        put_device(&i3cdev->dev->dev);

Since desc->dev is not NULL, this writes to the freed memory and then calls
put_device() again, resulting in a use-after-free and double free.

[Severity: High]
This is also a pre-existing issue, but can calling device_register() while
holding a read lock on the bus rwsem lead to a deadlock?

In i3c_master_reg_work_fn():

    i3c_bus_normaluse_lock(&master->bus);
    if (!master->shutting_down)
        i3c_master_register_new_i3c_devs(master);

The device_register() call inside i3c_master_register_new_i3c_devs()
synchronously triggers the driver's probe function. If the probe attempts an
I3C transfer, it calls i3c_device_do_priv_xfers(), which recursively reques=
ts
the read lock on the bus.

If a concurrent thread, such as a Hot Join, requests a write lock between
these two read lock attempts, the rwsem blocks the second read lock to prev=
ent
writer starvation. The writer blocks waiting for the first read lock to be
released, which won't happen until device_register() returns, resulting in =
an
ABBA deadlock.

[ ... ]

> @@ -2383,8 +2392,18 @@ static void i3c_master_attach_boardinfo(struct i3c=
_dev_desc *i3cdev)
>  	struct i3c_dev_boardinfo *i3cboardinfo;
> =20
>  	list_for_each_entry(i3cboardinfo, &master->boardinfo.i3c, node) {
> -		if (i3cdev->info.pid !=3D i3cboardinfo->pid)
> -			continue;
> +		/*
> +		 * For devices without PID (e.g., SETAASA devices), match by
> +		 * static address. For devices with PID, match by PID.
> +		 */
> +		if (i3cboardinfo->pid) {
> +			if (i3cdev->info.pid !=3D i3cboardinfo->pid)
> +				continue;
> +		} else {
> +			if (!i3cboardinfo->static_addr ||
> +			    i3cdev->info.static_addr !=3D i3cboardinfo->static_addr)
> +				continue;
> +		}

[Severity: Low]
Will this newly added else block ever successfully match a device?

i3c_master_attach_boardinfo() is called from
__i3c_master_add_i3c_dev_locked() to handle devices discovered dynamically =
via
DAA or Hot-Join. For these devices, the hardware does not provide a static
address during DAA, so i3cdev->info.static_addr is strictly 0.

Because of this, the condition
i3cdev->info.static_addr !=3D i3cboardinfo->static_addr
will evaluate to 0 !=3D non_zero, which is always true. This causes the loop
to unconditionally continue, making this fallback dead code.

> =20
>  		i3cdev->boardinfo =3D i3cboardinfo;
>  		i3cdev->info.static_addr =3D i3cboardinfo->static_addr;
> @@ -2398,8 +2417,12 @@ i3c_master_search_i3c_dev_duplicate(struct i3c_dev=
_desc *refdev)
>  	struct i3c_master_controller *master =3D i3c_dev_get_master(refdev);
>  	struct i3c_dev_desc *i3cdev;
> =20
> +	if (!refdev->info.pid)
> +		return NULL;
> +

[Severity: High]
Does returning NULL when PID is 0 allow devices to bypass duplicate detecti=
on
and trigger the pre-existing use-after-free bug?

If a dynamically discovered device reports a PID of 0, this check
unconditionally bypasses duplicate rejection, so the device is repeatedly
added.

Because static_addr is also 0 for DAA-discovered devices, the new naming
fallback in i3c_master_register_new_i3c_devs():

    dev_set_name(&desc->dev->dev, "%d-%02x", master->bus.id,
                 desc->info.static_addr);

will name multiple devices the same (e.g., %d-00). The first instance will
register successfully, but subsequent ones will fail device_register() due =
to
sysfs name collisions. This perfectly triggers the desc->dev use-after-free
on the error path.

>  	i3c_bus_for_each_i3cdev(&master->bus, i3cdev) {
> -		if (i3cdev !=3D refdev && i3cdev->info.pid =3D=3D refdev->info.pid)
> +		if (i3cdev !=3D refdev && i3cdev->info.pid &&
> +		    i3cdev->info.pid =3D=3D refdev->info.pid)

[Severity: Low]
Is the check for i3cdev->info.pid redundant here?

Since refdev->info.pid was explicitly checked for being non-zero right befo=
re
this loop, the equality check i3cdev->info.pid =3D=3D refdev->info.pid alre=
ady
guarantees that i3cdev->info.pid is non-zero. The boolean check isn't stric=
tly
necessary.

>  			return i3cdev;
>  	}

[ ... ]

> @@ -2832,9 +2855,15 @@ i3c_master_add_i3c_boardinfo(struct i3c_master_con=
troller *master,
> =20
>  	boardinfo->pid =3D ((u64)reg[1] << 32) | reg[2];
> =20
> -	if ((boardinfo->pid & GENMASK_ULL(63, 48)) ||
> -	    I3C_PID_RND_LOWER_32BITS(boardinfo->pid))
> -		return -EINVAL;
> +	/* For SETAASA devices, validate the static address instead of PID */
> +	if (boardinfo->static_addr_method & I3C_ADDR_METHOD_SETAASA) {
> +		if (!boardinfo->static_addr)
> +			return -EINVAL;
> +	} else {
> +		if ((boardinfo->pid & GENMASK_ULL(63, 48)) ||
> +		    I3C_PID_RND_LOWER_32BITS(boardinfo->pid))
> +			return -EINVAL;
> +	}

[Severity: Medium]
Could this logic incorrectly allow non-SETAASA I3C devices in the device tr=
ee
to have a PID of 0, permanently breaking device matching upon Hot-Join?

If a device is configured with mipi-i3c-static-method =3D SETDASA, it will =
reach
this else block. If its PID is 0, both boardinfo->pid & GENMASK_ULL(63, 48)
and I3C_PID_RND_LOWER_32BITS(boardinfo->pid) evaluate to 0, which bypasses
validation, and the device registers with PID 0.

If the device later Hot-Joins, DAA will retrieve its real, non-zero PID. Wh=
en
i3c_master_attach_boardinfo() runs, it sees i3cboardinfo->pid =3D=3D 0 and =
falls
back to matching by static_addr. Because static_addr is 0 during DAA, it
fails to match and the device permanently loses its DT properties.

> =20
>  	boardinfo->init_dyn_addr =3D init_dyn_addr;
>  	boardinfo->fwnode =3D fwnode_handle_get(fwnode);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624102153.1770=
072-1-akhilrajeev@nvidia.com?part=3D5

