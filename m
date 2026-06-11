Return-Path: <linux-hwmon+bounces-15042-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0VBpGDTBKmoawQMAu9opvQ
	(envelope-from <linux-hwmon+bounces-15042-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Thu, 11 Jun 2026 16:07:48 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FBF672959
	for <lists+linux-hwmon@lfdr.de>; Thu, 11 Jun 2026 16:07:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=nsBied+v;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15042-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15042-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8F289300A59E
	for <lists+linux-hwmon@lfdr.de>; Thu, 11 Jun 2026 14:07:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FA41408627;
	Thu, 11 Jun 2026 14:07:08 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAD540D57A
	for <linux-hwmon@vger.kernel.org>; Thu, 11 Jun 2026 14:07:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781186828; cv=none; b=YtKNf65cFhR3MXi8CHaeKDcCM/eH6b4UdBuw/VrRXIELW1nRw5Anva3KBOD0wKquo2Rgp9okNlcy3mWSH3e5pjyTZxgLU274PiKBg+Z2dDVF28bSniWOE60W7dbYFyVXnMlWdvLFfp2IKsQa0vdfau4dp28T1bU8oPqu5Y9vOjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781186828; c=relaxed/simple;
	bh=FkLMZqypGruYbrA1G7dDdjiLV79ibp78Ghg6kaOQwZA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cdLrtebp6VTHqWHhnk1ZSK/uMkZVEZ2DYFaQNUaEcSQZoyWdldaJm20uCNm4z97y1PgY22dibYVlrlBHyNYaaDtMRmc63tX/nMn9OnWzbOf7cEHqE5Nlsz6EKuFb7hqISDRbiuGiq1eM3rbDsDNp3tS6K1NP85Yydy2zByMiYAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nsBied+v; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DD961F00893;
	Thu, 11 Jun 2026 14:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781186826;
	bh=ML3pogfSq1j7y/ouS6X4JiqBnxNnMw2Ga8XIPlgKmkg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nsBied+vpAjchA3IPmaDoycarCSmbkFZOuw5S9oI3Gh9OUCFy3uaftU3LkvCu2dz5
	 GVnhhWwgYzQwD9aOl9pz9EdtkpUmhxO+wZ7osSTBzP/Hqa95YmHM8+gDuFHSzMgZNB
	 jz+V7BwEwo/DDZtzAt8KduM5iZb3ofqZYzQr1KLNyWDdF2mMqPV2wAiGb5IlTiArT/
	 ZfjUZbPeZCh3u1ywIQvHxZHzPl+Bbp4um89Uh1GfJkRO8I8DLJtjMU1ePAkJVg62i8
	 SMPxte6kImRSyDCn6YwHBfqKzDKSdO/7tvnqEX9It8ur4Bbp2tqL72QzfshkDj0f/4
	 e6Zb+XVvC6t4A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] hwmon: (ina2xx) Fix overflow issues
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260611135706.826074-1-linux@roeck-us.net>
References: <20260611135706.826074-1-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 14:07:06 +0000
Message-Id: <20260611140706.7DD961F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-15042-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@roeck-us.net,m:linux-hwmon@vger.kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,sashiko.dev:url,smtp.kernel.org:mid,lists.linux.dev:replyto,roeck-us.net:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 47FBF672959

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Clamping to LONG_MAX/LONG_MIN before DIV_ROUND_CLOSEST guarantees =
signed integer overflow/underflow on 32-bit platforms.
--

commit 6fb047c808b5329542311277defe6fdce7b455f0
Author: Guenter Roeck <linux@roeck-us.net>

hwmon: (ina2xx) Fix overflow issues

This commit fixes several integer overflow issues in the ina2xx driver
by upgrading intermediate calculations to 64-bit and adjusting the
clamping limits. It also updates the return type of ina2xx_get_value=20
to long to better support 64-bit systems.

> diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
> --- a/drivers/hwmon/ina2xx.c
> +++ b/drivers/hwmon/ina2xx.c

[ ... ]

> @@ -283,12 +285,13 @@ static int ina2xx_get_value(struct ina2xx_data *dat=
a, u8 reg,
>  		val =3D DIV_ROUND_CLOSEST(val, 1000);
>  		break;
>  	case INA2XX_POWER:
> -		val =3D regval * data->power_lsb_uW;
> +		val =3D clamp_val((u64)regval * data->power_lsb_uW, 0, LONG_MAX);
>  		break;
>  	case INA2XX_CURRENT:
>  		/* signed register, result in mA */
> -		val =3D ((s16)regval >> data->config->current_shift) *
> +		val64 =3D (s64)((s16)regval >> data->config->current_shift) *
>  		  data->current_lsb_uA;
> +		val =3D clamp_val(val64, LONG_MIN, LONG_MAX);
>  		val =3D DIV_ROUND_CLOSEST(val, 1000);

[Severity: High]
Can clamping to LONG_MAX and LONG_MIN here cause a signed integer overflow
on 32-bit systems?

Since val is clamped to the absolute limits of a signed long, when it is
subsequently passed to DIV_ROUND_CLOSEST(val, 1000), the rounding macro
will add 500 to positive values or subtract 500 from negative values.

Could this operation overflow LONG_MAX and underflow LONG_MIN, causing the
value to wrap around and return the opposite sign instead of the intended
clamped maximum limit?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611135706.8260=
74-1-linux@roeck-us.net?part=3D1

