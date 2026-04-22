Return-Path: <linux-hwmon+bounces-13450-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEhvF5W76GkHPgIAu9opvQ
	(envelope-from <linux-hwmon+bounces-13450-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 22 Apr 2026 14:14:13 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1160445C27
	for <lists+linux-hwmon@lfdr.de>; Wed, 22 Apr 2026 14:14:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 727D430252AB
	for <lists+linux-hwmon@lfdr.de>; Wed, 22 Apr 2026 12:10:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E31035F60F;
	Wed, 22 Apr 2026 12:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BahebPbj"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8384A23
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 12:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776859845; cv=none; b=cZWbTU05kR3NjdlEPgmC7yKL7H+RHmaOOGCqckJndRRR+sm4/F6j9MDKDcmpcRUM+BnRP6D+x2bU5aq4mAHreH7o2gJK6ZZiwjQ5pZP97xi7Xmw3wdsQfPBwNABBE4R4rkfQd9yFCImaTw956frSk1bNx5eX/B/HDIUntTjH2lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776859845; c=relaxed/simple;
	bh=uw/WNEGO97tKHyjK7F5MwNAsUT/0Qa7mtyIJG7/NxNA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pIM6gQ3CvM9oNccVFkBTHde3xDvnaRt3GC6+ZtrfCoR+MXUFwI7nqWZ9Vkywc/0WSYV3ewPEOklU3uzO/UkAiZj+/veLdjYXGmxH7U93kpsjKD+x6bTiIYydM7fTt3sRtCH+VXGprmxDaOcwIXeno6lL8/g4YO3Zkx33kEiWrzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BahebPbj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 742D0C19425;
	Wed, 22 Apr 2026 12:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776859845;
	bh=uw/WNEGO97tKHyjK7F5MwNAsUT/0Qa7mtyIJG7/NxNA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=BahebPbjhH5wNkN1FRs8f+s4ruLSVls2rqujoaIXtyQ5xEQnrgjMOkiL9XzmNaMUN
	 2KgN8ylJ5yiENxamd6DRv6YCegk0wyGhzYpjmsUBBeTIR6V1UwOgMsLfC0T4sU2RT8
	 URwcgLIcpA3KufUaizo2JTME49RgOkX0SVFQbeKYRZcHDnGh/mLqXQFPuci4GZ6v8U
	 fKZqQfKphlPNOMjvJ/9SIGTo2T40JUxakrBgK+1INoHJHg8rQTnGux9YO3dccIHGZQ
	 8RsGslKu9AhXjDC0Cx6Ibe0neL5mWNwBkWcZiyYM4/axVz/YRk43Z11Ro0XgAuQ2l2
	 M/iWyqVoUisqg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: mcp9982: Add external diode fault read
Reply-To: sashiko@lists.linux.dev
To: "Victor Duicu" <victor.duicu@microchip.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260422-add-external-diode-fault-read-v1-1-bb28e03a0766@microchip.com>
References: <20260422-add-external-diode-fault-read-v1-1-bb28e03a0766@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Apr 2026 12:10:44 +0000
Message-Id: <20260422121045.742D0C19425@smtp.kernel.org>
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-13450-lists,linux-hwmon=lfdr.de];
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
	HAS_REPLYTO(0.00)[sashiko@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sashiko.dev:url,smtp.kernel.org:mid,lists.linux.dev:replyto]
X-Rspamd-Queue-Id: B1160445C27
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Sashiko AI review found 1 potential issue(s):
- [Medium] Reading the `hwmon_temp_fault` attribute in Standby mode returns=
 stale data because it fails to trigger a one-shot conversion.
--

commit 50b760776977e57ad65e2996d0bfd4a793fe2276
Author: Victor Duicu <victor.duicu@microchip.com>

hwmon: mcp9982: Add external diode fault read

This patch adds external diode fault read capability to the MCP998X/33
and MCP998XD/33D driver.

> diff --git a/drivers/hwmon/mcp9982.c b/drivers/hwmon/mcp9982.c
> index 26c69e3388ab8..2e75ade20118b 100644
> --- a/drivers/hwmon/mcp9982.c
> +++ b/drivers/hwmon/mcp9982.c

[ ... ]

> @@ -510,6 +510,18 @@ static int mcp9982_read(struct device *dev, enum hwm=
on_sensor_types type, u32 at
> =20
>  			*val -=3D hyst * 1000;
> =20
> +			return 0;
> +		case hwmon_temp_fault:
> +			/*
> +			 * Because the ALERT/THERM pin is set in Therm(Comparator)
> +			 * mode, the external diode fault status register
> +			 * does not clear the bits after reading.
> +			 */
> +			*val =3D regmap_test_bits(priv->regmap, MCP9982_EXT_FAULT_STATUS_ADDR,
> +						BIT(channel));

Does this return stale data when the device is in Standby mode?

When the device is in Standby mode (!priv->run_state), automatic measuremen=
ts
are stopped, and the driver triggers a manual one-shot conversion before
reading attributes:

	if (!priv->run_state) {
		switch (type) {
		case hwmon_temp:
			switch (attr) {
			case hwmon_temp_input:
			case hwmon_temp_max_alarm:
			case hwmon_temp_min_alarm:
			case hwmon_temp_crit_alarm:
				ret =3D regmap_write(priv->regmap, MCP9982_ONE_SHOT_ADDR, 1);
				...

Since hwmon_temp_fault is not included in this wake-up list, it looks like
reading the fault status bypasses the wake-up logic and returns the cached
hardware state from the last active cycle instead of triggering a new
measurement.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260422-add-extern=
al-diode-fault-read-v1-1-bb28e03a0766@microchip.com?part=3D1

