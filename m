Return-Path: <linux-hwmon+bounces-15653-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1voDHH+xTWo09AEAu9opvQ
	(envelope-from <linux-hwmon+bounces-15653-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 08 Jul 2026 04:10:07 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1801B720FD5
	for <lists+linux-hwmon@lfdr.de>; Wed, 08 Jul 2026 04:10:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=O6niz2Db;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15653-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15653-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 800743011053
	for <lists+linux-hwmon@lfdr.de>; Wed,  8 Jul 2026 02:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00C0F3B47E5;
	Wed,  8 Jul 2026 02:10:05 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DB3CA4E
	for <linux-hwmon@vger.kernel.org>; Wed,  8 Jul 2026 02:10:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783476604; cv=none; b=DVFUXZiq0NeirZv04i0FhtxZo6UhMN3TXK+/2AJEld3Q0VcyZ8DiKlxa08a/xfdeeRq2b0BDbJMXPOa9h2VlZGRpe5c1FDg0bfku+TG0mBTWXzSc6TRNne1qrO3Xc5l0/ys1MnMX8A07Rapo0WbxT9vslH6SJu9VAxR8NAPMezk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783476604; c=relaxed/simple;
	bh=dl9qi0Ky4Wcuu8sCb6iN4r2+QWl2kMzxCZlNogtg3UE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RBtHzNjzla5aA9fxM5woYwM5CPa8lwpErCpSXHeE+IKbYV0uL/fEhYvoDoKvWo4tYfZw4cSw2NAErsDxhzqdDUMJNp1mqbC0DejEa4Pzdm+KnzKD7UPw5nlyeF4PIOk/eubqpw6PAfthR+Zu6bIOo3uV2bjjt+J1NdTDZz7B5H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O6niz2Db; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89CD91F000E9;
	Wed,  8 Jul 2026 02:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783476603;
	bh=/Z2Kvtzsxk12B1voupeY8zzKMxzZ3pUFbdBxIJ0epLw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O6niz2DbFfT606jJBAj16syQCm7BS6pQZHFjGWNOfa5z4byVmHybvhL4h0h5gKed7
	 UjWMm4+4kERuba03A5pC8UWvC/bVuvmUugX+WkEIIHJQOAqTBlL0XYUSouBCtrtmW7
	 OJy7n5yqtjHa6Lql1j3qm3InIrBy/2Y86wdfdyLy8saK9sUaA5COOZR5kfUwTZLYca
	 eucyD8JjSvmfaVsWxAcEIgEwbqyptJmObHxyYQcFAxTEDNPLPVmyhRv61Pw1IttvIe
	 h4cntHXdjwVRBMZZQbiKLJdlZXtTGaLecRDajEPcQc/75kX5bdyvW22wc21wJs4SDv
	 yKSs5XtNaKGyQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] hwmon: (nzxt-kraken3) Stop device IO before calling
 hid_hw_stop
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260708015806.213790-5-linux@roeck-us.net>
References: <20260708015806.213790-1-linux@roeck-us.net>
 <20260708015806.213790-5-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 02:10:03 +0000
Message-Id: <20260708021003.89CD91F000E9@smtp.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-15653-lists,linux-hwmon=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,vger.kernel.org:from_smtp,lists.linux.dev:replyto,roeck-us.net:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,smtp.kernel.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1801B720FD5

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unconditional call to `hid_device_io_stop()` in the probe error pa=
th triggers a spurious kernel warning and improperly unwinds initialization.
--

--- Patch [4]: [PATCH 4/4] hwmon: (nzxt-kraken3) Stop device IO before call=
ing hid_hw_stop ---
commit 1a6a1a210c8f1b5e86d4cd6021a1f5a8d033e172
Author: Guenter Roeck <linux@roeck-us.net>

hwmon: (nzxt-kraken3) Stop device IO before calling hid_hw_stop

Calling hid_hw_stop() does not stop the device IO, causing a race condition
if probe fails. This commit fixes the problem by calling
hid_device_io_stop() before calling hid_hw_stop().

> diff --git a/drivers/hwmon/nzxt-kraken3.c b/drivers/hwmon/nzxt-kraken3.c
> index d00409bcab93a..cca53252b343a 100644
> --- a/drivers/hwmon/nzxt-kraken3.c
> +++ b/drivers/hwmon/nzxt-kraken3.c
> @@ -970,6 +970,7 @@ static int kraken3_probe(struct hid_device *hdev, con=
st struct hid_device_id *id
>  fail_and_close:
>  	hid_hw_close(hdev);
>  fail_and_stop:
> +	hid_device_io_stop(hdev);

[Severity: High]
Does this code unconditionally call hid_device_io_stop() on error paths whe=
re
hid_device_io_start() has not yet been called?

Looking at kraken3_probe() in drivers/hwmon/nzxt-kraken3.c, if we hit the
default case in the product switch statement or if memory allocation for
priv->buffer fails, we jump to fail_and_close:

        default:
                ret =3D -ENODEV;
                goto fail_and_close;

At this point, hid_device_io_start() hasn't executed.

Because hid_device_io_stop() checks if io_started is false and emits a
dev_warn() in that case, this will trigger a spurious kernel warning on
these benign error paths. On systems with panic_on_warn enabled, this could
lead to a panic just by plugging in an unsupported device.

Additionally, when failing after hid_device_io_start() has been called
(for example, if kraken3_init_device() fails), the error handling jumps to
fail_and_close. This means hid_hw_close() is called before
hid_device_io_stop().

Should a new fail_and_stop_io label be added to ensure the teardown
happens in the correct LIFO order and to avoid warnings on early errors?

>  	hid_hw_stop(hdev);
>  	return ret;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708015806.2137=
90-1-linux@roeck-us.net?part=3D4

