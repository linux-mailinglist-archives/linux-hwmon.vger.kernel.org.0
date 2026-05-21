Return-Path: <linux-hwmon+bounces-14378-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CosAvhYDmo4+AUAu9opvQ
	(envelope-from <linux-hwmon+bounces-14378-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Thu, 21 May 2026 02:59:36 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5EF59D769
	for <lists+linux-hwmon@lfdr.de>; Thu, 21 May 2026 02:59:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6BCE6301E774
	for <lists+linux-hwmon@lfdr.de>; Thu, 21 May 2026 00:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD3BE27466A;
	Thu, 21 May 2026 00:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aYRqytuk"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B842156661
	for <linux-hwmon@vger.kernel.org>; Thu, 21 May 2026 00:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779325172; cv=none; b=gkkHYOjI7TW4y3BCmLBaAAQYd1cUIbn/utL+YArvRUOKGQf1diNAsrfODMDxIy0rvDf3PWTJGaBKFz7LR4x4UCSHsmuun9UI0Jvsel0iz320DkIiFN+XgHDr8G5rstQ1ox4QEyp7jCKuZYYi04IxtIBkBhNf8clY+qcSq7/qIxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779325172; c=relaxed/simple;
	bh=9XlC1Avyog3Fuciab4/2sMvPpL4MbwbvDnkJqmCxcM8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TRXzHLPc/6RyHbFDzs+8paD4n7l1xlkN6hxxzJdwSXnbfvRNP9A0fETD+j0kV3dobDegOXC9xfMg0hGgoWOiNEwVxt3LDQ0sdt47+6aSp8MF8QbzjUMeUkgcK/xVJloYLj345aOpR8r7qasAiLB9RYsw/W6cIj1n4VHH2K2P6iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aYRqytuk; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66A331F000E9;
	Thu, 21 May 2026 00:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779325171;
	bh=nZAjES9al1mLiUQCYIM/ZxUMG0aMWKJ6zpRbjpgNdBc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aYRqytukKPyNyApp1bq36uYhZfwfi9koBiZFAtZ/AKjgepLm21zJvFSXarr0FPEc1
	 dXyFqtt1F8Nwh9idZ3lV2skRYCvEDdP9N8PefJNecUuYgLlnun+bHvVGDFhvE63VuD
	 1oOO/8A1jTcShU4G130xySKX+jwQ8UO19gSYafbbZVDvyixGovUkMhsvbxzt6BlIJG
	 R6JgWBJHFFfx6PGUgn+8lL2k+zqsjd/ofEAM8pZRPXNpYvd+Xfko2UGq0N66nEvgWl
	 XwlCV8qmNGTUf/teqD+YnhwHFWyzwDuS+Qffreb6IH7jmjdm/2J2zQNkEACgX+an9b
	 NUdBynpXsARmA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/3] hwmon: (pmbus/adm1266) add rtc debugfs entry
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260520-adm1266-v5-3-c72ef1fac1ea@nexthop.ai>
References: <20260520-adm1266-v5-3-c72ef1fac1ea@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 00:59:31 +0000
Message-Id: <20260521005931.66A331F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-14378-lists,linux-hwmon=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,lists.linux.dev:replyto,smtp.kernel.org:mid,sashiko.dev:url,nexthop.ai:email]
X-Rspamd-Queue-Id: 8F5EF59D769
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> The driver seeds the chip's SET_RTC register once at probe with
> ktime_get_real_seconds().  Over a long uptime the chip's internal
> seconds counter drifts away from the host's wall-clock time, so the
> timestamp embedded in each blackbox record stops being meaningful
> in wall-clock terms.  The datasheet recommends that the host
> periodically resynchronise the counter to address this; today the
> driver has no userspace-facing knob for that.
>=20
> Expose SET_RTC via an rtc debugfs file alongside the other adm1266
> debugfs entries:
>=20
>   read  -- returns the chip's current SET_RTC seconds counter, so
>            userspace can observe how far the chip has drifted from
>            host wall-clock without writing anything.
>   write -- the kernel re-reads ktime_get_real_seconds() itself and
> [ ... ]
> byte-packing and write; probe just calls adm1266_rtc_set(client, 0)
> (the ignored @val argument) after pmbus_do_probe() so the
> pmbus_lock acquired by the new helper has a live mutex to take.
>=20
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520-adm1266-v5=
-0-c72ef1fac1ea@nexthop.ai?part=3D3


