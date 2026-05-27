Return-Path: <linux-hwmon+bounces-14529-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GM5MLL3RFmowsgcAu9opvQ
	(envelope-from <linux-hwmon+bounces-14529-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 27 May 2026 13:13:01 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 695085E3335
	for <lists+linux-hwmon@lfdr.de>; Wed, 27 May 2026 13:13:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 39F00305B62E
	for <lists+linux-hwmon@lfdr.de>; Wed, 27 May 2026 11:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28E343EC2EA;
	Wed, 27 May 2026 11:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kvv3yKTL"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C563D79FE
	for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2026 11:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779880165; cv=none; b=ou+9Oaq8VVbGtnulUOzPS9eGTk0SgDZN/+zMgIXR0LMu3JEAAIMrR6kjZVkoxnE0IbfAJJqwo6ZKffz3GqvMRDCKuIq09cUPWzoWwbWOAGKR2b4yVjeiK4td+sn080ck6gR0v4kl/Ghvt1BSDYSZI2xL+LT6g3J+h26s+DwS7qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779880165; c=relaxed/simple;
	bh=Tgua3Ald+BsvCmXAZ8g8viq3G1amhbzcc9FW4vi7FjQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bQvflNIKvcQOHYBstjO89FxFVFI573Cc+frYCZCT54lBEQxamb4Wj8AMIoRYkkdm1coTqPAWm+GQIRS9nhJLjz8D11rOYGL6hjJbz0WawvELzT4vRYzcIipmGD4baq8VHTG/iHlkqh4RlsNkTl5ghpPj97icJs0DDcXbpo8cMIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kvv3yKTL; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 682BB1F000E9;
	Wed, 27 May 2026 11:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779880163;
	bh=RcRCtydzAhP/g9++hhQllYGzRNwi7+UIDqaRtK1RlYA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Kvv3yKTLuxqO+uwzWkMZkqWYiGp5AOH2ANFz/fiiaJOmh8l0aTOuFDpON1BNtwjCz
	 +efedf46yx77+f48QVC9RrUkZ90/93/O5ecqlradCZ+W1LzWL+mugA0iGYuCAcNpo+
	 P3hSN1jiL8xF2qKHI8biIkeWcY6jgMwx/Va2uuQwDbsHBnUjPU3NfjPulSWWscmY1K
	 kfpR+Bc0J4EMpsoyPQ2M5BsSZ5BUpO8FNncaJ5rMNyV8DZ7BUigVY1NR5H1YCjOS9J
	 neAl3vcB6YDpbrfHGmEyBHtHxmWKT7ZVFX7rXGGBLFxUhq5PELkxxT9TPyOlK2pGWH
	 +c5YCVuI5g4dg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] hwmon: (gpd-fan): Initialize EC before registering
 hwmon device
Reply-To: sashiko-reviews@lists.linux.dev
To: xiaopeitux@foxmail.com
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <tencent_C41E4EE8E6305D772246B899A9BA2011BC09@qq.com>
References: <tencent_C41E4EE8E6305D772246B899A9BA2011BC09@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 11:09:22 +0000
Message-Id: <20260527110923.682BB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14529-lists,linux-hwmon=lfdr.de];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[foxmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,kylinos.cn:email,smtp.kernel.org:mid,lists.linux.dev:replyto]
X-Rspamd-Queue-Id: 695085E3335
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Arithmetic underflow in gpd_wm2_read_pwm() when the EC hardware re=
gister returns 0, leading to a misleading -EPERM error returned to userspac=
e.
- [High] The driver exclusively reserves shared Super I/O ports, which can =
cause conflicts with ACPI or other drivers.
- [High] The driver lacks PM suspend/resume callbacks, causing the EC initi=
alization and fan state to be lost after a sleep cycle, effectively breakin=
g the fix applied in probe.
--

commit deb9d21f0612d3df813e1c0b98382347fd4bf6f2
Author: Pei Xiao <xiaopei01@kylinos.cn>

hwmon: (gpd-fan): Initialize EC before registering hwmon device

Move the gpd_init_ec() call to before devm_hwmon_device_register_with_info
in the probe function. With the previous ordering, the hwmon device was
exposed to userspace before EC initialization completed, risking invalid
reads.

> diff --git a/drivers/hwmon/gpd-fan.c b/drivers/hwmon/gpd-fan.c
> index 7284babd4f5c9..745b3fb9e3a49 100644
> --- a/drivers/hwmon/gpd-fan.c
> +++ b/drivers/hwmon/gpd-fan.c
> @@ -643,6 +643,7 @@ static int gpd_fan_probe(struct platform_device *pdev)
> =20
>  	dev_set_drvdata(dev, data);
> =20
> +	gpd_init_ec(data);

[Severity: High]
This isn't a bug introduced by this patch, but moving this initialization
raises a question about system suspend. The driver does not appear to
implement PM suspend/resume callbacks.

After a system suspend, the EC loses its state and may return to an
uninitialized state. Since gpd_init_ec() is only called in the probe
function, won't the hardware fall back into the broken state where RPM
reads return 0 and PWM writes have no effect after waking up?

[Severity: High]
This is a pre-existing issue, but I noticed an arithmetic underflow could
occur in another part of the driver when the EC returns 0:

drivers/hwmon/gpd-fan.c:gpd_wm2_read_pwm() {
	...
	gpd_ecram_read(drvdata, drvdata->pwm_write, &var);

	// Match gpd_generic_write_pwm(u8) below
	return DIV_ROUND_CLOSEST((var - 1) * 255, (drvdata->pwm_max - 1));
}

If the EC firmware returns 0 (for example, if uninitialized or the fan is
stopped), (var - 1) evaluates to -1. This causes the division to return a
negative value, which the hwmon core misinterprets as an error code like
-EPERM or -ENOENT. Does this break sysfs PWM reads for stopped or
uninitialized fans?

[Severity: High]
This is also a pre-existing issue, but I noticed the driver exclusively
reserves shared Super I/O ports during probe:

drivers/hwmon/gpd-fan.c:gpd_fan_probe() {
	...
	res =3D platform_get_resource(pdev, IORESOURCE_IO, 0);
	...
	region =3D devm_request_region(dev, res->start,
				     resource_size(res), DRIVER_NAME);
	...
}

Standard kernel practice requires using request_muxed_region() temporarily
during each read/write transaction to serialize access across different
subsystems. By using devm_request_region(), doesn't this permanently
reserve these ports and risk causing conflicts and initialization failures
for other system resources like watchdogs or ACPI?

>  	hwdev =3D devm_hwmon_device_register_with_info(dev,
>  						     DRIVER_NAME,
>  						     data,
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1779876412.gi=
t.xiaopei01@kylinos.cn?part=3D2

