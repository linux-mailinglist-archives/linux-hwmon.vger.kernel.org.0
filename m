Return-Path: <linux-hwmon+bounces-15051-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kbN+M1/pKmoWzQMAu9opvQ
	(envelope-from <linux-hwmon+bounces-15051-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Thu, 11 Jun 2026 18:59:11 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3BA673CA0
	for <lists+linux-hwmon@lfdr.de>; Thu, 11 Jun 2026 18:59:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ixT5j+fc;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15051-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15051-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 00E1F35F022D
	for <lists+linux-hwmon@lfdr.de>; Thu, 11 Jun 2026 16:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C22C9339858;
	Thu, 11 Jun 2026 16:38:49 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB932332635;
	Thu, 11 Jun 2026 16:38:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781195929; cv=none; b=tiJrEWgKxn/8Y31MYRwFuj0BxatWd560o0pjqb+O8RJls/88B2R3yYGFB10GAFC2+GBnYRFej/2ciU6JeFqMcjBeS3rluGxdDQb1VjhwbAkpm5GhV1hSpa2dtPTkvNvg0adlbZAKjRFWmKXDhEjpYuATiUo3o+hN2jyMXzDgImQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781195929; c=relaxed/simple;
	bh=6FySkG+glYjf4ZDyk3xou1Yfjb1g720YZhbquuf5Z/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KecMpqM8LWqyWIXF5azUGVShCc+9Kdftyvex+diehvScERefSidMs4X4fbXsPJ17TLDgmVQXv3Y9rGvV0OajA1ZMBuQSzMCd92aviOKKsxud+L9Bkd33GW1b4U4x4zB+LjOsBHj9FrD6E8gabIhe0wyYAgpdIaEc1ENCp2P/na8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ixT5j+fc; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 445EB1F00893;
	Thu, 11 Jun 2026 16:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781195928;
	bh=aFyaJd3eEW45BpXIfUcCpGEEeHbiAowOimlNIYOftnI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ixT5j+fc79ElnHBbkZm4Qv3VhNah4swHI8cpb5qkPYT24274Dr9oTtS/eNEEjuaoz
	 qiIVA3zODlWzGZA+I+23mPnIbRqa8Y+d/H6FttGvH9pqPP5mT97omZ5me8a2MC4yfl
	 a1JtF+GDqCADINHP9u7Q4zSmwuhEjIlJPS1dLKjs3VUMnu+scmYE3wHWmqlbjTVWg7
	 wMelUVDFkvWrJGSJvz0p52l/jZIpZXUtqD5bH0S7ewp6CBaLR67Pg8CJzSlkgC9rxu
	 uPDBxLP3ZONFFgiMNCLmlMXKTAMSwTAlp4Xz47p36SiJOduUMTS0lAUtl1CQB//WYe
	 fpLj6z2oWghCg==
Date: Thu, 11 Jun 2026 11:38:47 -0500
From: Rob Herring <robh@kernel.org>
To: Ziming Zhu <zmzhu0630@163.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Ziming Zhu <ziming.zhu@silergycorp.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: hwmon: pmbus: Add bindings for
 Silergy SQ24860
Message-ID: <20260611163847.GA2925321-robh@kernel.org>
References: <20260611074335.4415-1-zmzhu0630@163.com>
 <20260611074335.4415-2-zmzhu0630@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611074335.4415-2-zmzhu0630@163.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15051-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[163.com];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-hwmon@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:zmzhu0630@163.com,m:linux@roeck-us.net,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:ziming.zhu@silergycorp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2E3BA673CA0

On Thu, Jun 11, 2026 at 03:43:33PM +0800, Ziming Zhu wrote:
> From: Ziming Zhu <ziming.zhu@silergycorp.com>
> 
> Add devicetree binding documentation for the Silergy SQ24860 eFuse.
> 
> The device is a PMBus hardware monitoring device which reports voltage,
> current, power, and temperature telemetry. The board-specific IMON
> resistor value is described with silergy,rimon-micro-ohms.
> 
> Signed-off-by: Ziming Zhu <ziming.zhu@silergycorp.com>

Missing Conor's reviewed-by.

> ---
>  .../bindings/hwmon/pmbus/silergy,sq24860.yaml | 74 +++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/silergy,sq24860.yaml

