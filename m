Return-Path: <linux-hwmon+bounces-14066-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCJ/HAyBBWrjXgIAu9opvQ
	(envelope-from <linux-hwmon+bounces-14066-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Thu, 14 May 2026 10:00:12 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A88353F047
	for <lists+linux-hwmon@lfdr.de>; Thu, 14 May 2026 10:00:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E53803007A75
	for <lists+linux-hwmon@lfdr.de>; Thu, 14 May 2026 08:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 917373D9029;
	Thu, 14 May 2026 08:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IAj8PJv9"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDE33C5553
	for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 08:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778745606; cv=none; b=ElN/s8UkuI3E1uc4Umk6UgojQz8rLjDG3N9fq2LdzroIYvxjgTsXyxblhROvAKrfpHZF/2n4+QnnTee8a/VQaAbjZCcjVHpDyNK/yfmfhTGiINuQOitwDotoQvLPelMgqXbQitlw1XXkzmxgavP1RTDXwhljX30Q3nf+Wy4FcM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778745606; c=relaxed/simple;
	bh=7RS/B2utUHTlwg1qtXcrxg9Ii1W0kvqhrAWWSiJuk5Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sJ5C9+jhRJbJNxexIbz613WgLxbGNSzZASZhY53lrSOJ+WX06N+kf8SIy3o5oHESrTt3MuWF8Y3wkHMwP1klg0AJDteZKcM1RgCoCyuYqSpcr1fl3WuBtTARvRpZtypFGxLWq8lHhNmNnEkYix5IXAC3FWPf6OkpAxZVlMmwX7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IAj8PJv9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E7F1C2BCB7;
	Thu, 14 May 2026 08:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778745606;
	bh=7RS/B2utUHTlwg1qtXcrxg9Ii1W0kvqhrAWWSiJuk5Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=IAj8PJv9yiytBALFtE1zJ9v7a3zMUz7VZBX6+Dnf1d4kznNjGlqHUgJhBuabjlgh5
	 GsfWtQsMKXk1J1402J9VUq6zDgUZlmTEf3yPvVezlAMnF5KP3nbP4mc5UTWdr1fWjJ
	 b7V/txXB8cb6Xis43WdeXxnHvh1loWeiXuwZa8G3q2NA0kOxZvkoKOX9gE1+V/UyWn
	 LfcWRgY07bVYRXbgdUrHGtHFnFTr+DGHbRkIqErAtMJhh31rlqgiUFFg6cDoC/xSou
	 GzJuAA1OBuyE16V2u+AXBXkM9UXTY1V3AQ1rXnSG6BhSIQNfFbhSdtPbDnwfDhwmB/
	 JchryulQSdDVg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/5] powercap: arm_scmi_powercap: Log number of
 powercap domains
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Tran" <alex.tran@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260513-scmi-client-probe-log-v2-1-36607e9dd540@oss.qualcomm.com>
References: <20260513-scmi-client-probe-log-v2-1-36607e9dd540@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 08:00:05 +0000
Message-Id: <20260514080006.0E7F1C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 6A88353F047
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-14066-lists,linux-hwmon=lfdr.de];
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
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smtp.kernel.org:mid,lists.linux.dev:replyto,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,sashiko.dev:url]
X-Rspamd-Action: no action

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The log message incorrectly reports the number of 'Initialized' =
domains using the count of 'Discovered' domains, leading to inaccurate and =
contradictory logs.
- [Low] Format string type mismatch for `pr->num_zones`.
--

commit bbfaa4d885154a2acd690976aeb604fa1c8f0eb4
Author: Alex Tran <alex.tran@oss.qualcomm.com>

powercap: arm_scmi_powercap: Log number of powercap domains

This commit adds a debug log to report the number of powercap domains
discovered from the firmware during probe. This helps confirm the firmware
exposed powercap resources.

> diff --git a/drivers/powercap/arm_scmi_powercap.c b/drivers/powercap/arm_=
scmi_powercap.c
> index ab66e9a3b1e2c..3efe3743cce0a 100644
> --- a/drivers/powercap/arm_scmi_powercap.c
> +++ b/drivers/powercap/arm_scmi_powercap.c

[ ... ]

> @@ -496,6 +496,7 @@ static int scmi_powercap_probe(struct scmi_device *sd=
ev)
>  		return ret;
> =20
>  	dev_set_drvdata(dev, pr);
> +	dev_dbg(dev, "Initialized %d powercap domains\n", pr->num_zones);

Are all of these domains actually initialized?

During the probe process, domains using an abstract power scale are
explicitly skipped and marked as invalid (spz->invalid =3D true).
scmi_zones_register() also tracks and logs the actual successfully
registered count.

If there are skipped domains, this will produce confusing logs, such as
"Registered 3 SCMI Powercap domains !" from scmi_zones_register() followed
by "Initialized 5 powercap domains" here.

Should the log message say "Discovered" instead of "Initialized" to match
the commit message?

Also, this isn't a bug, but does this code use the correct format specifier
for pr->num_zones? Since num_zones is an unsigned int in struct
scmi_powercap_root, should this use %u instead of %d?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513-scmi-clien=
t-probe-log-v2-0-36607e9dd540@oss.qualcomm.com?part=3D1

