Return-Path: <linux-hwmon+bounces-15146-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cCsqFG4iMWo/cQUAu9opvQ
	(envelope-from <linux-hwmon+bounces-15146-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Jun 2026 12:16:14 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B691768E16C
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Jun 2026 12:16:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=fIs+qIkc;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15146-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15146-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A9D91310DFC7
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Jun 2026 10:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BADE438FE0;
	Tue, 16 Jun 2026 10:09:35 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1238D43634A;
	Tue, 16 Jun 2026 10:09:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781604575; cv=none; b=MOQP6lB0+4mBaCsgLdGb9OV7Aux5UXACSAneTX28kOrYqhUKEHgAHzV7VaSZOILJr16oVgrENtSvNh3b1ZZqU3zw1c7IYVS15IiWLZ+TqkODU8iRq2ucgya8xyHAILV7a7j76mIOsNw/hzYAbM/3LxVlilyWZqQ+L/gnn7F1uUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781604575; c=relaxed/simple;
	bh=uV6sAE5MuQDix+EpLcN3XDCl4e4foIl7MdMMFw97FlI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sI7wdruUhf6YnrJJwwCRb7+sTmHk0i89nPDhPfuFOmJMglVbHFBYnFofA+j05ypZMawbOyJHXfXj3H79AfV8nMiBlGVrPVb1NrO2A3MDl1tI0MS2He5qlvyxALAXop3xwuhvJDQTX/kVYEGv3ziCszwGIJk9pDpaIvxoUbbhnLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fIs+qIkc; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65F2A1F00AC4;
	Tue, 16 Jun 2026 10:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781604573;
	bh=uV6sAE5MuQDix+EpLcN3XDCl4e4foIl7MdMMFw97FlI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fIs+qIkcMXW73ccx0PiF4y356tMm+2Jtqg5b0CnhgmEaWzDn/sxJX8HutnflWBofx
	 Glu93jzgB0tlJz6CBWG+04o9BIh9uIm8DDI0P/BJpdJe6KsUTdBBRPW32J0KXg9ZIv
	 1kPU6xxt6UqqnLESZ278r1O5BP/IWpUk5h2vFTuFeaO7HlMKxLIJLstnYhM4Y+ulgo
	 tqep6Tiw+4eGo4RY8DQ6NqRPqv//JWQTVUS9Qg/PGT76FWaAeTUBBcAEIrl35LaLJ5
	 VY9OiK7Z/b9lXCkfgLKGH+3lsjz+i9gNju1lZTnIALNQGB24zhWB5k/H4lRyNXYKOS
	 U4I3BMZ1iRf7g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 10/12] hwmon: spd5118: Remove 16-bit addressing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: devicetree@vger.kernel.org, Frank.Li@kernel.org, robh@kernel.org, linux-i3c@lists.infradead.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260616095429.3947205-11-akhilrajeev@nvidia.com>
References: <20260616095429.3947205-11-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 10:09:32 +0000
Message-Id: <20260616100933.65F2A1F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	MISSING_MIME_VERSION(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-15146-lists,linux-hwmon=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akhilrajeev@nvidia.com,m:devicetree@vger.kernel.org,m:Frank.Li@kernel.org,m:robh@kernel.org,m:linux-i3c@lists.infradead.org,m:conor+dt@kernel.org,m:linux-hwmon@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,sashiko.dev:url,vger.kernel.org:from_smtp,nvidia.com:email,roeck-us.net:email,lists.linux.dev:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B691768E16C

> The intent of introducing 16-bit addressing was to support I3C, but it
> turns out that I3C does not require reading the Legacy Mode register,
> nor any specific encoding for page translation. The testing of 16-bit
> code was limited and there are no known users for this feature. Remove
> the sections that support 16-bit addressing and prepare the driver to
> support I3C appropriately.
>=20
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616095429.3947=
205-1-akhilrajeev@nvidia.com?part=3D10


