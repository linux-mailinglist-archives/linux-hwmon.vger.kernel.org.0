Return-Path: <linux-hwmon+bounces-15662-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Q2CpMq3DTWrP9wEAu9opvQ
	(envelope-from <linux-hwmon+bounces-15662-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 08 Jul 2026 05:27:41 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A49721611
	for <lists+linux-hwmon@lfdr.de>; Wed, 08 Jul 2026 05:27:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=SM8I+xQH;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15662-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15662-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1793C301B739
	for <lists+linux-hwmon@lfdr.de>; Wed,  8 Jul 2026 03:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D765E36F8F9;
	Wed,  8 Jul 2026 03:27:19 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8D5372066
	for <linux-hwmon@vger.kernel.org>; Wed,  8 Jul 2026 03:27:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783481239; cv=none; b=Zx4olzKSyONn5nUNzvwY7WopQ8yCmN84GG2y/P+03gtixR0i6GLdBE4CzgszjKBmo7dFLNRHB5LIRChSGRnWcBdX3HTQYlmKaH/QswqXSbSwwCiltVwkaeoaudtYM/0lIO0ezt1NnPIcULjzsb9NVf1ffav7ScNA+JgL/iqKYVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783481239; c=relaxed/simple;
	bh=yyGn+rg20MJTXkHqFWiv45FSaGb1uZzMo0BhhTuKI7Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WxDbr0+09qPBhGv0mePLV50O0r5Hj+o9cjU+apIB3R1A+aF6kNlc5kq5ZycloZkZypcsxm33tyUUz7sKO5oQ95ilqGzUVmchhdhilOa4RyLJ5dhDNeuEpoXPkkLZ690PlcA+E6Dix63cHntaYEqK4OttyhHyG/SuNvST+AVrAAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SM8I+xQH; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56DEB1F000E9;
	Wed,  8 Jul 2026 03:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783481238;
	bh=NI4IcHgXLJPgcgD04xqgGPj/2dKVcy5oeP1XQVnLfHE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SM8I+xQHvBD/vezFdYOzK2+jfPUxe9ZCWHL4NvPIsEamzVXYLheHP1hcpOchxdw1m
	 KQFtzTUE+7aw3g9LSAGXWsRP8OnbecyspW8hhQXHDcbE5kJ2gvwYodRdurta8Q3cqD
	 bXPbmA7lRnRzE++RYcA/UQQyhWfO//krzptOT/se5ERH3le6m14OF0NwXAvksP5PFv
	 2mkODjy0nIInuGeLmbxvXvfb7MUW/dMczXqUupZscYi1N159lydZvnjL6zT4Z1C5AA
	 7pop0Tb3sUEkbaJ74IwvfSF9KehZzY+6KKbwj4E1BY1cuRzHynd701CZcpp+OaK0xU
	 HGSQW7qag0Djw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] hwmon: (nzxt-kraken3) Stop device IO before
 calling hid_hw_stop
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260708030507.227193-5-linux@roeck-us.net>
References: <20260708030507.227193-1-linux@roeck-us.net>
 <20260708030507.227193-5-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 03:27:17 +0000
Message-Id: <20260708032718.56DEB1F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-15662-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@roeck-us.net,m:linux-hwmon@vger.kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,roeck-us.net:email,smtp.kernel.org:mid,lists.linux.dev:replyto,vger.kernel.org:from_smtp,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 28A49721611

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing hwmon_lock() serialization for sysfs extra_groups attribut=
es in kraken3_fan_curve_pwm_store.
- [High] Insufficient bounds checking in kraken3_raw_event leads to an out-=
of-bounds read for Z53 devices.
- [High] Probe error paths in multiple other HID drivers fail to call `hid_=
device_io_stop(hdev)`, leaving IO enabled and leading to UAF vulnerabilitie=
s.
- [Medium] Using `spin_lock_bh()` in process context while the same lock is=
 acquired with `spin_lock()` in a hardirq-capable completion handler leads =
to deadlocks.
- [Medium] Sensor readings, update timestamps, and firmware version arrays =
are modified by the interrupt handler locklessly and read by sysfs/debugfs =
callbacks locklessly.
--

--- Patch [4]: [PATCH v2 4/4] hwmon: (nzxt-kraken3) Stop device IO before c=
alling hid_hw_stop ---
commit 56b3edbc8e234031a68a61227f708d801053d8df
Author: Guenter Roeck <linux@roeck-us.net>

hwmon: (nzxt-kraken3) Stop device IO before calling hid_hw_stop

Calling hid_hw_stop() does not stop the device IO, which can result
in a use-after-free race condition between hid_input_report() and probe
failure. This fix adds hid_device_io_stop() before hid_hw_stop() to
prevent the vulnerability.

> diff --git a/drivers/hwmon/nzxt-kraken3.c b/drivers/hwmon/nzxt-kraken3.c
> index d00409bcab93a..05525406c5fbb 100644
> --- a/drivers/hwmon/nzxt-kraken3.c
> +++ b/drivers/hwmon/nzxt-kraken3.c
> @@ -960,13 +960,15 @@ static int kraken3_probe(struct hid_device *hdev, c=
onst struct hid_device_id *id
[ ... ]
>  	return 0;
> =20
> +fail_and_stop_io:
> +	hid_device_io_stop(hdev);
>  fail_and_close:
>  	hid_hw_close(hdev);
>  fail_and_stop:
>  	hid_hw_stop(hdev);
>  	return ret;
>  }

[Severity: High]
This is a pre-existing issue, but do other HID drivers share this same
missing cleanup?

Looking at corsairpsu_probe() in drivers/hwmon/corsair-psu.c:

fail_and_close:
	hid_hw_close(hdev);
fail_and_stop:
	hid_hw_stop(hdev);
	return ret;

And mcp2221_probe() in drivers/hid/hid-mcp2221.c:

	ret =3D mcp_set_i2c_speed(mcp);
	if (ret) {
		hid_err(hdev, "can't set i2c speed: %d\n", ret);
		return ret;
	}

And nintendo_hid_probe() in drivers/hid/hid-nintendo.c:

err_close:
	hid_hw_close(hdev);
err_stop:
	hid_hw_stop(hdev);

Could these error paths also leave IO enabled and trigger a similar UAF
vulnerability if the HID core processes events after devres frees the
private data?

[Severity: High]
This isn't a bug introduced by this patch, but does the custom attribute
store function lack hwmon_lock() serialization?

drivers/hwmon/nzxt-kraken3.c:kraken3_fan_curve_pwm_store() {
...
		ret =3D
		    kraken3_write_curve(priv,
					priv->channel_info[dev_attr->nr].pwm_points, dev_attr->nr);
...
}

The hwmon core only serializes attributes registered via the info
parameter. For attributes registered via extra_groups, can modifying
the fan curve arrays without hwmon_lock() or priv->buffer_lock allow
concurrent sysfs writes to race with the core hwmon write callback and
corrupt device state?

[Severity: High]
This is a pre-existing issue, but does kraken3_raw_event() have
sufficient bounds checking for Z53 devices?

drivers/hwmon/nzxt-kraken3.c:kraken3_raw_event() {
...
		priv->fan_input[1] =3D get_unaligned_le16(data + Z53_FAN_SPEED_OFFSET);
		priv->channel_info[1].reported_duty =3D
		    kraken3_percent_to_pwm(data[Z53_FAN_DUTY_OFFSET]);
...
}

The function checks if the size is at least MIN_REPORT_LENGTH (20
bytes). If a report is exactly 20 bytes, does unconditionally accessing
offsets 23, 24, and 25 cause an out-of-bounds read?

[Severity: Medium]
This isn't a bug introduced by this patch, but is there a deadlock risk
between kraken3_read_z53() and kraken3_raw_event()?

kraken3_read_z53() uses spin_lock_bh():
	spin_lock_bh(&priv->status_completion_lock);

kraken3_raw_event() uses spin_lock():
	spin_lock(&priv->status_completion_lock);

On systems where legacy USB host controllers execute URB givebacks in
hardirq context, could the interrupt handler attempt to acquire the
already held spinlock and deadlock on the local CPU?

[Severity: Medium]
This is a pre-existing issue, but are sensor readings modified
locklessly?

drivers/hwmon/nzxt-kraken3.c:kraken3_raw_event() {
...
	/* Temperature and fan sensor readings */
	priv->temp_input[0] =3D
	    data[TEMP_SENSOR_START_OFFSET] * 1000 + data[TEMP_SENSOR_END_OFFSET] *=
 100;
...
}

And read in kraken3_read() without locks:

drivers/hwmon/nzxt-kraken3.c:kraken3_read() {
...
	case hwmon_temp_input:
		*val =3D priv->temp_input[channel];
...
}

Can the sysfs/debugfs callbacks read these variables concurrently with
the interrupt handler and return torn reads, contrary to the hwmon
subsystem guidelines?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708030507.2271=
93-1-linux@roeck-us.net?part=3D4

