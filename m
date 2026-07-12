Return-Path: <linux-hwmon+bounces-15847-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qI4WJk6uU2rwdQMAu9opvQ
	(envelope-from <linux-hwmon+bounces-15847-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sun, 12 Jul 2026 17:10:06 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 578AB7451E0
	for <lists+linux-hwmon@lfdr.de>; Sun, 12 Jul 2026 17:10:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="jd/cs1i+";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15847-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15847-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 79A3E300CBFA
	for <lists+linux-hwmon@lfdr.de>; Sun, 12 Jul 2026 15:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13B3833F5B8;
	Sun, 12 Jul 2026 15:07:31 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A21263C8F
	for <linux-hwmon@vger.kernel.org>; Sun, 12 Jul 2026 15:07:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783868851; cv=none; b=pXEWWx30tQJF+xwliIMf1tYHK0IFLhYEmGliiQsSsdEwXkUnVnHHA2/awfXW5yWFu10ucBZu4MharMvg+2NMSu2A4AkppJElrj50M7LWk3Opabmr8meHWLykRmsSdchCEg58oJ4yUkPMsH8cEfAWkHOizWVTOnvNi86NEiaRrxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783868851; c=relaxed/simple;
	bh=ZSB4Elf0rRVtvLUXxlHu8xNkwNCNSUD6s3xXtjmCl4U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jAnWzYxbvp2PZLQj7oeebXwe2zS/yXmqE9hi8Ei4emYGiM5Bk/h+m4RhRWvZTAhWkCkYTMOLrpg60FY2X4M7F0cuXIVX+j9VBgtgR8Qt9dAwTgZSmfx9qpUlH/vT1N/t98Z+7IB9xqKkOPC6XzswA1r22d/iiNbZoFaJpkSUg0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jd/cs1i+; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 699B01F000E9;
	Sun, 12 Jul 2026 15:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783868849;
	bh=ZSB4Elf0rRVtvLUXxlHu8xNkwNCNSUD6s3xXtjmCl4U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jd/cs1i+kFczT5MKNaNIxc6TgSvypnTueDqy+Y1spiTatbZCslwXYrYTEmvxeg6jP
	 f9HmTyKSFC7JnJzy3Oh7VOBfzlEu8S+k4geRJ7rj+l4iHEL3nMi12NHu7hDB67pQJU
	 yB/SqW4RlDryfHBxJcY1fndl86MgXZ+kAGTKx+Ca1ppkB4HJZniPdIY06ylbjSMM5r
	 UkgfFkolVxxpdDhUZpHVGuBp4+8OnkxTDJwn3XpVvFql5zli/XKnr92/VBSHuqy/nD
	 S07H/Z3LTPQJxNVVlujrZJ5hJHEAl2z+ILV3i3Uxe0sz0eKTh8E97Uz+kdJjLg03fX
	 X2+NQR2ArfSiQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/1] hwmon: (asus-ec-sensors) add missed handle for
 ENOMEM
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eugene Shalygin" <eugene.shalygin@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260712130602.1256700-2-eugene.shalygin@gmail.com>
References: <20260712130602.1256700-1-eugene.shalygin@gmail.com>
 <20260712130602.1256700-2-eugene.shalygin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 12 Jul 2026 15:07:29 +0000
Message-Id: <20260712150729.699B01F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-15847-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:eugene.shalygin@gmail.com,m:linux-hwmon@vger.kernel.org,m:eugeneshalygin@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,smtp.kernel.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 578AB7451E0

> Add missing return value check in the setup function.
>=20
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260712130602.1256=
700-2-eugene.shalygin@gmail.com?part=3D1


