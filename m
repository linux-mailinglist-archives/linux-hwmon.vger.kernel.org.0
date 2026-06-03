Return-Path: <linux-hwmon+bounces-14679-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id w41gBKQNIGqXvAAAu9opvQ
	(envelope-from <linux-hwmon+bounces-14679-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 03 Jun 2026 13:19:00 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 615DA636F56
	for <lists+linux-hwmon@lfdr.de>; Wed, 03 Jun 2026 13:18:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=nMpmGQIX;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-14679-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-14679-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AB75E307FB67
	for <lists+linux-hwmon@lfdr.de>; Wed,  3 Jun 2026 11:07:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E7A443E9F4;
	Wed,  3 Jun 2026 11:06:51 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9683A4611C5;
	Wed,  3 Jun 2026 11:06:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780484811; cv=none; b=Z4fDxlsZ4fFYpV31Ea9IhTBbnJBdZgbrGQP3V8aY3YXNK7cRDzW7+xPp4gQzdTf5lLswokpoQQBvs17htVWDsEYQhky15jtOb91yIns2X9otaxd0fT48A8Q6Qo/aJcYRCCjLB0RZ4DENKr4Rmtn1DA+TDpzrsg18PE8fQiVEltE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780484811; c=relaxed/simple;
	bh=SCLF779LHLJtJcBGxvlh8RnCDOag6JQKe5r19oGWkaI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eW+Lq8PZSUmux5PH7hw7kYrn9U5ddf/eRxAfJBbhiSRwIYihAwhS2fMnqXT+PKFGy7YQwlp43pHmc1JAjxGXLdLj+TAO9g/iHpfaR+E1nqk6wiEd9b/rnavVCIvcZbH5eM4QVrPhgv47hhltwnjJI8E6LnFBNhcX4607ijEctN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nMpmGQIX; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C49311F00893;
	Wed,  3 Jun 2026 11:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780484810;
	bh=SCLF779LHLJtJcBGxvlh8RnCDOag6JQKe5r19oGWkaI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nMpmGQIXHI7QWi+dG8CWX/z8Iv0Stdzq6NI6Fe0FrrZG24MqsYcxC151aaUNlkvfz
	 5wJHSX3iUfYN7uIRQaK78RlbmkVACSeqqhTQUcDinmqpqPX8oxhVQE+sBR2DbAt371
	 zeUcbcCq8EMnWwaKcufExT3BPdw9qjvz7JZoRiH/tmTA1MQdg5XtOqx/FZm8mjR6kh
	 hMUZAokN5q5T/tw6ihietxdZEbsSEew6Vf4Scrv219/DEt0g1+QCNW82N2aChER6M0
	 FJ0Nhyhwe8lG/LWWHXk1beQDVSU1EpL5/xcHzYSknatnMFeDGaWUrSGXt1c/rfAO/q
	 LyMWU3eLo+06w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: isl68137: Add RAA228234
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Naresh Solanki" <naresh.solanki@9elements.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260603110127.23930-1-naresh.solanki@9elements.com>
References: <20260603110127.23930-1-naresh.solanki@9elements.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 11:06:49 +0000
Message-Id: <20260603110649.C49311F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[9elements.com:email,smtp.kernel.org:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,sashiko.dev:url,vger.kernel.org:from_smtp,lists.linux.dev:replyto];
	TAGGED_FROM(0.00)[bounces-14679-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:naresh.solanki@9elements.com,m:conor+dt@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:wsa+renesas@sang-engineering.com,m:conor@kernel.org,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 615DA636F56

> From: Patrick Rudolph <patrick.rudolph@9elements.com>
>=20
> Add the compatible string for the Renesas RAA228234 8-phase PWM
> controller, which shares the same PMBus interface as the RAA228228.
>=20
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603110127.2393=
0-1-naresh.solanki@9elements.com?part=3D1


