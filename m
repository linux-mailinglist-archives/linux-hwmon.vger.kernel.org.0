Return-Path: <linux-hwmon+bounces-15070-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yVTvJVvJK2oDFAQAu9opvQ
	(envelope-from <linux-hwmon+bounces-15070-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 12 Jun 2026 10:54:51 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6AC677FB1
	for <lists+linux-hwmon@lfdr.de>; Fri, 12 Jun 2026 10:54:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Ct31lijB;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15070-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15070-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 15D1A32736E6
	for <lists+linux-hwmon@lfdr.de>; Fri, 12 Jun 2026 08:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3F7336F91F;
	Fri, 12 Jun 2026 08:53:39 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C13A3793AD;
	Fri, 12 Jun 2026 08:53:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781254419; cv=none; b=RZqyev3rIl7wkDf8UgKIpzcJbwFTPKDiNF8HzFRYpk9a4F1CmlTuwAu2y4S9glVpMRz5l+kvRa1W1HUpKYi4zhd0Ey5kXAXdifI82UqBuVEBvOKmHUjLM5VXO4umwIx2VQ45/LjkqwakGI3ypGwD8CTt9Zm40QkB6jpWnSCPcMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781254419; c=relaxed/simple;
	bh=uGH+AK/+/uFo8/TTB+L2s/0uaI8gpZqLM33LrkG6r2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eqxs9J+hpc9CEtjNaGMe9Q5bXmkfFM1lulhfEhLZw+E40RLhARDUEIqjbTpzxsKOP+B7FAL1efb9Eptox9VRJ3bHavkJB5ooqq0ySJH+srxiHxjBRsHA79dIKy/6InR4YqWAPpCVCI4FZTcIYuk1SFk6YNiRNg+9uoFC86Qo5IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ct31lijB; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A59751F000E9;
	Fri, 12 Jun 2026 08:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781254418;
	bh=mtf0IquBGXiIidIU1CGAyAVk1Qsu4DM+fxc2zCo7xH0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ct31lijBq0C+9xc2OLsJo/ai66t20muhZ7mKzwcQL63wgLe+z8G6i1UU9RKn7Eeu2
	 6OmEXbCcbskdInLXFDNmJE0JOalHLp5/uOty9ZPQXoAy+KuL4LEP/e/KcCCQQ5PwbE
	 UvfsWjGxD5MzWPVkixofYruxM+krie1zEghckYCFgUm5b4DsPufdM+aSBgnwOah4Du
	 mSPe4nef1Dfxzm77kXmYNEe9MXbbK8HXtCs5U3APOFovVIKq1uH3yy8Nph7Z0o5/R5
	 1MmLOqsWblbfRtnwIuYE0wmVOr4TX6CVsRDdV6YeIaemhjYB1lYXA49SCbk2nn++jv
	 yoSSbLRUGaAjA==
Date: Fri, 12 Jun 2026 10:53:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ziming Zhu <zmzhu0630@163.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Ziming Zhu <ziming.zhu@silergycorp.com>, 
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: hwmon: pmbus: Add bindings for
 Silergy SQ24860
Message-ID: <20260612-cherubic-exuberant-binturong-35b7ee@quoll>
References: <20260612030304.5165-1-zmzhu0630@163.com>
 <20260612030304.5165-2-zmzhu0630@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260612030304.5165-2-zmzhu0630@163.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:zmzhu0630@163.com,m:linux@roeck-us.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:ziming.zhu@silergycorp.com,m:conor.dooley@microchip.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-hwmon@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[163.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-hwmon@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-15070-lists,linux-hwmon=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,silergycorp.com:email,devicetree.org:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4F6AC677FB1

On Fri, Jun 12, 2026 at 11:03:02AM +0800, Ziming Zhu wrote:
> From: Ziming Zhu <ziming.zhu@silergycorp.com>
> 
> Add devicetree binding documentation for the Silergy SQ24860 eFuse.
> 
> The device is a PMBus hardware monitoring device which reports voltage,
> current, power, and temperature telemetry. The board-specific IMON
> resistor value is described with silergy,rimon-micro-ohms.
> 
> Signed-off-by: Ziming Zhu <ziming.zhu@silergycorp.com>
> 

Do not add blank lines between tags. I recommend to use b4 to handle
this - it would solve your problems, including the missing tag in
previous version.

> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  .../bindings/hwmon/pmbus/silergy,sq24860.yaml | 74 +++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/silergy,sq24860.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/silergy,sq24860.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/silergy,sq24860.yaml
> new file mode 100644
> index 000000000000..03ef82c11e1a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/silergy,sq24860.yaml
> @@ -0,0 +1,74 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +
> +$id: http://devicetree.org/schemas/hwmon/pmbus/silergy,sq24860.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Silergy SQ24860 eFuse
> +
> +maintainers:
> +  - Ziming Zhu <ziming.zhu@silergycorp.com>
> +
> +description:
> +  The Silergy SQ24860 is an integrated, high-current circuit protection and
> +  power management device with PMBus interface.
> +
> +properties:
> +  compatible:
> +    const: silergy,sq24860
> +
> +  reg:
> +    maxItems: 1
> +
> +  silergy,rimon-micro-ohms:

Isn't this just shunt-resistor-micro-ohms? IOW, didn't you just describe
the shunt?

> +    description:
> +      Micro-ohms value of the resistance installed between the IMON pin and
> +      the ground reference.

Best regards,
Krzysztof


