Return-Path: <linux-hwmon+bounces-15343-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 86grCIZTPWqL1QgAu9opvQ
	(envelope-from <linux-hwmon+bounces-15343-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Thu, 25 Jun 2026 18:12:54 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E89726C75F2
	for <lists+linux-hwmon@lfdr.de>; Thu, 25 Jun 2026 18:12:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="f9J+kd/0";
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15343-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15343-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 201E530120E9
	for <lists+linux-hwmon@lfdr.de>; Thu, 25 Jun 2026 16:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 614953AB47B;
	Thu, 25 Jun 2026 16:08:50 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6606B3264FF;
	Thu, 25 Jun 2026 16:08:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782403730; cv=none; b=Y77D+UssXxBjqBqGt/9hBTe333CvJnGmge6Y2pw0qbIl6IdH9zypRavfIBs+kngUcgsciyoF1xKmLmesp3IrUFR/vUZZQANCROIRJ5mq5d4PuP0DA4UNHK9cSJbIFV+rw6ZxLLEfCCn/vKpHCtsOqP3/TEpY8r1xoWAQAuRsSEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782403730; c=relaxed/simple;
	bh=xpV1Nmm23JWfQdwgn+tHAMRAQEifGsUVWM2NNHsBYY4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cLqC1SVwT89k4EYPQ3LjpSBa4IqTthoLipTHOlo2qr+jcucfevb0VBd/aGBPeCZqvs6aCtjGO6nih4w9FiA5PD8TTZ1EPwS8VDiUWxD8yqYdi6Qx3XsHeZNS8BcMPBujVfsdWfr4c70zNKMhBQMAAwJ71+M4nDE57bh4+Qi/MJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f9J+kd/0; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9452C1F000E9;
	Thu, 25 Jun 2026 16:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782403729;
	bh=xpV1Nmm23JWfQdwgn+tHAMRAQEifGsUVWM2NNHsBYY4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f9J+kd/0UjeKVxDKwfbYm629qEOCWwwovdHJs9AR9Cd13jNalmN5DXpKcT87oFX30
	 Hl0hFg4MvvBPVnJGpgdvWaZlxlqnie7JZUyjx/ExCjko1IepN5EJoprolGJDApq9l+
	 oGXWz2qNaE0gTm0ZBspMkBMtCWf4DZRclAFPq4t1YxFkeB1Zp2GRETLRKsiOF2JecU
	 STz5Y9QzrsChXPMEJlxgxmVQ2JEhtc53Lfj8ER1Km1wGbYIl1gH8teKYpZAW78c9ec
	 BnFCT0/amh+FWuk7zjsDIxKsdYyzyn2gxP8yLYLQDsQw+VA9garPkiMiFN2s91fuWz
	 /Tznr7R7Ke1lQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: (chipcap2) Add support for label
Reply-To: sashiko-reviews@lists.linux.dev
To: "Flaviu Nistor" <flaviu.nistor@gmail.com>
Cc: linux-hwmon@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260625160423.17882-2-flaviu.nistor@gmail.com>
References: <20260625160423.17882-1-flaviu.nistor@gmail.com>
 <20260625160423.17882-2-flaviu.nistor@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 16:08:46 +0000
Message-Id: <20260625160848.9452C1F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-15343-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:flaviu.nistor@gmail.com,m:linux-hwmon@vger.kernel.org,m:conor+dt@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:flaviunistor@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E89726C75F2

> Add support for label sysfs attribute similar to other hwmon devices.
> This is particularly useful for systems with multiple sensors on the
> same board, where identifying individual sensors is much easier since
> labels can be defined via device tree.
>=20
> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625160423.1788=
2-1-flaviu.nistor@gmail.com?part=3D2


