Return-Path: <linux-hwmon+bounces-14277-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOwrIkwKC2o0/gQAu9opvQ
	(envelope-from <linux-hwmon+bounces-14277-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 18 May 2026 14:47:08 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C730756CF40
	for <lists+linux-hwmon@lfdr.de>; Mon, 18 May 2026 14:47:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43191306D63A
	for <lists+linux-hwmon@lfdr.de>; Mon, 18 May 2026 12:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D729421889;
	Mon, 18 May 2026 12:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W2GW/dml"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF97541C2F3
	for <linux-hwmon@vger.kernel.org>; Mon, 18 May 2026 12:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779108070; cv=none; b=QNCm6kpfNMveY6OcsmixjhciQ2bxsMDYA5JeRbY8mN2o59WPhli6E5aFw5o4aCQmliV+5Cjt/fklKXzmbxCK4xFzzTGRdvdptVIt6e07HukalGxz4GJG2whv9BfCnlnPBcf9s7Ht5vIq0nm8gaIhNvJEx6A2/0s+uhAH/75FfSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779108070; c=relaxed/simple;
	bh=tx9NkS+I8fqIhMmmFfEtn5idwpXo7OCEAnSmOp/YZV0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=a43IVvU8xENvTscL2xi+hZRatvO2iH1CbV87XD70t3wkGyGkrTahjo70gajw1344z3nFZ9bgxffog6aXRYBC7LG1Fnv4JKiWEEd3kgOq3du/Y1ryDRpGAUD+vQyFpWJgaaGpujXSV4NSMSDFsq+GtQXcJCNPGIgY+U+3GDaTvl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W2GW/dml; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEEA9C2BCB8;
	Mon, 18 May 2026 12:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779108069;
	bh=tx9NkS+I8fqIhMmmFfEtn5idwpXo7OCEAnSmOp/YZV0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=W2GW/dmlGyRg4AHIzLXnCpNSUvCTNruGsavfB98kJFJ80bkU2FpRZGz8oyIC+Z5NA
	 gMNjqrZ3tl6Yk7EZfnb39gdp9SIKT9XzCoHzVYIu7metqZTjRuk5ASpOc0aABD9g2a
	 sDMWEjZ6p22t3s1z/4ZU6SeHOEgk8PjLacr4sDj475HEBtkVp2P3uL66B8sa0npsR+
	 P4aGcUMZW5uuYMUacL5rbE8tV/bJ691BK7T7aiH48stSj6g+D781FHoAi/kO0So6PR
	 aGH3Vd/wacAJmXuf53gWq5JILlfWLGDDIJYiGri/I3ZtYLkOIeQ1v7LKT0pPzOULGW
	 UI9cZQg+D4RGA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (tmp102) Drop unnecessary __maybe_unused
Reply-To: sashiko-reviews@lists.linux.dev
To: "Flaviu Nistor" <flaviu.nistor@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260518122210.10288-1-flaviu.nistor@gmail.com>
References: <20260518122210.10288-1-flaviu.nistor@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 12:41:09 +0000
Message-Id: <20260518124109.BEEA9C2BCB8@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: C730756CF40
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-14277-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	RCPT_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
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
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Action: no action

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Removing `__maybe_unused` without also removing `of_match_ptr()`=
 resurrects a build warning on `!CONFIG_OF` builds.
--

commit 48f4abeb993e88df34017f1f7dacc66c48dc3d0e
Author: Flaviu Nistor <flaviu.nistor@gmail.com>

hwmon: (tmp102) Drop unnecessary __maybe_unused

The commit removes the __maybe_unused annotation from the tmp102_of_match
array. It states that the array is used unconditionally in tmp102_driver.

> tmp102_of_match is used unconditionally in tmp102_driver, so there is no
> need for __maybe_unused.

Is this description accurate? Looking at tmp102_driver, the array
assignment remains wrapped in the of_match_ptr() macro:

static struct i2c_driver tmp102_driver =3D {
	.driver.name	=3D DRIVER_NAME,
	.driver.of_match_table =3D of_match_ptr(tmp102_of_match),
	...

When the kernel is compiled with CONFIG_OF disabled, of_match_ptr()
evaluates to NULL and tmp102_of_match is left completely unreferenced.

> diff --git a/drivers/hwmon/tmp102.c b/drivers/hwmon/tmp102.c
> index 3aa1a3fbeaa92..23f66f70d5a9a 100644
> --- a/drivers/hwmon/tmp102.c
> +++ b/drivers/hwmon/tmp102.c
> @@ -400,7 +400,7 @@ static const struct i2c_device_id tmp102_id[] =3D {
>  };
>  MODULE_DEVICE_TABLE(i2c, tmp102_id);
> =20
> -static const struct of_device_id __maybe_unused tmp102_of_match[] =3D {
> +static const struct of_device_id tmp102_of_match[] =3D {
>  	{ .compatible =3D "ti,tmp102" },
>  	{ },
>  };

Does this removal resurrect the -Wunused-const-variable build warning
on !CONFIG_OF builds?

To safely drop __maybe_unused and make the usage truly unconditional,
should the of_match_ptr() wrapper also be removed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518122210.1028=
8-1-flaviu.nistor@gmail.com?part=3D1

