Return-Path: <linux-hwmon+bounces-15256-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PDlANo9COWr3pQcAu9opvQ
	(envelope-from <linux-hwmon+bounces-15256-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 22 Jun 2026 16:11:27 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB156B0358
	for <lists+linux-hwmon@lfdr.de>; Mon, 22 Jun 2026 16:11:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=cv5i5+Cs;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15256-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15256-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0630C30087D1
	for <lists+linux-hwmon@lfdr.de>; Mon, 22 Jun 2026 14:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ECF73B8130;
	Mon, 22 Jun 2026 14:11:25 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B913AA510
	for <linux-hwmon@vger.kernel.org>; Mon, 22 Jun 2026 14:11:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782137485; cv=none; b=Q9J/BHCImFAMK93gghDEUHQhHnd/8IDZQwUDrhgthrI/WEdIvWcqOM+bSR0HmUkRoKzVfMdoi9UUS09gwkWuxaop0gcqk2aq++/fc+aKyuAqod6VRHySfevuEGHbZBFyHbI3ZOGxRw40t03V8brzkn+tQbsMv2QSVvnVMngvSJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782137485; c=relaxed/simple;
	bh=5p0APOcfkzwDxmE1nWBgUj2hQyqVEwSUvfW1txNee5M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XyGG3WxX86kETa9zCaclp2X+OFW0acQrwdThflUgmWTGAxK285HsrCLfiiWzDd3JCjCk0raN4VuiQqCZR2GHPVfDZEOKmEN5PWJFupJIRabpG7xzyvxHF+H8HktBq69Q6Th3K14teFYoxCLwcsrt+ojy0Xpd2LLtaD+CO0emJAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cv5i5+Cs; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5AB31F00A3A;
	Mon, 22 Jun 2026 14:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782137483;
	bh=5p0APOcfkzwDxmE1nWBgUj2hQyqVEwSUvfW1txNee5M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cv5i5+CsiuTCp4JmAVaXyuFsQcfSFR205xhLXtIy/HQ7TW2VxZUdaYyDIvnRJ31H0
	 hlTcJh3TFxMDZZROzFYmkXef3KYi7DcRa+BCSg5W+Vu96/u8RqqaXhwoyGXpWhIwa6
	 iIvJ/GikK+qdOlun5GU3GKgRVHQJudeMkHy79PtyQibu0Qs/L/+tjrzKUhcLn4mvyF
	 InOzUazwn9NuCr7crU34XbIEIwVsavLFb+sqlWJVYaysm+UaTycd+XfgO9M3dfOUnW
	 y9XpBa0allFFwcSQsg+ojibaHghDINteqiAAMqIqJ8Cpip55q6zIMrzQhOx/zSw769
	 BnEj0htbIBbrA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/8] hwmon: sbtsi_temp: Refactor temperature register
 access into helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akshay Gupta" <Akshay.Gupta@amd.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260622135821.2190260-3-Akshay.Gupta@amd.com>
References: <20260622135821.2190260-1-Akshay.Gupta@amd.com>
 <20260622135821.2190260-3-Akshay.Gupta@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 22 Jun 2026 14:11:23 +0000
Message-Id: <20260622141123.B5AB31F00A3A@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-15256-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Akshay.Gupta@amd.com,m:linux-hwmon@vger.kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,amd.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6BB156B0358

> From: Prathima <Prathima.Lk@amd.com>
>=20
> Extract the paired integer/decimal register reads and writes from the
> hwmon read/write callbacks into sbtsi_temp_read() and sbtsi_temp_write()
> helpers. This consolidates error handling and respects the ReadOrder bit
> for atomic temperature latching.
>=20
> This keeps register access independent while preserving existing hwmon
> functionality.
>=20
> Reviewed-by: Akshay Gupta <Akshay.Gupta@amd.com>
> Signed-off-by: Prathima <Prathima.Lk@amd.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260622135821.2190=
260-1-Akshay.Gupta@amd.com?part=3D2


