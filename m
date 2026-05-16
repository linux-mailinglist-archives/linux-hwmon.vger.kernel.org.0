Return-Path: <linux-hwmon+bounces-14180-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uK/0NK4xCGqudgMAu9opvQ
	(envelope-from <linux-hwmon+bounces-14180-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sat, 16 May 2026 10:58:22 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EC355AD06
	for <lists+linux-hwmon@lfdr.de>; Sat, 16 May 2026 10:58:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8078D300EF7B
	for <lists+linux-hwmon@lfdr.de>; Sat, 16 May 2026 08:58:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D4DE380FEE;
	Sat, 16 May 2026 08:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SrNZodaR"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFB0380FCE;
	Sat, 16 May 2026 08:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778921899; cv=none; b=jKjL327dM9yz4DNCClZSLVtBeCgK17jHdevFVYTBPykkmnhoiCEj3QUcNboQ4ZEEcgDnFzAQHbHRkA7P/a3Ghht4xvrWnscQK7lO3KQNYizgqe1mVjrZzN+24InXuE0j9pMI4Ktd+Cc8HXru8XOZoJY7qk+8WI3aG0MjfFQd+eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778921899; c=relaxed/simple;
	bh=dinb0IQ5qy1hbH/IQIh+2H5l94KQ4lc28u7UcPyWt5I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fdKt6ecwuGbmriutelw005bqAsa1MalMZH/HLGxIFFSxrr6k2OZ7trqiavDaZ72bGdV/ckGKzYgCy3CTgC8plKJh+UmA8HifzvwWQr34KHM6229YHvBJBHcifhM5UMPU1l50LWCuej2FvVcmFqPEEAaE/VfiS1qQ2Jn9jg/N9eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SrNZodaR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55708C19425;
	Sat, 16 May 2026 08:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778921899;
	bh=dinb0IQ5qy1hbH/IQIh+2H5l94KQ4lc28u7UcPyWt5I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=SrNZodaRZ4hSG3JdozlvcFnVEH6skQkaCUdwl10Gbcnt+Excvm9voJojCMXN46eW3
	 83bPvIZh22syTKsEUdIruDQBecj4aY/me8GACOWqSxSKVyDlQMGVOG6dOzYYgji6Fx
	 VdIINDN+a/bJNJgmfpkIcGNw/S7yp/jkd5+h29ncsxNNmVTgwybZmi/Y/RjRmURe0s
	 VkRttNhSNDK4MzBMPRSlimix5ifbWudYXU5sCj4vOl/eHkHk9YYJMfX1y0RmYHoiBw
	 0McnP/2bUJzxuPe+NJLjN0MxjXJFAQ7402U3LatUDC/ZK+4sCG+OQG0NmACnPh6Wky
	 CqV0Z4W4pg0Vg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/1] mfd: Add Host Interface (HIF) support for
 Nuvoton NCT6694
Reply-To: sashiko-reviews@lists.linux.dev
To: a0282524688@gmail.com
Cc: linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260515085746.114361-2-a0282524688@gmail.com>
References: <20260515085746.114361-2-a0282524688@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 16 May 2026 08:58:18 +0000
Message-Id: <20260516085819.55708C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 52EC355AD06
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14180-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [Critical] Calling devm_request_threaded_irq() with a NULL primary handle=
r and IRQF_SHARED unconditionally fails.
- [High] The Linux virtual IRQ number is incorrectly written to the hardwar=
e Super-I/O IRQ routing register.
- [High] USB transfer buffers are allocated with devm_kzalloc(), violating =
DMA cacheline alignment requirements.
- [High] Hardware interrupts are enabled before the IRQ handler is register=
ed, and disabled after the handler is freed, creating a window for unhandle=
d interrupt storms.
- [High] Missing bounds check on interface->endpoint array before accessing=
 the first endpoint in the USB probe function.
- [High] The USB interrupt callback ignores urb->actual_length, risking rea=
ding uninitialized or stale memory.
- [High] Returning IRQ_NONE after successfully acknowledging the device's i=
nterrupt in the HIF IRQ handler.
- [High] Software-only IRQ masking causes an interrupt storm if a child dev=
ice's IRQ is disabled by the OS.
--

commit 719984a8b6993b3c3d29315e4713194e4c4a7af4
Author: Ming Yu <a0282524688@gmail.com>

mfd: Add Host Interface (HIF) support for Nuvoton NCT6694

The Nuvoton NCT6694 provides a Host Interface (HIF) via eSPI. This commit
updates the driver configuration to allow selecting between the USB and HIF
interfaces, sharing common functions and sub-devices.

> diff --git a/drivers/mfd/nct6694-hif.c b/drivers/mfd/nct6694-hif.c
> new file mode 100644
> index 0000000000000..ca8c08b0d2e34
> --- /dev/null
> +++ b/drivers/mfd/nct6694-hif.c
[ ... ]
> +static irqreturn_t nct6694_irq_handler(int irq, void *data)
> +{
> +	struct nct6694 *nct6694 =3D data;
> +	struct nct6694_hif_data *hdata =3D nct6694->priv;
> +	u8 reg_data[4];
> +	u32 intr_status;
> +	int ret;
> +
> +	/* Check interrupt status is set */
> +	if (!(inb(hdata->shm_base + NCT6694_SHM_COFS_STS) & NCT6694_SHM_COFS_ST=
S_COFS4W))
> +		return IRQ_NONE;
> +
> +	/* Clear interrupt status */
> +	outb(NCT6694_SHM_COFS_STS_COFS4W, hdata->shm_base + NCT6694_SHM_COFS_ST=
S);
> +
> +	ret =3D regmap_bulk_read(hdata->regmap, NCT6694_SHM_INTR_STATUS,
> +			       reg_data, ARRAY_SIZE(reg_data));
> +	if (ret)
> +		return IRQ_NONE;

Is it correct to return IRQ_NONE here?

The driver has already verified the interrupt belongs to the device and
cleared it at the hardware level.

Should this return IRQ_HANDLED instead to prevent misleading the kernel's
spurious interrupt detector?

[ ... ]
> +static int nct6694_irq_init(struct nct6694 *nct6694, int irq)
> +{
> +	struct nct6694_hif_data *hdata =3D nct6694->priv;
> +	struct nct6694_sio_data *sio_data =3D hdata->sio_data;
> +	unsigned char cofs_ctl2;
> +	int ret;
> +
> +	/* Set SIRQ number */
> +	ret =3D superio_enter(sio_data);
> +	if (ret)
> +		return ret;
> +
> +	superio_select(sio_data, SIO_REG_LD_SHM);
> +
> +	if (!superio_inb(sio_data, SIO_REG_SHM_ENABLE)) {
> +		superio_exit(sio_data);
> +		return -EIO;
> +	}
> +
> +	hdata->shm_base =3D superio_inw(sio_data, SIO_REG_SHM_BASE_ADDR);
> +
> +	superio_outb(sio_data, SIO_REG_SHM_IRQ_NR, irq);

Does irq hold a Linux virtual IRQ number here?

platform_get_irq() returns a Linux-internal virtual IRQ number (virq), while
the Super-I/O hardware configuration register typically expects a physical =
ISA
IRQ routing number (e.g. 0-15).

Could writing a virtual IRQ number misconfigure the hardware?

[ ... ]
> +static void nct6694_irq_disable(struct irq_data *data)
> +{
> +	struct nct6694 *nct6694 =3D irq_data_get_irq_chip_data(data);
> +	irq_hw_number_t hwirq =3D irqd_to_hwirq(data);
> +
> +	guard(spinlock_irqsave)(&nct6694->irq_lock);
> +
> +	nct6694->irq_enable &=3D ~BIT(hwirq);
> +}

Could this software-only IRQ masking cause an interrupt storm?

If a child device's IRQ is disabled by the OS, nct6694->irq_enable is updat=
ed
but the interrupt is not masked at the hardware level.

Since the top-level handler nct6694_irq_handler() dispatches interrupts via
generic_handle_irq_safe(), which ignores irq_enable, could the device
immediately reassert the interrupt if the child handler never runs to clear
the hardware condition?

[ ... ]
> +static int nct6694_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	ret =3D nct6694_irq_init(data, irq);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D devm_add_action_or_reset(dev, nct6694_irq_release, data);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D devm_request_threaded_irq(dev, irq, NULL, nct6694_irq_handler,
> +					IRQF_ONESHOT | IRQF_SHARED,
> +					dev_name(dev), data);

Does this sequence create a window for unhandled interrupt storms?

nct6694_irq_init() enables interrupts on the device hardware, and the OS
handler is requested afterwards. Similarly, because devres unwinds in rever=
se
order, the OS handler will be freed before the hardware interrupt is disabl=
ed
during removal.

Also, can devm_request_threaded_irq() succeed here?

The Linux interrupt core explicitly rejects requests for shared interrupts
(IRQF_SHARED) with a NULL primary hardirq handler, returning -EINVAL.

> diff --git a/drivers/mfd/nct6694.c b/drivers/mfd/nct6694.c
> index 308b2fda3055c..cf3457c2b3ed2 100644
> --- a/drivers/mfd/nct6694.c
> +++ b/drivers/mfd/nct6694.c
[ ... ]
> @@ -210,10 +236,12 @@ static void usb_int_callback(struct urb *urb)
>  	int_status =3D le32_to_cpu(*status_le);
> =20
>  	while (int_status) {
> -		int irq =3D __ffs(int_status);
> +		int hwirq =3D __ffs(int_status);
> +		unsigned int virq =3D irq_find_mapping(nct6694->domain, hwirq);

Is it safe to read *status_le without checking urb->actual_length?

If a buggy or malicious USB device sends a short packet or a Zero-Length
Packet (ZLP), could the driver read uninitialized or stale data from the
transfer buffer?

[ ... ]
> @@ -284,18 +313,28 @@ static int nct6694_usb_probe(struct usb_interface *=
iface,
>  	if (!nct6694)
>  		return -ENOMEM;
> =20
> -	nct6694->usb_msg =3D devm_kzalloc(dev, sizeof(union nct6694_usb_msg), G=
FP_KERNEL);
> -	if (!nct6694->usb_msg)
> +	udata =3D devm_kzalloc(dev, sizeof(*udata), GFP_KERNEL);
> +	if (!udata)
>  		return -ENOMEM;
> =20
> -	nct6694->int_buffer =3D devm_kzalloc(dev, sizeof(*nct6694->int_buffer),=
 GFP_KERNEL);
> -	if (!nct6694->int_buffer)
> +	udata->usb_msg =3D devm_kzalloc(dev, sizeof(*udata->usb_msg), GFP_KERNE=
L);
> +	if (!udata->usb_msg)
>  		return -ENOMEM;
> =20
> -	nct6694->int_in_urb =3D usb_alloc_urb(0, GFP_KERNEL);
> -	if (!nct6694->int_in_urb)
> +	udata->int_buffer =3D devm_kzalloc(dev, sizeof(*udata->int_buffer), GFP=
_KERNEL);
> +	if (!udata->int_buffer)
>  		return -ENOMEM;

Is it safe to allocate USB DMA transfer buffers using devm_kzalloc()?

Memory allocated via devm_kzalloc() is prefixed with a devres header, causi=
ng
the actual payload to be unaligned to ARCH_DMA_MINALIGN.

Could this lead to cache invalidation wiping out concurrent CPU updates to =
the
adjacent devres header on architectures with non-coherent DMA? Should stand=
ard
kmalloc() be used instead?

[ ... ]
> @@ -326,11 +364,11 @@ static int nct6694_usb_probe(struct usb_interface *=
iface,
>  		goto err_ida;
>  	}
> =20
> -	usb_fill_int_urb(nct6694->int_in_urb, udev, usb_rcvintpipe(udev, NCT669=
4_INT_IN_EP),
> -			 nct6694->int_buffer, sizeof(*nct6694->int_buffer), usb_int_callback,
> +	usb_fill_int_urb(udata->int_in_urb, udev, usb_rcvintpipe(udev, NCT6694_=
INT_IN_EP),
> +			 udata->int_buffer, sizeof(*udata->int_buffer), usb_int_callback,
>  			 nct6694, int_endpoint->bInterval);

Does the code verify that the interface has any endpoints configured before
accessing &interface->endpoint[0].desc to set int_endpoint earlier in the
probe function?

If a malformed USB device exposes an interface with zero endpoints, could
accessing endpoint[0] result in an out-of-bounds read?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515085746.1143=
61-2-a0282524688@gmail.com?part=3D1

