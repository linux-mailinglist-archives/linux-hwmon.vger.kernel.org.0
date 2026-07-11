Return-Path: <linux-hwmon+bounces-15830-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Qo2pJUs6Ump+NQMAu9opvQ
	(envelope-from <linux-hwmon+bounces-15830-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sat, 11 Jul 2026 14:42:51 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A09C7418B9
	for <lists+linux-hwmon@lfdr.de>; Sat, 11 Jul 2026 14:42:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=EDw4lrrV;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15830-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15830-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9C5113006176
	for <lists+linux-hwmon@lfdr.de>; Sat, 11 Jul 2026 12:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A823B3C2796;
	Sat, 11 Jul 2026 12:42:49 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B99B3C1093
	for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 12:42:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783773769; cv=none; b=TBKgGNV5zgCn+sKheP1qW7b9wYVPXghnczijkiBKEibgv4/+fjzt5NyaJRGNhsRtIfmWO5XkPR7PAqzwauTkzI8KoFEfsor4QmLZgjOmFqsaKgOR/gxkbP+z2Syp/6GeQXUiiBpSUQpBuRjhgky0HsZFrPEYX6D9G6DC+J3RMpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783773769; c=relaxed/simple;
	bh=9TEnhIu10fyLR/G7Fs/J4yUmIZ8CE7+R2lfRfgqmoLg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kt+tZV4RXdNPfoHbOzRBpl8TApRfAnL/3ChLIsNCdFfJdKJUJRDa28xjDri9FQoMO04D60rEECqjwXPhZN5Eg0y5RaPgkmJg1GEcPioE7GBiZLRH1Xx70i1GsMHpRyogefJ9w/5I079Xz73sYKwe2YofoQJ7b7sKoYxNyBJ06JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EDw4lrrV; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C82AB1F000E9;
	Sat, 11 Jul 2026 12:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783773768;
	bh=/qQOH0HYyh5z7PvDBt9XEQrIA0dqb4I2/es3Srj+TRI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EDw4lrrVwMvLpiz6NuGOc6eZynN02tOMKQD0BLwTO24T0x9YqInppKswJHaHwij72
	 0H9rOxezhB19M8hc9Kh1G2txp4L7VBoSGydyESb2Tvaf+BT/NzgajmhNh0Ra3tcJfN
	 rc/fy8iROgFa5IZtd5x/OBFk9oigmvtF08jpLJfM3btbyZ3QQlvfoAxEs9oSCpZA1v
	 t6UHGSBv3Kr0IBxfOvSjJJEfXDlOMKbae6hK210he9TfAjNJapLO1amNqQzG1H+Zk4
	 SEB0XEgf8+vLWcBWjYu3BH5gzuvYwJ+IawSlXOvKf2dfrAhCp0DHKZPrVh1S+juUek
	 q1yd3L4UpRpZg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/1] hwmon: (asus-ec-sensors) detect unconnected
 physical sensors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eugene Shalygin" <eugene.shalygin@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260711122937.594989-2-eugene.shalygin@gmail.com>
References: <20260711122937.594989-1-eugene.shalygin@gmail.com>
 <20260711122937.594989-2-eugene.shalygin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 11 Jul 2026 12:42:47 +0000
Message-Id: <20260711124247.C82AB1F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-15830-lists,linux-hwmon=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,smtp.kernel.org:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2A09C7418B9

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the zero-initial=
ized `last_updated` timestamp causes hwmon to report stale 0 values for the=
 first 5 minutes of system uptime.
--

--- Patch [1]: [PATCH v3 1/1] hwmon: (asus-ec-sensors) detect unconnected p=
hysical sensors ---
commit 5f0c212609da2bfbdab37b7fbc65fb23b0a4589a
Author: Eugene Shalygin <eugene.shalygin@gmail.com>

hwmon: (asus-ec-sensors) detect unconnected physical sensors

When there is no physical sensor connected to the motherboard socket,
reading the EC register returns one of several special values (-62, -60,
-40). This commit tests for these values and returns -ENODATA to hwmon.

> diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sens=
ors.c
> index 29a23484cbe7b..3936006adeb6c 100644
> --- a/drivers/hwmon/asus-ec-sensors.c
> +++ b/drivers/hwmon/asus-ec-sensors.c
[ ... ]
> @@ -1309,12 +1343,19 @@ static int asus_ec_hwmon_read(struct device *dev,=
 enum hwmon_sensor_types type,
>  	}
> =20
>  	ret =3D get_cached_value_or_update(dev, sidx, state, &value);

[Severity: High]
This isn't a bug introduced by this patch, but doesn't this result in stale=
 0
values being returned for the first 5 minutes of system uptime?

During probe, struct ec_sensors_data is allocated via devm_kzalloc(), which
zero-initializes the last_updated field.

Because the kernel initializes jiffies to a large negative value (typically
-300 * HZ to catch wrap-around bugs), the timestamp check in
get_cached_value_or_update() effectively becomes:

    time_after(negative_val, HZ)

This evaluates to false, as (long)(HZ - negative_val) < 0 is false.

The condition remains false until jiffies wraps around and passes HZ,
which takes approximately 300 seconds. This can cause userspace fan control
daemons to disable cooling, leading to unexpected throttling.

Should last_updated be initialized to jiffies - HZ during allocation to
ensure the first sensor read correctly triggers an update?

> -	if (!ret) {
> -		*val =3D scale_sensor_value(value,
> -					  get_sensor_info(state, sidx)->type);
> +	if (ret)
> +		return ret;
> +
> +	sensor_info =3D get_sensor_info(state, sidx);
> +	if (sensor_info->type =3D=3D hwmon_temp) {
> +		ec_sensor =3D get_ec_sensor_type(state, sidx);
> +		if ((environment_temp_sensors & BIT(ec_sensor)) &&
> +		    is_blank_temperature_value(value))
> +			return -ENODATA;
>  	}
> +	*val =3D scale_sensor_value(value, sensor_info->type);
> =20
> -	return ret;
> +	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260711122937.5949=
89-2-eugene.shalygin@gmail.com?part=3D1

