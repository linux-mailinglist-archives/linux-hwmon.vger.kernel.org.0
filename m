Return-Path: <linux-hwmon+bounces-13167-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBxDDXSL12k3PggAu9opvQ
	(envelope-from <linux-hwmon+bounces-13167-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Thu, 09 Apr 2026 13:20:20 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C67CB3C9983
	for <lists+linux-hwmon@lfdr.de>; Thu, 09 Apr 2026 13:20:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 388483008996
	for <lists+linux-hwmon@lfdr.de>; Thu,  9 Apr 2026 11:20:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 333EC3C0638;
	Thu,  9 Apr 2026 11:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lMczLMze"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FEA73BFE23
	for <linux-hwmon@vger.kernel.org>; Thu,  9 Apr 2026 11:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775733617; cv=none; b=uY5Mv1tnh+4E+C6OquN4SN2qzgIsmkMJu1MCuqUpyAVwJ5ouIWLkI396o/16HZbLzhSiktAIPvjBM+Gv9bJIfgq05EeL/t6uUikvDt2c7NqxRmescynWztMU8buGaV3KtfKA+aAmRGimNS+yycRCbLD+U08/TwBeDJAgPQd85Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775733617; c=relaxed/simple;
	bh=jVt/7YyOj/PM5ntkhlfPUbQBihoxRtrRDLPezbFm9wM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=g4I8lb2d3kJEeEJv2JAFUgdGMLYXBtZEQ053SirJhsISxAgNOXnbuULyLLmdBh6QAgMuaVau/MLsZAZLlrflVv8/pYw418ZZRBKGMGCGNR9tpricbrSbGa3EKy7momcQdwEUM7Du6FVeU5oYOcGMuvOM1m+pW9jomqf1TDAhWIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lMczLMze; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E14FC4CEF7;
	Thu,  9 Apr 2026 11:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775733616;
	bh=jVt/7YyOj/PM5ntkhlfPUbQBihoxRtrRDLPezbFm9wM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=lMczLMzes5njSpV6NLZyijuKiOCWEGhtIIyKUeyK8YsC29NFf8empZ+IHZ+M0khzq
	 nYsQOcEQymfHXHFx8GYUlpDjveM1j6aqEa/dvlky/aAQ+jQG51pZFhnFUvkhHwsMSU
	 6HlpIoaYtE7/WtYuCXAj6+f++jc17X67VO7YhIJryAYR3y7TpH+RD/dogve08aWtWJ
	 bn3EQn9GwIfmiitw/jupt2e16l5KoE62FcXuan9O0QX7dN166KVgZEGOnOjavxnbhZ
	 C2v0BHxMXaXPvmcJKwWmPurJtFgmT7fAgCbid4UfJFc2m4+ixELYfqsMRqQ/24xmPO
	 I5lFYVO1Cw8TQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 02/13] ACPICA: Read LVR from the I2C resource
 descriptor
Reply-To: sashiko@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260409105747.48158-3-akhilrajeev@nvidia.com>
References: <20260409105747.48158-3-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Apr 2026 11:20:15 +0000
Message-Id: <20260409112016.9E14FC4CEF7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-13167-lists,linux-hwmon=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,sashiko.dev:url,lists.linux.dev:replyto,smtp.kernel.org:mid,nvidia.com:email]
X-Rspamd-Queue-Id: C67CB3C9983
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Sashiko AI review found 1 potential issue(s):
- [Low] The newly added `lvr` field is not registered in the ACPICA resourc=
e dump facility because `acpi_rs_dump_i2c_serial_bus` was not updated.
--

commit 3fa9f87815791b9a3bb1e7f01dab51e491970fce
Author: Akhil R <akhilrajeev@nvidia.com>

ACPICA: Read LVR from the I2C resource descriptor

ACPI 6.3 specifies byte 8 of I2C Serial Bus Connection descriptor to be
used for Legacy Virtual Register (LVR) data as specified in the MIPI
I3C Specification for an I2C device connected to an I3C Host Controller.
Update the rsconvert_info to include this field.

Link: https://github.com/acpica/acpica/commit/70082dc8
Link: https://github.com/acpica/acpica/commit/b3c38dc9

> diff --git a/drivers/acpi/acpica/rsserial.c b/drivers/acpi/acpica/rsseria=
l.c
> index 279bfa27da94d..c06e918ab8895 100644
> --- a/drivers/acpi/acpica/rsserial.c
> +++ b/drivers/acpi/acpica/rsserial.c

[ ... ]

> @@ -391,6 +391,10 @@ struct acpi_rsconvert_info acpi_rs_convert_i2c_seria=
l_bus[17] =3D {
>  	 AML_OFFSET(i2c_serial_bus.type_specific_flags),
>  	 0},
> =20
> +	{ACPI_RSC_MOVE8, ACPI_RS_OFFSET(data.i2c_serial_bus.lvr),
> +	 AML_OFFSET(i2c_serial_bus.type_specific_flags) + 1,
> +	 1},
> +

Should the acpi_rs_dump_i2c_serial_bus array in
drivers/acpi/acpica/rsdumpinfo.c also be updated to include the new lvr
field so it is printed by the resource dump facility?

>  	{ACPI_RSC_MOVE32, ACPI_RS_OFFSET(data.i2c_serial_bus.connection_speed),
>  	 AML_OFFSET(i2c_serial_bus.connection_speed),
>  	 1},

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260409105747.4815=
8-1-akhilrajeev@nvidia.com?part=3D2

