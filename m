Return-Path: <linux-hwmon+bounces-13574-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFw/Nt3F8WkbkQEAu9opvQ
	(envelope-from <linux-hwmon+bounces-13574-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 29 Apr 2026 10:48:29 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E195A491575
	for <lists+linux-hwmon@lfdr.de>; Wed, 29 Apr 2026 10:48:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CCB2B3009F3F
	for <lists+linux-hwmon@lfdr.de>; Wed, 29 Apr 2026 08:48:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7659D3314BF;
	Wed, 29 Apr 2026 08:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ADRiKH2q"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DAA2571C0
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Apr 2026 08:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777452495; cv=none; b=X8uJSuVt9DgcJM336dMqbGcir8FPnws8kt+bn/dzqUw8tWj1sAMYZhHNM2zRkd6826INEQyv2sBqZBVb+dVmwB9ALW5zWq+K+y0kxkyp9Sopn17hWJywEWobLE7SJDs4IAn6k3FgcRL8DGRSbTE7qC29/DJniaUeSvYbjzmpHHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777452495; c=relaxed/simple;
	bh=KlJg9T7D8IRjaEXrZcRg+XavJPfYNazGXy9GW8+Yc1o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=s/cO70B3elQzP/CPkJHtKkj8lUeshWlcMAEXzb6Wgl9YymowWYNyoefZSHXWfYAujiPBE5GY1iJWyTI82HtEafnm3VjRg/Pk/UoiMJzr6STZqk3egtOGgg09j20HVK07EpcGFACtEXjNMUp7jI9BzuliLB0xDR9suQSalrP1Yxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ADRiKH2q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C46C3C19425;
	Wed, 29 Apr 2026 08:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777452495;
	bh=KlJg9T7D8IRjaEXrZcRg+XavJPfYNazGXy9GW8+Yc1o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=ADRiKH2qTjDij0oa9T0vRjS42Pwdjk+IPgFIaeJyRV3kQlub06GReGTeMWVnQ9jNQ
	 3/hAwSyHwKTN4nyQt/LpgrAWKcW3ClXkvQqCO+Va0/maVcq1NrNGzhT5aA/rwAs0Z7
	 QLAzM7Mevc7bCWl6XQFWPl4c4RQ7Kkq4QrOPPd7k5Ce5a2tuImrNOmw9UpT/bOwGTn
	 u27nAbKpLHfY+fphROvUpg1dRL3xb35c3L8oz3FOQplq0k7y8Mu0f2uR4aXryb80gI
	 bZ9KR1sy7OuOBYGhPJNe2e1QfuTN5liZ2W5Ipm9/ljOW5MEesyzO8XYv2ncGveg+qk
	 f1T3eI0JGP/yA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/3] hwmon: emc2305: Support configurable fan PWM at
 shutdown
Reply-To: sashiko@lists.linux.dev
To: florin.leotescu@oss.nxp.com
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260429065955.2113012-4-florin.leotescu@oss.nxp.com>
References: <20260429065955.2113012-4-florin.leotescu@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Apr 2026 08:48:14 +0000
Message-Id: <20260429084814.C46C3C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: E195A491575
X-Rspamd-Action: no action
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
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-13574-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[sashiko@lists.linux.dev];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,lists.linux.dev:replyto,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,smtp.kernel.org:mid]

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The emc2305_shutdown() callback sets the hardware to a safe shutdo=
wn state but does not prevent concurrent or subsequent modifications from t=
he thermal framework or sysfs, and violates hwmon locking guidelines.
--

commit 13f5fb0080b01e93b042a4e45c254e10cd715c59
Author: Florin Leotescu <florin.leotescu@nxp.com>

hwmon: emc2305: Support configurable fan PWM at shutdown

This commit adds support for an optional "fan-shutdown-percent" device tree
property to configure the safe shutdown PWM duty cycle per fan output. It
introduces a shutdown callback to apply these configured states during
system handoff.

> diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c
> index f71a0e265924..c5a0b2146478 100644
> --- a/drivers/hwmon/emc2305.c
> +++ b/drivers/hwmon/emc2305.c

[ ... ]

> @@ -727,6 +744,23 @@ static int emc2305_probe(struct i2c_client *client)
>  	return 0;
>  }
> =20
> +static void emc2305_shutdown(struct i2c_client *client)
> +{
> +	int i;
> +	int ret;
> +	struct emc2305_data *data =3D i2c_get_clientdata(client);
> +
> +	for (i =3D 0; i < data->pwm_num; i++) {
> +		if (data->pwm_shutdown[i] !=3D EMC2305_PWM_SHUTDOWN_UNSET) {
> +			ret =3D i2c_smbus_write_byte_data(client, EMC2305_REG_FAN_DRIVE(i),
> +							data->pwm_shutdown[i]);

Does this hardware access need to be serialized? The hwmon subsystem
guidelines explicitly state that drivers must use hwmon_lock() and
hwmon_unlock() to serialize hardware operations for attributes registered
outside the hwmon core.

Also, can concurrent or subsequent updates overwrite this safe shutdown sta=
te?

During system shutdown, kernel workqueues remain active and can continue to
execute thermal zone polling. Because the driver does not track whether it =
is
shutting down, the thermal framework's set_cur_state callback could execute
and overwrite the safe shutdown PWM state with a temperature-based value.

Would it make sense to introduce a boolean flag (e.g., shutting_down)
protected by hwmon_lock() here, and check this flag in the thermal and sysfs
write paths to abort further updates?

> +			if (ret < 0)
> +				dev_warn(&client->dev,
> +					 "Failed to set shutdown PWM for ch %d\n", i);
> +		}
> +	}
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260429065955.2113=
012-1-florin.leotescu@oss.nxp.com?part=3D3

