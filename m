Return-Path: <linux-hwmon+bounces-14243-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id luRxL4c6CWrgOwQAu9opvQ
	(envelope-from <linux-hwmon+bounces-14243-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sun, 17 May 2026 05:48:23 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 092D055F243
	for <lists+linux-hwmon@lfdr.de>; Sun, 17 May 2026 05:48:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C31E6300D46E
	for <lists+linux-hwmon@lfdr.de>; Sun, 17 May 2026 03:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C0F4212F89;
	Sun, 17 May 2026 03:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gmJ2Eh0O"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1919C78F39
	for <linux-hwmon@vger.kernel.org>; Sun, 17 May 2026 03:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778989700; cv=none; b=nNjTC9duJkdVW2rLF1YngAxJYC8297dxJsQRkIWW/JV21UZ3E5IJJsEf5r1WElWqgL+i/gaJY82defZQ3dIMsMHa4wrbsHHbRU8Gm2plYpxHmCrffgQqDAZPzkYu9LdtcjIIIXY0kzy8FT7km26PJfE4uqprmKUI1jcLleE6rgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778989700; c=relaxed/simple;
	bh=rBEJTrzij+0K0YZNQaH4+62nxz0/gAag3Y+jWcNjjy0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=c7YoQvkUy0Lg7bSU6AXpKTk0pXaCaNwk6m7DO0+z06XZoKlUHDn2oYQUMdKOVaYtfF8mXjRRueOzu/ZPT83b+hdRlLqc+7FTqAnFTkLU3pHh8HXMEe8PJOfwWBUSLmUH729nzCghFOQ8ZrFn67rUPVtMXDUU6weh/mpK92Bzp9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gmJ2Eh0O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E4F2C2BCB0;
	Sun, 17 May 2026 03:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778989699;
	bh=rBEJTrzij+0K0YZNQaH4+62nxz0/gAag3Y+jWcNjjy0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=gmJ2Eh0OWSNgEh69y+bTAtc+S1wNhTi8T5GB7cUpi18oacJbw4smTtSAo+yqLSJOm
	 RqQjz1XJ13HW03ZtFmRMZwW1dhmL3rw8sv2H/PS/wbfyQmwCc8I1souG0mOQFlVANy
	 1yG2x0n7iiNoAqs4r6bWeR/TJjB4CqBHv7Mg7ew1pwUlzUEoud/iS0cpSZeOj0DPM4
	 AMoidLXCbRePPO7jdrInHK1TLUdDRdnCOFCjb9PQzz54gFW5YyrgvEeJ1iR/F4608F
	 iZSKw+nCJcYa+iCgmW5gugC5+RDzdxIlt9J4maMe6lCcCfm82/hB802y5nAQEPdyFT
	 2LPwTlRSajcDA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] hwmon: (pmbus/adm1266) serialize sequencer_state
 debugfs read with pmbus_lock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260516-adm1266-v4-3-1f8df4797258@nexthop.ai>
References: <20260516-adm1266-v4-3-1f8df4797258@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 17 May 2026 03:48:18 +0000
Message-Id: <20260517034819.8E4F2C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 092D055F243
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-14243-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sashiko.dev:url,lists.linux.dev:replyto,nexthop.ai:email]
X-Rspamd-Action: no action

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Meaningful code and commit message mismatch regarding defensive =
serialization.
--

commit 5ae3b71ff51816fdbc3baadbd4aef89f7cc85ac0
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

hwmon: (pmbus/adm1266) serialize sequencer_state debugfs read with pmbus_lo=
ck
   =20
adm1266_state_read() backs the sequencer_state debugfs entry and
issues an i2c_smbus_read_word_data() against the device without taking
pmbus_lock. The pmbus_core framework holds pmbus_lock around its own
multi-transaction sequences, so an unlocked debugfs reader can land
between a page write and the subsequent paged read in another thread.

> but the same defensive serialisation that
> applies to the GPIO accessors applies here: any direct device
> access from outside pmbus_core should be ordered with respect to
> pmbus_core's own.

This isn't a bug, but is this statement in the commit message accurate?

Looking at the gpio accessors like adm1266_gpio_get() and
adm1266_gpio_get_multiple(), they appear to issue direct i2c reads without
taking pmbus_lock:

static int adm1266_gpio_get(struct gpio_chip *chip, unsigned int offset)
{
	...
	ret =3D i2c_smbus_read_block_data(data->client, pmbus_cmd, read_buf);
	...
}

Similarly, adm1266_gpio_dbg_show() acquires data->buf_mutex via
adm1266_pmbus_block_xfer(), which only protects local buffers rather than
serialising against the pmbus core.

Furthermore, if the gpio accessors were modified to take pmbus_lock(),
wouldn't that cause a null pointer dereference crash during driver probe?

adm1266_probe() registers the gpio chip via adm1266_config_gpio() before
calling pmbus_do_probe():

static int adm1266_probe(struct i2c_client *client)
{
	...
	ret =3D adm1266_config_gpio(data);
	if (ret < 0)
		return ret;

	ret =3D adm1266_set_rtc(data);
	if (ret < 0)
		return ret;

	ret =3D pmbus_do_probe(client, &data->info);
	...
}

Since pmbus_do_probe() allocates the internal pmbus_data structure that
pmbus_lock() relies on, it seems the gpio accessors cannot safely use this
lock.

Could the commit message be updated to clarify the actual locking model,
rather than citing the gpio accessors as precedent?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260516-adm1266-v4=
-0-1f8df4797258@nexthop.ai?part=3D3

