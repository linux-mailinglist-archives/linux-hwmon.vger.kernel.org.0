Return-Path: <linux-hwmon+bounces-15814-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i1b8GgYQUmqQLgMAu9opvQ
	(envelope-from <linux-hwmon+bounces-15814-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sat, 11 Jul 2026 11:42:30 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D57A5741159
	for <lists+linux-hwmon@lfdr.de>; Sat, 11 Jul 2026 11:42:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=F161iXHy;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15814-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15814-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C57D300D455
	for <lists+linux-hwmon@lfdr.de>; Sat, 11 Jul 2026 09:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 058383839B2;
	Sat, 11 Jul 2026 09:42:28 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED028391838
	for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 09:42:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783762947; cv=none; b=BA+KEgutiSnlHRT7C4bE0t+0Hxwbv+fBgXuP0oAQ1j7dj9QxWop/2PjrZa/xv3e9YXMOwtcIA5Cc7P2tL4TAEnYpkN71coAiHQBh+9U4jSW+5rGx/lO7R0FTtZAd8PWoDhOTaj1ShQ/VL+ibNLYNmoZwRfpu3A2flzEF2xliy/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783762947; c=relaxed/simple;
	bh=lM6y3ax1cKFPncTyKOp7ByFsM9LW7kl1oDWQJHeJEUM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CpvJPLksYvkZyoFFvqW3cC27bU7suYGp3KtSvIFgKRu3BOkYw16gh/kmWwtPvJXCaLjsAH2yvPtLPTVHi6vyQU25B1nAeXYQ/p8sU2obifRurqD0S/lNLjMeM9EcY1uVGR4ZidX9oLvXVIqHAPcSByt+IxokfoX+aUQ2GPJI3GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F161iXHy; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F5F41F000E9;
	Sat, 11 Jul 2026 09:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783762946;
	bh=lM6y3ax1cKFPncTyKOp7ByFsM9LW7kl1oDWQJHeJEUM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F161iXHyHKAyfvPHbrGX9AjL/HPZ51pB7ingHgbrMo21WxYa3xTDGsuTi2LYqkUuT
	 i+09+ZATulb/BCkV9X4iysG43ReROnbTEXiGpg5jegsHLUpn5xEtsZx+4c76ksQGcC
	 Z6WU3A2FOxX6vDSL5l3AI8bN8m7PXhMhlKh227rK1QsI2vt4MZJrlJrw1wlQAh/zKP
	 bXHcd4FMNnO2lh2kOajSF3R8Z31qArjFGqfpySvZNH7HXEPd8cidAAbexrGe294lek
	 rRcImiB7wXZOYvBDSLkqOiFOIA7ToccQoG8Xpa9KGqGTPJ0wotAIqPpYoXMAm6H1ou
	 wllGXw8mrAFBA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/3] hwmon: (applesmc) Cache fan positions during
 register initialization
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shih-Yuan Lee" <fourdollars@debian.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260711093323.14529-2-fourdollars@debian.org>
References: <20260710123236.10508-1-fourdollars@debian.org>
 <20260711093323.14529-1-fourdollars@debian.org>
 <20260711093323.14529-2-fourdollars@debian.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 11 Jul 2026 09:42:26 +0000
Message-Id: <20260711094226.6F5F41F000E9@smtp.kernel.org>
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
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-15814-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:fourdollars@debian.org,m:linux-hwmon@vger.kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sashiko.dev:url,smtp.kernel.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D57A5741159

> To support the read_string callback for fan labels in the modern HWMON
> API, load and cache the fan position names in smcreg.fan_positions
> during register initialization.
>=20
> Pre-pad fallback labels with four spaces to match the "+ 4" pointer
> arithmetic offset used by all fan labels in the read_string callback.
>=20
> Signed-off-by: Shih-Yuan Lee <fourdollars@debian.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260711093323.1452=
9-1-fourdollars@debian.org?part=3D1


