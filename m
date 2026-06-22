Return-Path: <linux-hwmon+bounces-15241-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id O4/wLNAqOWo/nwcAu9opvQ
	(envelope-from <linux-hwmon+bounces-15241-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 22 Jun 2026 14:30:08 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 045A36AF720
	for <lists+linux-hwmon@lfdr.de>; Mon, 22 Jun 2026 14:30:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=SdzeTsua;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15241-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15241-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3CE0830071CD
	for <lists+linux-hwmon@lfdr.de>; Mon, 22 Jun 2026 12:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C70AF3A7820;
	Mon, 22 Jun 2026 12:30:05 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CB53A75BB;
	Mon, 22 Jun 2026 12:30:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782131405; cv=none; b=QxhddNwE8UzvLHgfX0HOziOnnLtLywX1S3zncoKnuIrCiTUeqjZzZXM8eH5mSR7PWV3mg37dooIjm9ZZdjvUbKH+nDMwTDVUf7Ni9vQGNZyLlXRl04tV0P/6OFH4oNV9WxxhkEVD587mG+G1sb9Vn6tKj/t5tzVrXrQPNXxR32k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782131405; c=relaxed/simple;
	bh=6bvqfWOr+PuNk/IfnxyrRyVXJAM9cSSe/wRBSR8490g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MG6rGlV6mp06D59MR0jRa7/n3cec+0SNEhLpxGpmrhwrMM0ldNvD1AmTpy5OF1pEVSmhFfCmkDTP0d4TzDyDvIXIygxgwWPvyC+tYf6z2iRT6ix9LkJ1oOEibBeBeWLkxFMDggVMiKZ1Y1ro8y/HEt6eXTuvJoKzOPjENEHnYb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SdzeTsua; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FEA91F000E9;
	Mon, 22 Jun 2026 12:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782131404;
	bh=5yoZ/Czy4eJtvyAKIOjmr6IlJxPiOx7G6o88YA1Nwe4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SdzeTsuadbAFNPphtN+RmLJVhGuoCzfLpYR7qm2AwlNxgyVxBmi4Ef4MjGWHbKGJ+
	 vvayGwPRGsTF+gp91DuKF9p6IbS3p5JAZL5ozMJfOQST+FaFlrj6NOlWFD07VKGvFe
	 GkYrkeD2Qnto0N4pLO10D41YymKpzI8aTq6nA9D06ysYFyfWDX/KknhW9L0dOcPxra
	 QP5gD9dR24pUtmwwn5JY/2S1R5C3O6y/LwI9aRgJWR7XKY66Z/X3AM1IVWfrsvdn8C
	 BWS18awYTggiitAz03XH8p7SaXj0VzNSf2f3mzbKrw9ffvmWmJi3yKHqRIiF7ThNQl
	 9M53z5oFc5cxg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] hwmon: (chipcap2) Add support for label
Reply-To: sashiko-reviews@lists.linux.dev
To: "Flaviu Nistor" <flaviu.nistor@gmail.com>
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260622122200.14245-2-flaviu.nistor@gmail.com>
References: <20260622122200.14245-1-flaviu.nistor@gmail.com>
 <20260622122200.14245-2-flaviu.nistor@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 22 Jun 2026 12:30:03 +0000
Message-Id: <20260622123004.3FEA91F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:flaviu.nistor@gmail.com,m:linux-hwmon@vger.kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:flaviunistor@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-15241-lists,linux-hwmon=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smtp.kernel.org:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,lists.linux.dev:replyto,sashiko.dev:url,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 045A36AF720

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Data race on shared state between threaded interrupt handlers and =
sysfs context, violating hwmon subsystem guidelines.
--

commit a4752e881c74f908f48e460d6cd5322c3eb88341
Author: Flaviu Nistor <flaviu.nistor@gmail.com>

hwmon: (chipcap2) Add support for label

This commit adds support for the label sysfs attribute to the chipcap2 hwmon
device. This allows for easier identification of individual sensors via the
device tree.

> diff --git a/drivers/hwmon/chipcap2.c b/drivers/hwmon/chipcap2.c
> index 4aecf463180fd..086571d556b7e 100644
> --- a/drivers/hwmon/chipcap2.c
> +++ b/drivers/hwmon/chipcap2.c
[ ... ]
> @@ -552,6 +559,16 @@ static int cc2_humidity_max_alarm_status(struct cc2_=
data *data, long *val)
>  	return 0;
>  }
> =20

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing this driver I
noticed a potential data race. Does the driver access and modify shared
variables (rh_alarm.low_alarm) concurrently from both sysfs read paths and
threaded interrupt handlers without locking?

In the sysfs process context, the flag is evaluated and cleared without loc=
ks:

drivers/hwmon/chipcap2.c:cc2_humidity_min_alarm_status() {
    ...
    if (data->rh_alarm.low_alarm) {
        *val =3D (measurement < min_hyst) ? 1 : 0;
        data->rh_alarm.low_alarm =3D *val;
    } else {
        *val =3D 0;
    }
    ...
}

Concurrently, the threaded interrupt handler sets the flag:

drivers/hwmon/chipcap2.c:cc2_low_interrupt() {
    ...
    if (cc2->process_irqs) {
        hwmon_notify_event(cc2->hwmon, hwmon_humidity,
                           hwmon_humidity_min_alarm, CC2_CHAN_HUMIDITY);
        cc2->rh_alarm.low_alarm =3D true;
    }
    ...
}

The hwmon subsystem guidelines mandate that drivers must implement locking
required for interrupt handling, specifically recommending the use of
hwmon_lock() and hwmon_unlock() to serialize operations. Can these paths
race and cause state corruption or lost alarm events?

> +static int cc2_read_string(struct device *dev, enum hwmon_sensor_types t=
ype,
> +			   u32 attr, int channel, const char **str)
> +{
> +	struct cc2_data *data =3D dev_get_drvdata(dev);
> +
> +	*str =3D data->label;
> +
> +	return 0;
> +}
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260622122200.1424=
5-1-flaviu.nistor@gmail.com?part=3D2

