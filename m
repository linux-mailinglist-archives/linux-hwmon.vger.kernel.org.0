Return-Path: <linux-hwmon+bounces-14777-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lpTxA4EjI2pQjQEAu9opvQ
	(envelope-from <linux-hwmon+bounces-14777-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 05 Jun 2026 21:29:05 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E9364AF0C
	for <lists+linux-hwmon@lfdr.de>; Fri, 05 Jun 2026 21:29:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=moZOq3zo;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-14777-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-14777-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3D9A30022BD
	for <lists+linux-hwmon@lfdr.de>; Fri,  5 Jun 2026 19:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC2474071F0;
	Fri,  5 Jun 2026 19:24:59 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B734071FC
	for <linux-hwmon@vger.kernel.org>; Fri,  5 Jun 2026 19:24:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780687499; cv=none; b=qvo0ENNkSNDvaJFOxBN01V9UWYNmZwnamcKPGU+uCAJ3K5AQaBaV0sy5jsz8TbbjfCaCLi7qaB12ResSqizpwVwQmcgnlVgJMg7yVIrqA7idc8sDlHlwASQqNXEjQWOt2PoksTaQ2qskxX/RR037XRv+nOG0FBjdkHGYeewADDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780687499; c=relaxed/simple;
	bh=pkhzY89gjMNqKe9PHZwWfFtTUV+Kz2FxDzGnmLP6fQA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tpf95X0EC6JhVsio2FDRGk2o/zwcb2uEpqyALgkMFTOTstSADVPEvl9RwkeChP00oPxxaYSl7BM4dvAtVv2Wwo+Ie/iNDJNG1l2IeTPkRdEryoH63RfmA2kdMXv+1cp0IBtplCvbOEzH1zUgx5VW81frhpBg2tMsx1CiA3SRgzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=moZOq3zo; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 319CE1F00893;
	Fri,  5 Jun 2026 19:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780687498;
	bh=pkhzY89gjMNqKe9PHZwWfFtTUV+Kz2FxDzGnmLP6fQA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=moZOq3zoBBDYnazKowPapXDY1pNkKqz+RUrk0ppTZ8VPb8RphQRRB3NPfAHyCiNIY
	 uQDi25b1rQXNpb5yvG+sXq3vkRk8/cedz1NsT8DuS61BnZ0gvLKxXErLLv8zrJlDCU
	 NWI7+zUu5YSF/s3BojOZYZBatb13DMcUVyx4/SMKAhpEoBQhbpImLzU+MvAdhN3mmU
	 Tr1LDlHcDd6Nu4uYJ5LFamCx1wY4hJ6pG/XXXiTfhBIhdPWzXBP2q0PsXDfSSrAeIj
	 WX/E+9KHUnYSB1d45aizuGksfHXpJ/n7ECrn1r48elnM7uaP64gaVfgHKZRe2d9OGK
	 /oGO2asPwvsKw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 9/9] modpost: Handle malformed WMI GUID strings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260605181433.188847-10-W_Armin@gmx.de>
References: <20260605181433.188847-10-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 19:24:57 +0000
Message-Id: <20260605192458.319CE1F00893@smtp.kernel.org>
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:W_Armin@gmx.de,m:linux-hwmon@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-14777-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmx.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[smtp.kernel.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,sashiko.dev:url,gmx.de:email,lists.linux.dev:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 88E9364AF0C

> Some WMI GUIDs found inside binary MOF files contain both
> uppercase and lowercase characters. Blindly copying such
> GUIDs will prevent the associated WMI driver from loading
> automatically because the WMI GUID found inside WMI device ids
> always contains uppercase characters.
>=20
> Avoid this issue by always converting WMI GUID strings to
> uppercase. Also verify that the WMI GUID string actually looks
> like a valid GUID.
>=20
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605181433.1888=
47-1-W_Armin@gmx.de?part=3D9


