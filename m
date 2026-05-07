Return-Path: <linux-hwmon+bounces-13820-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DHwDJMR/GkjLAAAu9opvQ
	(envelope-from <linux-hwmon+bounces-13820-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Thu, 07 May 2026 06:14:11 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC68C4E2CED
	for <lists+linux-hwmon@lfdr.de>; Thu, 07 May 2026 06:14:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9BF8E3009CF2
	for <lists+linux-hwmon@lfdr.de>; Thu,  7 May 2026 04:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6DB131CA4E;
	Thu,  7 May 2026 04:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="avdHQttl"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BD01F3BA2;
	Thu,  7 May 2026 04:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778127248; cv=none; b=YEuDMAI0tYT6MBKqaPcuGVVfh9Cv5y6Yidgq+7Klx3xdBqLE32SK1zajkw5UFHjWY3yh+3JL9Wc8Nco5TqThWixIUH4EYKxHvhGNHYkDM0mp4kolUOjCYCNG/RHU1BoBJDi1rxkTeeN8WazL63K/rDrNnvIheTdizZeY8vhCNGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778127248; c=relaxed/simple;
	bh=+Vt8zEJ+r9dsyJnh4bur3B+ar7F8gndoI9eBYPPbNbY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kIXhoB6w1J3r2z1jVPk3vXd7i+hdjMtKjQYMDwlfmrqGkVRoReNUkwJr8+QI9fbEgevdryOtL/2DxFfPBHIm+f6dS+rJqigSqRJaCbcQeYwqyXFcuDRcY7+JygFZNNpJa9Lc88dcz8y18eR5bXfTwmWF0eawG8Ag5t4suO4pz/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=avdHQttl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 493A7C2BCF4;
	Thu,  7 May 2026 04:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778127248;
	bh=+Vt8zEJ+r9dsyJnh4bur3B+ar7F8gndoI9eBYPPbNbY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=avdHQttldlCnr3z/AXxaeesqrlTCzTZGEiqQ4BzNaLj9qTpzSoffU8ka/YHYk4p22
	 pHhZkuYCuBneUKhyF7lBhhGy3xMeaVzO88kDNZgwh1IkJMTnt1YinEeUnPGMjJM58k
	 wOwC0xobfO/D+PYCPtZzUMmEMGwsWKMZ09y/J5/wPv7iZ4SPJEWK40UfolyYS/fN6I
	 A/Q53uk0SoAYFdaf0goPbc+S2YlBuJq1aWYgzEf+LuJ9c73DEijPbmWmVcOhtDe7Rp
	 PAvx1GUCqrA0lvqOXDkoEdns2zCyTn0OsibYQpH9lPIa+L5N18G4BmcfAbzyn1aumS
	 ca5PzHPZ2bTZw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] usb: xhci-pci: add generic auxiliary device
 interface
Reply-To: sashiko@lists.linux.dev
To: "Jihong Min" <hurryman2212@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <effa7bd7bef8a8ea28b9e28fe47af6a58e39edf2.1778123510.git.hurryman2212@gmail.com>
References: <effa7bd7bef8a8ea28b9e28fe47af6a58e39edf2.1778123510.git.hurryman2212@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 07 May 2026 04:14:07 +0000
Message-Id: <20260507041408.493A7C2BCF4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: BC68C4E2CED
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-13820-lists,linux-hwmon=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,smtp.kernel.org:mid]
X-Rspamd-Action: no action

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Lockless modification of devres payload in `xhci_pci_try_remove_=
aux_device` bypasses the subsystem's devres locking mechanism.
--

commit bb8a85242e2a88f6613cf1810360076073e5ac66
Author: Jihong Min <hurryman2212@gmail.com>

usb: xhci-pci: add generic auxiliary device interface

This commit adds a small auxiliary device registration path for selected
xHCI PCI controllers like the AMD Promontory 21. It creates an auxiliary
device and stores it in devres so subsystem-specific child drivers can bind
to controller-specific functionality outside xhci-pci.

> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index 585b2f3117b08..618d6840e1083 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
[ ... ]
> @@ -103,6 +106,80 @@ static int xhci_pci_run(struct usb_hcd *hcd);
[ ... ]
> +static void xhci_pci_try_remove_aux_device(struct pci_dev *pdev)
> +{
> +	struct xhci_pci_aux_devres *devres;
> +
> +	devres =3D devres_find(&pdev->dev, xhci_pci_aux_devres_release, NULL,
> +			     NULL);
> +	if (!devres || !devres->auxdev)
> +		return;
> +
> +	auxiliary_device_destroy(devres->auxdev);
> +	devres->auxdev =3D NULL;

Is it safe to locklessly modify the devres payload here?

The code uses devres_find() to obtain the devres object and manually clears
devres->auxdev after destroying the auxiliary device. This bypasses the
devres subsystem's internal spinlocks and leaves a dead devres node in the
device's list until standard devres_release_all() runs.

Should this use devres_release() instead? Calling devres_release() would
safely acquire the required locks, invoke the callback, remove the node
from the list, and free the memory.

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1778123510.gi=
t.hurryman2212@gmail.com?part=3D1

