Return-Path: <linux-hwmon+bounces-13108-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKEXJ+6r1GmKwQcAu9opvQ
	(envelope-from <linux-hwmon+bounces-13108-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 07 Apr 2026 09:02:06 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4E83AA977
	for <lists+linux-hwmon@lfdr.de>; Tue, 07 Apr 2026 09:02:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52F2D30530CC
	for <lists+linux-hwmon@lfdr.de>; Tue,  7 Apr 2026 07:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4123391859;
	Tue,  7 Apr 2026 07:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ID+ItTp7"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D2B38A71E;
	Tue,  7 Apr 2026 07:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775545237; cv=none; b=TPmQl1kbHwnwg0VUm/ubtWdUSjka9iUf118sbueG0akzLYyxmoGvSf6WSO5wf9ZKHo7uTlwRzejNZThqX8ro0UTNXshUdA8nip+z4sJ3SUB23fsTg+RV8aSLwVy4d7sOWjOW2OGss8FX81HxhyKAHjlqKGgiLB50oI6MC3DM9sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775545237; c=relaxed/simple;
	bh=KC++AGYaCPtqG8OBRYariCPXzGcrTMUsx7ei4Bja4QQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KYuINtAvkjHRgRN4tr69i2+g8dc13AQwTfbQdUAohKVYl4664Ov5cMRgsTgnBZfd6ubkiNWnOSk6kLghUjO0tTWj/5GPWESs+ODsPk8PhreEDhYphZEUqV0NeJnUpW2cSbc9f/ghpmC/a9SSo+p1OFaM0w2PFLEMD4pkcD4weX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ID+ItTp7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0586C2BC9E;
	Tue,  7 Apr 2026 07:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775545237;
	bh=KC++AGYaCPtqG8OBRYariCPXzGcrTMUsx7ei4Bja4QQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ID+ItTp7caZBgfAvTzsBBhnu+06DZg8amfvbRzMgapVy7TeBPfTaFvCHtLpFAUgdL
	 eeuD/Xu1FrRMlPI+2Y1030XGlUuYiwfwaqLRnwH5/MRcYfUNAdCNSY3MklSX+iRraM
	 fAWrGvdBqkb9SkFe9TpW49HFMbQlMJO43AocZHd3WGebXzFBE8px7btC61C5vxHbHA
	 CK3fsSwQ3L9BckdTvbOsr6f8dvrTGU0W2tABUqAv+avJwYgzOF3J7XhD2rfu0+lcpb
	 8+lnHxcgCnCm9LUX/wQFq8HygHNV12Txti/e+VkoJPEQj9oMai/03ruRT0f+BYrq0Z
	 JDgkz2L6pGhbA==
Date: Tue, 7 Apr 2026 09:00:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: ASHISH YADAV <ashishyadav78@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ashish Yadav <ashish.yadav@infineon.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon/pmbus: Add Infineon XDP720
Message-ID: <20260407-monumental-mastiff-of-sunshine-fb27ab@quoll>
References: <20260406101647.109667-1-Ashish.Yadav@infineon.com>
 <20260406101647.109667-2-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260406101647.109667-2-Ashish.Yadav@infineon.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13108-lists,linux-hwmon=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0D4E83AA977
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 06, 2026 at 03:46:46PM +0530, ASHISH YADAV wrote:
> From: Ashish Yadav <ashish.yadav@infineon.com>
> 
> Add documentation for the device tree binding of the XDP720 eFuse.
> This patch introduces a YAML schema describing the required and optional

Redundant parts was supposed to go to /dev/null.

You already said this in the first sentence.

Also, there is no such thing as YAML schema.


> properties for the XDP720 eFuse device node. It includes details on the
> compatible string, register mapping,supply and rimon-micro-ohms(RIMON).

So nothing here is useful - nothing explains the hardware, so drop all
this and keep only first sentence. Or say something useful about
hardware.

> 
> Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
> ---

Best regards,
Krzysztof


