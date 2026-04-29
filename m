Return-Path: <linux-hwmon+bounces-13584-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sK7OBNXy8WmElwEAu9opvQ
	(envelope-from <linux-hwmon+bounces-13584-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 29 Apr 2026 14:00:21 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 999F1493CFE
	for <lists+linux-hwmon@lfdr.de>; Wed, 29 Apr 2026 14:00:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0D183023DCC
	for <lists+linux-hwmon@lfdr.de>; Wed, 29 Apr 2026 11:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44A94340283;
	Wed, 29 Apr 2026 11:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kl8t0qxb"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224EA1A6807
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Apr 2026 11:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777463953; cv=none; b=oEd6mk+FKNgo2TpQZl6FG5uFAp2WggYjD2ribV2WSDpMe4igDgosySk54JdUBAA9y1FN+hyzqv6Catlk4FzAKlPAPf85qZUq981y1FeC38tlR/y2PQmIDEMDAK+1VNSvDFdOfscZuOkKBie1Fb90xPvLduWtqMxBibZ7es6lzWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777463953; c=relaxed/simple;
	bh=oUZj+EjqKCyyX6X3yEuLUYqF5lrvHzZeZ+wu6jiFgAs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ErjxpTv+TPUEPLSjj661iCpZtWd/qYeTTjx33mg49HJPTY7ODV/2hmy1gY/whjMGYa6zYA68PWxJC7Y7SqD52u2G0IzEQl/obZqlK+49cQ+rmqoOpIaqTATMQW/JPFFySkjRXpykMihIV+LUaQd9EkIOU9Xtb8IoSTy5qK87WGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kl8t0qxb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A38E0C19425;
	Wed, 29 Apr 2026 11:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777463952;
	bh=oUZj+EjqKCyyX6X3yEuLUYqF5lrvHzZeZ+wu6jiFgAs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Kl8t0qxbphl5ZayuWQTYDu6ZjUGOq5XA5z8wqP4Qg8GPCyquGyOdRH6lX43SVStTp
	 p5KRqFoe1QtbNpNrQY/NP08AV5HkzSgK/xuMAfQyXbLFqyNwuStSDgjcWWEbCRx5Q6
	 Rd2vOSDeU6euet/UzjBTXAuYioInwUVcZnsdTgZaYeEWzBF6Xdyv14E1mTp0tYkhnI
	 f+2aZLQ7HKqSs4Wiyzp/9RT8WmRSMcyQ05NI4SLX7c3LcjeGBYbKRRaPnhOEmFmbua
	 68xBAkho2PKZ4IAOcBWg/QCTKOIV+JBi9P42OekXkZICoC6tMwlijbTzr6mUwQJmEz
	 5053TJCdtTxUg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/2] hwmon: (pmbus/q54sj108a2) Add support for
 q50sn12072 and q54sn120a1
Reply-To: sashiko@lists.linux.dev
To: "Brian Chiang" <chiang.brian@inventec.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260429-add-support-for-q50sn12072-and-q54sn120a1-v7-2-f1f83d2039f7@inventec.com>
References: <20260429-add-support-for-q50sn12072-and-q54sn120a1-v7-2-f1f83d2039f7@inventec.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Apr 2026 11:59:11 +0000
Message-Id: <20260429115912.A38E0C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 999F1493CFE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-13584-lists,linux-hwmon=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[sashiko@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,sashiko.dev:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,inventec.com:email]

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Returning 0 on `devm_kzalloc` failure causes silent driver probe f=
ailure.
- [Medium] The patch introduces several significant bug fixes and refactori=
ngs that are not mentioned in the commit message.
--

commit 64436d69954e3cda83f05bdee9e09fc2269a2808
Author: Jack Cheng <cheng.jackhy@inventec.com>
hwmon: (pmbus/q54sj108a2) Add support for q50sn12072 and q54sn120a1

This commit adds support for the Delta Q50SN12072 and Q54SN120A1 DC-DC
power modules to the q54sj108a2 driver.

> Add support for them to q54sj108a2 driver.

This isn't a bug, but the commit message only mentions adding support for
the new modules. However, the patch also includes several other changes:
adding PMBus locking in the debugfs read/write paths, fixing the
WRITE_PROTECT restore logic, modifying the configuration for the existing
q54sj108a2 module, and refactoring the device identification logic.

Could the commit message be updated to describe these additional changes,
or should they be split into separate patches?

> diff --git a/drivers/hwmon/pmbus/q54sj108a2.c b/drivers/hwmon/pmbus/q54sj=
108a2.c
> --- a/drivers/hwmon/pmbus/q54sj108a2.c
> +++ b/drivers/hwmon/pmbus/q54sj108a2.c

[ ... ]

> @@ -333,16 +384,17 @@ static int q54sj108a2_probe(struct i2c_client *clie=
nt)
>  		return -ENODEV;
>  	}
> =20
> -	ret =3D pmbus_do_probe(client, &q54sj108a2_info[chip_id]);
> -	if (ret)
> -		return ret;
> -
>  	psu =3D devm_kzalloc(&client->dev, sizeof(*psu), GFP_KERNEL);
>  	if (!psu)
>  		return 0;

Because the psu allocation was moved before pmbus_do_probe(), returning 0
on allocation failure now skips registering the hwmon device entirely.
Since the probe function returns success (0), does this leave the driver
in a broken state? Should this return -ENOMEM instead?

> =20
> +	psu->chip =3D chip_id;
>  	psu->client =3D client;
> =20
> +	ret =3D pmbus_do_probe(client, &q54sj108a2_info[chip_id]);
> +	if (ret)
> +		return ret;
> +
>  	debugfs =3D pmbus_get_debugfs_dir(client);
> =20
>  	q54sj108a2_dir =3D debugfs_create_dir(client->name, debugfs);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260429-add-suppor=
t-for-q50sn12072-and-q54sn120a1-v7-0-f1f83d2039f7@inventec.com?part=3D2

