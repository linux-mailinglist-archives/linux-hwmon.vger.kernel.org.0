Return-Path: <linux-hwmon+bounces-13565-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iF5DEi+l8WnxjAEAu9opvQ
	(envelope-from <linux-hwmon+bounces-13565-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 29 Apr 2026 08:29:03 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCE348FC34
	for <lists+linux-hwmon@lfdr.de>; Wed, 29 Apr 2026 08:29:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7C78302A2C5
	for <lists+linux-hwmon@lfdr.de>; Wed, 29 Apr 2026 06:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2417B37BE60;
	Wed, 29 Apr 2026 06:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lBCjT3wG"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34551A6819;
	Wed, 29 Apr 2026 06:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777444140; cv=none; b=lHgJ9bmUU7nFMSZORHsVsG6Jy+mo8C5TFpd8sYFlYq6J+ossZbak+ce4YlFhxTkxV+u9jOuINsUpLVB5tokfBcJvbYRfyblxUAmumfbu0sdJvH8bz+a7SaPYTLRyHFvLXpi9kDI8rFMtotQHmfLpMjFSfX51sFHnbMZ4bx4p95o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777444140; c=relaxed/simple;
	bh=eH0kQ+0CepR4vLSoH8uonXV0bfyq6+x5+imWCovgGrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KABKpffpmdPLaLItyuiKOeJ6NXYfc1aZW8XcofAsaoDL9Y3kOc9DuPQVSQkKWHNEfYntRoJJXcGbv31muPGa+r6GKd+lqNyNNZgWBsD46idr8lOEha+63ucSpCOgWphve5MJoI9sDh6APdlCGCftFj9wbj9VTAuVIviX2xf74YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lBCjT3wG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36F46C19425;
	Wed, 29 Apr 2026 06:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777444139;
	bh=eH0kQ+0CepR4vLSoH8uonXV0bfyq6+x5+imWCovgGrs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lBCjT3wGgfPm+Jv9xIkZuThAyRtN2D8z6S+KHyuwt6JjRdUuVbbYTIz/Y5dn9QM1N
	 fboCEey1IzGuj2SV2Qucf9BVeZeft/3B0yZEMpQOWCkqo1+2LiUloWjsW4Fz6K8N7Y
	 dtRsusTt6bkDpqXcF3X5XMpRkt6OLPlPNSXzDD/NTuNQhoA67GIBsUmWVfG/mTsveB
	 Smo704mWYHB7jhUCho8g4fd/QEs3dX1SaOcTBY5CeZKDEWwH+jf1NAhVeObCiNNCVN
	 6EvOG0nIxJpRvbORk6b0FgIVyl5oiHFWQ1J8+QhPomo3MAHvaf8um3N8JfXryRN6qM
	 9muk7SjqEqt7A==
Date: Wed, 29 Apr 2026 08:28:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
Cc: linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/4] dt-bindings: hwmon: Add Sensirion SHT30 series
Message-ID: <20260429-steadfast-acoustic-degu-baebee@quoll>
References: <1777374569-59233-1-git-send-email-zaixiang.xu.dev@gmail.com>
 <1777374569-59233-3-git-send-email-zaixiang.xu.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1777374569-59233-3-git-send-email-zaixiang.xu.dev@gmail.com>
X-Rspamd-Queue-Id: 9BCE348FC34
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13565-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-hwmon@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url]

On Tue, Apr 28, 2026 at 07:09:27PM +0800, Zaixiang Xu wrote:
> Add YAML devicetree binding schema for Sensirion SHT30 series and the
> compatible GXCAS GXHT30 sensors.
> 
> Use fallback compatibles for compatible chips and add optional
> interrupts and vdd-supply properties.
> 
> Signed-off-by: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
> ---
>  .../bindings/hwmon/sensirion,sht30.yaml       | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/sensirion,sht30.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/sensirion,sht30.yaml b/Documentation/devicetree/bindings/hwmon/sensirion,sht30.yaml
> new file mode 100644
> index 000000000000..9b120f8d303c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/sensirion,sht30.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/sensirion,sht30.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sensirion SHT3x and GXCAS GXHT30 humidity and temperature sensors
> +
> +maintainers:
> +  - Zaixiang Xu <zaixiang.xu.dev@gmail.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - sensirion,sht30
> +          - sensirion,sht31
> +          - sensirion,sht35
> +          - sensirion,sht85
> +          - sensirion,sts30
> +          - sensirion,sts31
> +          - sensirion,sts32
> +          - sensirion,sts35

I don't understand this - it AGAIN does not match the driver. Your
driver clearly claims all of these are compatible. But binding does not.
Explain the reasons in commit msg.

Best regards,
Krzysztof


