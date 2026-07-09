Return-Path: <linux-hwmon+bounces-15688-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yv4oImNoT2q3gAIAu9opvQ
	(envelope-from <linux-hwmon+bounces-15688-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Thu, 09 Jul 2026 11:22:43 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF4572EE10
	for <lists+linux-hwmon@lfdr.de>; Thu, 09 Jul 2026 11:22:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=C4lFS6cV;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15688-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15688-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF33E303CEB1
	for <lists+linux-hwmon@lfdr.de>; Thu,  9 Jul 2026 09:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7154E3FF1B9;
	Thu,  9 Jul 2026 09:11:59 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081143FF1B1
	for <linux-hwmon@vger.kernel.org>; Thu,  9 Jul 2026 09:11:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783588319; cv=none; b=E48rc2eRO3+out+37Q8FNGptVU+vs0Oxiugm27DJbMY4MHN/iQsVJu5twDPsqV4HXZU43BoUZnhJnvXo/Jz9rgAopySpDcfCn46plPCQwqITTxXwMQSeZysAht+OTtLaELB2bFXiUD01cq13RMBxPyj8sgcDMYf1cj+XGpCrjIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783588319; c=relaxed/simple;
	bh=qB5KvR0HwHniWWWu4/r0nnUQ+U/9Wtbv95Xccy14Sqs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OZ14FC5xmygzuuoRSGMYKJaRtHEyVYX4AjC7ylPygCmtXRr5N1SVhnqfbPyI/soYzmGE5IaoIGE51+HTs2z3RsooElcqmw9l4lJuThOdmVyg6D5AVOmjZmgl5pzhJjb42dvyX2OIp1PoCq6FXASrUH/uMyL2KbvehJj//qd/XRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C4lFS6cV; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D4E11F000E9;
	Thu,  9 Jul 2026 09:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783588317;
	bh=uQYJiMWwDZ+Zm9CTuBh2LowjGbr4dm4MPRdFHM5rfgk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C4lFS6cV/80yo/OLGFMKKzQbYSWhQZangLT0nywsS7SOaVyVv2EeTDKooUWJGd6Ou
	 tDcaShEWjQqCPpp/iuQM16y03ZGh85qY8BnHUYA5X7bY3y34csg1llP3B7oJW7wVsI
	 1tV6IXCR5cIKwqF8KAe50j+9yZhXWJJv7330ZH36+o9FIdIBTxWW8e0L2i76/xnyEv
	 TOl2V5TK1nh/i+G09K9KM4zoOA+r26miC4GlsCgm77UCNoWh2JAfH78UaiDgR91kxG
	 hqh+nI6BNE8JF8e/WyJVycXJ2y0QzjpPAbkvK14jAtdHbnZYS1LbkJBT50fudP4eSb
	 z7th0JJ1Ocl2g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] firmware: stratix10-svc: add async HWMON read
 commands and register socfpga-hwmon device
Reply-To: sashiko-reviews@lists.linux.dev
To: tze.yee.ng@altera.com
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260709090153.21675-2-tze.yee.ng@altera.com>
References: <20260709090153.21675-1-tze.yee.ng@altera.com>
 <20260709090153.21675-2-tze.yee.ng@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 09:11:57 +0000
Message-Id: <20260709091157.9D4E11F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-15688-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:tze.yee.ng@altera.com,m:linux-hwmon@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-hwmon];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,smtp.kernel.org:mid,sashiko.dev:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lists.linux.dev:replyto,altera.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DEF4572EE10

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver removal sequence incorrectly destroys the async transac=
tion backend before unregistering the child client devices, leading to pote=
ntial Use-After-Free and NULL pointer dereferences.
- [High] ida_alloc_max() is called with an inclusive maximum of 16, which o=
verflows the 4-bit bitfields for client and job IDs.
--

--- Patch [1]: [PATCH v4 1/2] firmware: stratix10-svc: add async HWMON read=
 commands and register socfpga-hwmon device ---
commit 525d10487a60f1d84c17127378990a4a611c8881
Author: Tze Yee Ng <tze.yee.ng@altera.com>

firmware: stratix10-svc: add async HWMON read commands and register socfpga=
-hwmon device
   =20
This commit adds asynchronous Stratix 10 service layer support for hardware
monitor temperature and voltage read commands. It also registers a
socfpga-hwmon platform device from the service layer driver when hardware
monitor support is enabled.

> diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix1=
0-svc.c
> index c24ca5823078f..716b58f5a6170 100644
> --- a/drivers/firmware/stratix10-svc.c
> +++ b/drivers/firmware/stratix10-svc.c
[ ... ]
> @@ -1329,6 +1332,14 @@ int stratix10_svc_async_send(struct stratix10_svc_=
chan *chan, void *msg,
>  		args.a0 =3D INTEL_SIP_SMC_ASYNC_RSU_NOTIFY;
>  		args.a2 =3D p_msg->arg[0];
>  		break;
> +	case COMMAND_HWMON_READTEMP:
> +		args.a0 =3D INTEL_SIP_SMC_ASYNC_HWMON_READTEMP;
> +		args.a2 =3D p_msg->arg[0];
> +		break;
> +	case COMMAND_HWMON_READVOLT:
> +		args.a0 =3D INTEL_SIP_SMC_ASYNC_HWMON_READVOLT;
> +		args.a2 =3D p_msg->arg[0];
> +		break;
>  	default:
>  		dev_err(ctrl->dev, "Invalid command ,%d\n", p_msg->command);
>  		ret =3D -EINVAL;

[Severity: High]
This is a pre-existing issue and was not introduced by this patch, but does
the job ID allocation earlier in stratix10_svc_async_send() wrap around when
assigning the maximum ID?

In stratix10_svc_async_send():
	ret =3D ida_alloc_max(&achan->job_id_pool, MAX_SDM_JOB_IDS,
			    GFP_KERNEL);

ida_alloc_max() can allocate an ID up to MAX_SDM_JOB_IDS (16) inclusive.
Because both the job ID and client ID are stored in 4-bit bitfields,
allocating ID 16 (0x10) will be truncated to 0 when packed.

When the transaction completes, ida_free() would receive ID 0 instead of 16,
which could unexpectedly free an active job's ID while ID 16 is leaked.
A similar issue appears in stratix10_svc_add_async_client() with
MAX_SDM_CLIENT_IDS.

[ ... ]
> @@ -2050,6 +2087,9 @@ static void stratix10_svc_drv_remove(struct platfor=
m_device *pdev)
> =20
>  	of_platform_depopulate(ctrl->dev);
> =20
> +	if (svc->stratix10_svc_hwmon)
> +		platform_device_unregister(svc->stratix10_svc_hwmon);
> +
>  	platform_device_unregister(svc->stratix10_svc_rsu);
> =20
>  	for (i =3D 0; i < SVC_NUM_CHANNEL; i++) {

[Severity: High]
This is a pre-existing issue and was not introduced by this patch, but does
this driver removal sequence destroy the async transaction backend before
unregistering the child devices?

Looking at stratix10_svc_drv_remove():

	stratix10_svc_async_exit(ctrl);
	of_platform_depopulate(ctrl->dev);
	if (svc->stratix10_svc_hwmon)
		platform_device_unregister(svc->stratix10_svc_hwmon);
	platform_device_unregister(svc->stratix10_svc_rsu);

Because stratix10_svc_async_exit() is called first, it frees all active
transaction handlers and sets actrl->invoke_fn to NULL. However, the child
devices (socfpga-hwmon, stratix10-rsu) are still registered and could initi=
ate
or poll requests during this window.

Could concurrent accesses to the child devices trigger a use-after-free on
handler->next or a NULL pointer dereference on actrl->invoke_fn?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709090153.2167=
5-1-tze.yee.ng@altera.com?part=3D1

