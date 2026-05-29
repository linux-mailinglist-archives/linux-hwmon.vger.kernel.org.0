Return-Path: <linux-hwmon+bounces-14601-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAg+OiF6GWr3wwgAu9opvQ
	(envelope-from <linux-hwmon+bounces-14601-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 29 May 2026 13:36:01 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F00A0601B2E
	for <lists+linux-hwmon@lfdr.de>; Fri, 29 May 2026 13:36:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 02B99303D75F
	for <lists+linux-hwmon@lfdr.de>; Fri, 29 May 2026 11:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E63113D810B;
	Fri, 29 May 2026 11:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FdQ7Ynky"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBA93D75CF;
	Fri, 29 May 2026 11:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780054472; cv=none; b=XCLCGdVwm9mg76oeoeAI720/ySO3cg98nYzEkeECYUjpX4FNuHKkMFI9JCey6kvKIKyDKlUXeCFbIDQBU5OKl1JQUX340ZoZzEgDl5UaIxu4q7Yaa9OveJFz0+AL9E6JW2hoFEn87N3SOgy/mH1d2bMJDB84VeJMKjQnvh88T10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780054472; c=relaxed/simple;
	bh=5Iab6X4RhrWitUCbun54a4+F35ok7WUHKaB69LikAFw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TWUZJT0XUm8bOgp+CIBS4CpOufwQIcuqOexMIsG12EotRxORwGO1gauI4h/Xlk24OtTgu6WR6Ngm9rWUljHIeym4XyrzhQ+Jh/Mcp5aJMgj8oTfmzew5ZtJn+Yj+RGYBu8jEV+4mS6qo8ADNIk/pcw/HgitM/DPxXzGmQYBoKSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FdQ7Ynky; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E977D1F00893;
	Fri, 29 May 2026 11:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780054471;
	bh=Rva11O7unq6kogxVmk2m9YYMSdahz4e/wFC22rOT/QI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FdQ7YnkyjWqYhwz1lydMlH76BArr9i5jmDwpHYDilathLSeNpC/YwPPW2uZUDN1jq
	 QjiSRHdx95157iGbVwP7e9vPN90130Bj8YI+q5dxr3uKvIz3PQCFDuH+6VnESecN6U
	 HnHQ2xO9SJSjX9nfm9pxwVrcHE0KjgdhDqEvkyD/PqfDXtcfY2gO4WtFHmBWvbvrTa
	 S/azUSJ39+QBVxFrCeroFqqOphi6GKEqneff82lElyrGdVJYZdgXlPgPexljJ5NyQb
	 yI3M6tjs9LgbDC4M+9XAQdavA7gBUPzgUADvTMpQhxUgIePcjgwS4By2ghV5s8278p
	 idWA+OVOHs92A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] hwmon: (k10temp) Add thermal support for AMD 1Ah
 Family Models 80h-8Fh
Reply-To: sashiko-reviews@lists.linux.dev
To: "Muralidhara M K" <muralidhara.mk@amd.com>
Cc: linux-pci@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260529111242.2748206-1-muralidhara.mk@amd.com>
References: <20260529111242.2748206-1-muralidhara.mk@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 11:34:30 +0000
Message-Id: <20260529113430.E977D1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14601-lists,linux-hwmon=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Queue-Id: F00A0601B2E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Adding a driver-specific PCI Device ID to include/linux/pci_ids.h i=
nstead of defining it locally, and inserting it out of numerical order.
--

commit abc89cca4a911449422a5a960303c2439a718982
Author: Muralidhara M K <muralidhara.mk@amd.com>

hwmon: (k10temp) Add thermal support for AMD 1Ah Family Models 80h-8Fh

This commit adds the PCI Device ID for AMD 1Ah Family 80h-8Fh Models to
the k10temp PCI device table. This enables out-of-the-box thermal
monitoring for these processors.

[ ... ]

> diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
> index 24cb42f66e4b6..3301224c58454 100644
> --- a/include/linux/pci_ids.h
> +++ b/include/linux/pci_ids.h
> @@ -585,6 +585,7 @@
>  #define PCI_DEVICE_ID_AMD_1AH_M20H_DF_F3 0x16fb
>  #define PCI_DEVICE_ID_AMD_1AH_M60H_DF_F3 0x124b
>  #define PCI_DEVICE_ID_AMD_1AH_M70H_DF_F3 0x12bb
> +#define PCI_DEVICE_ID_AMD_1AH_M80H_DF_F3 0x1243

[Severity: Low]
This isn't a bug, but should this device ID be defined locally in the
driver instead of being added to include/linux/pci_ids.h?

Could this ID also be placed in numerical order? It looks like 0x1243 is
inserted after 0x12bb.

>  #define PCI_DEVICE_ID_AMD_MI200_DF_F3	0x14d3
>  #define PCI_DEVICE_ID_AMD_MI300_DF_F3	0x152b
>  #define PCI_DEVICE_ID_AMD_VANGOGH_USB	0x163a

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529111242.2748=
206-1-muralidhara.mk@amd.com?part=3D1

