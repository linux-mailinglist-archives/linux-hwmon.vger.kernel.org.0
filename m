Return-Path: <linux-hwmon+bounces-15216-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8OqGOrsQNWo4mgYAu9opvQ
	(envelope-from <linux-hwmon+bounces-15216-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 19 Jun 2026 11:49:47 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B526A5095
	for <lists+linux-hwmon@lfdr.de>; Fri, 19 Jun 2026 11:49:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Wp6+fEtM;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15216-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15216-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 769DB3038A73
	for <lists+linux-hwmon@lfdr.de>; Fri, 19 Jun 2026 09:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EDE9326D65;
	Fri, 19 Jun 2026 09:49:38 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C30318B96;
	Fri, 19 Jun 2026 09:49:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781862577; cv=none; b=XO5cbgpq0RM+MQ9z42cs/jjhUd1eZoZHcV45ESNSs9XTe252+l1p+Mg3OGwixKqEme+tK6E1t/gldhIiSEGPK7KQQQblC12Cgi7BTsmOQ1rJRiSv8n0bn3K3O+9YCBdW4L4TzDjYGNpCTsvdfgK8KQYYtkovMLlV8DKL6ziXccs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781862577; c=relaxed/simple;
	bh=YLjFzPTEF9LCv85DmutXDKpOdwBlw9pFxGDhLmA8U+w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=niKkVz7UdZhZoGIhjDWKxDENIDw3Cn6d7luryBRTlKMcZECCVbo6urBY99CUGBj9FZPkobLBecHd1MO+V793wZvHxMMFL2z6ra4xT0lXy3k037h5UZAVe+uOVgDryM8SjqX4uqcxU6vMqc9BJX+AWyz5114tuvyuqlFX59eAwGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wp6+fEtM; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 902981F000E9;
	Fri, 19 Jun 2026 09:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781862575;
	bh=iZqf7eFBFgAirw9JlX0+V8FLBiZ3leIya1QCsPtIxE8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wp6+fEtM+inXOIzd25+pHZRvWYp2UNZm6CDx51e7NA0mQKqJEZLZMuXp88NIEMDij
	 PonT8bMP7amsy8AyMG3hevNMt53LeUmKjAPPQyEVQz23Ivd92RuSuwTbMwT3SVoacN
	 t/8aP4u3anvVhMDPtp9DUTBHze5DYG6SpcJNu/571O+1M3mtlO4JKOuoz2RTJFsNt6
	 rS+Be0/BQCVEsU8bvbs/wzqEXpLqVSte/LRJWuBxIB1IPCNu5C/hVfEzh8CKsan+OD
	 TYGjWtAtaxufIXiCKZdCe9im2UoMezlQWR/KZAAWipIZrpKnmMA0OegjJcG5tJDPrf
	 cS3D3mx7pPRpQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: socfpga: stratix10: add hwmon node
Reply-To: sashiko-reviews@lists.linux.dev
To: tze.yee.ng@altera.com
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <d62c4188cd936883bc14c95dcd27555ec94df7cf.1781861409.git.tze.yee.ng@altera.com>
References: <cover.1781861409.git.tze.yee.ng@altera.com>
 <d62c4188cd936883bc14c95dcd27555ec94df7cf.1781861409.git.tze.yee.ng@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Jun 2026 09:49:35 +0000
Message-Id: <20260619094935.902981F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15216-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,smtp.kernel.org:mid,sashiko.dev:url,altera.com:email,lists.linux.dev:replyto];
	FORGED_RECIPIENTS(0.00)[m:tze.yee.ng@altera.com,m:devicetree@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:conor+dt@kernel.org,m:robh@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 47B526A5095

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Hardware monitoring sysfs attributes remain active after the servi=
ce channel is freed during driver removal, leading to a kernel panic.
- [High] Incorrect temperature scaling calculation reports temperatures 100=
0 times too small to the hwmon subsystem.
- [High] Asynchronous sysfs reads are effectively broken and will always bl=
ock for the full 2-second timeout before falling back to manual polling.
--

commit a3baf92605bf6c042e451ccdb74f299304cebf79
Author: Tze Yee Ng <tze.yee.ng@altera.com>

arm64: dts: socfpga: stratix10: add hwmon node
   =20
Add an hwmon child node under the Stratix 10 service layer and describe
the SoCDK voltage and temperature sensors using the altr,stratix10-hwmon
compatible.

> diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts b/arc=
h/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts
> index e2a1cea7f3da9..01a8ffe430ed0 100644
> --- a/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts
> +++ b/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts
[ ... ]
> @@ -134,3 +134,36 @@ root: partition@4200000 {
>  		};
>  	};
>  };
> +
> +&temp_volt {
> +	status =3D "okay";

[Severity: High]
This isn't a bug introduced by this patch, but enabling this hwmon node exp=
oses
a pre-existing lifecycle issue during driver removal that can lead to a ker=
nel
panic.

The stratix10-hwmon driver uses devm_hwmon_device_register_with_info() for
registration, meaning the sysfs attributes are only unregistered during dev=
res
cleanup after stratix10_hwmon_remove() returns. However, the remove function
synchronously frees the service channel (stratix10_svc_free_channel), which
sets chan->scl to NULL.

If a userspace process reads a sysfs attribute concurrently, the service th=
read
might unconditionally dereference chan->scl in svc_thread_recv_status_ok():

drivers/firmware/stratix10-svc.c:svc_thread_recv_status_ok() {
    ...
    p_data->chan->scl->receive_cb(p_data->chan->scl, cb_data);
    ...
}

Should the driver manage the service channel lifecycle via
devm_add_action_or_reset() so the channel strictly outlives the sysfs
attributes?

[Severity: High]
This is a pre-existing issue, but enabling this hwmon node exposes an incor=
rect
temperature scaling calculation.

The hwmon subsystem strictly requires temperature attributes to be reported=
 in
millidegrees Celsius. The hardware reports the temperature in Q8.8 format.

In stratix10_hwmon_parse_temp(), the driver shifts the value right by 8 bit=
s,
effectively returning raw degrees Celsius:

drivers/hwmon/stratix10-hwmon.c:stratix10_hwmon_parse_temp() {
    ...
    *val =3D (long)(s32)temperature / STRATIX10_HWMON_TEMP_FRAC_DIV;
    ...
}

Because it fails to multiply the result by 1000, a temperature of 50 degrees
Celsius is reported as 50 instead of 50000. Monitoring tools will mistakenly
display this as 0.050 degrees Celsius.

Could the conversion logic be updated to multiply the result by 1000 to
satisfy the hwmon core requirements?

[Severity: High]
This is a pre-existing issue, but enabling this hwmon node exposes a broken
asynchronous read path that induces a 2-second latency spike per read.

The stratix10_hwmon_async_read() function waits on a completion:

drivers/hwmon/stratix10-hwmon.c:stratix10_hwmon_async_read() {
    ...
    wait_ret =3D wait_for_completion_io_timeout(&completion, HWMON_TIMEOUT);
    ...
}

It expects the callback stored in handle->cb by stratix10_svc_async_send()
to be executed. However, the stratix10-svc driver never actually invokes th=
is
callback anywhere in the service layer.

As a result, the completion is never signaled. Every sysfs read incurs a
mandatory 2-second timeout delay before it falls back to manual polling via
stratix10_svc_async_poll().

Is it possible to either implement the callback invocation in the service l=
ayer,
or adjust the async read approach to avoid this latency?

> +
> +	voltage {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		input@2 {
> +			label =3D "0.8V VCC";
> +			reg =3D <2>;
> +		};
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1781861409.gi=
t.tze.yee.ng@altera.com?part=3D5

