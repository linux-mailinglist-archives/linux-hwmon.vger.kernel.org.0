Return-Path: <linux-hwmon+bounces-13479-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBW0DqBQ6Wl2XgIAu9opvQ
	(envelope-from <linux-hwmon+bounces-13479-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Thu, 23 Apr 2026 00:50:08 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A60144B5A7
	for <lists+linux-hwmon@lfdr.de>; Thu, 23 Apr 2026 00:50:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D71893001F88
	for <lists+linux-hwmon@lfdr.de>; Wed, 22 Apr 2026 22:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81D893750CB;
	Wed, 22 Apr 2026 22:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iy4bgzEk"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECF7373C1D
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 22:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776898202; cv=none; b=pT6psT1ImQLNHMGwEG8oRZX5zm6gQeU+ZDN1O6LbBpfBo4LwYcsd+XDg1vllyHD+w89XSwormZ55xCTaMhNFCnIeBUqxu+Pv0P9B+ElkxasDNH/0ZcJbnWWqyEUTK7/s1yXWMn62BAtEibcyXpJ0GpuNupeN+HYU1PxFKA9ycXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776898202; c=relaxed/simple;
	bh=mhBzopQskhYRCITVhno9b/Rf0E2lZm1gjP7Nywfa/UE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cXO718NA/EJO8hAN4NDWsCnC00vsM2E8kTnxkysVtin7LeKmSg8lh987Ks6izLedcg+4HEC5Ggy19nU5wMFpKflQz2OpUM/poq8wE/5lBL2UsVNgQd3pyQ8pVonS1SPITsm0DQcBNXsiTfcpqb0eNDNE+nP36I9Bwk3EkLrVUmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iy4bgzEk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23857C2BCB3;
	Wed, 22 Apr 2026 22:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776898202;
	bh=mhBzopQskhYRCITVhno9b/Rf0E2lZm1gjP7Nywfa/UE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=iy4bgzEkazuW8QBQk6jJN5EaC1v3qxlimPQGHGZ4gAEz0pWqtJcZAUv97Gy1/aw5l
	 1mcjJXRPbHoXfTBveD/VBqTRbPfruzL7XQ4bdkiyqn2F0BmOc5GCWXxaGdvVATpdma
	 leyjxJMfnobmP/4tFq24MyEHLX/hTHbMmPXkLLahWH/19GY8QJDZ6H5KwjIu7WQg27
	 9ahGevkKpOBC+crZW3xF/RYlknU2W0AUMjPzDSEnccGlUFUfMVUDtyrox955wOCNQe
	 hzWshhhbYh/rh1wiyL5t5t8s0NIOArbMHV8g5J8nZm+EpG48vYWFSrRRbdeTDNKFiP
	 pQKj2KJrbLFpA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 05/12] thermal/of: Move the node pointer assignation
 in the OF code file
Reply-To: sashiko@lists.linux.dev
To: "Daniel Lezcano" <daniel.lezcano@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260422174305.2899095-6-daniel.lezcano@oss.qualcomm.com>
References: <20260422174305.2899095-6-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Apr 2026 22:50:00 +0000
Message-Id: <20260422225002.23857C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-13479-lists,linux-hwmon=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	HAS_REPLYTO(0.00)[sashiko@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smtp.kernel.org:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,lists.linux.dev:replyto]
X-Rspamd-Queue-Id: 1A60144B5A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Sashiko AI review found 1 potential issue(s):
- [High] The patch introduces a double call to `thermal_cooling_device_init=
_complete()` in `devm_thermal_of_cooling_device_register()`, leading to lin=
ked list corruption.
--

commit 1b7fe952320202b48dbc54a3f4bad412d0bfc910
Author: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

thermal/of: Move the node pointer assignation in the OF code file

This commit moves the assignment of the device node pointer from the thermal
core framework to the thermal OF code. It updates
devm_thermal_of_cooling_device_register() to use
thermal_of_cooling_device_register() instead of
__thermal_cooling_device_register(), creating a more consistent API design.

> diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
> index 3ba8c970f11f3..ee9776d0e5be7 100644
> --- a/drivers/thermal/thermal_of.c
> +++ b/drivers/thermal/thermal_of.c
> @@ -537,6 +537,7 @@ thermal_of_cooling_device_register(struct device_node=
 *np,
>  	if (IS_ERR(cdev))
>  		return cdev;
> =20
> +	cdev->np =3D np;
>  	thermal_cooling_device_init_complete(cdev);
> =20
>  	return cdev;

[ ... ]

> @@ -578,7 +579,7 @@ devm_thermal_of_cooling_device_register(struct device=
 *dev,
>  	if (!ptr)
>  		return ERR_PTR(-ENOMEM);
> =20
> -	tcd =3D __thermal_cooling_device_register(np, type, devdata, ops);
> +	tcd =3D thermal_of_cooling_device_register(np, type, devdata, ops);

Does this result in thermal_cooling_device_init_complete() being called
twice for the same cooling device?

When thermal_of_cooling_device_register() is called, it successfully
initializes the device and calls thermal_cooling_device_init_complete(),
which adds the device to the list.

Then devm_thermal_of_cooling_device_register() explicitly calls
thermal_cooling_device_init_complete() again:

drivers/thermal/thermal_of.c:devm_thermal_of_cooling_device_register() {
    ...
	tcd =3D thermal_of_cooling_device_register(np, type, devdata, ops);
	if (IS_ERR(tcd)) {
		devres_free(ptr);
		return tcd;
	}

	*ptr =3D tcd;
	devres_add(dev, ptr);

	thermal_cooling_device_init_complete(tcd);
    ...
}

Could this cause list_add() to be called twice on the same node, corrupting
the doubly-linked list structure?

While this issue is fixed later in the series by commit 61302b0ce72b9
(thermal/of: Pass the of_index and add a function to register with an
index), should it be fixed here to avoid breaking bisectability?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260422174305.2899=
095-1-daniel.lezcano@oss.qualcomm.com?part=3D5

