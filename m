Return-Path: <linux-hwmon+bounces-15840-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Q8ZKMmOPU2qUbwMAu9opvQ
	(envelope-from <linux-hwmon+bounces-15840-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sun, 12 Jul 2026 14:58:11 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFCE744BF0
	for <lists+linux-hwmon@lfdr.de>; Sun, 12 Jul 2026 14:58:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=JwrNO3vx;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15840-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15840-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1A9C83001BE4
	for <lists+linux-hwmon@lfdr.de>; Sun, 12 Jul 2026 12:58:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB0893A450A;
	Sun, 12 Jul 2026 12:58:08 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15AF23D2A1
	for <linux-hwmon@vger.kernel.org>; Sun, 12 Jul 2026 12:58:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783861088; cv=none; b=BvOay/9QrCMfD9uu0oPUbILixGj+EKB9gk1Ns4hxcEcgNkb1XQQ5wcejglwf2zAehcjmg3FaB4LFLyMW2/qsT4daznHjVBNJmb86wqzcLBX93FpffE7IHCOv/El4g0zN5nsuzlvP1qyU5FipZt/WAjrseEQv3oufU0CpmbO5V24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783861088; c=relaxed/simple;
	bh=0tn+zleJ51yoO+Gpf5YNlgPSQ8vHNuIfUunTwC4SjK8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Mm7u2fm5G1mCpTn8TR4U5dq0PPGU1ldwhmtNBOQTRF5Zsw2A/5MVbv467o7PrOGU0SRLpuJ9T+4dcmUQj/67kIJzQG90SiVnS2cRj9tNEfF8OTKG+tVNbI2BGFMOj/jgildPuiMhc96jV7hG+8divdiC/ABDZPzX1w0jxK0jCxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JwrNO3vx; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 242661F000E9;
	Sun, 12 Jul 2026 12:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783861087;
	bh=EAIISM9SOXfnKjAD/4NWDqwk6Yxddh0ZDXRxzc241Dg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JwrNO3vxG4/cNVvkuEHeX5ZcNEk9PU+aFQGJibUYVlYEJlr6G6ATYMCjVTmB8/k13
	 J5iXBOyStHrZ2MEW5HScN09jozwhReqvjcRVrU9ovBZXqpKXFl83KEBxqFAv4LnOrc
	 87uKLiU/V6z3dEiSERGFvo3T2T1EbuPj+rbTwh5alMxS2yencBHmgGHEbNn0dyXRxF
	 RtaSPMBAjipJnthS5EmxxwdFtvWfAqati9f7ey8WkC8wBuDrhxOTvhAggxOYlPRN/U
	 PF8HSxq1b9z96G/IdqGf/jOUDIaF557KWnzd3qawFG5EUSxafyCtLDk7bVPXIeYOXB
	 PA3g5ZwkoGUiw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) add missed handle for ENOMEM
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eugene Shalygin" <eugene.shalygin@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260712125147.1254339-1-eugene.shalygin@gmail.com>
References: <20260712125147.1254339-1-eugene.shalygin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 12 Jul 2026 12:58:06 +0000
Message-Id: <20260712125807.242661F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-15840-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:eugene.shalygin@gmail.com,m:linux-hwmon@vger.kernel.org,m:eugeneshalygin@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,sashiko.dev:url,lists.linux.dev:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1FFCE744BF0

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The newly added error handling incorrectly returns `status` (which=
 evaluates to 0) instead of the actual error code when `asus_ec_hwmon_add_c=
han_info()` fails.
--

--- Patch [1]: [PATCH] hwmon: (asus-ec-sensors) add missed handle for ENOME=
M ---
commit 2fb0c06e28b3b0aad223266de4f30ef04ff0537b
Author: Eugene Shalygin <eugene.shalygin@gmail.com>

hwmon: (asus-ec-sensors) add missed handle for ENOMEM
   =20
This commit adds a missing return value check in the setup function
asus_ec_probe() to handle potential memory allocation failures.

> diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sens=
ors.c
> index 29a23484cbe7b..dd8c1a3f182e3 100644
> --- a/drivers/hwmon/asus-ec-sensors.c
> +++ b/drivers/hwmon/asus-ec-sensors.c
> @@ -1495,9 +1495,10 @@ static int asus_ec_probe(struct platform_device *p=
dev)
>  		if (!nr_count[type])
>  			continue;
> =20
> -		asus_ec_hwmon_add_chan_info(asus_ec_hwmon_chan, dev,
> -					     nr_count[type], type,
> -					     hwmon_attributes[type]);
> +		if (asus_ec_hwmon_add_chan_info(asus_ec_hwmon_chan, dev,
> +						nr_count[type], type,
> +						hwmon_attributes[type]))
> +			return status;

[Severity: High]
Does this correctly return the error code? At this point in asus_ec_probe(),
status appears to be 0 from the earlier successful call to setup_lock_data(=
).

Should this capture and return the actual error code from
asus_ec_hwmon_add_chan_info() instead, to avoid returning success (0) while
aborting the probe?

>  		*ptr_asus_ec_ci++ =3D asus_ec_hwmon_chan++;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260712125147.1254=
339-1-eugene.shalygin@gmail.com?part=3D1

