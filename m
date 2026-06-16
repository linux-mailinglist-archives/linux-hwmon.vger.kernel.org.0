Return-Path: <linux-hwmon+bounces-15149-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7oKvNCkkMWoOcgUAu9opvQ
	(envelope-from <linux-hwmon+bounces-15149-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Jun 2026 12:23:37 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C0E68E317
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Jun 2026 12:23:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=nbYAlRwV;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15149-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15149-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 551C23026E40
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Jun 2026 10:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CBEC436379;
	Tue, 16 Jun 2026 10:13:46 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C95436367;
	Tue, 16 Jun 2026 10:13:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781604826; cv=none; b=UOy8NockA7mN/2mouyMxz9jRurd/hEPT4YrmB22bhZJwTkjcXEL8fBvq7CT1plGJISXZbqWoJgBGXRk9y3Md/X1ccNIfznrFtM5qX1Hg+l86nFFZdHR/svtYvgmJcUN+82rPUyJViQ0v5peK3vg4FNSClb+7IbiH3kZPNjZjIsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781604826; c=relaxed/simple;
	bh=1XDjk/kkC03BdJLTPKaz/Gi2smvOCxC0M0fCaQElTFw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PZ+73ahvEfFUDF5hVhoxCWZ+apb+d8Y0zv05Sbv8eyLyr7yX8ZyCwgsmucdaVl6JbdtIwQmqFVuL/7ee/noRjS3CqNh8hLrUlToxXQlrHIuOOpLqYHfmSVnRgRnkW+7NV9ZyBG8hBs+sVcvLtn5+6gOnkXrVHia8yV1BZiDT854=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nbYAlRwV; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61AA81F00A3A;
	Tue, 16 Jun 2026 10:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781604824;
	bh=BkS3F1+/DWISLTHviORQVN8XvF4HhhDUErq5yxdCXG4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nbYAlRwVONhVFU7bvSbB31+CNyMYVbFXJg8chDuHmKJb5o1jFDs/ilvPC9Oh4MLUC
	 uE+9ULHIshuKPK5IBau89un4BM5QQXKXl5c7e4eYNISwPFpQYdohIyEfPCrsiSnTYx
	 dUJ7VqIfAo+6ltw3VlvStW9ordY+YkTAXanjAvfXlSGVXNBl+T/Ap5L441s2up8kMK
	 nu9sJIDhvdgUn+ZuR/59+NzMcUNtd85oSteISC52RIxwm8tPk8iHJqJqto/+5iRLNs
	 EWVgMykh8LnQQuh1jAJxNMSyY/h6t1LvcSLVPKb1pXzu9MhzpWRDTf5WOiwgkIfzzW
	 fpuISlY/jsmLA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 07/12] i3c: dw-i3c-master: Add SETAASA as supported
 CCC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: Frank.Li@kernel.org, conor+dt@kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20260616095429.3947205-8-akhilrajeev@nvidia.com>
References: <20260616095429.3947205-8-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 10:13:43 +0000
Message-Id: <20260616101344.61AA81F00A3A@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-15149-lists,linux-hwmon=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akhilrajeev@nvidia.com,m:Frank.Li@kernel.org,m:conor+dt@kernel.org,m:robh@kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-i3c@lists.infradead.org,m:devicetree@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,smtp.kernel.org:mid,sashiko.dev:url,lists.linux.dev:replyto,nvidia.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 93C0E68E317

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Hardware registers are accessed before runtime PM is resumed, pote=
ntially causing a bus fault.
--

commit 0dd3a1716725800c8f7459a7e2204416a4488acf
Author: Akhil R <akhilrajeev@nvidia.com>

i3c: dw-i3c-master: Add SETAASA as supported CCC

This commit adds SETAASA and SETHID to the supported list of CCC commands f=
or
the DesignWare I3C host controller. SETAASA assigns predefined static
addresses to all devices on the bus, and SETHID stops HID bit flipping as a
prerequisite.

> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i=
3c-master.c
> index 971b429b76bc8..3e510fddf06c5 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -309,6 +309,8 @@ static bool dw_i3c_master_supports_ccc_cmd(struct i3c=
_master_controller *m,
>  	case I3C_CCC_GETSTATUS:
>  	case I3C_CCC_GETMXDS:
>  	case I3C_CCC_GETHDRCAP:
> +	case I3C_CCC_SETAASA:
> +	case I3C_CCC_VENDOR(0, true): /* SETHID */
>  		return true;
>  	default:
>  		return false;

[ ... ]

> static int dw_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
> 				      struct i3c_ccc_cmd *ccc)
> {
> 	struct dw_i3c_master *master =3D to_dw_i3c_master(m);
> 	int ret =3D 0;
>=20
> 	if (ccc->id =3D=3D I3C_CCC_ENTDAA)
> 		return -EINVAL;
>=20
> 	/* AMD platform specific OD and PP timings */
> 	if (master->quirks & AMD_I3C_OD_PP_TIMING) {
> 		amd_configure_od_pp_quirk(master);
> 		writel(master->i3c_pp_timing, master->regs + SCL_I3C_PP_TIMING);
> 		writel(master->i3c_od_timing, master->regs + SCL_I3C_OD_TIMING);
> 	}
>=20
> 	ret =3D pm_runtime_resume_and_get(master->dev);

[Severity: High]
This is a pre-existing issue, but could accessing these hardware registers
before runtime PM is resumed cause a bus fault?

If the device is runtime-suspended, its clocks and power domains are disabl=
ed.
Accessing memory-mapped registers of a clock-gated device here might lead to
an asynchronous bus error or a system hang.

Should the register writes be moved after pm_runtime_resume_and_get()
completes successfully?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616095429.3947=
205-1-akhilrajeev@nvidia.com?part=3D7

