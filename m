Return-Path: <linux-hwmon+bounces-13306-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qF2BN6DO4GkkmQAAu9opvQ
	(envelope-from <linux-hwmon+bounces-13306-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Thu, 16 Apr 2026 13:57:20 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2098440DB22
	for <lists+linux-hwmon@lfdr.de>; Thu, 16 Apr 2026 13:57:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B20E3019935
	for <lists+linux-hwmon@lfdr.de>; Thu, 16 Apr 2026 11:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8925839E6D4;
	Thu, 16 Apr 2026 11:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZYckWoIk"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658342580F3
	for <linux-hwmon@vger.kernel.org>; Thu, 16 Apr 2026 11:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776340637; cv=none; b=NdIaxEFtdbALG2ADdKGAtT0VhXFH6zWBhbHDdfi3uXian1NrCBbTqrB1T1CAfS8Rf5zXK4Fp0GGZGAWD9Ec27FAtaiP1GR3mJDOWJaSyInVGtaJYV0eEBDrV9VYk2K/8ZYpI6qABl3Po9yeyJUsnk+x2VYdGxmaibN27+EWOBOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776340637; c=relaxed/simple;
	bh=xr/XOK5ML/9W9/pbY4jCHX54I2ZxVGlMNhOYBdVTWaw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=r1WCGQCBwvkB2m4tdiC0SRqWhlEn3sn9odXpbVo3EBmdoG+6oFPpd9oZAIlCqTU+ekOPQcPm8RX/A5krzI2dhyA23pFjWhNM3j9NBM+B8OOACZ4YfER21S1cCiOeJcvNNMisSx1s7pkafUbQC/jRBa641vZOQxrSwZCOsNT9/lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZYckWoIk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBDAFC2BCAF;
	Thu, 16 Apr 2026 11:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776340637;
	bh=xr/XOK5ML/9W9/pbY4jCHX54I2ZxVGlMNhOYBdVTWaw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=ZYckWoIkfFkLzIZOuAcYD9UboaoqNKWhur5MNzodZoUXnDV9ooypkGn9PlaXZfPZR
	 CYF2EtpOYq4oFcMDRJQNxS190r6MmqusajCPmmhO013SdrcjbHaVqeoCq6tYMjidwE
	 dJhImI6VEnfsjlQIGtnwIk/z/ps4i0wUgPrxE+ysLHHQQJgX3Ef9laLjFa3JIuHnhY
	 OB5yfbtROMjLnVjxrdxYNplkfdXf8008T/fJ69YLDb/Vn3+U32E0Xlb1lRzg2PQ/nN
	 XMj8EfE44m5ndVLGFCj3aqDidYoSsEfm8DhvlINZcrjdfJRB1BSYw0xBIUhhV5Hzwt
	 T/QoDJaLybiCQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] hwmon: (adm1031) Hold lock while reading cached
 data
Reply-To: sashiko@lists.linux.dev
To: "Gui-Dong Han" <hanguidong02@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260416091754.310-2-hanguidong02@gmail.com>
References: <20260416091754.310-2-hanguidong02@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Apr 2026 11:57:16 +0000
Message-Id: <20260416115716.CBDAFC2BCAF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13306-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,smtp.kernel.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sashiko.dev:url]
X-Rspamd-Queue-Id: 2098440DB22
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Sashiko AI review found 2 potential issue(s):
- [High] Store functions like fan_auto_channel_store() read uninitialized c=
ached values, which can silently disable hardware monitoring.
- [High] auto_temp_max_store() corrupts the temp_max cache and causes regis=
ter desynchronization.
--

commit 8f551aed0a746551e7fda3272d5c7e3fcaa2b090
Author: Gui-Dong Han <hanguidong02@gmail.com>

hwmon: (adm1031) Hold lock while reading cached data

The patch addresses TOCTOU races by holding data->update_lock while
accessing cached values in sysfs show and store functions.

Link: https://lore.kernel.org/linux-hwmon/CALbr=3DLYJ_ehtp53HXEVkSpYoub+XYS=
TU8Rg=3Do1xxMJ8=3D5z8B-g@mail.gmail.com/

> diff --git a/drivers/hwmon/adm1031.c b/drivers/hwmon/adm1031.c
> index 0551f815233d9..887fba9ea149f 100644
> --- a/drivers/hwmon/adm1031.c
> +++ b/drivers/hwmon/adm1031.c
> @@ -350,9 +350,8 @@ fan_auto_channel_store(struct device *dev, struct dev=
ice_attribute *attr,
>  	if (ret)
>  		return ret;
> =20
> -	old_fan_mode =3D data->conf1;
> -
>  	mutex_lock(&data->update_lock);
> +	old_fan_mode =3D data->conf1;

This is not a regression from this patch, but does this store function read
uninitialized cached values if it is called before adm1031_update_device()
has populated them?

The driver allocates its data structure with devm_kzalloc() during probe,
initializing the cache variables (like data->conf1) to zero, but
adm1031_update_device() is not called during probe to populate them.

If a user writes to this sysfs attribute before any reads, the store
function performs a read-modify-write using the zeroed data->conf1. When it
writes data->conf1 back to the ADM1031_REG_CONF1 register, it clears the
ADM1031_CONF1_MONITOR_ENABLE bit (0x01).

Could this silently disable the chip's hardware monitoring and thermal
protection?

[ ... ]

Additionally, there appears to be a separate pre-existing regression in
auto_temp_max_store():

drivers/hwmon/adm1031.c:auto_temp_max_store() {
    ...
	val =3D clamp_val(val, 0, 127000);
	mutex_lock(&data->update_lock);
	data->temp_max[nr] =3D AUTO_TEMP_MAX_TO_REG(val, data->auto_temp[nr],
						  data->pwm[nr]);
	adm1031_write_value(client, ADM1031_REG_AUTO_TEMP(nr),
			    data->temp_max[nr]);
	mutex_unlock(&data->update_lock);
    ...
}

Does this corrupt the temp_max cache and cause register desynchronization?

The calculated new automatic temperature limit is assigned to
data->temp_max[nr] instead of data->auto_temp[nr], corrupting the cache
used by temp_max_show().

Because data->auto_temp[nr] is left stale, if auto_temp_min_store() is
called before the cache expires, it will read the old data->auto_temp[nr]
value and write it back to ADM1031_REG_AUTO_TEMP.

Could this cause the hardware to silently revert the max temperature limit
just set by the user?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260416091754.310-=
1-hanguidong02@gmail.com?part=3D2

