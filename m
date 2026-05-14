Return-Path: <linux-hwmon+bounces-14076-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kM7LOV21BWqeZwIAu9opvQ
	(envelope-from <linux-hwmon+bounces-14076-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Thu, 14 May 2026 13:43:25 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E147541258
	for <lists+linux-hwmon@lfdr.de>; Thu, 14 May 2026 13:43:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 98FD9300D93E
	for <lists+linux-hwmon@lfdr.de>; Thu, 14 May 2026 11:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 112953C2777;
	Thu, 14 May 2026 11:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="faHWajg1"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20C53AFAFF;
	Thu, 14 May 2026 11:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778759004; cv=none; b=CltZaqrLRZlmjXV4IKaLb20MiHPIiEDbCXZAevjhUOlhA2CBMRc7LU0oaBoSZR/OUzu59M4M6Csj1ACkiz9PZtlakb7rfbmVbzHJzEgHsprRR2AzVhxXF94afiRBOfvuXejxZxPo/XsVXv2FHGPWqA5ePR+t5jlN+rUHRyU7lf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778759004; c=relaxed/simple;
	bh=8uvHL9zd/W4MzaGePykxvJrwfNXRylh/wVLnkJKzd7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EfNy9CgZyEFHP+gCABmVkmJtfx/+H/8f5kyLtbcOYL7QkMeh8FrMBggy6WzlFhW/gyph3pnjSIu64XmCxeSlEvmVA2vGWsR2IrFtDtbBdlsoryuz464/fzPdlGn+9U64aY4gBziGEmXNz3tCzX3ereGskoA7CXhSJpK84N7nis0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=faHWajg1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2B4FC2BCB3;
	Thu, 14 May 2026 11:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778759003;
	bh=8uvHL9zd/W4MzaGePykxvJrwfNXRylh/wVLnkJKzd7E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=faHWajg1RinoZINo2zzw/9LYhaBpCAO/WjniBeVywbskviXc90WOjIgzqclFC/aI+
	 99AeFcPs33YWa+cGZgNI3dtza9vSrNN6mMPk8F60CeYfXMXbel+24P77oWLOGHCzX3
	 5afJRDMXWTLXEQOl2iuzExQ1HaAlj9/f87CAAAoANqoU260Tb/TBlmi/1gtLGQHAIs
	 YGn5u5Qot9sFHOCXYBtSiQBCXyrzOt3sUi2Q4jnioPE2ztJWRkvlR+Sa2nTVtHwVA3
	 Z7B7iwQTQr/BQYijqwo04L95gaThQ05dOGIbr0/vTEshL02soTccdt4y336+ODOgJA
	 nUYG05ef2ywGg==
Date: Thu, 14 May 2026 13:43:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: trivial-devices: Add Murata D1U74T
 PSU
Message-ID: <20260514-dazzling-ethereal-bumblebee-d9b69e@quoll>
References: <20260513-d1u74t-v3-0-27bcd6852c45@nexthop.ai>
 <20260513-d1u74t-v3-1-27bcd6852c45@nexthop.ai>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260513-d1u74t-v3-1-27bcd6852c45@nexthop.ai>
X-Rspamd-Queue-Id: 9E147541258
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14076-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-hwmon@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 03:33:02AM -0700, Abdurrahman Hussain wrote:
> The Murata D1U74T-W is a PMBus-compliant AC/DC power supply unit. The
> binding only declares the compatible string and i2c reg, with no

Describe the hardware, not binding. What does the hardware have?
Supplies? Pins? Clocks? Interrupts?


> additional properties (no regulators, no supplies), so add it to
> trivial-devices.yaml rather than carrying a standalone binding file.

Best regards,
Krzysztof


