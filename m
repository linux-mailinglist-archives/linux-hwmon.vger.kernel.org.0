Return-Path: <linux-hwmon+bounces-14447-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AU2I0GJEWoJnQYAu9opvQ
	(envelope-from <linux-hwmon+bounces-14447-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sat, 23 May 2026 13:02:25 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0ECC5BE9D5
	for <lists+linux-hwmon@lfdr.de>; Sat, 23 May 2026 13:02:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07CCE301158D
	for <lists+linux-hwmon@lfdr.de>; Sat, 23 May 2026 10:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5916E386C2A;
	Sat, 23 May 2026 10:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FnyWK1uK"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5A11F7916
	for <linux-hwmon@vger.kernel.org>; Sat, 23 May 2026 10:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779533919; cv=none; b=Fd42KYTBZZ0RMUg38HmIoTkyjx9IdJHPGy16SMRpdRFsmRO8f8TnhD2+xr7J0n4JqeXGGah2ccNBzSU6COoozqSv6xXL0idlxDnfUVEW2JZkycRDHNlxUgi+dI3LPFTn3IcRbD2rgYX7lASgmKdQlsqSaZ7MRPj3ooNr3SbHvI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779533919; c=relaxed/simple;
	bh=hMFdPE4IF63nPiWFDHf5Fg+zb33xF3PmtCmgT+BAkA8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GFNF2Wxbz2btIFQBAMSylp3jrqoKDuRdJ+5HWpDkezbSWwcY3w1YMjEIuDyxsN1aiB/gjoW8wp0d8tpxq+bh8W1DKW/byBdIN8MjE21B63391tPn19RuTEAzBv/6eQTxX7RBIlJoHqJOB4cNQZJvaBZe+NNHz9xlqHvwbndKddM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FnyWK1uK; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67B9C1F000E9;
	Sat, 23 May 2026 10:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779533917;
	bh=pSlzHotif3sqGnlpk/09QIL+zMaS/NX4mKbEahb1iS8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FnyWK1uKuQT9CCNXTaF7E1zi6gSMiTT/R5uSPuAgz0kE6tdu9bHM8Z8MydY16wZYd
	 sTW9h57O4eqL5PiFzYX96awiR5YN5z3XxSehCJXrs6kr7NACKAnm/61PPbYMTFXkWN
	 UR3Osex8dwgebLAGSUbp1FdyPtD5uq4QhW5z9yPC7anPAVonEJgtZX5TiiNFk9kFIg
	 cMkKE/0/LNGHWAOGqbx8w9U6KCVJ6esku7GLGWI94S1uJl1m0+khf+NisPGqVvBNAz
	 nFTx2u4xxzwvx+4Q2rKkcgPHi6ngjxe34x2AhbqUgoOz+2tzUApjeJgKYHDCIiDmQI
	 35vOewEV8jyWw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] hwmon: (lm63) expose PWM frequency and LUT
 hysteresis as writable
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jan-Henrik Bruhn" <kernel@jhbruhn.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260523095412.3341202-1-kernel@jhbruhn.de>
References: <20260523095412.3341202-1-kernel@jhbruhn.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 23 May 2026 10:58:37 +0000
Message-Id: <20260523105837.67B9C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-14447-lists,linux-hwmon=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smtp.kernel.org:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,sashiko.dev:url,jhbruhn.de:email,lists.linux.dev:replyto]
X-Rspamd-Queue-Id: E0ECC5BE9D5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing lock in `pwm1_freq_show` causes a data race and a potentia=
l divide-by-zero kernel panic.
--

commit 1bf46f1b90af417821722eaed56484734ef9e3ae
Author: Jan-Henrik Bruhn <kernel@jhbruhn.de>

hwmon: (lm63) expose PWM frequency and LUT hysteresis as writable

This commit exposes the PWM frequency and LUT hysteresis as writable
sysfs attributes. It adds a pwm1_freq attribute to select the closest
SCS + PFR combination, and exposes a chip-wide pwm1_auto_point_temp_hyst
attribute for the hysteresis amount.

> diff --git a/drivers/hwmon/lm63.c b/drivers/hwmon/lm63.c
> index 30500b4d22212..90c49c448c624 100644
> --- a/drivers/hwmon/lm63.c
> +++ b/drivers/hwmon/lm63.c

[ ... ]

> @@ -455,6 +458,86 @@ static ssize_t pwm1_enable_store(struct device *dev,
>  	return count;
>  }
> =20
> +static ssize_t pwm1_freq_show(struct device *dev,
> +			      struct device_attribute *dummy, char *buf)
> +{
> +	struct lm63_data *data =3D lm63_update_device(dev);
> +	unsigned int base =3D (data->config_fan & 0x08) ?
> +			    LM63_PWM_BASE_SLOW_HZ : LM63_PWM_BASE_FAST_HZ;
> +
> +	return sprintf(buf, "%u\n", base / data->pwm1_freq);

[Severity: High]
Can this read of data->pwm1_freq race with an update, resulting in a
divide-by-zero exception?

Looking at lm63_update_device(), it acquires data->update_lock and can
temporarily set data->pwm1_freq to 0 before clamping it to 1:

lm63_update_device() {
    mutex_lock(&data->update_lock);
    ...
    data->pwm1_freq =3D i2c_smbus_read_byte_data(client, LM63_REG_PWM_FREQ);
    if (data->pwm1_freq =3D=3D 0)
        data->pwm1_freq =3D 1;
    ...
}

Since pwm1_freq_show() does not hold data->update_lock, could it read
data->pwm1_freq during this transient 0 state and cause a kernel panic?

> +}
> +

[ ... ]

> @@ -629,6 +712,42 @@ static ssize_t show_lut_temp_hyst(struct device *dev,
>  	return sprintf(buf, "%d\n", temp);
>  }
> =20
> +/*
> + * The LM63 has a single hysteresis register shared by all LUT entries.
> + * Expose it as a chip-wide hysteresis amount in millidegrees; the
> + * per-point pwm1_auto_pointN_temp_hyst attributes remain read-only and
> + * show the resulting absolute trip-down temperature for each entry.
> + */
> +static ssize_t pwm1_auto_point_temp_hyst_show(struct device *dev,
> +					      struct device_attribute *dummy,
> +					      char *buf)
> +{
> +	struct lm63_data *data =3D lm63_update_device(dev);
> +
> +	return sprintf(buf, "%d\n", TEMP8_FROM_REG(data->lut_temp_hyst));

[Severity: High]
Does accessing data->lut_temp_hyst here without holding data->update_lock
also result in a data race with concurrent updates?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260523095412.3341=
202-1-kernel@jhbruhn.de?part=3D1

