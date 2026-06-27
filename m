Return-Path: <linux-hwmon+bounces-15380-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mYitFqOOP2rTUQkAu9opvQ
	(envelope-from <linux-hwmon+bounces-15380-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sat, 27 Jun 2026 10:49:39 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FCE6D1803
	for <lists+linux-hwmon@lfdr.de>; Sat, 27 Jun 2026 10:49:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="Aqsx/8UZ";
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15380-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15380-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2CBC230180A5
	for <lists+linux-hwmon@lfdr.de>; Sat, 27 Jun 2026 08:49:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5666A2E11B9;
	Sat, 27 Jun 2026 08:49:36 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CFF17D6
	for <linux-hwmon@vger.kernel.org>; Sat, 27 Jun 2026 08:49:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782550176; cv=none; b=YcAHVUPDpCHs8mCa0Uu2BFsJqFxOQ2icZYV/zXXUwhBnC1hNUO1umxfkXnQkJv51EXKMc86kxNyuX/ixU283Mjjs2sqKscXt05T7JL3hyK5m073jlGgx/McjMl18pYiGRNjSj/XR90CVB/+VKI85rRgR4FqSn3neT1vJBcejObU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782550176; c=relaxed/simple;
	bh=ykPX2eVs2+6Whqo/tZpXce/GZEcanXzVYLve3DYXujI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=p0arQzthDjMKSk4e2M55ysz/NKuS6eZ+bfHKe9aLDBsrWCfOoPbL3yht6azEpcUuZG6M0o/CWeet43lqWTanR8lh93zpcKIx7rYV9BAkhKkDutmRvmTNoKibByrjs3zuhp0lcvmVCTVDu14Rtcz1WIs/30L82maxT9JuxO6AGPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Aqsx/8UZ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A75111F000E9;
	Sat, 27 Jun 2026 08:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782550174;
	bh=J2VAlmShmW4Cwujr1fgyePgUivKiiWYThPOUd6eSSEw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Aqsx/8UZ+hYK/ZAoOfh4+ScT0fYoQYQP9X2cZA2/EFJ2uochrpCit0Y03gmWdnn1K
	 jt2OmjvmCUg31av3oOJNTHzFMGLvf1kebHJI8mggHfVk+chWnuvxIW8PKOAZvQH6k1
	 DNNADxdZuTjwKhbMr4nEcbq3V/RkTOi2s57wKWsyhs7FTcd9UNO+nopLBKfaR/ZhEr
	 +cJVVuKe0EQ2crquUfn/hncn8CnTATOV+qAEfNBKlJ/lp2Mz3zHnmX1sFLiySgxQjR
	 VKFtwZMoIj6Y23itinJr2XARhkKeaeXiy4xF6+Z3GbIcPdhPbcPfVJDfjcZG0D8ckq
	 0f5ANa6j/sXXw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1] hwmon: (yogafan) Add support for Lenovo Yoga/Legion
 fan monitoring
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sergio Melas" <sergiomelas@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260627084039.47158-1-sergiomelas@gmail.com>
References: <20260627084039.47158-1-sergiomelas@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 27 Jun 2026 08:49:33 +0000
Message-Id: <20260627084934.A75111F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-15380-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sergiomelas@gmail.com,m:linux-hwmon@vger.kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 97FCE6D1803

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Unprivileged Denial of Service of the RLLag telemetry filter via f=
ast polling (shared state pollution).
- [Medium] Silent bypass of WMI Coexistence Guard due to Kconfig mismatch (=
`IS_REACHABLE` misuse).
--

commit db32fd276d89299ba906703e55172f8ec3415249
Author: Sergio Melas <sergiomelas@gmail.com>

hwmon: (yogafan) Add support for Lenovo Yoga/Legion fan monitoring

This driver provides fan speed monitoring for Lenovo Yoga, Legion, and
IdeaPad laptops by interfacing with the Embedded Controller (EC) via ACPI.
It implements a Rate-Limited Lag filter to smooth out low-resolution sampli=
ng
in the embedded controller.

> diff --git a/drivers/hwmon/yogafan.c b/drivers/hwmon/yogafan.c
> index 605cc928f21f3..7d66d563ec236 100644
> --- a/drivers/hwmon/yogafan.c
> +++ b/drivers/hwmon/yogafan.c

[ ... ]

> @@ -50,48 +62,109 @@ struct yoga_fan_data {
>  static void apply_rllag_filter(struct yoga_fan_data *data, int idx, long=
 raw_rpm)
>  {
>  	ktime_t now =3D ktime_get_boottime();
> -	s64 dt_ms =3D ktime_to_ms(ktime_sub(now, data->last_sample[idx]));
> +	s64 raw_dt_ms;
>  	long delta, step, limit, alpha;
>  	s64 temp_num;
> +	u32 dt_ms;

[ ... ]

> -	if (data->last_sample[idx] =3D=3D 0 || dt_ms > MAX_SAMPLING) {
> +	/* 3. Auto-Reset Logic: Snap to hardware value after long gaps (>5s) */
> +	/*   Ref: [TAG: INIT_STATE, STALE_DATA_THRESHOLD] */
> +	raw_dt_ms =3D ktime_to_ms(ktime_sub(now, data->last_sample[idx]));
> +
> +	if (data->last_sample[idx] =3D=3D 0 || raw_dt_ms < MIN_SAMPLING || raw_=
dt_ms > MAX_SAMPLING) {
>  		data->filtered_val[idx] =3D raw_rpm;
>  		data->last_sample[idx] =3D now;
>  		return;
>  	}

[Severity: High]
Does combining the MIN_SAMPLING check into this auto-reset block create an
unintended bypass of the filter?

If an unprivileged user queries the fanX_input sysfs attribute faster than
MIN_SAMPLING (100ms), raw_dt_ms < MIN_SAMPLING evaluates to true.

Because this block sets data->last_sample[idx] =3D now, the time delta never
accumulates to exceed 100ms on continuous fast polling. This seems to snap
filtered_val to raw_rpm repeatedly, entirely defeating the filter's smoothi=
ng
logic.

[ ... ]

> @@ -206,6 +298,17 @@ static int yoga_fan_probe(struct platform_device *pd=
ev)
>  	struct device *hwmon_dev;
>  	int i;
> =20
> +	/* Check for WMI interfaces that handle fan/thermal management. */
> +	/*  If present, we yield to the WMI driver to prevent double-reporting.=
 */
> +#if IS_REACHABLE(CONFIG_ACPI_WMI)
> +	if (wmi_has_guid(LENOVO_WMI_OTHER_MODE_GUID) &&
> +	    wmi_has_guid(LENOVO_CAPABILITY_DATA_00_GUID) &&
> +	    wmi_has_guid(LENOVO_FAN_TEST_DATA_GUID)) {
> +		dev_info(&pdev->dev, "Lenovo WMI management interface detected; yieldi=
ng to WMI driver\n");
> +		return -ENODEV;
> +	}
> +#endif

[Severity: Medium]
Is IS_REACHABLE the correct macro to use here for the WMI coexistence guard?

If the driver is built-in (CONFIG_YOGAFAN=3Dy) but ACPI WMI is built as a
module (CONFIG_ACPI_WMI=3Dm), IS_REACHABLE(CONFIG_ACPI_WMI) will evaluate to
false.

This silently compiles out the guard, which could lead to hardware race
conditions between this driver and the WMI driver once the module loads.

Would it be safer to use IS_ENABLED() alongside a Kconfig dependency like
depends on ACPI_WMI || ACPI_WMI=3Dn?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260627084039.4715=
8-1-sergiomelas@gmail.com?part=3D1

