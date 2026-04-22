Return-Path: <linux-hwmon+bounces-13478-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAvuOnRL6WmqXQIAu9opvQ
	(envelope-from <linux-hwmon+bounces-13478-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Thu, 23 Apr 2026 00:28:04 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C5744B47F
	for <lists+linux-hwmon@lfdr.de>; Thu, 23 Apr 2026 00:28:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 558E2304C7FD
	for <lists+linux-hwmon@lfdr.de>; Wed, 22 Apr 2026 22:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5E943451DA;
	Wed, 22 Apr 2026 22:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VeK3OhuG"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9294F277C81
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 22:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776896881; cv=none; b=UlwWkZQ6HvRV1/uY9NhgJD8Pfp9BLCigpQms7RRXHQ+stl3F4QzGwiP86yCRilbbxABAZXjbCetCL9QRG9F/NtYDIMe9y4XObbBbPauF9Rj6SZOKJZOU7Vbs1LZ+EAaEVHyeWRtH7RDHuQ5jyxx7EeAa59ZA6/VnTKBcPTfWMZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776896881; c=relaxed/simple;
	bh=brYPwEo3IGI3uYKgTTyAScx3Fvf4EJgKev1OOJCFQ0U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IO9CsyW5mD0IPIKZxvrwWJXcdBzKSNWEG2szNl4Ttf5GiLrb2nQ0FyoD0vzsaiDSE0DaraXYugsO/uEsBG7VHFS6wTybBzpYKtvZrMYWtT84Mqr1lETMue6cNMTLF0yUo+DHZms0G4V9qw5ieyRyZAhnniOAE732moK1ob2MgZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VeK3OhuG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 285B1C19425;
	Wed, 22 Apr 2026 22:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776896881;
	bh=brYPwEo3IGI3uYKgTTyAScx3Fvf4EJgKev1OOJCFQ0U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=VeK3OhuGUoSYi3Wygyf/XlS/2qU3b1scOPT6Nh/kBq11kxbA8TtcYtzqjvaaAsqnj
	 CQrvJ96ush6Q4S2cghxOFVKUhgsHOX60D6xnaN5QW287M8TTvKxR61dUbXFq8u8sSC
	 uXnfysMlXNMNoaLqUqewYD9D1W/GtZv3kQdtxHbA0SYJ/ibw98IGGEyyyhrfMmydZt
	 TZeWtZToLCLdAYQ1oSweWO0ObBP3BWwT6RFBlSnoD2YKPiEp3QXxSIQV0KmB+qtCpI
	 Dh0m0PNS5PZjCZwW5GPgC8R/U2WyQBOt6p1HPcTfQrRiWV2IuaDAKG208s9p13lIdZ
	 DSwj1+G3VVVeQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/2] thermal: hwmon: Use extra_groups for adding
 temperature attributes
Reply-To: sashiko@lists.linux.dev
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <2267033.irdbgypaU6@rafael.j.wysocki>
References: <2267033.irdbgypaU6@rafael.j.wysocki>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Apr 2026 22:28:00 +0000
Message-Id: <20260422222801.285B1C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-13478-lists,linux-hwmon=lfdr.de];
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
	HAS_REPLYTO(0.00)[sashiko@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,smtp.kernel.org:mid,lists.linux.dev:replyto]
X-Rspamd-Queue-Id: A6C5744B47F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Sashiko AI review found 1 potential issue(s):
- [Low] Incomplete refactoring leaves unused fields in `struct thermal_hwmo=
n_temp`.
--

commit 31b1d3d5cb622738ced37ad0ce85eba8a7a4b533
Author: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

thermal: hwmon: Use extra_groups for adding temperature attributes

This commit simplifies the thermal hwmon device registration by passing an
attribute group directly via the extra_groups argument instead of adding
each sysfs attribute individually.

> diff --git a/drivers/thermal/thermal_hwmon.c b/drivers/thermal/thermal_hw=
mon.c
> index 46c40c0852804..49d06cf27bd87 100644
> --- a/drivers/thermal/thermal_hwmon.c
> +++ b/drivers/thermal/thermal_hwmon.c

[ ... ]

>  /* one temperature input for each thermal zone */
>  struct thermal_hwmon_temp {
>  	struct list_head hwmon_node;
>  	struct thermal_zone_device *tz;
> -	struct thermal_hwmon_attr temp_input;	/* hwmon sys attr */
> -	struct thermal_hwmon_attr temp_crit;	/* hwmon sys attr */
> +	struct device_attribute temp_input;	/* hwmon sys attr */
> +	struct device_attribute temp_crit;	/* hwmon sys attr */
>  };

Are temp_input and temp_crit still needed in struct thermal_hwmon_temp?

Now that the attributes are registered via the static thermal_hwmon_group
using DEVICE_ATTR_RO, it looks like these fields are no longer initialized
or used anywhere in the updated code.

Could they be removed entirely to avoid keeping dead fields and to save mem=
ory
in the dynamically allocated struct thermal_hwmon_device?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/5100596.31r3eYUQgx@=
rafael.j.wysocki?part=3D2

