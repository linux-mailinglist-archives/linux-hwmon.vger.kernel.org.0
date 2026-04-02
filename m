Return-Path: <linux-hwmon+bounces-13023-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFnHMEghzmnElAYAu9opvQ
	(envelope-from <linux-hwmon+bounces-13023-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Thu, 02 Apr 2026 09:56:56 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9FC385817
	for <lists+linux-hwmon@lfdr.de>; Thu, 02 Apr 2026 09:56:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 00A37312B1F7
	for <lists+linux-hwmon@lfdr.de>; Thu,  2 Apr 2026 07:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61FA137AA9E;
	Thu,  2 Apr 2026 07:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QwTlG0I2"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAD9325726;
	Thu,  2 Apr 2026 07:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775115848; cv=none; b=WXpfc6U4UUEYWg5n5icjGYN/sGyyB0AaR22k5qcuIsR1ZdsTyA9OX8ikKBOtD3bXt2dnOBF4bUhM9HRx/1GJidOrn7Lu5hg0K9ArV83m5XvWohA1/polLM4LtLgLdfyedUSGm01Qy+2Nq3UIPa1O7oZzy6f7cMpM97B5BQhYd4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775115848; c=relaxed/simple;
	bh=EoUiNgH3RLhJk/rzvHG3W111ug5RQnGLRQHQODHAo28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KfWqJ/S6EMe5KOiq/ui+c5DqqEx2rpGThrXAYjSToxhlrT5GZuwrHeJ/fUzvRSRLZm30W04yt3IcgW1MhFYPoFrbq++0/1C2XK2YsqyeXbFMkjxRFzJWa/kMgY+GBF3FVdESc1bZZO8BZ1WF4uRzkyCyx4tJ/z36c+T14nGOA2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QwTlG0I2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E907C19423;
	Thu,  2 Apr 2026 07:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775115847;
	bh=EoUiNgH3RLhJk/rzvHG3W111ug5RQnGLRQHQODHAo28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QwTlG0I2ppucR9kfKgc3p8Lzm05Seghu7vyIGxDP3oRRFvrUVgPHYupUibjTAd5X4
	 IRUi58wVClEe3V61qSxFhyXbA2Gpzn5UPMbYjDBsmyzf4AU7pF5S5nH6uXAYI0VX0l
	 +pCfVtg/ZRnPWw17owaDUkQQUKxrG67APDnZYECLeoDr96gTWyUEmsGi5udNGoWoAI
	 wyTzjVZgQjP7BgTn+l3bmQQSdTFMCdw7Uu53LQ3zz9HA2hffd9HLbyWC37Aeh5hxkB
	 ntBkBu7nmQTkh2/iV6jVl0eceEmgMsZq5bwDiRe6Oj3KDHh1Dz8R1DlIw3Nt98wyKH
	 zYZwRegHHV5ng==
Date: Thu, 2 Apr 2026 09:44:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: ASHISH YADAV <ashishyadav78@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ashish Yadav <ashish.yadav@infineon.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon/pmbus: Add Infineon XDP720
Message-ID: <20260402-enlightened-analytic-leopard-ddc512@quoll>
References: <20260401104550.115715-1-Ashish.Yadav@infineon.com>
 <20260401104550.115715-2-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260401104550.115715-2-Ashish.Yadav@infineon.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13023-lists,linux-hwmon=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,infineon.com:email,infineon.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1D9FC385817
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 04:15:49PM +0530, ASHISH YADAV wrote:
> From: Ashish Yadav <ashish.yadav@infineon.com>
> 
> Add documentation for the device tree binding of the XDP720 eFuse.
> 
> Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
> ---
> This patch introduces a YAML schema describing the required and optional
> properties for the XDP720 eFuse device node. It includes details on the
> compatible string, register mapping, and rimon-micro-ohms(RIMON).
> 
> The RIMON resistance is installed between the Imon pin and the ground
> reference.

Why are you adding second commit msg? Hardware description goes to
commit msg. Redundant parts go to /dev/null.


> ---
>  .../bindings/hwmon/pmbus/infineon,xdp720.yaml | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yaml
> new file mode 100644
> index 000000000000..bbde8ff92ae9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +
> +$id: http://devicetree.org/schemas/hwmon/pmbus/infineon,xdp720.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Infineon XDP720 Digital eFuse Controller
> +
> +maintainers:
> +  - Ashish Yadav <ashish.yadav@infineon.com>
> +
> +description: |
> +  The XDP720 is an eFuse with integrated current sensor and digital
> +  controller. It provides accurate system telemetry (V, I, P, T) and
> +  reports analog current at the IMON pin for post-processing.
> +
> +  Datasheet:
> +     https://www.infineon.com/assets/row/public/documents/24/49/infineon-xdp720-001-datasheet-en.pdf
> +
> +properties:
> +  compatible:
> +    enum:
> +      - infineon,xdp720
> +
> +  reg:
> +    maxItems: 1
> +
> +  infineon,rimon-micro-ohms:
> +    description: |

Do not need '|' unless you need to preserve formatting.

> +      The value of the RIMON resistor, in micro ohms, required to enable
> +      the system overcurrent protection.
> +

Missing supply

> +required:
> +  - compatible
> +  - reg

Here as well, most likely.

Best regards,
Krzysztof


