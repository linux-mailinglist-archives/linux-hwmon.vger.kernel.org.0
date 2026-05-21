Return-Path: <linux-hwmon+bounces-14395-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 54zRLYB5D2q3MgYAu9opvQ
	(envelope-from <linux-hwmon+bounces-14395-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Thu, 21 May 2026 23:30:40 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3680A5AC1F8
	for <lists+linux-hwmon@lfdr.de>; Thu, 21 May 2026 23:30:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 94A8B301AD0E
	for <lists+linux-hwmon@lfdr.de>; Thu, 21 May 2026 21:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58A2A33987F;
	Thu, 21 May 2026 21:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lD8GjeCV"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5CB30E0ED
	for <linux-hwmon@vger.kernel.org>; Thu, 21 May 2026 21:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779399037; cv=none; b=ZQU9V1N1bqlIMSVy5xdReMMlZoRcNzwxfkrUwlugibgH5iXtwPEesorKOkjYtdtqdg0jeaiubCxItd/FqCgv2GBxD/MHh3gxcgGECkmWC2fYXRHpm/hioHC9rCld23IQk/9U1YiVQ4gX5KiRLcY+v2cRYeORag7bVT2gtNUOr+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779399037; c=relaxed/simple;
	bh=7LuCRVBTLG+OZi8jyIMs907nQBc8/SZQX/+B9aiOWIU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=vA/gZHAG1MHqmABMbbpq2XCwxyk4VF1CQsLMuKRFL0211pVT0Ot+t8mOKSrvB4fpm7voKt7CHkdd7MlcDzk61z6NsiA9Nf7G8OPYP8G0R63EhWZrHocRnYzX0OKmWrF3Qx0LeRksulEQisann0Go+NjhOlWTAudMBrvAPEaxhjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lD8GjeCV; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C803F1F000E9;
	Thu, 21 May 2026 21:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779399035;
	bh=7LuCRVBTLG+OZi8jyIMs907nQBc8/SZQX/+B9aiOWIU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lD8GjeCVMXo2Iqp5QhdNfjo3UOfs6RfKlqLpF8Mro5Lu8tobDdrsN2s4rl/o9RlWK
	 5hxXoyQONsyqb+L/7fMSC334ihQ7ci31WwyOEbiegg/zBPXpTGz+C83INW+UOWeD2F
	 T61UE8lte2J1/oCs9MZ2LtoNYa5JmkjokB4WACDVe4B4KLSRPJRoCm/ocNqnwcs/8N
	 rjvoPtwwGCuEFsB/VExbMjpG852ZBDre6fll8KsW8QuGTNzD+OtqihOmtGe9tNG0ov
	 XSHJkGo9KvX45yadgysoq05jNs2t7gDIe2BAsfeoYtrzbUVj1A6VGTD3BrZzr7GiIF
	 3rcNOwZMFFp8A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (nct6683) Add support for ASRock Z890 Pro-A
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UmVpbmVyIFByw7Zscw==?= <reiner.proels@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260521212632.223724-1-Reiner.Proels@gmail.com>
References: <20260521212632.223724-1-Reiner.Proels@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 21:30:35 +0000
Message-Id: <20260521213035.C803F1F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14395-lists,linux-hwmon=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,sashiko.dev:url,lists.linux.dev:replyto]
X-Rspamd-Queue-Id: 3680A5AC1F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> From: Reiner Pr=C3=B6ls <reiner.proels@gmail.com>
>=20
> Add the ASRock Z890 Pro-A customer ID to the list of supported
> boards for the NCT6683 hardware monitoring driver.
>=20
> MIME-Version: 1.0
> Content-Type: text/plain; charset=3DUTF-8
> Content-Transfer-Encoding: 8bit
>=20
> Signed-off-by: Reiner Pr=C3=B6ls <reiner.proels@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521212632.2237=
24-1-Reiner.Proels@gmail.com?part=3D1


