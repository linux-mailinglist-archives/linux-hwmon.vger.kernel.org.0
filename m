Return-Path: <linux-hwmon+bounces-14472-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IM92CMhsE2p6AwcAu9opvQ
	(envelope-from <linux-hwmon+bounces-14472-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sun, 24 May 2026 23:25:28 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5205C456C
	for <lists+linux-hwmon@lfdr.de>; Sun, 24 May 2026 23:25:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 554983001328
	for <lists+linux-hwmon@lfdr.de>; Sun, 24 May 2026 21:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83EB9332913;
	Sun, 24 May 2026 21:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bqVx3PF5"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782F830C371
	for <linux-hwmon@vger.kernel.org>; Sun, 24 May 2026 21:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779657925; cv=none; b=kMBirKKk0XonMWRfbrbSw3sVDu/gC+UScBUda5UT+R0mtMRVMRcq9FSQdrb3pvkeesFR62gHNS8ulKEevkQUDPooKWQ1JR7Rl0AWvMST941+Srovxtvl8EzOE13cKObOAIz29nJmYuvbs51RxMcUC2kKhkz5Dp+keDZzivA0Uq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779657925; c=relaxed/simple;
	bh=dGXlfeN0oSPLSJBgrAVcID1PRtg/0/CJ5WDl8z5cekg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CKGvTgIiZ3/R5B41YtvzmsYMsIXNUcir6PhWTwyZYDHlACCeEutR08tmkA5da46QdvHOtGSJE2GCoJ70xtg7BvUSkqxmE94UBlOG5kF3KaMOV/OqQuW/KIMFLT1styvSs6Jj1IwSIxZHV51Kt57VqAOw1a0ZtL4SeDab1G+X3iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bqVx3PF5; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3A731F000E9;
	Sun, 24 May 2026 21:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779657924;
	bh=dGXlfeN0oSPLSJBgrAVcID1PRtg/0/CJ5WDl8z5cekg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bqVx3PF5ZCez5zBnAGuAhpQinyMNsuOSzz55WgjZO5j4wnn03TEijdvGG/yWB780A
	 f3u0fyZKSZDDjdluXwt4OYBVJQCn46muV/nhFhUCOpsmYorhYHOWUPfvDVu8iNq1Yr
	 N4jl1NZwQAawXSACSVA2CQFr9iEbBhCjGJOiCM46XYj1NrpeG+ew6wltn49iBcBwWL
	 vl+k1KLhUfX0AUqPZ20IYozNwouhBJB+ReKlCL9XCA5l2/nG+PAxiSBkD/tCbyDz0m
	 1vSA5WTqlpCj7UCt3sz/v6PdE5XLk/FZVxweCfCeHMyBaH5jcEPA8fRUZmaE/45C0D
	 6316N2ftFITTw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] scsi: mpt3sas: add IO Unit Page 7 config
 accessor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis Sautier" <sautier.louis@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260524210545.1333637-2-sautier.louis@gmail.com>
References: <20260524210545.1333637-2-sautier.louis@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 24 May 2026 21:25:23 +0000
Message-Id: <20260524212523.F3A731F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14472-lists,linux-hwmon=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,lists.linux.dev:replyto,sashiko.dev:url,smtp.kernel.org:mid]
X-Rspamd-Queue-Id: BA5205C456C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> Add mpt3sas_config_get_iounit_pg7(), mirroring the existing iounit
> page accessors. Used by the hwmon driver added in the following patch
> to read the IOC and board temperatures.
>=20
> Assisted-by: Claude:claude-opus-4-7
> Signed-off-by: Louis Sautier <sautier.louis@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260524210545.1333=
637-1-sautier.louis@gmail.com?part=3D1


