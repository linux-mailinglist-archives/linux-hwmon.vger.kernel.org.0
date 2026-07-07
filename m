Return-Path: <linux-hwmon+bounces-15634-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kcKsCnL0TGobsgEAu9opvQ
	(envelope-from <linux-hwmon+bounces-15634-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 07 Jul 2026 14:43:30 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DB571B773
	for <lists+linux-hwmon@lfdr.de>; Tue, 07 Jul 2026 14:43:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=C3hk+sq3;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15634-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15634-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EABD130EBE08
	for <lists+linux-hwmon@lfdr.de>; Tue,  7 Jul 2026 12:36:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EBEA40A950;
	Tue,  7 Jul 2026 12:36:36 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621953F7A98;
	Tue,  7 Jul 2026 12:36:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783427796; cv=none; b=UUfh4Vchv8vrq8jF/R6Cwoee9dfUmmsuSxwE1Vwf8T+xjWRH+Jbneyv+Dc4HeAzTzNY2zFSRhRyyAWzVllFGWbFwHvFRgsbnkvYxe781EU1ljxRu5QxvnUXKe0BxIF72s8D7tyWMzkkHNMVllYzvIXTsp3LEseqt06kSePYVgi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783427796; c=relaxed/simple;
	bh=IT/XnY6Wha6i2nMoO1cglXroXgw7yuvYrpPs/FCVwg4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RVp8KJFL2yoDH5hLNCBo3wvVr+68ECCZM6/ciBDyf1lYIM7A2xIpjKD6fLeaQZ5/K9r/PfBlx9NXgt7rxOD/+F69d5KsGNQXQdVVKPnRlfLzCI6lCT7S0WOoA6QH2SRKIIeEz4v1TItD5mauhXsDTd8uEwohp+w7bD/azi44sF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C3hk+sq3; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C6861F000E9;
	Tue,  7 Jul 2026 12:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783427795;
	bh=IT/XnY6Wha6i2nMoO1cglXroXgw7yuvYrpPs/FCVwg4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C3hk+sq3+UHHB+fBWsOqU85221O3j8Hua+eWkpX3n3WQrIEN3biFb0FJeL/0FX9Oi
	 cAN2s0yP8DrPw4nTGlgnF4b8k0jkMK60PqOy/n2IPkPNwz3c3kroK5L1ZR+SR8ZJYL
	 tHEGYyRFmnKA3l3X3A/EFhODujI7wzSToIO4gswcLkGzghJHy6GL/FwxA2xWP6CvtN
	 igf3QpCYl75aW5rlViktVwJRilRs/OxKK2UT0f+hLY1w5e5pLnO20fnggh3Rk6A4/u
	 GVxw1cAEJMmNQ4pEBTsu+MERih8fThKQbxv+DdELHFWzdQ7Y6R3Dkz3Q0BApbmANxM
	 RqXmZN2WKkGbA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] hwmon: (pmbus) Add driver for Analog Devices
 MAX20912 and MAX20916
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fred Chen" <fredchen.openbmc@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260707122701.751878-3-fredchen.openbmc@gmail.com>
References: <20260707122701.751878-1-fredchen.openbmc@gmail.com>
 <20260707122701.751878-3-fredchen.openbmc@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 12:36:34 +0000
Message-Id: <20260707123634.9C6861F000E9@smtp.kernel.org>
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
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:fredchen.openbmc@gmail.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:fredchenopenbmc@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-15634-lists,linux-hwmon=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lists.linux.dev:replyto,sashiko.dev:url];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
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
X-Rspamd-Queue-Id: 66DB571B773

> Add support for the Analog Devices MAX20912 and MAX20916 dual-output
> multiphase voltage regulators with PMBus interfaces.
>=20
> Signed-off-by: Fred Chen <fredchen.openbmc@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707122701.7518=
78-1-fredchen.openbmc@gmail.com?part=3D2


