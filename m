Return-Path: <linux-hwmon+bounces-15838-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RgJ+HIl3U2rWbAMAu9opvQ
	(envelope-from <linux-hwmon+bounces-15838-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sun, 12 Jul 2026 13:16:25 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B157447A4
	for <lists+linux-hwmon@lfdr.de>; Sun, 12 Jul 2026 13:16:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=mALKj1w5;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15838-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15838-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 820E8300A380
	for <lists+linux-hwmon@lfdr.de>; Sun, 12 Jul 2026 11:16:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDCA32D73B9;
	Sun, 12 Jul 2026 11:16:22 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897B954723
	for <linux-hwmon@vger.kernel.org>; Sun, 12 Jul 2026 11:16:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783854982; cv=none; b=KE5y/vwCRzCSa5hk06l4EiuxO50/DrJenVUVFQt9XEthtxWtN0auviKXi6tlwoWXHXB1QUDpNOhgUhNFgfnVFSSmBNGGR5RA0Vr884mfE6kP7BQ1FLRnX05LZ4CcNdVffOftNkYX8jBVwt7UbJ0UIRDB5JDFDS3bWJRYcitcL1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783854982; c=relaxed/simple;
	bh=A5l3fSjDJSt7U0rjVnlPQ8TWWgv0UHFcAsE4c2T4GBA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dhw2HtiTiuFsgZ4rZtumsuf/3dgMmJZ8me8BV/tTvUIaTMLh5/RoTbDCEyJOeSbDbbZYUfzUMzJiEUWCnKm/o4HxQiuzKGNxenk3/UMZQbSnPrQuZIdb7pSgp16AcI8W+H7m1egC+h09xnZVtLTNMzsmjcZf43Xy8Tl/7S85x5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mALKj1w5; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDE5A1F000E9;
	Sun, 12 Jul 2026 11:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783854981;
	bh=R0ZFNN4L+xf/EaA8WSHHIO4+0bkpbG2UkTm1iA13ijc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mALKj1w5dgysmUDpoh8vARdtYgaESTRZ/IuQsNqyFF/Cw1un0xBZOkW0gOlmescn+
	 mj1Fz7HCvsQXI7uIACt6z+WY2MaX183P6CWd7QSvBgkShD7JbW4BmHWEwTDo71LyUc
	 gNWdTxhH2Z2jKjpIFa/RV5/W5Y5lHmtPehrSJVcH3RS+G7ORFByguKRhT6z8KWELPR
	 3lObL+O8HlyAjDwppBi1SPQfNbWBxe8MKDx/ZDTvl6ifzImqJ5U6iqAmzSV+uXCs2u
	 /MmQ+oV/VjEyHIa39dc0n9wxD7By/m65KQGVVj87dglBieBrGT7yvOpeNjZeQgD3mc
	 3vLqGjRy/pp7A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/1] hwmon: (asus-ec-sensors) fix EC read intervals
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eugene Shalygin" <eugene.shalygin@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260712110650.1240071-2-eugene.shalygin@gmail.com>
References: <20260712110650.1240071-1-eugene.shalygin@gmail.com>
 <20260712110650.1240071-2-eugene.shalygin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 12 Jul 2026 11:16:20 +0000
Message-Id: <20260712111620.EDE5A1F000E9@smtp.kernel.org>
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
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-15838-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:eugene.shalygin@gmail.com,m:linux-hwmon@vger.kernel.org,m:eugeneshalygin@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,smtp.kernel.org:mid,lists.linux.dev:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B1B157447A4

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver ignores the memory allocation failure from asus_ec_hwmo=
n_add_chan_info(), causing a NULL pointer dereference in the hwmon core.
- [High] Missing rate-limiting timestamp update on EC read failure allows l=
og flooding and ACPI EC spam by unprivileged userspace.
--

--- Patch [1]: [PATCH v2 1/1] hwmon: (asus-ec-sensors) fix EC read interval=
s ---
commit 22e0613e28eceb6562850cc438cb81f20f1fefaa
Author: Eugene Shalygin <eugene.shalygin@gmail.com>

hwmon: (asus-ec-sensors) fix EC read intervals

This commit updates the EC read interval logic to take INITIAL_JIFFIES into
account when setting up the next update time, using a 64-bit jiffies value
for next_update.

> diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sens=
ors.c
> index 29a23484cbe7b..eb71e41fd4f4b 100644
> --- a/drivers/hwmon/asus-ec-sensors.c
> +++ b/drivers/hwmon/asus-ec-sensors.c

[ ... ]

> @@ -1278,13 +1278,12 @@ static int get_cached_value_or_update(const struc=
t device *dev,
>  				      int sensor_index,
>  				      struct ec_sensors_data *state, s32 *value)
>  {
> -	if (time_after(jiffies, state->last_updated + HZ)) {
> +	if (time_after64(get_jiffies_64(), state->next_update)) {
>  		if (update_ec_sensors(dev, state)) {
>  			dev_err(dev, "update_ec_sensors() failure\n");
>  			return -EIO;
>  		}

[Severity: High]
This is a pre-existing issue, but does returning early on error here cause
unbounded log spam?

If update_ec_sensors() fails (e.g., due to a hardware timeout), it returns
-EIO without updating state->next_update. Since the timestamp remains in the
past, subsequent reads from userspace will immediately retry the failing
operation, potentially spamming the log and the ACPI EC.

Should state->next_update be advanced even on failure to maintain rate
limiting?

> -
> -		state->last_updated =3D jiffies;
> +		state->next_update =3D get_jiffies_64() + HZ;
>  	}
> =20
>  	*value =3D state->sensors[sensor_index].cached_value;

[ ... ]

> @@ -1488,8 +1488,8 @@ static int asus_ec_probe(struct platform_device *pd=
ev)
>  	for (type =3D 0; type < hwmon_max; ++type) {
>  		if (!nr_count[type])
>  			continue;
> =20
>  		asus_ec_hwmon_add_chan_info(asus_ec_hwmon_chan, dev,
>  					     nr_count[type], type,
>  					     hwmon_attributes[type]);
>  		*ptr_asus_ec_ci++ =3D asus_ec_hwmon_chan++;
>  	}

[Severity: High]
This isn't a bug introduced by this patch, but does this loop ignore memory
allocation failures?

If devm_kcalloc() fails inside asus_ec_hwmon_add_chan_info(), it returns
-ENOMEM and leaves asus_ec_hwmon_chan->config as NULL.

Since the return value is ignored here, the uninitialized struct is passed
to devm_hwmon_device_register_with_info(). The hwmon core unconditionally
dereferences the config pointer in hwmon_num_channel_attrs(), which could
cause a kernel oops on probe during memory pressure.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260712110650.1240=
071-2-eugene.shalygin@gmail.com?part=3D1

