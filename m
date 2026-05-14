Return-Path: <linux-hwmon+bounces-14061-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FgfA89hBWrsVgIAu9opvQ
	(envelope-from <linux-hwmon+bounces-14061-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Thu, 14 May 2026 07:46:55 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EF253E180
	for <lists+linux-hwmon@lfdr.de>; Thu, 14 May 2026 07:46:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 63C51302F699
	for <lists+linux-hwmon@lfdr.de>; Thu, 14 May 2026 05:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B50EC3264D9;
	Thu, 14 May 2026 05:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="daZD/Wi7"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925302F12AB
	for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 05:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778737610; cv=none; b=TQKJWKomGaKmz5bruAqMRqeJFVCAhvtr1KzlpqafhwKz820cQD72wpJP8khOpYWUhSkFLSlhsQWnc8gWuaWhMaRuppu6i7VXc+cHi2Xehh0e2mZTAlpFb+95t4UUo75lIxceDtrU+090UgYsUNIVpLlPjnAqPJkFMGGRg8xD+KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778737610; c=relaxed/simple;
	bh=62BBT7PJUHt/3ToUXc4d7+Cv4tQFEhtaTnVsMMcoqoI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NL23BpesVdo/VIpLnll5/X3NM1VQ/Ovj8kf4RppwMEbDR05N0mhAgqiS8Bk8vCpz2hYorEUuOUJ4yGIi1PgQsGQS4R0cRnW+ue6oK3w3AlyN5sEd071ZAWW4Rp9n5FmiDUB2AvsuQ1JiJMFww5UeQYmDkUfVEOWq7RkDgdhb9EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=daZD/Wi7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17E1EC2BCB7;
	Thu, 14 May 2026 05:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778737610;
	bh=62BBT7PJUHt/3ToUXc4d7+Cv4tQFEhtaTnVsMMcoqoI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=daZD/Wi7eQBLTduvkMEwzeM/2e/XWWqJfZCIWWphb2rkHSo/ifyzbpjOB92LO7S8r
	 d624ot6MtSlyqUOUoeZE/CaBV9TIVo0/Fa7ZhKIiUX9vvoimgYfHCCn9J/1DjDl3Ye
	 9cpFstCfcBEBlLLOHVBu1blOhq9/H/+sZwriCBf49iqkUAtBdNgRWZxeSGc525jihO
	 NMQZyUOL3J2VqctViUDbZwqVhCcrJ+m6Bk4+i0rZpQuexHxqDFoQfkIMSepRfgGHsK
	 YVqV+H3O+VUzQ2vA+SYq6AoOKXnaFLdzQ0uzcEQGwcjSiAlPLP1VLVtMkFytSMEuSL
	 vkWp5AC/YbaDQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] hwmon: Support guard() and scoped_guard for
 subsystem locks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260513142514.419345-2-linux@roeck-us.net>
References: <20260513142514.419345-2-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 05:46:49 +0000
Message-Id: <20260514054650.17E1EC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 77EF253E180
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-14061-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,sashiko.dev:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,smtp.kernel.org:mid,roeck-us.net:email]
X-Rspamd-Action: no action

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The header include/linux/hwmon.h uses the DEFINE_GUARD macro but fa=
ils to explicitly include <linux/cleanup.h>.
--

commit 14ebb15eae07a29dd197db88caa15eb8cc2e93a1
Author: Guenter Roeck <linux@roeck-us.net>

hwmon: Support guard() and scoped_guard for subsystem locks
   =20
This commit adds support for guard() and scoped_guard() macros to the
hwmon subsystem lock, aiming to simplify lock management.

> diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
> index 301a83afbd663..04959e044fd0f 100644
> --- a/include/linux/hwmon.h
> +++ b/include/linux/hwmon.h
[ ... ]
> @@ -495,6 +495,8 @@ char *devm_hwmon_sanitize_name(struct device *dev, co=
nst char *name);
>  void hwmon_lock(struct device *dev);
>  void hwmon_unlock(struct device *dev);
> =20
> +DEFINE_GUARD(hwmon_lock, struct device *, hwmon_lock(_T), hwmon_unlock(_=
T))

Does this header need to include <linux/cleanup.h>?

The DEFINE_GUARD macro is provided by <linux/cleanup.h>. While many files
might implicitly pull it in through <linux/device.h> or <linux/mutex.h>,
could this introduce a build regression for any compilation units that incl=
ude
<linux/hwmon.h> without an implicit include path to <linux/cleanup.h>?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513142514.4193=
45-1-linux@roeck-us.net?part=3D1

