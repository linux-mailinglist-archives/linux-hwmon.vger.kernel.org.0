Return-Path: <linux-hwmon+bounces-15497-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ykUTCV/cQ2rxkQoAu9opvQ
	(envelope-from <linux-hwmon+bounces-15497-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 30 Jun 2026 17:10:23 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1756E5C37
	for <lists+linux-hwmon@lfdr.de>; Tue, 30 Jun 2026 17:10:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=dbtQ18KU;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15497-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15497-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E87E4312D178
	for <lists+linux-hwmon@lfdr.de>; Tue, 30 Jun 2026 15:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0105E36D4F1;
	Tue, 30 Jun 2026 15:05:03 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D422836CDF8;
	Tue, 30 Jun 2026 15:05:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782831902; cv=none; b=sreRf+YO/QIVXCPMUQ26UxZPMu3aXuVbzFZP/ZjN4nlRyDq4YXctSom0w3xCtTZP+cMjdOeE/lPMR11xWlX48AN4GLUiYEVniEEZ2MWA8vhwG2BWHSSnmhb6nhsoCZO3ne1aCCqqET3yV4Vi6Q7w2oBCqp0zkE8DQrUKa8dDWZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782831902; c=relaxed/simple;
	bh=BAxLpP+Ruq2byygz1RCCJ72VBVo2cwAhGAl16p77bn4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IbxWD3pp6jav/RW94Wrj/I57mYVSklAvjloJHoOCP0OUgEUlbYc45/uBflVT1Ns8708xEpLkMnVWids0u3tyiappfK6jU51v79+3vv4jSfE/RS2AnA6z0PqbDBr9fhgL5LSRbmCyjxNa/+iiE4bSfSmrrOvtgMLo2zCsgvF1ZZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dbtQ18KU; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34CDF1F00A3A;
	Tue, 30 Jun 2026 15:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782831901;
	bh=IUo2zivSGSq1e22ugSVHl1SkuCpW8ITQbBGPQ6XW+gw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dbtQ18KUnwu6ulTdEkhYSAHBzXuNHK6Gg/3AwGlYSX9b0ugJjF1UHsD9HMJiweYK9
	 kOka2feIUeL9rqvtFqsogBTBRzROUm/aKPbnZBKCsag2AZCAlp4Kp9HU5licHhQzA1
	 eSWi8t4RcMbkBbUTLf9ZBzjsRztZ74H5UDHyAlcPBqanxvVwODcLql35Pdd/olNQvl
	 XRW6z4bPTkeVGOIUQdnO5Oj1ZIsMzZkP8GBpm7bc7YKUJGLzi6VSMaz+/x5R8eFPGG
	 zSTShwXTOpOGJ8+oS1lgBVLJ9ICz+nI909qHZTivPU9FLKGNXL1dqOe4U5e1MDbUfY
	 6B6MKTp9emskQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] platform: arm64: lenovo-thinkpad-t14s: Wire EC
 thermal events to hwmon
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Lezcano" <daniel.lezcano@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260630145307.10745-3-daniel.lezcano@oss.qualcomm.com>
References: <20260630145307.10745-1-daniel.lezcano@oss.qualcomm.com>
 <20260630145307.10745-3-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 15:05:00 +0000
Message-Id: <20260630150501.34CDF1F00A3A@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15497-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smtp.kernel.org:mid,qualcomm.com:email,vger.kernel.org:from_smtp,lists.linux.dev:replyto,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,sashiko.dev:url];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:daniel.lezcano@oss.qualcomm.com,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:conor+dt@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BC1756E5C37

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The patch adds HWMON_T_ALARM to the hwmon temperature channels t=
o support thermal alarms but fails to expose or handle hwmon_temp_alarm in =
the is_visible and read callbacks, rendering the alarm attribute invisible =
and inaccessible.
--

commit 100b1ed0167b57e72fe6d235a080f1fbdce5fee9
Author: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

platform: arm64: lenovo-thinkpad-t14s: Wire EC thermal events to hwmon

This commit wires up EC thermal zone status change notifications to the
hwmon notification framework. It associates hwmon temperature channels
with EC events and adds thermal alarm capabilities.

> diff --git a/drivers/platform/arm64/lenovo-thinkpad-t14s.c b/drivers/plat=
form/arm64/lenovo-thinkpad-t14s.c
> index 35a6f8b0cb6b1..5fafb01a2b332 100644
> --- a/drivers/platform/arm64/lenovo-thinkpad-t14s.c
> +++ b/drivers/platform/arm64/lenovo-thinkpad-t14s.c

[ ... ]

> @@ -640,13 +653,14 @@ static const struct hwmon_ops t14s_ec_hwmon_ops =3D=
 {
>  };
> =20
>  static const struct hwmon_channel_info *t14s_ec_hwmon_info[] =3D {
> +	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
>  	HWMON_CHANNEL_INFO(temp,
> -			   HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_INPUT | HWMON_T_LABEL),
> +			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_ALARM,
> +			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_ALARM,
> +			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_ALARM,
> +			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_ALARM,
> +			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_ALARM,
> +			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_ALARM),
>  	NULL
>  };

[Severity: Medium]
Since HWMON_T_ALARM is added here, do t14s_ec_hwmon_is_visible() and
t14s_ec_hwmon_read() also need to be updated to handle hwmon_temp_alarm?

If t14s_ec_hwmon_is_visible() is not updated to support hwmon_temp_alarm,
it falls through to returning 0:

static umode_t t14s_ec_hwmon_is_visible(...)
{
        switch (type) {
        case hwmon_temp:
                if (attr =3D=3D hwmon_temp_input ||
                    attr =3D=3D hwmon_temp_label)
                        return 0444;
                break;
        default:
                return 0;
        }

        return 0;
}

Will this prevent the sysfs file from being created by the hwmon core,
meaning hwmon_notify_event() will attempt to notify on a non-existent file,
and userspace will not be able to read the alarm state?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260630145307.1074=
5-1-daniel.lezcano@oss.qualcomm.com?part=3D2

