Return-Path: <linux-hwmon+bounces-14595-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBpOHqIzGWpTswgAu9opvQ
	(envelope-from <linux-hwmon+bounces-14595-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 29 May 2026 08:35:14 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD605FDFCF
	for <lists+linux-hwmon@lfdr.de>; Fri, 29 May 2026 08:35:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F38C301AD27
	for <lists+linux-hwmon@lfdr.de>; Fri, 29 May 2026 06:29:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08E453A4F26;
	Fri, 29 May 2026 06:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TUchP8T4"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4BD351C0D;
	Fri, 29 May 2026 06:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780036178; cv=none; b=gxmkOgU0+KeywT3MRLMdmzYkjjWODnTuh7nwJqCdvuo4vh0rxvnnFlRQRCn1qCb7R8LyMPTTYbBewhtNU3WWEpAvGdb8aTwmVWvfCn+bP1M9fXtE2FeHn694QhOO5W5Bah0YKOLeAWxEaR0LP/AZ4nXufXfOpsoLVSGhQOXey2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780036178; c=relaxed/simple;
	bh=FRbQkOyhdUxT8fShnakEuKOQ+iMzRTGaSOoJ539kxGM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hW9N8JY8prhImYp9+aOnKbzGq5pJ3EPLjB8JUki0GqPdxy1lXOcJbkw7IhzO2DRk2e8gkLnyLqctkkl49/154CMoW6MedvGv8wL24EpVFZt8nx5oB5AD1t5V2YYtXCo2VNuZSzVXrNFA/3jM5Wl/SgvTIRXLdEOrSDZMrjeIPE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TUchP8T4; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 646091F00893;
	Fri, 29 May 2026 06:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780036177;
	bh=SRuIz3TU79Qu+65qo0yf1cxlyHQng1b+ovTiV+ccBbo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TUchP8T4b9bp8imrpbxK6hBmzaZ9czwHInA0cN3xCdo2Y0U1AWutHdVvWNrdjZnpq
	 TMaicSc+Uc52KDQkO2n0nAmf9UXQ8SQe4NogKQPUKQeiRqrlUqC3csSzhqqa7ENZt8
	 Vh5+4k08HVIAY2Cdxm/xvA1plcS9r/DciweCwD8sTD3jIfvOO2ppXUdKsHxB3xUJGr
	 ZiZO6Ltqo/QfJ/T4I5B5Sjf4m+ozre7OPb76zEVznIQC5PJlyZtgTF6t3OJzaeiNZw
	 diZNjw4fgmithavE/LtsGL+AI2TZNBIVmIts/bhkbHhsWw1yoFFcOvLVCbHCAKRqyn
	 KoEKkQ3HMabtw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] hwmon:(pmbus/xdp730) Add support for efuse
 xdp720/xdp730
Reply-To: sashiko-reviews@lists.linux.dev
To: "ASHISH YADAV" <ashishyadav78@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260529054218.5184-3-Ashish.Yadav@infineon.com>
References: <20260529054218.5184-3-Ashish.Yadav@infineon.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 06:29:37 +0000
Message-Id: <20260529062937.646091F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14595-lists,linux-hwmon=lfdr.de];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smtp.kernel.org:mid,lists.linux.dev:replyto,infineon.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Queue-Id: BCD605FDFCF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Renaming the Kconfig symbol, module, and driver from 'xdp720' to=
 'xdp730' breaks existing kernel and userspace configurations.
--

commit 83256f5e0c4297d842a3fc2a6730dfe5ce709501
Author: Ashish Yadav <ashish.yadav@infineon.com>

hwmon:(pmbus/xdp730) Add support for efuse xdp720/xdp730

This commit adds support for the Infineon XDP730 Digital eFuse Controller by
updating the existing XDP720 driver. It renames the Kconfig symbol, module,
and source file to reflect the expanded family support.

> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -711,14 +711,14 @@ config SENSORS_XDP710
>  	  This driver can also be built as a module. If so, the module will
>  	  be called xdp710.
> =20
> -config SENSORS_XDP720
> -	tristate "Infineon XDP720 family"
> +config SENSORS_XDP730
> +	tristate "Infineon XDP730 family"

[Severity: Medium]
Does this renaming break existing kernel configurations?

When users upgrade, their existing CONFIG_SENSORS_XDP720 setting will be
silently dropped (e.g., during make olddefconfig), resulting in an unintend=
ed
loss of hardware monitoring capabilities for the XDP720.

Would it be safer to preserve the existing Kconfig symbol and only update
the prompt and help text to reflect the expanded support?

>  	help
>  	  If you say yes here you get hardware monitoring support for Infineon
> -	  XDP720.
> +	  XDP720 and XDP730 Digital eFuse Controllers.
> =20
>  	  This driver can also be built as a module. If so, the module will
> -	  be called xdp720.
> +	  be called xdp730.
> =20
>  config SENSORS_XDPE152
>  	tristate "Infineon XDPE152 family"
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -69,7 +69,7 @@ obj-$(CONFIG_SENSORS_TPS546D24)	+=3D tps546d24.o
>  obj-$(CONFIG_SENSORS_UCD9000)	+=3D ucd9000.o
>  obj-$(CONFIG_SENSORS_UCD9200)	+=3D ucd9200.o
>  obj-$(CONFIG_SENSORS_XDP710)	+=3D xdp710.o
> -obj-$(CONFIG_SENSORS_XDP720)	+=3D xdp720.o
> +obj-$(CONFIG_SENSORS_XDP730)	+=3D xdp730.o

[Severity: Medium]
Will changing the module and driver name to xdp730 break userspace scripts
and expectations?

Any explicit module load rules (e.g., in /etc/modules) or sysfs paths that
currently depend on the old xdp720 name might fail after this update.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529054218.5184=
-1-Ashish.Yadav@infineon.com?part=3D2

