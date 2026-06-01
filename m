Return-Path: <linux-hwmon+bounces-14658-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +ClKDNRPHWooYwkAu9opvQ
	(envelope-from <linux-hwmon+bounces-14658-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 01 Jun 2026 11:24:36 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B38A861C5DC
	for <lists+linux-hwmon@lfdr.de>; Mon, 01 Jun 2026 11:24:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5EDD23096ED7
	for <lists+linux-hwmon@lfdr.de>; Mon,  1 Jun 2026 09:17:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0C3F390606;
	Mon,  1 Jun 2026 09:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IJ6yPrQF"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6A739061C;
	Mon,  1 Jun 2026 09:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780305469; cv=none; b=X85pgJ68zAKvG1cN67GuD3DG1e3AnLwY7IpVMT/DRJspngo/1ftUcws/quJZrW/knn/6+lLKYIqRHbQ9O/JCdEOvpPvMiexqSmP5uePMmPszJSrin7cgW4o8QrGBey4zkcefoNpFJyQl2HFYiD/LPVizz67oDVrf6w0JEfai15s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780305469; c=relaxed/simple;
	bh=5dyK72MMPz2wRuY0iUZQ/EQf6NMnrASwHShpqTcVxpI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Yl92CsN9VWS335iunsRgrg4wxWD1ZodtKrSUhA8EWkfk9gEjD++mZ984ivsby2K2YjCghTZujNgaqu/43g/cGpBQ8QNd3aQb7IJ0WDk4+Ts5Mx1I9YNftR4e26jD0IRZN3pDOZCs5JkZ5c3ndU4E0EfVjSeeOc+hi+Nidxf6WTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IJ6yPrQF; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 870AB1F00893;
	Mon,  1 Jun 2026 09:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780305466;
	bh=5dyK72MMPz2wRuY0iUZQ/EQf6NMnrASwHShpqTcVxpI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IJ6yPrQFplMdNTTBQcwK8b2B0SzZyhCLTVA46nrTyN1/8YN3MLzB/0OrKlbBZjga5
	 z0IFQuZogwy+vRz2bnhBp4jiZ+RbluY0S5tua4z5iikF07Ok0TQkEDyegWMQLAlPbG
	 sp89qcH5IEBBAjUds6Q5OY0wj6wCSwW/Z21EwcVZ7WEKyX/IbStQ0blQMHFaxy7Z68
	 DeDRl/zc++XXyHMcaYKACv3hXqJO9GdurmFEiM2fQzjHfvwKHGnVCjEZis5HavVvKZ
	 m/Gs96+pUU/LswLLCn7Y5tpYKt3Q59xludI3Un2DYmtqO6v2T2ts4RwQXpaBIM6knL
	 94V2yBXbhWrpg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] hwmon:(pmbus/xdp720) Add support for efuse
 xdp730
Reply-To: sashiko-reviews@lists.linux.dev
To: "ASHISH YADAV" <ashishyadav78@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260601090925.3781-3-Ashish.Yadav@infineon.com>
References: <20260601090925.3781-3-Ashish.Yadav@infineon.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 09:17:46 +0000
Message-Id: <20260601091746.870AB1F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14658-lists,linux-hwmon=lfdr.de];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,infineon.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,sashiko.dev:url,smtp.kernel.org:mid];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Queue-Id: B38A861C5DC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> From: Ashish Yadav <ashish.yadav@infineon.com>
>=20
> Adds support for the Infineon XDP730 Digital eFuse Controller by
> updating the existing XDP720 driver.
>=20
> Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601090925.3781=
-1-Ashish.Yadav@infineon.com?part=3D2


